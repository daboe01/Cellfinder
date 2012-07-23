/*
 * AppController.j
 * NewApplication
 *
 * Created by You on November 16, 2011.
 * Copyright 2011, Your Company All rights reserved.
 *
 * <!> fixme
 * nothing to declare currently...
 *
 */

@import <Foundation/CPObject.j>
@import <Renaissance/Renaissance.j>

var CV_MAXPIXELSIZE=500;

@implementation SimpleImageViewCollectionItem: CPCollectionViewItem
{	CPImage _img;
	CPImageView _imgv;
	unsigned _size @accessors(property=size);
	unsigned _compoID @accessors(property=compoID);
}
-(void) setSize:(insigned) someSize
{	if(_size == someSize) return;
	_size=someSize;
	_img=[_representedObject provideImageForCollectionViewItem: self];
	[_img setDelegate: self];
}
-(void) setCompoID:(insigned) someID
{	_compoID=someID;
	_img=[_representedObject provideImageForCollectionViewItem: self];
	[_img setDelegate: self];
}
- (void)imageDidLoad:(CPImage)image
{	[_imgv setImage: image];
	var myframe=[_imgv frame];
	var mysize=[image size];
	[_imgv setFrame: CPMakeRect(myframe.origin.x,myframe.origin.y, mysize.width, mysize.height)];

}
- _createContentView
{	var o=[CPImageView new];
	[o setImageScaling: CPScaleProportionally];
	return o;
}
-(CPView) loadView
{	_imgv=[self _createContentView];
	var myview=[CPBox new];
	var name=[_representedObject valueForKeyPath:"image.name"]
	[myview setTitle: name];
	[myview setTitlePosition: CPBelowBottom];
    [myview setBorderType:  CPLineBorder ];
    [myview setBorderWidth:  2.0 ];

	[myview setContentView: _imgv];
	[self setView: myview];
	_img=[_representedObject provideImageForCollectionViewItem: self];
	[_img setDelegate: self];
	return myview;
}
-(void) setRepresentedObject: someObject
{	[super setRepresentedObject: someObject];
	[self loadView];
}
-(void) setSelected:(BOOL) state
{	[[self view] setBorderColor: state? [CPColor yellowColor]: [CPColor blackColor] ];
}

@end

/////////////////////////////////////////////////////////
@implementation FlickerController: CPObject
{	var myAppController;
	id	flickerSuperview;
	id	imageView;
	id	slider;
	id	imageArray;
	unsigned _imageIndex;
}


-(FlickerController) initWithImageArray: myArray andAppController: someAppController
{	if(self=[self init])
	{	myAppController=someAppController;
		[CPBundle loadRessourceNamed: "flicker.gsmarkup" owner:self];
		imageArray=myArray;
		[slider setMaxValue: [imageArray count]-1 ];
		[self setImageIndex:0];
	}
	return self;
}
-(void) setImageIndex:(unsigned) someIndex
{	_imageIndex=Math.floor(someIndex);
	_imageIndex=Math.min(_imageIndex, [imageArray count]-1 );
	var image= [imageArray objectAtIndex:  _imageIndex ];
	var size=[image size];
	var myframe=[imageView frame];
	[imageView setFrame: CPMakeRect(myframe.origin.x,myframe.origin.y, size.width, size.height)];
	[imageView setObjectValue: image];
}
-(unsigned) imageIndex
{	return _imageIndex;
}

@end


/////////////////////////////////////////////////////////

PhotoDragType="PhotoDragType";

@implementation StacksController: CPObject
{
	var myAppController;
	id	stacksCollectionView;
	id	stacksWindow;
	id	_viewingCompo;
	id	stacksettingswindow;
	unsigned _itemSize;

}

-(CPString) _ressourceName
{	return "stacks.gsmarkup";
}

- initWithTrial: someTrial andAppController: someAppController
{	if(self=[self init])
	{	myAppController=someAppController;

		[CPBundle loadRessourceNamed: [self _ressourceName] owner:self];
		[stacksCollectionView registerForDraggedTypes:[PhotoDragType]];
		[self setItemSize:0.5];
	}
}

-(void) setItemSize:(unsigned) someSize
{	_itemSize=someSize;
	[[stacksCollectionView items] makeObjectsPerformSelector:@selector(setSize:) withObject:_itemSize];
	[stacksCollectionView setMinItemSize: CPMakeSize(_itemSize*CV_MAXPIXELSIZE,_itemSize*CV_MAXPIXELSIZE)];
}
-(void) itemSize
{	return _itemSize;
}


-(void) newStack: sender
{	[myAppController.stacksController addObject: [CPDictionary dictionaryWithObject:"NewStack" forKey:"name" ]];
	[self runSettings:self];
}
-(void) deleteStack: sender
{	[myAppController.stacksController removeObjectsAtArrangedObjectIndexes: [myAppController.stacksController selectionIndexes] ];
}

-(void) runSettings:sender
{	[CPApp beginSheet: stacksettingswindow modalForWindow: stacksWindow modalDelegate:self didEndSelector:@selector(didEndSheet:returnCode:contextInfo:) contextInfo:nil];

}
-(void)setViewingCompo: someCompo
{	_viewingCompo=someCompo;
	[[stacksCollectionView items] makeObjectsPerformSelector:@selector(setCompoID:) withObject:_viewingCompo];
}
-(unsigned)viewingCompo
{	return _viewingCompo;
}

-(void) runFlicker: sender
{	var peek=[stacksCollectionView selectionIndexes];
	
	var selectedArray=[peek count]? [[stacksCollectionView items ]  objectsAtIndexes: peek ]: [stacksCollectionView items ];

	var myArray=[CPMutableArray new];
	var i,n=[selectedArray count];

	for(i=0; i<n; i++)
	{	var o=[selectedArray objectAtIndex: i];
		[myArray addObject:o._img ];
	}
	[[FlickerController alloc] initWithImageArray: myArray andAppController: myAppController];
}

-(void) applyMerge: sender
{
}
-(void) performBurnIn: sender
{
}

- (void)performDragOperation:(CPDraggingInfo)aSender
{	var data = [[aSender draggingPasteboard] dataForType:PhotoDragType];
    var o=[CPKeyedUnarchiver unarchiveObjectWithData: data];
	var idimage=[o._changes objectForKey:"idimage"];
	var newImg=[CPDictionary dictionaryWithObjects: [ idimage ] forKeys: [ "idimage" ] ];
	var analysesEntity=[myAppController.analysesController entity];
	var newAnalysis=[analysesEntity insertObject:
		[CPDictionary dictionaryWithObjects: [ idimage ] forKeys: [ "idimage" ] ] ];
	[newImg setValue: [newAnalysis valueForKey:"id"] forKey:"idanalysis" ];
// <!>set new analysis type to value of "AnalysisHoldingThePoints"
	[myAppController.stacksContentController addObject: newImg ];
//	[self setItemSize: [self itemSize]];
}

- (void)closeSheet:(id)sender
{	[CPApp endSheet: stacksettingswindow returnCode:[sender tag]];
}
-(void) didEndSheet: someSheet returnCode: someCode contextInfo: someInfo
{
}


@end
