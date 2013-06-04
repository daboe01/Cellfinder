@import "DottingController.j"

// this controller is for automated cell detection

@implementation AutoDottingController : DottingController
{	id annotatedImageView;
	id trialSettingsWindow;
	id inputAnalysisWindow;
	id inputAnalysisField;
	id outputAnalysisWindow;
	id outputAnalysisField;
}

-(void) _postInit
{	[super _postInit];
	var mycompo= [myAppController.trialsController valueForKeyPath: "selection.composition_for_javascript"];

	if(mycompo !== CPNullMarker)
	{	var myreq=[CPURLRequest requestWithURL: BaseURL+"0?cmp="+mycompo ];
		var mypackage=[[CPURLConnection sendSynchronousRequest: myreq returningResponse: nil]  rawString];
		var arr = JSON.parse( mypackage );
		if(!arr) return;
		var i,l=arr.length;
		for(i=0;i<l;i++)
		{	var m=arr[i];
			if([m characterAtIndex:0]=='<') next;
			var sel=CPSelectorFromString(m);
			if(sel) [self performSelector:sel];
		}
	}
	var re = new RegExp("#([^&#]+)");
	var m=re.exec(document.location);
	if (m) [myAppController.folderController setFilterPredicate: [CPPredicate predicateWithFormat:"folder_name=='"+m[1]+"'" ]];
	// this is necessary to prevent the imageDidLoad event beeing eaten up sometimes in firefox (because this event takes too long to finish)
	[[CPRunLoop currentRunLoop] performSelector:@selector(_postInit2) target:self argument: nil order:0 modes:[CPDefaultRunLoopMode]];
}
-(void) _postInit2
{	[annotatedImageView bind:"backgroundImage" toObject: myAppController.analysesController withKeyPath: "selection._backgroundImage" options:nil];
	[myAppController.analysesController addObserver:self forKeyPath:"selection.idcomposition_for_editing" options:nil context:nil];
}

- (void)observeValueForKeyPath: keyPath ofObject: object change: change context: context
{	if(keyPath === "selection.idcomposition_for_editing" || keyPath === "value" )
	{
		// reload image
		[[CPRunLoop currentRunLoop] performSelector:@selector(reloadImage) target:self argument: nil order:0 modes:[CPDefaultRunLoopMode]];

	}
}
-(void) setScale:(double) someScale
{	_scale=someScale;
	[annotatedImageView setScale: _scale];
	[self reloadImage];
}
-(void) reloadImage
{	var img=[myAppController.analysesController valueForKeyPath: "selection._backgroundImage"];
	if([img isKindOfClass:[CPImage class]])
	{	[annotatedImageView setBackgroundImage: img ];
	}
}


-(void) delete: sender	// delete a dot
{	[annotatedImageView delete: sender];
}

// CompoAPI
-(void) setNumberingPoints
{	[annotatedImageView setStyleFlags: [annotatedImageView styleFlags] | AIVStyleNumbers ];
}
-(void) setDrawingLines
{	[annotatedImageView setStyleFlags: [annotatedImageView styleFlags] | AIVStylePolygon ];
}
-(void) setDrawingAngle
{	[annotatedImageView setStyleFlags: [annotatedImageView styleFlags] | AIVStyleAngleInfo ];
}

-(void) reaggregate: sender
{	var mycompo= [myAppController.trialsController valueForKeyPath: "selection.composition_for_aggregation"];
	var idanalysis=[myAppController.analysesController valueForKeyPath:"selection.id"];
	var idimage=[myAppController.analysesController valueForKeyPath:"selection.idimage"];

	if(mycompo !== CPNullMarker)
	{	var myreq=[CPURLRequest requestWithURL: BaseURL+idimage+"?idanalysis="+idanalysis+"&cmp="+mycompo];
		[CPURLConnection sendSynchronousRequest: myreq returningResponse: nil];
		[super reaggregate:sender];
	}
}
-(void) runSettings: sender
{	[trialSettingsWindow makeKeyAndOrderFront:self];
}

-(void) matchDots: sender
{	var myarr=[CPMutableArray new];
	var so=[myAppController.folderContentController selectedObjects];
	var idtrial=[myAppController.trialsController valueForKeyPath:"selection.id"];
	var i,l=[so count];
	if(l<2)
	{	[[CPAlert alertWithError:"Bitte mindestens zwei Zeilen auswaehlen (Shift-Taste)"] runModal];
		return;
	}
	for(i=0;i<l;i++)
	{	var ro=[so objectAtIndex: i];
		[myarr addObject: [ro valueForKey:"idimage"]];
	}
	var myreq=[CPURLRequest requestWithURL: BaseURL+"makestack"+"/"+idtrial+"/"+"mystack"];
    [myreq setHTTPMethod: "POST"];
	[myreq setHTTPBody: JSON.stringify(myarr) ];
	[CPURLConnection sendSynchronousRequest: myreq returningResponse: nil];

	window.open("http://auginfo:3000/Frontend/index.html?id="+idtrial+"&t=AutoStacks.gsmarkup",'autostacks');
}

-(void) toggleVoronoi:sender
{	[annotatedImageView setStyleFlags: [annotatedImageView styleFlags] ^ AIVStyleVoronoi ];
	[annotatedImageView setNeedsDisplay:YES];
}

-(void) editViewingCompo:sender
{	[[CompoController alloc] initWithCompo: [[myAppController.analysesController selectedObject] valueForKey:"editing_compo"] valueObserver: self];
}

-(void) insertAnalysisFromInput:sender
{	[inputAnalysisWindow makeKeyAndOrderFront:self];
}
-(void) performUploadCoords:sender
{	var myIdSourceAnalysis=  [myAppController.analysesController valueForKeyPath:"selection.id"];
	var mystuff=[inputAnalysisField stringValue];
	var myreq=[CPURLRequest requestWithURL: BaseURL+"input_results/"+myIdSourceAnalysis+"/"+mystuff];
	[CPURLConnection sendSynchronousRequest: myreq returningResponse: nil];
	[self _refreshResults];
}

-(void) revealCoords: sender
{	var coords="";
	var mySourceAnalysis=  [myAppController.analysesController selectedObject];
	var sourceArray=[mySourceAnalysis valueForKey:"results"];
	var i,j=[sourceArray count];
	for(i=0; i< j; i++)
	{	coords+=[[sourceArray objectAtIndex:i] valueForKey:"row"];
		coords+=" ";
		coords+=[[sourceArray objectAtIndex:i] valueForKey:"col"];
		var peekTag=[[sourceArray objectAtIndex:i] valueForKey:"tag"];
		if(peekTag)
		{	coords+="(";
			coords+=[[sourceArray objectAtIndex:i] valueForKey:"tag"];
			coords+=")";
		}
		coords+=" ";
	}
	[outputAnalysisField setStringValue:coords]
	[outputAnalysisWindow makeKeyAndOrderFront:self];
}

-(void) setTag: sender
{
	var tag=[sender integerValue];
	[annotatedImageView setDefaultTag: tag];
	var arr=[annotatedImageView selectedDots];

	var i,j=[arr count];
	for(i=0; i<j;i++)
	{	var o=arr[i];
		[o._data setValue: tag forKey:"tag"];
		[o setNeedsDisplay:YES];
	}
}



@end

@implementation GSMarkupTagAutoDottingController : GSMarkupTagObject
+ (CPString) tagName
{
  return @"autoDottingController";
}
+ (Class) platformObjectClass
{
	return [AutoDottingController class];
}
@end

