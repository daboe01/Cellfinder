@import "DottingControllers.j"

/////////////////////////////////////////////////////////
@implementation FlickerController: CPObject
{	id	imageView;
	id	slider;
	id	imageArray;
	unsigned _imageIndex;
}


-(void) setImageArray: myArray
{	[CPBundle loadRessourceNamed: "Flicker.gsmarkup" owner:self];
	imageArray=myArray;
	[slider setMaxValue: [imageArray count]-1 ];
}
-(void) setImageIndex:(unsigned) someIndex
{	_imageIndex=Math.min(Math.floor(someIndex), [imageArray count]-1 );
	var image= [imageArray objectAtIndex:  _imageIndex ];
	var size=[image size];
	var myframe=[imageView frame];

// setObjectValue causes flicker in more recent WebKit browsers.
// so here is my workaround...
    imageView._DOMImageElement.style.visibility = "hidden";
    imageView._DOMImageElement.src = [image filename];
	[imageView setFrame: CPMakeRect(myframe.origin.x,myframe.origin.y, size.width, size.height)];
    imageView._DOMImageElement.style.visibility = "visible";
}
-(unsigned) imageIndex
{	return _imageIndex;
}
- (void)imageDidLoad:(CPImage)image
{	[self setImageIndex:0];
}

@end


/////////////////////////////////////////////////////////

@implementation ProjectedImageEditorCollectionItem: UnnumberedImageEditorCollectionItem
-(CPString) _additionalImageURLPart
{	return [super _additionalImageURLPart]+"&affine="+[_representedObject valueForKey:"parameter"];
}
@end


@implementation CossvalidationAnalysisProxy: CPObject
{	var _fsobject;
	var	_idimage;
	var _parameter
}
- initWithObject: myObject
{	if(self=[super init])
	{	_fsobject=myObject;
	}
	return self;
}
- valueForKey:(CPString) aKey
{	if(aKey==="idimage")
	{	return _idimage;
	} else if(aKey==="parameter")
	{	return _parameter;
	} else return [_fsobject valueForKey:aKey];
}
-(void) setValue: aVal forKey:(CPString) aKey
{	if(aKey==="idimage")
	{	_idimage= aVal;
	} else if(aKey==="parameter")
	{	_parameter = aVal;
		return;
	} else [_fsobject setValue: aVal forKey:aKey];
}
- entity
{	return [_fsobject entity];
}
- setEntity: anEntity
{	[_fsobject setEntity: anEntity];
}
@end


@implementation CossvalidationController: CPObject
{	var sourceAnalysis;
	var destinationAnalysis;
	var myAnalysis;
	id	myCollectionView;
}

-(void) setAnalysisArray: myArray
{	var arr=[myArray copy];
	var i,j=[arr count];

	for(i=0; i<j;i++)
	{	var o=arr[i];
		if([o valueForKey:"idanalysis_reference"] === null)
		{	sourceAnalysis=o;
		}
		else destinationAnalysis=o;
	}
	myAnalysis =[[CossvalidationAnalysisProxy alloc] initWithObject: sourceAnalysis];
	[CPBundle loadRessourceNamed: "Crossvalidation.gsmarkup" owner:self];
	[[CPRunLoop currentRunLoop] performSelector:@selector(_postInit) target:self argument: nil order:0 modes:[CPDefaultRunLoopMode]];
}
-(void) _postInit
{	[self _configureForAnalysis: destinationAnalysis];
}

-(void) _configureForAnalysis: anAnalysis
{	[myAnalysis setValue: [anAnalysis valueForKey:"idimage"] forKey:"idimage"];
	[myAnalysis setValue: [anAnalysis valueForKey:"parameter"] forKey:"parameter"];
	[myCollectionView setContent: [myAnalysis] ];
}
-(void) toggleImage:sender
{	var anAnalysis=destinationAnalysis;

	if([sender objectValue] === 1)	// show source image
		anAnalysis=sourceAnalysis;
	[self _configureForAnalysis: anAnalysis];
}
@end