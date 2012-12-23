@import <Foundation/CPObject.j>
@import <Renaissance/Renaissance.j>
@import "AnnotatedImageView.j"


@implementation CPObject (ImageURLForDottingController)

-(CPImage) _backgroundImage
{	var mycompoID=[self valueForKey:"idcomposition_for_editing" ];
	var myidimage=[self valueForKey:"idimage" ];
	var myURL= [[CPApp delegate] baseImageURL]+myidimage+"?rnd=1";
	if(mycompoID && mycompoID!==CPNullMarker) myURL+="&cmp="+mycompoID;
	var mycontroller= [[CPApp mainWindow] delegate];	// this is hack to get hold of the UI context from within the database context
	var scale= mycontroller._scale;
	if(mycontroller._originalSize) myURL+="&width="+ Math.floor(mycontroller._originalSize.width *scale*
																mycontroller._originalSize.height*scale);
	var img=[[CPImage alloc] initWithContentsOfFile: myURL];
	[img setDelegate: mycontroller];
	return img;
}

@end


/////////////////////////////////////////////////////////

@implementation DottingController : CPObject
{	id annotatedImageView;
	id _scale @accessors(property=scale);
	CPSize _originalSize;
}

// this is a hack to get the scaling right
- (void)imageDidLoad:(CPImage)image
{	if(!_originalSize) _originalSize= [image size];
}

- init
{	if(self=[super init])
	{	_scale=1;
		[[CPRunLoop currentRunLoop] performSelector:@selector(_postInit) target:self argument: nil order:0 modes:[CPDefaultRunLoopMode]];
	} return self;
}

-(void) _postInit
{	var mycompo= [[CPApp delegate].trialsController valueForKeyPath: "selection.composition_for_javascript"];
	if(mycompo != CPNullMarker)
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
	[annotatedImageView bind:"backgroundImage" toObject: [CPApp delegate].analysesController withKeyPath: "selection._backgroundImage" options:nil];
}

-(void) setScale:(double) someScale
{	_scale=someScale;
	[annotatedImageView setScale: _scale];
	[annotatedImageView setBackgroundImage: [[[CPApp delegate].analysesController selectedObject] _backgroundImage]];	// force image update

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

@end

@implementation GSMarkupTagDottingController : GSMarkupTagObject
+ (CPString) tagName
{
  return @"dottingController";
}
+ (Class) platformObjectClass
{
	return [DottingController class];
}
@end

