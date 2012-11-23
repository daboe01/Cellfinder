/*
 *
 */
@import <Foundation/CPObject.j>
@import <Renaissance/Renaissance.j>


/////////////////////////////////////////////////////////

@implementation CPObject (ImageURLHack)

//<!> unused?!
-(CPImage) _cellfinderImageFromID
{	var myURL=BaseURL+[self valueForKey:"id"]+"?width=10000";
	var img=[[CPImage alloc] initWithContentsOfFile: myURL];
	[img setDelegate: self];
	return img;
}
-(CPImage) _cellfinderSpc: someSpc forID: someID
{	var myreq=[CPURLRequest requestWithURL: BaseURL+someID+"?spc="+someSpc ];
	return [[CPURLConnection sendSynchronousRequest: myreq returningResponse: nil]  rawString];

}
-(CPImage) _cellfinderGeom
{	return [self _cellfinderSpc: "geom" forID: [self valueForKey:"id"] ];
}
@end

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


@implementation ImageBrowser : CPObject
{
	id	folderCollectionView;
	unsigned _itemSize;
	unsigned _viewingCompoID @accessors(property=viewingCompoID);
}


- (void)performDragOperation:(CPDraggingInfo)aSender
{	var data = [[aSender draggingPasteboard] dataForType:PhotoDragType];
    var o=[CPKeyedUnarchiver unarchiveObjectWithData: data];
	var myurl=BaseURL+"import/"+ [trialsController valueForKeyPath:"selection.id"];
	myurl+="/"+[o objectForKey:"filename" ];

	var myreq=[CPURLRequest requestWithURL: myurl];
	[CPURLConnection sendSynchronousRequest: myreq returningResponse: nil];
	[[trialsController selectedObject] willChangeValueForKey:"folders"];
	[trialsController._entity._relations makeObjectsPerformSelector:@selector(_invalidateCache)];
	[[trialsController selectedObject] didChangeValueForKey:"folders"];

	[[folderController selectedObject] willChangeValueForKey:"folder_content"];
	[folderController._entity._relations makeObjectsPerformSelector:@selector(_invalidateCache)];
	[[folderController selectedObject] didChangeValueForKey:"folder_content"];
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
