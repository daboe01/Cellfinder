// this controller is for generic image registration

@import "DottingController.j"


@implementation CPObject (ImageURLCV)

-(void) _setImageSizedWithDelegate: someDelegate
{	var myreq=[CPURLRequest requestWithURL: BaseURL+[self valueForKey:"idimage"]+"?spc=geom"];
	[CPURLConnection connectionWithRequest:myreq delegate: someDelegate];
}

-(CPSize) _getImageSize
{	var myreq=[CPURLRequest requestWithURL: BaseURL+[self valueForKey:"idimage"]+"?spc=geom" ];
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

// API for subclasses
-(CPString) _additionalImageURLPart
{	return "";
}
-(void) connection: someConnection didReceiveData: data
{	var arr=data.split(' ');
	var mysize=CPMakeSize(arr[0],arr[1]);

	var rnd=1;
	var myURL=BaseURL+_idimage+"?rnd="+rnd;
	if(_compoID) myURL+=("&cmp="+parseInt(_compoID));
	if(_handovers) myURL+=("&handover_params="+_handovers);
	if(!_size) _size=1;		//<!> fixme make this configurable in UI trial settings (should be 0.1 when images are large)
	myURL+=("&width="+parseInt( (_size*mysize.width) * (_size*mysize.height)));
	myURL+=[self _additionalImageURLPart];
	var image=[[CPImage alloc] initWithContentsOfFile: myURL];
	[image setDelegate: self];
	if([image loadStatus] ===  CPImageLoadStatusCompleted)
		[self setImage: image];
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
{	if(_size===null) _size=1.0;
	_imgv=[self _createContentView];
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
{    [[self view] setValue:state? [CPColor yellowColor]: [CPColor colorWithWhite:(190.0 / 255.0) alpha: 1.0]  forThemeAttribute:@"border-color"];
}

@end


@implementation StacksController: DottingController
{	id	myCollectionView;
	id	myWindow;
	id	_viewingCompo;
	id	stacksettingswindow;

}

-(void) _postInit
{	[myCollectionView registerForDraggedTypes: [PhotoDragType]];
	var re = new RegExp("#([^&#]+)");
	var m=re.exec(document.location);
	if (m) [myAppController.stacksController setFilterPredicate: [CPPredicate predicateWithFormat:"name=='"+m[1]+"'" ]];
	[super _postInit];
	[self setScale: 1.0];
}
-(void) setScale:(unsigned) someSize
{
	if(_scale=== null || someSize === _scale) return;
	_scale=someSize;
	[[myCollectionView items] makeObjectsPerformSelector:@selector(setSize:) withObject:_scale];
}
-(void) resetItemSize
{	[self setScale:_scale];
}

-(void) newStack: sender
{	[myAppController.stacksController addObject: [CPDictionary dictionaryWithObject:"NewStack" forKey:"name" ]];

	[self runSettings:self];
}

- (void)deleteStackWarningDidEnd:(CPAlert)anAlert code:(id)code context:(id)context
{
    if(code)
	{
		[myAppController.stacksController removeObjectsAtArrangedObjectIndexes:[myAppController.stacksController selectionIndexes] ];
	}
}

-(void) deleteStack: sender
{
    if([myAppController.stacksController valueForKeyPath:"selection.@count"]>1)
    {	var myalert = [CPAlert new];
		[myalert setMessageText: "Are you sure you want to delete multiple stacks at once?"];
		[myalert addButtonWithTitle:"Cancel"];
		[myalert addButtonWithTitle:"Delete mutiple"];
		[myalert beginSheetModalForWindow: myWindow modalDelegate:self didEndSelector:@selector(deleteStackWarningDidEnd:code:context:) contextInfo: nil];
    }
	else if([myAppController.stacksController valueForKeyPath:"selection.analyses.@count"] >2 )
	{	var myalert = [CPAlert new];
		[myalert setMessageText: "Are you sure you want to delete the full stack?"];
		[myalert addButtonWithTitle:"Cancel"];
		[myalert addButtonWithTitle:"Delete"];
		[myalert beginSheetModalForWindow: myWindow modalDelegate:self didEndSelector:@selector(deleteStackWarningDidEnd:code:context:) contextInfo: nil];
	} else
	{	[self deleteStackWarningDidEnd: nil code:1 context: nil];
	}
}


-(void) runSettings:sender
{	if(!stacksettingswindow)
		[CPBundle loadRessourceNamed: "StacksAdmin.gsmarkup" owner: self ];

	[CPApp beginSheet: stacksettingswindow modalForWindow: myWindow modalDelegate:self didEndSelector:@selector(didEndSheet:returnCode:contextInfo:) contextInfo:nil];

}
-(void)setViewingCompo: someCompo
{	_viewingCompo=someCompo;
	[[myCollectionView items] makeObjectsPerformSelector:@selector(setCompoID:) withObject:_viewingCompo];
}
-(unsigned)viewingCompo
{	return _viewingCompo;
}

-(CPImage) provideRegistratedImageForStackItem: someItem
{	var rnd=1;	//Math.floor(Math.random()*100000);
	var myURL=BaseURL+[someItem valueForKey:"idimage"]+"?rnd="+rnd;
	if(_viewingCompo) myURL+=("&cmp="+parseInt(_viewingCompo));
	var handovers=[someItem valueForKey:"parameter"]
	if(handovers) myURL+=("&affine="+handovers);
	var imgsize=[someItem _getImageSize];
	myURL+=("&width="+parseInt((_scale*imgsize.width)*(_scale*imgsize.height)));
	myURL+=("&idanalysis="+[someItem valueForKey:"idanalysis"]);
	var img=[[CPImage alloc] initWithContentsOfFile: myURL];
	return img;
}

-(void) _triggerRegistrationMatrixGeneration
{	var myreq=[CPURLRequest requestWithURL: BaseURL+"STACK/"+[myAppController.stacksController valueForKeyPath: "selection.id"] +"?spc=affine"];
	[CPURLConnection sendSynchronousRequest: myreq returningResponse: nil];
}
-(void) runFlicker: sender
{
	[self _triggerRegistrationMatrixGeneration];

	var selectedArray=[[myAppController.stacksController selectedObject] valueForKey:"analyses" synchronous:YES];
	selectedArray= [selectedArray sortedArrayUsingDescriptors: [[CPSortDescriptor sortDescriptorWithKey:@"idimage" ascending:YES selector:@selector(compare:)]] ];

	var myArray=[CPMutableArray new];
	var i,n=[selectedArray count];
	var fc=[FlickerController new];

	for(i=0; i<n; i++)
	{	var o=[selectedArray objectAtIndex: i];
		[o reload];
		var img=[self provideRegistratedImageForStackItem: o ];
		[img setDelegate: fc];
		[myArray addObject: img];
	}
	[fc setImageArray: myArray];
}

-(void) flattenStack: sender
{	if ([myAppController valueForKeyPath:"stacksController.selection.idpatch"] === CPNullMarker) {
		[[CPAlert alertWithError:"Config flattening compo first"] runModal];
		return;
	}
	[self _triggerRegistrationMatrixGeneration];

	var myurl = BaseURL+"0?idstack="+[myAppController  valueForKeyPath:"stacksController.selection.id"] +"&cmp="+[myAppController valueForKeyPath:"stacksController.selection.idpatch"];
	if([myAppController valueForKeyPath:"stacksController.selection.geometry"]!==CPNullMarker)
		myurl+=("&csize="+encodeURIComponent([myAppController valueForKeyPath:"stacksController.selection.geometry"]));
	window.open(myurl,'flattened_stackwindow');
}


-(void) downloadGIF: sender
{	[self _triggerRegistrationMatrixGeneration];
	[self downloadGIF2: sender];
}
-(void) downloadGIF2: sender
{	var myURL=BaseURL+"STACK/"+[myAppController valueForKeyPath:"stacksController.selection.id"] +"?spc=gif";
	if(_viewingCompo) myURL+=("&cmp="+parseInt(_viewingCompo));
	window.open(myURL,'animated_gifwindow');
}
-(void) downloadZIP: sender
{	var myURL=BaseURL+"STACK/"+[myAppController valueForKeyPath:"stacksController.selection.id"] +"?spc=zip";
	if(_viewingCompo) myURL+=("&cmp="+parseInt(_viewingCompo));
	document.location=myURL;
}
-(void) downloadMP4: sender
{	var myURL=BaseURL+"STACK/"+[myAppController valueForKeyPath:"stacksController.selection.id"] +"?spc=mp4";
	if(_viewingCompo) myURL+=("&cmp="+parseInt(_viewingCompo));
	window.open(myURL,'animated_mp4window');
}

-(unsigned) getIDOfReferenceAnalaysis
{	var arr=[myAppController.stacksContentController arrangedObjects];
	var i,l=[arr count];
	var peek;
	for(i=0; i<l; i++)
	{	if(peek=[arr[i] valueForKey:"idanalysis_reference"]) return peek;
	}
	return CPNotFound;
}

- (void)performDragOperation:(CPDraggingInfo)aSender
{	var data = [[aSender draggingPasteboard] dataForType:PhotoDragType];
    var o=[CPKeyedUnarchiver unarchiveObjectWithData: data];

	var idimage=[o._changes objectForKey:"idimage"];
	var newImg=[CPDictionary dictionaryWithObjects: [ idimage ] forKeys: [ "idimage" ] ];
	var analysesEntity=[myAppController.analysesController entity];
	var idReferenceAnalysis=[self getIDOfReferenceAnalaysis];
	var newAnalysis=[analysesEntity insertObject:
		[CPDictionary dictionaryWithObjects: [ idimage ] forKeys: [ "idimage" ] ] ];
	if(idReferenceAnalysis === CPNotFound)
	{	idReferenceAnalysis=[newAnalysis valueForKey:"id"]
	}
	[newImg setValue: idReferenceAnalysis forKey:"idanalysis_reference" ];

	[newImg setValue: [newAnalysis valueForKey:"id"] forKey:"idanalysis" ];
	[myAppController.stacksContentController addObject: newImg ];

	[self resetItemSize];
}

- (void)closeSheet:(id)sender
{	[stacksettingswindow orderOut:sender];
	[CPApp endSheet: stacksettingswindow returnCode: CPRunStoppedResponse];
}
-(void) didEndSheet: someSheet returnCode: someCode contextInfo: someInfo
{
}

-(unsigned) indexOfItem: someItem
{	var arr=[myCollectionView items];
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
//	[myAppController.stacksContentController removeObjectsAtArrangedObjectIndexes: [CPIndexSet indexSetWithIndex: i ]];
}
-(void) collectionView:(CPCollectionView)collectionView didDoubleClickOnItemAtIndex:(int)index
{	[self removeImageAtIndex: index];
}
-(BOOL) collectionView: someView acceptDrop: draggingInfo index:dropIndex dropOperation: someOP
{	[self performDragOperation: draggingInfo];
	return YES;
}
@end
