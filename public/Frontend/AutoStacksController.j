// this controller is for manual image registration

@import "ManualStacksController.j"


@implementation AutoStacksController: ManualStacksController
{	id progress;
	var mystacksconnection
}

//prevent our RANSAC matrix from beeing destroyed. don't call super method!!
-(void) _triggerRegistrationMatrixGeneration
{
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
	var myreq=[CPURLRequest requestWithURL: BaseURL+"ransac_debug/" + idransac + "/" + idmontage + "/" + idanalysis1 + "/" + idanalysis2];
	mystacksconnection=[CPURLConnection connectionWithRequest:myreq delegate: self];
	[progress startAnimation: self];
}
-(void) rebase: sender
{	var id = [myAppController.stacksContentController valueForKeyPath: "selection.id"];
	var myreq=[CPURLRequest requestWithURL: BaseURL+"rebase/" + id];
	mystacksconnection=[CPURLConnection connectionWithRequest: myreq delegate: self];
	[progress startAnimation: self];
}
-(void) collectSamebase: sender
{	var id = [myAppController.stacksContentController valueForKeyPath: "selection.id"];
	var myreq=[CPURLRequest requestWithURL: BaseURL+"collect_samebase/" + id];
	mystacksconnection=[CPURLConnection connectionWithRequest: myreq delegate: self];
	[progress startAnimation: self];
}
-(void) downloadGIFSingle: sender
{	var idmontage=[myAppController.stacksController valueForKeyPath: "selection.id"];
	var idanalysis1 =[myAppController.stacksContentController valueForKeyPath: "selection.idanalysis"];
	var idanalysis2 =[myAppController.stacksContentController valueForKeyPath: "selection.idanalysis_reference"];
	var myURL=BaseURL+"ransac_debug/0/" + idmontage + "/" + idanalysis1 + "/" + idanalysis2;
	if(_viewingCompo) myURL+=("&cmp="+parseInt(_viewingCompo));	#<!> fixme unimplemented in backend
	window.open(myURL,'animated_gifwindow');
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
	var myreq=[CPURLRequest requestWithURL: BaseURL+"bridgestitch/"+idtrial+"/"+idransac+"/"+idmontage1+"/"+idmontage2];
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
	{	[super connection: someConnection didReceiveData: data];
	}
}

-(void) runCrossvalidation:sender
{	var myArray=[[myAppController.stacksController selectedObject] valueForKey:"analyses" synchronous:YES];
	[[CossvalidationController new] setAnalysisArray: myArray];

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
