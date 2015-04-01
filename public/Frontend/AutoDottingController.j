@import "DottingController.j"

// this controller is for automated cell detection

@implementation AutoDottingController : DottingController
{	id annotatedImageView;
	id trialSettingsWindow;
	id inputAnalysisWindow;
	id inputAnalysisField;
	id tagField;
    id clusterConnection;
    id autostitchConnection;
    id reanaConnection;
    id reaggConnection;
    id tagsTV;
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
			if([m characterAtIndex:0]=='<') continue;
			var sel=CPSelectorFromString(m);
			if(sel) [self performSelector:sel];
		}
	}
	var re = new RegExp("#([^&#]+)");
	var m=re.exec(document.location);
	if (m) [myAppController.folderController setFilterPredicate: [CPPredicate predicateWithFormat:"folder_name=='"+m[1]+"'" ]];
    [annotatedImageView setDefaultTag:0];
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
        window.___forceImageReload = 1;
		[[CPRunLoop currentRunLoop] performSelector:@selector(reloadImage) target:self argument:nil order:0 modes:[CPDefaultRunLoopMode]];
	}
}
-(void) setScale:(double) someScale
{	_scale=someScale;
	[annotatedImageView setScale: _scale];
	[self reloadImage];
}
-(void) reloadImage
{
	var img=[myAppController.analysesController valueForKeyPath: "selection._backgroundImage"];
	if([img isKindOfClass:[CPImage class]])
	{
    	[annotatedImageView setBackgroundImage:img];
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
-(void) setClosingPolygons
{	[annotatedImageView setStyleFlags: [annotatedImageView styleFlags] | AIVStylePolygonClose ];
}


-(void) reaggregate: sender
{	var mycompo= [myAppController.trialsController valueForKeyPath: "selection.composition_for_aggregation"];
	var idanalysis=[myAppController.analysesController valueForKeyPath:"selection.id"];
	var idimage=[myAppController.analysesController valueForKeyPath:"selection.idimage"];
	if(mycompo !== CPNullMarker)
	{
		var myreq=[CPURLRequest requestWithURL: BaseURL+idimage+"?idanalysis="+idanalysis+"&cmp="+mycompo];
		var res=[CPURLConnection sendSynchronousRequest: myreq returningResponse: nil];
		[super reaggregate:sender];
	}
}
-(void) runSettings: sender
{	[trialSettingsWindow makeKeyAndOrderFront:self];
}

-(void)_makestackForIDTrial:idtrial
{	var myarr=[CPMutableArray new];
	var so=[myAppController.folderContentController selectedObjects];
	var i,l=[so count];
	if(l<2)
	{	[[CPAlert alertWithError:"Bitte mindestens zwei Zeilen auswaehlen (Shift-Taste)"] runModal];
		return;
	}
	for(i=0;i<l;i++)
	{	var ro=[so objectAtIndex: i];
		[myarr addObject: [ro valueForKey:"idimage"]];
	}
    var folderName=[[so objectAtIndex:0] valueForKey:"folder_name"]+'_'+[so count];
	var myreq=[CPURLRequest requestWithURL: BaseURL+"makestack"+"/"+idtrial+"/"+folderName];
    [myreq setHTTPMethod: "POST"];
	[myreq setHTTPBody: JSON.stringify(myarr) ];
	var ret=[CPURLConnection sendSynchronousRequest:myreq returningResponse:nil];
    return [ret rawString];
}

-(void) matchDots: sender
{
	var idtrial=[myAppController.trialsController valueForKeyPath:"selection.id"];
    [self _makestackForIDTrial:idtrial];
	window.open("http://augimageserver:3000/Frontend/index.html?id="+idtrial+"&t=AutoStacks.gsmarkup",'autostacks');
}

-(void) clusterDots:sender
{
	var mycompoID= [myAppController.trialsController valueForKeyPath: "selection.composition_for_clustering"];
    if (mycompoID === CPNullMarker) 
    {   alert("no compo given");
        return;
    }
	var idtrial=[myAppController.trialsController valueForKeyPath:"selection.id"];
    var idstack=[self _makestackForIDTrial:idtrial];
	var myreq=[CPURLRequest requestWithURL:BaseURL+"0?cmp="+mycompoID+"&idstack="+idstack];
	clusterConnection = [CPURLConnection connectionWithRequest:myreq delegate:self];
    clusterConnection._idtrial=idtrial;
    [progress startAnimation:self];
}

-(void) doAnalyzeSelected: sender
{	var myarr=[CPMutableArray new];
	var so=[myAppController.folderContentController selectedObjects];
	var mycompoID= [myAppController.trialsController valueForKeyPath: "selection.composition_for_celldetection"];
    if (mycompoID === CPNullMarker) 
    {   alert("no compo given");
        return;
    }
	var i,l=[so count];
	for(i=0;i<l;i++)
	{	var ro=[so objectAtIndex: i];
        var idimage=[ro valueForKey:"idimage"];
        var myanalysis=[myAppController.analysesController._entity insertObject:@{"idimage":idimage, "idcomposition_for_analysis":mycompoID}];
        var myurl= BaseURL +idimage+"?cmp="+mycompoID+"&idanalysis="+[myanalysis valueForKey:"id"];
		var myconnection=[CPURLConnection connectionWithRequest:[CPURLRequest requestWithURL: myurl] delegate:self];
        myconnection._doReload=YES;
	}
}
-(void) analyzeSelected: sender
{
    setTimeout(function() {[self doAnalyzeSelected: sender]}, 1000);
}

-(void) addDefaultAnalyses:(id)sender
{
	var folder_name=[myAppController.folderController valueForKeyPath:"selection.folder_name"];
	var idtrial= [myAppController.trialsController valueForKeyPath:"selection.id"]
	var myurl=BaseURL+"analyze_folder/"+idtrial+"/"+ folder_name;
	var myreq=[CPURLRequest requestWithURL: myurl];
	reanaConnection=[CPURLConnection connectionWithRequest:myreq delegate: self];
    reanaConnection._doReload=YES;
    [progress startAnimation:self];
}
-(void) reaggregateFolder:(id)sender
{
	var folder_name=[myAppController.folderController valueForKeyPath:"selection.folder_name"];
	var idtrial= [myAppController.trialsController valueForKeyPath:"selection.id"]
	var myurl=BaseURL+"reaggregate_folder/"+idtrial+"/"+ folder_name;
	var myreq=[CPURLRequest requestWithURL: myurl];
    [myreq setHTTPMethod:"POST"];

	reaggConnection=[CPURLConnection connectionWithRequest:myreq delegate: self];
    reaggConnection._doReload=YES;
    [progress startAnimation:self];
}

- (void)connection:someConnection didReceiveData: data
{
    if(someConnection._doReload)
    {
        [myAppController.analysesController reload];
    }
    [super connection:someConnection didReceiveData:data];
    if(someConnection === clusterConnection)
    {   var idtrial=clusterConnection._idtrial;
        clusterConnection=nil;
        [progress stopAnimation: self];
        window.open("http://augimageserver:3000/Frontend/index.html?id="+idtrial+"&t=ClusterStacks.gsmarkup",'clusterstacks');
    }
    if(someConnection === autostitchConnection)
    {   var idtrial=clusterConnection._idtrial;
        autostitchConnection=nil;
        [progress stopAnimation: self];
        window.open("http://augimageserver:3000/Frontend/index.html?id="+idtrial+"&t=AutoStacks.gsmarkup",'autostacks');
    }
    if(someConnection === reanaConnection)
    {
        reanaConnection=nil;
        [progress stopAnimation: self];
    }
    if(someConnection === reaggConnection)
    {
        reaggConnection=nil;
        [progress stopAnimation: self];
    }
    
}


-(void) matchDotsAll: sender	//<!> fixme GUI feedback usw.
{	var idtrial =[myAppController.trialsController valueForKeyPath: "selection.id"];
	var idransac=[myAppController.trialsController valueForKeyPath: "selection.composition_for_ransac"];

	var myreq=[CPURLRequest requestWithURL: BaseURL+"automatch_folder/"+idtrial+"/"+idransac+"/"+[myAppController.folderController valueForKeyPath:"selection.folder_name"]];
    [progress startAnimation:self];
	autostitchConnection=[CPURLConnection connectionWithRequest:myreq delegate: self];
}


-(void) toggleVoronoi:sender
{	[annotatedImageView setStyleFlags: [annotatedImageView styleFlags] ^ AIVStyleVoronoi ];
	[annotatedImageView setNeedsDisplay:YES];
}

-(void) editViewingCompo:sender
{
    var mycompocontroller=[[CompoController alloc] initWithCompo:[[myAppController.analysesController selectedObject] valueForKey:"editing_compo"] valueObserver:self];
    [mycompocontroller setDelegate:self];
}
-(void) unsetCompo:(id)sender
{
    [[myAppController.analysesController selectedObject] setValue:[CPNull null] forKey:"idcomposition_for_editing"];
}

-(void) insertAnalysisFromInput:sender
{
	[inputAnalysisField setStringValue:[self _getCoords]];
	[inputAnalysisWindow makeKeyAndOrderFront:self];
}
-(void) performUploadCoords:sender
{	var myIdSourceAnalysis=  [myAppController.analysesController valueForKeyPath:"selection.id"];
	var mystuff=[inputAnalysisField stringValue];
	var myreq=[CPURLRequest requestWithURL: BaseURL+"input_results/"+myIdSourceAnalysis+"/"+mystuff];
	[CPURLConnection sendSynchronousRequest: myreq returningResponse: nil];
	[self _refreshResults];
	[inputAnalysisWindow orderOut:self];
}
-(CPString) _getCoords
{	var coords="";
	var mySourceAnalysis=  [myAppController.analysesController selectedObject];
	var sourceArray=[mySourceAnalysis valueForKey:"results"];
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
	[annotatedImageView setDefaultTag: tag];
	var arr=[annotatedImageView selectedDots];

	var i,j=[arr count];
	for(i=0; i<j;i++)
	{	var o=arr[i];
		[o._data setValue: tag forKey:"tag"];
		[o setNeedsDisplay:YES];
	}
}

-(void) annotatedImageView: someView dotWasSelected: someDot
{	[tagField setIntegerValue: [someDot objectValue].tag];
	[self setTag: tagField];
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
