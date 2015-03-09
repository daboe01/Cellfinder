// this controller is for manual image registration

@import "ManualStacksController.j"


@implementation AutoStacksController: ManualStacksController
{	id		progress;
	BOOL	_bridgeStitchingAll;
	var		mystacksconnection
}

//prevent our RANSAC matrix from beeing destroyed. don't call super method!!
-(void) _triggerRegistrationMatrixGeneration
{
}

- (void)deleteAllWarningDidEnd:(CPAlert)anAlert code:(id)code context:(id)context
{	if(code)
	{	var idtrial=[myAppController.trialsController valueForKeyPath: "selection.id"]
        var myreq=[CPURLRequest requestWithURL: BaseURL+"STACK/DELALL/"+idtrial];
        [CPURLConnection sendSynchronousRequest: myreq returningResponse: nil];
        [myAppController.stacksController reload];
    }

}

-(void) deleteAll: sender
{
	var myalert = [CPAlert new];
	[myalert setMessageText: "Are you sure you want to delete all entries?"];
	[myalert addButtonWithTitle:"Cancel"];
	[myalert addButtonWithTitle:"Delete"];
	[myalert beginSheetModalForWindow: myWindow modalDelegate:self didEndSelector:@selector(deleteAllWarningDidEnd:code:context:) contextInfo: nil];

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
-(void) reRansacReversed:(id)sender
{
	var idanalysis1 =[myAppController.stacksContentController valueForKeyPath: "selection.idanalysis"];
	var idanalysis2 =[myAppController.stacksContentController valueForKeyPath: "selection.idanalysis_reference"];
	if(idanalysis2 === CPNullMarker)
	{	[[CPAlert alertWithError:"Please select entry with a reference"] runModal];
		return;
	}
   [myAppController.stacksContentController setValue:idanalysis1 forKeyPath:"selection.idanalysis_reference"];
   [myAppController.stacksContentController setValue:idanalysis2 forKeyPath:"selection.idanalysis"];
   [self reRansac:self];
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
}
-(void) _postInit
{
    [super _postInit];
	[stacksImageView setDelegate:self];
	[stacksImageView setStyleFlags:[stacksImageView styleFlags] | AIVStyleNumbers ];
	[stacksImageView bind:"scale" toObject:self withKeyPath:"scale" options:nil];
	[stacksImageView bind:"value" toObject:[CPApp delegate].stacksAnalysesController withKeyPath: "selection.results" options:nil];
	[stacksImageView bind:"backgroundImage" toObject:[CPApp delegate].stacksContentController withKeyPath: "selection._backgroundImage" options:nil];
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
