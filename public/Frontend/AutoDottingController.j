@import "DottingController.j"

// this controller is for automated cell detection

@implementation AutoDottingController : DottingController
{	id annotatedImageView;
	id trialSettingsWindow;
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
}

-(void) setScale:(double) someScale
{	_scale=someScale;
	[annotatedImageView setScale: _scale];
	[annotatedImageView setBackgroundImage: [myAppController.analysesController valueForKeyPath: "selection._backgroundImage"] ];
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
		[[myAppController.analysesController selectedObject] willChangeValueForKey:"aggregations"];
		[myAppController.analysesController._entity._relations makeObjectsPerformSelector:@selector(_invalidateCache)];
		[[myAppController.analysesController selectedObject] didChangeValueForKey:"aggregations"];
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

