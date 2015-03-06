/*
 *
 */
@import "StacksController.j";
@import "UploadManager.j"


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
{	id myalert;
	id	renameWindow;
}

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

- (void)deleteWarningDidEnd:(CPAlert)anAlert code:(id)code context:(id)context
{
    if(code)
	{	var selectedItems=[[myCollectionView items] objectsAtIndexes: [myCollectionView selectionIndexes] ]
		var folder_name=[[[selectedItems objectAtIndex: 0] representedObject] valueForKey:"folder_name"];
		var idtrial= [[CPApp delegate].trialsController valueForKeyPath:"selection.id"]
		var myurl=BaseURL+"delete_images_in_folder/"+idtrial+"/"+ folder_name;
		var myreq=[CPURLRequest requestWithURL: myurl];
		[CPURLConnection sendSynchronousRequest: myreq returningResponse: nil];

		[self _refreshFoldersList];
		[self _refreshFoldersContentList];
	}
}

-(void) deleteImagesOfSelectedFolder: sender
{
	myalert = [CPAlert new];
    [myalert setMessageText: "Are you sure you want to delete all images of this folder?"];
	[myalert addButtonWithTitle:"Cancel"];
	[myalert addButtonWithTitle:"Delete"];
	[myalert beginSheetModalForWindow:myWindow modalDelegate:self didEndSelector:@selector(deleteWarningDidEnd:code:context:) contextInfo: nil];
}

-(void) deleteSelectedImage: sender
{
	var so=[myAppController.folderContentController selectedObjects];
	var i,l=[so count];
	for(i=0;i<l;i++)
	{	var ro=[so objectAtIndex: i];
        var idimage=[ro valueForKey:"idimage"];
        var myurl= HostURL +"/DB/images/id/"+ idimage;
        var myreq=[CPURLRequest requestWithURL: myurl];
        [myreq setHTTPMethod:"delete"];
        [CPURLConnection connectionWithRequest:myreq delegate:self];
    }
	if([[[CPApp delegate].folderContentController arrangedObjects]  count] === 1)
		[self _refreshFoldersList];

	[self _refreshFoldersContentList];
}
-(void) renameSelectedImage: sender
{	[renameWindow makeKeyAndOrderFront:self];
}
-(void) renameSelectedImageOrderOut: sender
{	[self _refreshFoldersList];
	[self _refreshFoldersContentList];
	[renameWindow orderOut:self];
}

-(void) uploadImage: sender
{	[UploadManager sharedUploadManager];
}

-(void) addDefaultAnalyses: sender
{	var selectedItems=[[myCollectionView items] objectsAtIndexes: [myCollectionView selectionIndexes] ]
	var folder_name=[[[selectedItems objectAtIndex: 0] representedObject] valueForKey:"folder_name"];
	var idtrial= [[CPApp delegate].trialsController valueForKeyPath:"selection.id"]
	var myurl=BaseURL+"analyze_folder/"+idtrial+"/"+ folder_name;
	var myreq=[CPURLRequest requestWithURL: myurl];
	[CPURLConnection connectionWithRequest: myreq delegate: self];	//<!> fixme implement feedback spinner
}

- (CPArray)collectionView:(CPCollectionView)aCollectionView dragTypesForItemsAtIndexes:(CPIndexSet)indices
{
	return [PhotoDragType];
}

//<!> fixme: causes flicker and loss of selection
- (void)_refreshFoldersList
{	var trialsController=[CPApp delegate].trialsController;
	[[trialsController selectedObject] willChangeValueForKey:"folders"];
	 [trialsController._entity._relations makeObjectsPerformSelector:@selector(_invalidateCache)];
	[[trialsController selectedObject] didChangeValueForKey:"folders"];
}
- (void)_refreshFoldersContentList
{

	var folderController=[CPApp delegate].folderController;
	[[folderController selectedObject] willChangeValueForKey:"folder_content"];
	 [folderController._entity._relations makeObjectsPerformSelector:@selector(_invalidateCache)];
	[[folderController selectedObject] didChangeValueForKey:"folder_content"];

}


- (void)performDragOperation:(CPDraggingInfo)aSender
{	var data = [[aSender draggingPasteboard] dataForType:PhotoDragType];
    var o=[CPKeyedUnarchiver unarchiveObjectWithData: data];
	var myurl=BaseURL+"import/"+ [trialsController valueForKeyPath:"selection.id"];
	myurl+="/"+[o objectForKey:"filename" ]+"/"+ [o objectForKey:"uri" ];

	var myreq=[CPURLRequest requestWithURL: myurl];
	[CPURLConnection sendSynchronousRequest: myreq returningResponse: nil];
	[self _refreshFoldersList];
	[self _refreshFoldersContentList];

}

- (CPData)collectionView:(CPCollectionView)aCollectionView
   dataForItemsAtIndexes:(CPIndexSet)indices
                 forType:(CPString)aType
{
	var firstIndex = [indices firstIndex];
	var o=[[aCollectionView itemAtIndex: firstIndex] representedObject];
    return [CPKeyedArchiver archivedDataWithRootObject: o ];
}


- (float)splitView:(CPSplitView)aSplitView constrainMinCoordinate: proposedMin ofSubviewAt: dividerIndex
{	return 100;	
}
- (float)splitView:(CPSplitView)aSplitView constrainMaxCoordinate: proposedMax ofSubviewAt: dividerIndex
{	return [[aSplitView window] frame].size.width-200;
}

-(void) delete:sender
{	[[[CPApp keyWindow] delegate] delete:sender];
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
