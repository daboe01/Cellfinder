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


@implementation CPObject (ImageURLCV)



-(void) _setImageSizedWithDelegate: someDelegate
{	var myreq=[CPURLRequest requestWithURL: BaseURL+[self valueForKey:"idimage"]+"?spc=geom"];
	[CPURLConnection connectionWithRequest:myreq delegate: someDelegate];
}

-(CPSize) _getImageSize
{
	var myreq=[CPURLRequest requestWithURL: BaseURL+[self valueForKey:"idimage"]+"?spc=geom" ];
	var mypackage=[[CPURLConnection sendSynchronousRequest: myreq returningResponse: nil]  rawString];
	var arr=mypackage.split(' ');
	return CPMakeSize(arr[0],arr[1]);
}
@end

@implementation SimpleImageViewCollectionItem: CPCollectionViewItem
{	var			_idimage;
	var			_handovers;
	CPImage		_img;
	CPImageView _imgv;
	unsigned	_size @accessors(property=size);
	unsigned	_compoID @accessors(property=compoID);
}

-(void) connection: someConnection didReceiveData: data
{	var arr=data.split(' ');
	var mysize=CPMakeSize(arr[0],arr[1]);

	var rnd=1;
	var myURL=BaseURL+_idimage+"?rnd="+rnd;
	if(_compoID) myURL+=("&cmp="+parseInt(_compoID));
	if(_handovers) myURL+=("&handover_params="+_handovers);
	if(!_size) 	_size=0.1;
	myURL+="&width="+parseInt( (_size*mysize.width)* (_size*mysize.height) );
	var image=[[CPImage alloc] initWithContentsOfFile: myURL];

	if([image loadStatus]!==  CPImageLoadStatusCompleted)
	{	[image setDelegate: self];
	} else [self setImage: image];
}


-(void) setSize:(insigned) someSize		//<!> should read setScale
{	if(_size === someSize) return;
	_size=someSize;
	[_representedObject _setImageSizedWithDelegate: self];
}
-(void) setCompoID:(insigned) someID
{	_compoID=someID;
	[_representedObject _setImageSizedWithDelegate: self];
}
-(void) setImage: someImage
{	_img=someImage;
	[_imgv setImage: _img];
	var myframe=[_imgv frame];
	var mysize=[_img size];
	if ([[self collectionView] respondsToSelector:@selector(setMinItemSize:)])
		[[self collectionView] setMinItemSize: mysize ];
	[_imgv setFrame: CPMakeRect(myframe.origin.x,myframe.origin.y, mysize.width, mysize.height)];
}
-(CPImage) image
{	return _img;
}
- (void)imageDidLoad:(CPImage)image
{	[self setImage: image];
}
- _createContentView
{	var o=[CPImageView new];
	[o setImageScaling:CPScaleNone ];	//CPScaleProportionally
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
	[_representedObject _setImageSizedWithDelegate: self];
	return myview;
}
-(void) setRepresentedObject: someObject
{	_idimage=[someObject valueForKey:"idimage"];
	if([[[someObject entity] columns] containsObject:"idmontage"])
		_handovers=[someObject valueForKey:"parameter"];
	[super setRepresentedObject: someObject];
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

@implementation StacksController: CPObject
{
	var myAppController;
	id	stacksCollectionView;
	id	stacksWindow;
	id	_viewingCompo;
	id	stacksettingswindow;
	unsigned _itemSize;

}

- init
{	if(self=[super init])
	{	myAppController=[CPApp delegate];
		[self setItemSize:0.2];
		[stacksCollectionView registerForDraggedTypes: [PhotoDragType]];
alert([stacksCollectionView delegate])
	} return self;
}

-(void) setItemSize:(unsigned) someSize	//<!> should read setItemScale
{	_itemSize=someSize;
	[[stacksCollectionView items] makeObjectsPerformSelector:@selector(setSize:) withObject:_itemSize];
}
-(void) itemSize
{	return _itemSize;
}
-(void) resetItemSize
{	[self setItemSize:_itemSize];
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

-(CPImage) provideRegistratedImageForStackItem: someItem
{	var rnd= Math.floor(Math.random()*100000);	//=1;
	var myURL=BaseURL+[someItem valueForKey:"idimage"]+"?rnd="+rnd;
	var handovers=[someItem valueForKey:"parameter"]
	if(handovers) myURL+=("&affine="+handovers);
	var imgsize=[someItem _getImageSize];
	myURL+="&width="+parseInt( (_itemSize*imgsize.width)* (_itemSize*imgsize.height) );
	var img=[[CPImage alloc] initWithContentsOfFile: myURL];
	return img;
}

-(void) _triggerRegistrationMatrixGeneration
{	var myreq=[CPURLRequest requestWithURL: BaseURL+"STACK/"+[myAppController.stacksController valueForKeyPath: "selection.id"] +"?spc=affine"];
	[[CPURLConnection sendSynchronousRequest: myreq returningResponse: nil]  rawString];
}
-(void) runFlicker: sender
{
	[self _triggerRegistrationMatrixGeneration];
	var peek=[stacksCollectionView selectionIndexes];

	var selectedArray=[[myAppController.stacksController selectedObject] valueForKey:"analyses" synchronous:YES];
	var myArray=[CPMutableArray new];
	var i,n=[selectedArray count];

	for(i=0; i<n; i++)
	{
		var o=[selectedArray objectAtIndex: i];
		[o reload];
		[myArray addObject: [self provideRegistratedImageForStackItem: o ]];
	}
	[[FlickerController alloc] initWithImageArray: myArray andAppController: myAppController];
}

-(void) flattenStack: sender
{	[self _triggerRegistrationMatrixGeneration];
	window.open(BaseURL+"0?idstack="+[myAppController  valueForKeyPath:"stacksController.selection.id"] +"&cmp="+[myAppController valueForKeyPath:"stacksController.selection.idpatch"]+"&csize="+[myAppController valueForKeyPath:"stacksController.selection.width"]+"x"+[myAppController valueForKeyPath:"stacksController.selection.height"],'flattened_stackwindow');
}
-(void) downloadGIF: sender
{	[self _triggerRegistrationMatrixGeneration];
	window.open(BaseURL+"STACK/"+[myAppController valueForKeyPath:"stacksController.selection.id"] +"?spc=gif",'animated_gifwindow');
}

-(unsigned) getIDOfReferenceAnalaysis
{	var arr=[myAppController.stacksContentController arrangedObjects];
	var i,l=[arr count];
	for(i=0; i<l; i++)
	{	if(![arr[i] valueForKey:"idanalysis_reference"]) return [arr[i] valueForKey:"idanalysis"];
	}
	return CPNotFound;
}

- (void)performDragOperation:(CPDraggingInfo)aSender
{	var data = [[aSender draggingPasteboard] dataForType:PhotoDragType];
    var o=[CPKeyedUnarchiver unarchiveObjectWithData: data];

alert(o);
	var idimage=[o._changes objectForKey:"idimage"];
	var newImg=[CPDictionary dictionaryWithObjects: [ idimage ] forKeys: [ "idimage" ] ];
	var analysesEntity=[myAppController.analysesController entity];
	var idReferenceAnalysis=[self getIDOfReferenceAnalaysis];
	var newAnalysis=[analysesEntity insertObject:
		[CPDictionary dictionaryWithObjects: [ idimage ] forKeys: [ "idimage" ] ] ];
	if(idReferenceAnalysis!= CPNotFound)
		[newImg setValue: idReferenceAnalysis forKey:"idanalysis_reference" ];
	[newImg setValue: [newAnalysis valueForKey:"id"] forKey:"idanalysis" ];
// <!>set new analysis type to value of "AnalysisHoldingThePoints"
	[myAppController.stacksContentController addObject: newImg ];

	[self setItemSize: [self itemSize]];	// <!> why the heck do we need this to get the scaling right?
}

- (void)closeSheet:(id)sender
{
	[stacksettingswindow orderOut:sender];
	[CPApp endSheet: stacksettingswindow returnCode: CPRunStoppedResponse];
}
-(void) didEndSheet: someSheet returnCode: someCode contextInfo: someInfo
{
}

-(unsigned) indexOfItem: someItem
{	var arr=[stacksCollectionView items];
	var l=[arr count];
	for(var i=0;i< l; i++)
	{	if([arr objectAtIndex: i] === someItem) return i;
	}
	return CPNotFound;
}


-(void) removeImageAtIndex:(int) i
{	if(i === CPNotFound) return;
// <!> delete only, if shift is pressed
//	if(CPAlert("Really delete?"))	//<!>
	[myAppController.stacksContentController removeObjectsAtArrangedObjectIndexes: [CPIndexSet indexSetWithIndex: i ]];
}
-(void) collectionView:(CPCollectionView)collectionView didDoubleClickOnItemAtIndex:(int)index
{	[self removeImageAtIndex: index];
}

@end
