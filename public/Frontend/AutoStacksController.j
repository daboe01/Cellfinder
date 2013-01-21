// this controller is for manual image registration

@import "ManualStacksController.j"

@implementation UnnumberedImageEditorCollectionItem: ImageEditorCollectionItem

- _createContentView
{	var o= [super _createContentView];
	[o setStyleFlags: [o styleFlags] & ~AIVStyleNumbers ];
	return o;
}

@end


/////////////////////////////////////////////////////////


@implementation AutoStacksController: ManualStacksController

//prevent our RANSAC matrix from beeing destroyed. don't call super method!!
-(void) _triggerRegistrationMatrixGeneration
{
}

-(void) _postInit
{	[super _postInit];
	[self setScale:1];
}
-(void) runRansac: sender
{	var myreq=[CPURLRequest requestWithURL: BaseURL+"STACK/"+[myAppController.stacksController valueForKeyPath: "selection.id"] +"?spc=affine&ransac=1&thresh=60&identityradius=6"];
	[CPURLConnection sendSynchronousRequest: myreq returningResponse: nil];
	[[myAppController.stacksController selectedObject] willChangeValueForKey:"analyses"];
	 [myAppController.stacksController._entity._relations makeObjectsPerformSelector:@selector(_invalidateCache)];
	[[myAppController.stacksController selectedObject] didChangeValueForKey:"analyses"];
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
