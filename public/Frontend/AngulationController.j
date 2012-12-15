@import "DottingController.j"


@implementation AngulationController : DottingController
-(void) _postInit
{	[super _postInit];
	[annotatedImageView setDrawingAngle];
}
@end


@implementation GSMarkupTagAngulationController : GSMarkupTagDottingController
+ (CPString) tagName
{
  return @"angulationController";
}
+ (Class) platformObjectClass
{
	return [AngulationController class];
}
@end

