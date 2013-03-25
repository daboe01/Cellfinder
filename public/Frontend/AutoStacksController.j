// this controller is for manual image registration

@import "ManualStacksController.j"

@implementation UnnumberedImageEditorCollectionItem: ImageEditorCollectionItem

- _createContentView
{	var o= [super _createContentView];
	[o setStyleFlags: [o styleFlags] & ~AIVStyleNumbers ];
	return o;
}

//prevent dot creation in other view don't call super method!!
-(void) annotatedImageView: someView dot: someDot movedToPoint: newPoint
{
}

@end


/////////////////////////////////////////////////////////


@implementation AutoStacksController: ManualStacksController
{	id progress;
}

//prevent our RANSAC matrix from beeing destroyed. don't call super method!!
-(void) _triggerRegistrationMatrixGeneration
{
}

-(void) _postInit
{	[super _postInit];
	[self setScale:1];
}
-(void) runRansac: sender
{	var myreq=[CPURLRequest requestWithURL: BaseURL+"STACK/"+[myAppController.stacksController valueForKeyPath: "selection.id"] +"?spc=affine&ransac=1&thresh=80&identityradius=6&iterations=15"];
	[CPURLConnection connectionWithRequest:myreq delegate: self];
	[progress startAnimation: self];
}
-(void) runRansac3: sender
{	var myreq=[CPURLRequest requestWithURL: BaseURL+"STACK/"+[myAppController.stacksController valueForKeyPath: "selection.id"] +"?spc=affine&ransac=1&thresh=40&identityradius=6&iterations=15"];
	[CPURLConnection connectionWithRequest:myreq delegate: self];
	[progress startAnimation: self];
}
-(void) runRansac2: sender
{	var myreq=[CPURLRequest requestWithURL: BaseURL+"STACK/"+[myAppController.stacksController valueForKeyPath: "selection.id"] +"?spc=affine&ransac=1&thresh=100&identityradius=8&iterations=25"];
	[CPURLConnection connectionWithRequest:myreq delegate: self];
	[progress startAnimation: self];
}

-(void) connection: someConnection didReceiveData: data
{	var myid =  data;
	[progress stopAnimation:self];
	if(myid)
	{	var mystack=[myAppController.stacksController._entity objectWithPK: myid];
		[mystack willChangeValueForKey:"analyses"];
		[mystack._entity._relations makeObjectsPerformSelector:@selector(_invalidateCache)];
		[mystack didChangeValueForKey:"analyses"];
	}
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
