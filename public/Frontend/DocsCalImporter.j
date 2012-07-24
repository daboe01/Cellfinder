@import <AppKit/AppKit.j>
@import <Renaissance/Renaissance.j>

var BaseURL="http://auginfo/docscaldownload/";
var spinnerImg;

@implementation CPObject (ImageURLHack)

-(CPImage) _dc_provideImageForCollectionViewItem: someItem
{	var rnd=1;	//Math.floor(Math.random()*100000);
	var myURL=BaseURL+[self valueForKey:"name"]+"?rnd="+rnd;
	var size=[someItem size];
	if(!size) size=100;
	myURL+="&size="+size;
	var img=[[CPImage alloc] initWithContentsOfFile: myURL];
	return img;
}
@end

/////////////////////////////////////////////////////////

@implementation DCSimpleImageViewCollectionItem: CPCollectionViewItem
{	CPImage _img;
	CPImageView _imgv;
	unsigned _size @accessors(property=size);
}
-(void) setSize:(insigned) someSize
{	_size=someSize;		//*someSize
	_img=[_representedObject _dc_provideImageForCollectionViewItem: self];
	[_img setDelegate: self];
}
- (void)imageDidLoad:(CPImage)image
{	[_imgv setImage: image];
	var myframe=[_imgv frame];
	var size=[image size];
	[_imgv setFrame: CPMakeRect(myframe.origin.x,myframe.origin.y, size.width, size.height)];

}
-(CPView) loadView
{	_imgv=[CPImageView new];
	[_imgv setImageScaling: CPScaleProportionally];
	var myview=[CPBox new];
	var name=[_representedObject valueForKeyPath:"name"]
	var re = new RegExp("^[^_]+_(....)(..)(..)");
	var m = re.exec(name);
	if(m) [myview setTitle: m[1]+'-'+m[2]+'-'+m[3]];
	[myview setTitlePosition: CPBelowBottom];
    [myview setBorderType:  CPLineBorder ];
    [myview setBorderWidth:  2.0 ];
	[myview setContentView: _imgv];
	[_imgv setImage: spinnerImg];
	[self setView: myview];
	_img=[_representedObject _dc_provideImageForCollectionViewItem: self];
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

var _sharedCDImporter;

@implementation DocsCalImporter : CPObject
{	id	stacksController;
	id	stacksDirController;
	id	stacksContentController;
	id	stacksCollectionView;
	id	typePopup;
	id	pizField;
	id	mainWindow;
	unsigned _itemSize @accessors(property=itemSize);
}
-(void) setItemSize:(unsigned) someSize
{	_itemSize=someSize;
	[[stacksCollectionView items] makeObjectsPerformSelector:@selector(setSize:) withObject:_itemSize];
	[stacksCollectionView setMinItemSize: CPMakeSize(_itemSize,_itemSize)];
}
-(CPArray) arrayForURL:(CPString) someURL
{	var myreq=[CPURLRequest requestWithURL: someURL];
	var mpackage=[[CPURLConnection sendSynchronousRequest: myreq returningResponse: nil]  rawString];
	var arr = JSON.parse( mpackage );
	return arr? arr:[];
}
-(void)loadPIZ: sender
{	var piz=[pizField stringValue];
	[stacksController addObject: [CPDictionary dictionaryWithObject: piz forKey:"piz"] ];
	if(![[stacksDirController arrangedObjects] count])
	{	var arr = [self arrayForURL: BaseURL+piz+"?peek=1"];
		var i,l=arr.length;
		for(i=0;i<l;i++)
		{	[stacksDirController addObject: [CPDictionary dictionaryWithObjects: [arr[i], piz] forKeys:["name", "piz"]] ];
		}
	}
	[self changeType: self];
}

-(void)changeType: sender
{	var type=[[typePopup selectedItem] title];
	var piz=[pizField stringValue];

	var arr = [self arrayForURL: BaseURL+piz+"?dir="+type];

	var i,l=arr.length;
	[stacksContentController setContent:[]];
	for(i=0;i<l;i++)
	{		[stacksContentController addObject: [CPDictionary dictionaryWithObjects: [arr[i], piz] forKeys:["name", "piz"]] ];
	}

	[self setItemSize: [self itemSize]];
}

+ sharedDocsCalImporter
{	if(!_sharedCDImporter) {
		_sharedCDImporter=[self new];
		[_sharedCDImporter setItemSize:100];
		[CPBundle loadRessourceNamed: "docscal.gsmarkup" owner:_sharedCDImporter];
		spinnerImg=[[CPImage alloc] initWithContentsOfFile: [CPString stringWithFormat:@"%@/%@", [[CPBundle mainBundle] resourcePath],"spinner.gif" ]];
		[_sharedCDImporter.mainWindow setInitialFirstResponder: _sharedCDImporter.pizField ];
		[_sharedCDImporter.mainWindow makeKeyAndOrderFront:_sharedCDImporter ];
	}
	return _sharedCDImporter;
}

- (CPArray)collectionView:(CPCollectionView)aCollectionView dragTypesForItemsAtIndexes:(CPIndexSet)indices
{
	return [PhotoDragType];
}
- (CPData)collectionView:(CPCollectionView)aCollectionView
   dataForItemsAtIndexes:(CPIndexSet)indices
                 forType:(CPString)aType
{
	var firstIndex = [indices firstIndex];
	var filename=[[aCollectionView itemAtIndex: firstIndex]._img filename];
	var o =[CPMutableDictionary new];
	var re = new RegExp("docscaldownload/([^?]+)");
	var m = re.exec(filename);
	if(m)
	{	[o setObject: m[1] forKey:"filename"];
	}
    return [CPKeyedArchiver archivedDataWithRootObject: o ];
}

@end
