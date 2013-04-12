// this controller is for manual image registration

@import "AutoStacksController.j"


@implementation VoronoiSimulationController: AutoStacksController
{	id myScrollView;
}

-(void) runExperiment: sender
{	var arr=[[[myAppController.stacksController selectedObject] valueForKey:"analyses"] copy];
	var i,j=[arr count];
	var sourceAnalysis;
	var destinationAnalysis;
	var peek;

	for(i=0; i<j;i++)
	{	var o=arr[i];
		if(!(peek=[o valueForKey:"idanalysis_reference"])) sourceAnalysis=peek;
		else destinationAnalysis=peek;
	}
	alert(sourceAnalysis)
	[myCollectionView setContent: [sourceAnalysis] ];
}
@end


@implementation GSMarkupTagVoronoiSimulationController:GSMarkupTagAutoStacksController
+ (CPString) tagName
{
  return @"voronoiSimulationController";
}
+ (Class) platformObjectClass
{
	return [VoronoiSimulationController class];
}
@end
