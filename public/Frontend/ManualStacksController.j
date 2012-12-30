// this controller is for manual image registration

@import "StacksController.j"

@implementation ImageEditorCollectionItem: SimpleImageViewCollectionItem

-(void) setImage: someImage
{	_img=someImage;
	var mysize=[_img size];
	if ([[self collectionView] respondsToSelector:@selector(setMinItemSize:)])
		[[self collectionView] setMinItemSize: mysize ];
	[_imgv setBackgroundImage: _img];
	[[[self collectionView] delegate] resetItemSize];
}

- _createContentView
{	var o= [AnnotatedImageView new];
	[o setDelegate: self];
	[o setStyleFlags: [o styleFlags] | AIVStyleNumbers ];
	[o bind:"scale" toObject: self withKeyPath: "size" options:nil];
	[o bind:"value" toObject: _representedObject withKeyPath: "analysis.results" options:nil];
	return o;
}

-(void) annotatedImageView: someView dot: someDot movedToPoint: newPoint
{	var cv=[self collectionView];
	var items=[cv items];
	var i,j=[items count];
	var dotIndex=[someView indexOfDot: [someDot data]];
	for(i=0;i<j;i++)
	{	var o=items[i];
		var aiv=[[o view] contentView];
		if(someView !== aiv)
		{	var dots=[aiv objectValue];
			if(dotIndex > [dots count]-1)		//  add point, that is not yet present in other view
			{
				var mydot=[[DotView alloc] initWithCentroid: newPoint ];
				var obV=[aiv addToModelPoint: newPoint]
				[mydot setData: obV];
				[mydot setId: [obV valueForKey:"id"] ]

				[aiv addDotView: mydot];
				[aiv setNeedsDisplay:YES];
			}
		}
	}
}
-(void) delete: sender	// delete a dot
{	[_imgv delete:sender];
}

- (void) annotatedImageView: aView didDoubleClickWithEvent: anEvent
{	var d=[[self collectionView] delegate];
	[d removeImageAtIndex:[d indexOfItem: aView._delegate]];
}

@end


/////////////////////////////////////////////////////////


@implementation ManualStacksController: StacksController


-(void) delete: sender	// delete a dot
{	[[stacksCollectionView items] makeObjectsPerformSelector:@selector(delete:) withObject: sender];
}


@end


@implementation GSMarkupTagManualStacksController:GSMarkupTagObject
+ (CPString) tagName
{
  return @"manualStacksController";
}
+ (Class) platformObjectClass
{
	return [ManualStacksController class];
}
@end
