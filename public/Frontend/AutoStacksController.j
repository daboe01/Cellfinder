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

-(void) autoStitching: sender
{	var myreq=[CPURLRequest requestWithURL: BaseURL+"autostitch/"+[myAppController.stacksController valueForKeyPath: "selection.id"]];
	mystacksconnection=[CPURLConnection connectionWithRequest:myreq delegate: self];
	[progress startAnimation: self];
}


// refresh gui after finishing async stuff
-(void) connection: someConnection didReceiveData: data
{	if(someConnection === mystacksconnection){
		var myid =  data;

		[progress stopAnimation:self];
		if(myid > 0)
		{	var mystack=[myAppController.stacksController._entity objectWithPK: myid];
			[mystack willChangeValueForKey:"analyses"];
			[mystack._entity._relations makeObjectsPerformSelector:@selector(_invalidateCache)];
			[mystack didChangeValueForKey:"analyses"];
		} else if(myid == 0)
		{

			var mytrial=[myAppController.trialsController selectedObject];
			[mytrial willChangeValueForKey:"stacks"];
			[mytrial._entity._relations makeObjectsPerformSelector:@selector(_invalidateCache)];
			[mytrial didChangeValueForKey:"stacks"];
		}
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
