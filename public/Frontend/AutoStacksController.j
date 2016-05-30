// this controller is for manual image registration

@import "ManualStacksController.j"


@implementation AutoStacksController: ManualStacksController
{
    BOOL	_bridgeStitchingAll;
	id		mystacksconnection;
    id      mainBB;
}

-(void) _postInit
{
    [super _postInit];
    var button=[mainBB addButtonWithImageName:"reload.png" target:self action:@selector(reloadList:)];
    [button setToolTip:"Reload list"];
}

-(void) _triggerRegistrationMatrixGeneration
{
// prevent our RANSAC matrix from beeing destroyed. don't call super method!!
}

- (void)deleteAllWarningDidEnd:(CPAlert)anAlert code:(id)code context:(id)context
{	if(code)
	{	var idtrial=[myAppController.trialsController valueForKeyPath: "selection.id"]
        var myreq=[CPURLRequest requestWithURL: BaseURL+"STACK/DELALL/"+idtrial];
        [CPURLConnection sendSynchronousRequest: myreq returningResponse: nil];
        [myAppController.stacksController reload];
    }

}
-(void) reloadList:(id)sender
{
    [myAppController.stacksController reload];
}


-(void) deleteAll: sender
{
	var myalert = [CPAlert new];
	[myalert setMessageText: "Are you sure you want to delete all entries?"];
	[myalert addButtonWithTitle:"Cancel"];
	[myalert addButtonWithTitle:"Delete"];
	[myalert beginSheetModalForWindow:myWindow modalDelegate:self didEndSelector:@selector(deleteAllWarningDidEnd:code:context:) contextInfo: nil];

}

-(void) runRansac: sender
{	var idransac=[myAppController.trialsController valueForKeyPath: "selection.composition_for_ransac"]
	var myreq=[CPURLRequest requestWithURL: BaseURL+"STACK/"+[myAppController.stacksController valueForKeyPath: "selection.id"] +"?spc=affine&ransac="+idransac];
	mystacksconnection=[CPURLConnection connectionWithRequest:myreq delegate: self];
	[progress startAnimation: self];
}
-(void) reRansac: sender
{	var idransac=[myAppController.trialsController valueForKeyPath: "selection.composition_for_ransac"];
	var idmontage=[myAppController.stacksController valueForKeyPath: "selection.id"];
	var idanalysis1 =[myAppController.stacksContentController valueForKeyPath: "selection.idanalysis"];
	var idanalysis2 =[myAppController.stacksContentController valueForKeyPath: "selection.idanalysis_reference"];
	if(idanalysis2 === CPNullMarker)
	{	[[CPAlert alertWithError:"Please select entry with a reference"] runModal];
		return;
	}
	var myreq=[CPURLRequest requestWithURL: BaseURL+"ransac_debug/" + idransac + "/" + idmontage + "/" + idanalysis1 + "/" + idanalysis2];
	mystacksconnection=[CPURLConnection connectionWithRequest:myreq delegate: self];
	[progress startAnimation: self];
}
-(void) insertIdentityMatrix:(id)sender
{   [myAppController.stacksContentController setValue:"1,0,0,1,0,0" forKeyPath: "selection.parameter"];
}

-(void) rebase: sender
{	var id = [myAppController.stacksContentController valueForKeyPath: "selection.id"];
	var myreq=[CPURLRequest requestWithURL: BaseURL+"rebase/" + id];
	mystacksconnection=[CPURLConnection connectionWithRequest: myreq delegate: self];
	[progress startAnimation: self];
}
-(void) collectSamebase: sender
{	var samebase=[self getIDOfReferenceAnalaysis];
	var idmontage=[myAppController.stacksController valueForKeyPath: "selection.id"];
	var myreq=[CPURLRequest requestWithURL: BaseURL+"collect"+"/"+samebase+"/" + idmontage];
	mystacksconnection=[CPURLConnection connectionWithRequest: myreq delegate: self];
	[progress startAnimation: self];
}

-(void) downloadGIFSingle: sender
{	var idmontage=[myAppController.stacksController valueForKeyPath: "selection.id"];
	var idanalysis1 =[myAppController.stacksContentController valueForKeyPath: "selection.idanalysis"];
	var idanalysis2 =[myAppController.stacksContentController valueForKeyPath: "selection.idanalysis_reference"];
	if(idanalysis2 === CPNullMarker)
	{	[[CPAlert alertWithError:"Please select entry with a reference"] runModal];
		return;
	}
	var myURL=BaseURL+"ransac_debug/0/" + idmontage + "/" + idanalysis1 + "/" + idanalysis2;
	if(_viewingCompo) myURL+=("&cmp="+parseInt(_viewingCompo));	//<!> fixme still unimplemented in backend
	window.open(myURL,'animated_gifwindow_debug');
}

-(void) autoStitching: sender
{	var myreq=[CPURLRequest requestWithURL: BaseURL+"autostitch/"+[myAppController.stacksController valueForKeyPath: "selection.id"]];
	mystacksconnection=[CPURLConnection connectionWithRequest:myreq delegate: self];
	[progress startAnimation: self];
}

-(void) bridgeStitching: sender
{	var idransac=[myAppController.trialsController valueForKeyPath: "selection.composition_for_ransac"]
	var idtrial=[myAppController.trialsController valueForKeyPath: "selection.id"]

	var selectedItems=[myAppController.stacksController selectedObjects ]
	var j=[selectedItems count];
	if (j != 2)
	{	[[CPAlert alertWithError:"Please select exactly two stacks"] runModal];
		return;
	}
	var idmontage1=[[selectedItems objectAtIndex:0] valueForKey:"id"];
	var idmontage2=[[selectedItems objectAtIndex:1] valueForKey:"id"];
	var url= BaseURL+"bridgestitch/"+idtrial+"/"+idransac+"/"+idmontage1+"/"+idmontage2;
	if(_bridgeStitchingAll) url+="?all=1";
	var myreq=[CPURLRequest requestWithURL: url];
	mystacksconnection=[CPURLConnection connectionWithRequest:myreq delegate: self];
	[progress startAnimation: self];
}
-(void) bridgeStitchingAll: sender
{	_bridgeStitchingAll=YES;
	[self bridgeStitching: sender]
	_bridgeStitchingAll=NO;
}

-(void) mergeBridged: sender
{
	var selectedItems=[myAppController.stacksController selectedObjects ]
	if ([selectedItems count] != 1)
	{	[[CPAlert alertWithError:"Please select only bridged stack"] runModal];
		return;
	}

	var idmontage=[myAppController.stacksController valueForKeyPath: "selection.id"];
	var myreq=[CPURLRequest requestWithURL: BaseURL+"rebase_merge/"+idmontage];
	mystacksconnection=[CPURLConnection connectionWithRequest:myreq delegate: self];
	[progress startAnimation: self];
}


// refresh gui after finishing async stuff
-(void) connection: someConnection didReceiveData: data
{	if(someConnection === mystacksconnection){
		var myid =  data;
		var mystack;

		[progress stopAnimation:self];
		if(myid  > 0) mystack=[myAppController.stacksController._entity objectWithPK: myid];
		if(myid == 0)
		{	mystack=[myAppController.stacksController selectedObject];
			var mytrial=[myAppController.trialsController selectedObject];
			[mytrial willChangeValueForKey:"stacks"];
			[mytrial._entity._relations makeObjectsPerformSelector:@selector(_invalidateCache)];
			[mytrial didChangeValueForKey:"stacks"];
			[myAppController.stacksController setSelectedObjects:[mystack]];
		}
		[mystack willChangeValueForKey:"analyses"];
		[mystack._entity._relations makeObjectsPerformSelector:@selector(_invalidateCache)];
		[mystack didChangeValueForKey:"analyses"];

		mystacksconnection=nil;
	} else
	{	[super connection:someConnection didReceiveData: data];
	}
}

-(void) runCrossvalidation:sender
{	var myArray=[[myAppController.stacksController selectedObject] valueForKey:"analyses" synchronous:YES];
	[[CrossvalidationController new] setAnalysisArray: myArray];

}
-(void) gotoClusterStacks:(id)sender
{
    var idstack=[myAppController.stacksController valueForKeyPath:"selection.id"];
    var myanalysis=[myAppController.analysesController._entity insertObject:@{"idstack":idstack}];
	var idtrial=[myAppController.trialsController valueForKeyPath:"selection.id"];
	window.open("http://augimageserver:3000/Frontend/index.html?id="+idtrial+"&t=ClusterStacks.gsmarkup",'clusterstacks');
}

@end

@implementation ClusterStacksController: AutoStacksController
{
    id stacksImageView;
    id tagField;
	id inputAnalysisWindow;
	id inputAnalysisField;
}
-(void) _postInit
{
    [super _postInit];
	[stacksImageView setDelegate:self];
    
    var mycompo= [myAppController.trialsController valueForKeyPath: "selection.composition_for_javascript2"];

	if(mycompo !== CPNullMarker)
	{	var myreq=[CPURLRequest requestWithURL: BaseURL+"0?cmp="+mycompo ];
		var mypackage=[[CPURLConnection sendSynchronousRequest: myreq returningResponse: nil]  rawString];
		var arr = JSON.parse( mypackage );
		if(!arr) return;
		var i,l=arr.length;
		for(i=0;i<l;i++)
		{	var m=arr[i];
			if([m characterAtIndex:0]=='<') continue;
			var sel=CPSelectorFromString(m);
			if(sel) [self performSelector:sel];
		}
	} else
        [stacksImageView setStyleFlags:[stacksImageView styleFlags] | AIVStyleNumbers ];

	[stacksImageView bind:"scale" toObject:self withKeyPath:"scale" options:nil];
	[stacksImageView bind:"value" toObject:myAppController.stacksAnalysesController withKeyPath: "selection.results" options:nil];
	[stacksImageView bind:"backgroundImage" toObject:myAppController.stacksContentController withKeyPath: "selection._backgroundImage" options:nil];
	[myAppController.stacksContentController addObserver:self forKeyPath:"selection.idcomposition_for_editing" options:nil context:nil];
}

// CompoAPI
-(void) setNumberingPoints
{	[stacksImageView setStyleFlags: [stacksImageView styleFlags] | AIVStyleNumbers ];
}
-(void) setDrawingLines
{	[stacksImageView setStyleFlags: [stacksImageView styleFlags] | AIVStylePolygon ];
}
-(void) setDrawingAngle
{	[stacksImageView setStyleFlags: [stacksImageView styleFlags] | AIVStyleAngleInfo ];
}
-(void) setClosingPolygons
{	[stacksImageView setStyleFlags: [stacksImageView styleFlags] | AIVStylePolygonClose ];
}
-(void) setVoronoi
{	[stacksImageView setStyleFlags: [stacksImageView styleFlags] | AIVStyleVoronoi ];
}



- (void)observeValueForKeyPath: keyPath ofObject: object change: change context: context
{	if(keyPath === "selection.idcomposition_for_editing" || keyPath === "value" )
	{
        window.___forceImageReload = 1;
		[[CPRunLoop currentRunLoop] performSelector:@selector(reloadImage) target:self argument:nil order:0 modes:[CPDefaultRunLoopMode]];
	}
}
-(void) reloadImage
{
	var img=[myAppController.stacksAnalysesController valueForKeyPath: "selection._backgroundImage"];
	if([img isKindOfClass:[CPImage class]])
	{
    	[stacksImageView setBackgroundImage:img];
	}
}


-(void) reaggregate: sender
{	var mycompo= [myAppController.trialsController valueForKeyPath: "selection.composition_for_aggregation"];
	var idanalysis=[myAppController.stacksAnalysesController valueForKeyPath:"selection.id"];

	if(mycompo !== CPNullMarker)
	{
		var myreq=[CPURLRequest requestWithURL: BaseURL+"0?idanalysis="+idanalysis+"&cmp="+mycompo];
		var res=[CPURLConnection sendSynchronousRequest:myreq returningResponse:nil];
        [[CPApp delegate].stackAggregationsController reload];
	}
}

-(void) reloadImage
{
	var img=[[CPApp delegate].stacksContentController valueForKeyPath: "selection._backgroundImage"];
	if([img isKindOfClass:[CPImage class]])
	{
    	[stacksImageView setBackgroundImage:img];
	}
}
-(void) setScale:(double) someScale
{	[super setScale:someScale];
	[stacksImageView setScale: _scale];
	[self reloadImage];
}

-(void) insertAnalysisFromInput:sender
{
	[inputAnalysisField setStringValue:[self _getCoords]];
	[inputAnalysisWindow makeKeyAndOrderFront:self];
}
-(void) performUploadCoords:sender
{	var myIdSourceAnalysis=  [myAppController.stacksAnalysesController valueForKeyPath:"selection.id"];
	var mystuff=[inputAnalysisField stringValue];
	var myreq=[CPURLRequest requestWithURL: BaseURL+"input_results/"+myIdSourceAnalysis+"/"+mystuff];
	[CPURLConnection sendSynchronousRequest: myreq returningResponse: nil];
	[self _refreshResults];
	[inputAnalysisWindow orderOut:self];
}
-(CPString) _getCoords
{	var coords="";
	var sourceArray=[myAppController.stacksAnalysesController valueForKeyPath:"selection.results"];
	var i,j = [sourceArray count];
	for(i = 0; i < j; i++)
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
	return coords;
}

-(void) setTag: sender
{
	var tag=[sender integerValue];
	[stacksImageView setDefaultTag: tag];
	var arr=[stacksImageView selectedDots];

	var i,j=[arr count];
	for(i=0; i<j;i++)
	{	var o=arr[i];
		[o._data setValue: tag forKey:"tag"];
		[o setNeedsDisplay:YES];
	}
}

-(void) annotatedImageView:(id)someView dotWasSelected:(id)someDot
{	[tagField setIntegerValue: [someDot objectValue].tag];
	[self setTag: tagField];
}

@end


@implementation GSMarkupTagAutoStacksController:GSMarkupTagManualStacksController
+ (CPString) tagName
{
  return @"autoStacksController";
}
+ (Class) platformObjectClass
{
	return [AutoStacksController class];
}
@end
@implementation GSMarkupTagClusterStacksController:GSMarkupTagAutoStacksController
+ (CPString) tagName
{
  return @"clusterStacksController";
}
+ (Class) platformObjectClass
{
	return [ClusterStacksController class];
}
@end
