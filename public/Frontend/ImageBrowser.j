/*
 *
 */
@import "StacksController.j";


@implementation FSObject(Archiving)

- (void)encodeWithCoder: (CPCoder)aCoder
{
	var mydata=[_data copy];
	if(_changes) [mydata addEntriesFromDictionary: _changes];
	[aCoder _encodeDictionaryOfObjects: mydata forKey:@"FS.objects"];
}
- (void)initWithCoder:(CPCoder)aCoder
{	self=[self init];
	if(self)
	{	_changes=[aCoder _decodeDictionaryOfObjectsForKey:@"FS.objects"]
	}
	return self;
}
@end


/////////////////////////////////////////////////////////

var _sharedImageBrowser;


@implementation ImageBrowser : StacksController

+ sharedImageBrowser
{	if(!_sharedImageBrowser)
	{	[CPBundle loadRessourceNamed: "ImageBrowser.gsmarkup" owner: [CPApp delegate] ];
		_sharedImageBrowser= [CPApp delegate]._sharedImageBrowser;
		_sharedImageBrowser.myAppController= [CPApp delegate];
		[_sharedImageBrowser.myCollectionView registerForDraggedTypes:[PhotoDragType]];
		[_sharedImageBrowser setScale:0.1];
	}
	[_sharedImageBrowser.myWindow makeKeyAndOrderFront: _sharedImageBrowser ];
	return _sharedImageBrowser;
}


-(void) deleteImage: sender
{	var selectedItems=[[myCollectionView items] objectsAtIndexes: [myCollectionView selectionIndexes] ]
alert([[selectedItems objectAtIndex: 0] representedObject]);
	[myAppController.folderContentController removeObject: [[selectedItems objectAtIndex: 0] representedObject]];
}

- (CPArray)collectionView:(CPCollectionView)aCollectionView dragTypesForItemsAtIndexes:(CPIndexSet)indices
{
	return [PhotoDragType];
}

- (void)performDragOperation:(CPDraggingInfo)aSender
{	var data = [[aSender draggingPasteboard] dataForType:PhotoDragType];
    var o=[CPKeyedUnarchiver unarchiveObjectWithData: data];
	var myurl=BaseURL+"import/"+ [trialsController valueForKeyPath:"selection.id"];
	myurl+="/"+[o objectForKey:"filename" ]+"/"+ [o objectForKey:"uri" ];

	var myreq=[CPURLRequest requestWithURL: myurl];
	[CPURLConnection sendSynchronousRequest: myreq returningResponse: nil];

//<!> fixme: call this only, if import will result in new folder
//<!> fixme: select the folder into which was imported by this drop

	[[trialsController selectedObject] willChangeValueForKey:"folders"];
	//[trialsController._entity._relations makeObjectsPerformSelector:@selector(_invalidateCache)];
	[[trialsController selectedObject] didChangeValueForKey:"folders"];

	[[folderController selectedObject] willChangeValueForKey:"folder_content"];
	[folderController._entity._relations makeObjectsPerformSelector:@selector(_invalidateCache)];
	[[folderController selectedObject] didChangeValueForKey:"folder_content"];
}

- (CPData)collectionView:(CPCollectionView)aCollectionView
   dataForItemsAtIndexes:(CPIndexSet)indices
                 forType:(CPString)aType
{
	var firstIndex = [indices firstIndex];
	var o=[[aCollectionView itemAtIndex: firstIndex] representedObject];
    return [CPKeyedArchiver archivedDataWithRootObject: o ];
}

-(void) delete:sender
{	[[[CPApp keyWindow] delegate] delete:sender];
}


-(void) docsCalImport:sender
{	[DocsCalImporter sharedDocsCalImporter];
}

@end

@implementation GSMarkupTagImageBrowser:GSMarkupTagObject
+ (CPString) tagName
{
  return @"imageBrowser";
}
+ (Class) platformObjectClass
{
	return [ImageBrowser class];
}
@end
