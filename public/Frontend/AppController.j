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

/////////////////////////////////////////////////////////

BaseURL="http://127.0.0.1:3000/IMG/";

PhotoDragType="PhotoDragType";

/////////////////////////////////////////////////////////

@import <Foundation/CPObject.j>
@import <Renaissance/Renaissance.j>
@import "CompoController.j"
@import "ImageController.j"
@import "StacksController.j"
@import "Stacks2Controller.j"
@import "DocsCalImporter.j"


/////////////////////////////////////////////////////////

@implementation CPObject (ImageURLHack)
-(CPImage) _cellfinderImageFromID
{	var myURL=BaseURL+[self valueForKey:"id"]+"?width=10000";
	var img=[[CPImage alloc] initWithContentsOfFile: myURL];
	[img setDelegate: self];
	return img;
}
@end

@implementation FSObject(Archiving)

-(void) encodeWithCoder: aCoder
{
	//[super encodeWithCoder:aCoder];	// raises?!
	var mydata=[_data copy];
	if(_changes) [mydata addEntriesFromDictionary: _changes];
	[aCoder _encodeDictionaryOfObjects: mydata forKey:@"FS.objects"];
}
- initWithCoder: aCoder
{	self=[self init];
	if(self)
	{	_changes=[aCoder _decodeDictionaryOfObjectsForKey:@"FS.objects"]
	}
	return self;
}
@end

/////////////////////////////////////////////////////////


@implementation AppController : CPObject
{	id	store @accessors;	
	id	trialsController;
	id	trialsWindow;
	id	stacksController;
	id	stacksContentController;
	id	folderController;
	id	folderContentController;
	id	folderCollectionView;
	id	folderImagesTable;
	unsigned _itemSize;
	unsigned _viewingCompoID @accessors(property=viewingCompoID);
	id	analysesController;
	id	filterPredicate;

	CPMutableSet	_imageControllers;

	id	trialsettingswindow;
	id	displayfilters_ac;
	id	uploadfilters_ac;
	id	fixupfilters_ac;
	id	overlayfilters_ac;
	id	analyticsfilters_ac;
	id	perlfilters_ac;
	id	javascriptfilters_ac;

}
-(void) setViewingCompoID:(unsigned) someCompoID
{	_viewingCompoID=someCompoID;
	[[folderCollectionView items] makeObjectsPerformSelector:@selector(setCompoID:) withObject:_viewingCompoID];
}


-(void) setItemSize:(unsigned) someSize	//<!> should read setItemScale
{	_itemSize=someSize;
	[[folderCollectionView items] makeObjectsPerformSelector:@selector(setSize:) withObject:_itemSize];
}
-(void) itemSize
{	return _itemSize;
}

-(CPString) baseImageURL
{	return BaseURL;
}
-(CPArray) imageControllersForIDTrial:(int) idtrial
{	var all=[_imageControllers allObjects];
	if(!all) all= [];
	var i,l=all.length;
	var ret=[CPMutableArray new];
	for(i=0;i<l;i++)
	{	if([all[i] idtrial]== idtrial)
		{	[ret addObject: all[i] ];
		}
	} return ret;
}
- (void) applicationDidFinishLaunching:(CPNotification)aNotification
{	store=[[FSStore alloc] initWithBaseURL: "http://127.0.0.1:3000/DBI"];	//<!> fixme

	[CPBundle loadRessourceNamed: "gui.gsmarkup" owner:self];
	[self setItemSize:0.1];
	[folderCollectionView registerForDraggedTypes:[PhotoDragType]];
	[folderImagesTable registerForDraggedTypes:[PhotoDragType]];
}

- (void)performDragOperation:(CPDraggingInfo)aSender
{	var data = [[aSender draggingPasteboard] dataForType:PhotoDragType];
    var o=[CPKeyedUnarchiver unarchiveObjectWithData: data];
	var myurl=BaseURL+"?";
	
	myurl+="idtrial="+ [trialsController valueForKeyPath:"selection.id"];
	var cmp=[trialsController valueForKeyPath:"selection.composition_for_upload" ];
	if(cmp!="CPNullMarker")
		myurl+="&cmp="+ [trialsController valueForKeyPath:"selection.id"];
	myurl+="&filedata="+"/tmp/"+[o objectForKey:"filename" ]+'_s.jpg';
	myurl+="&filename="+[o objectForKey:"filename" ];
	var myreq=[CPURLRequest requestWithURL: myurl];
	[CPURLConnection sendSynchronousRequest: myreq returningResponse: nil];
	[[trialsController selectedObject] willChangeValueForKey:"folders"];
	[trialsController._entity._relations makeObjectsPerformSelector:@selector(_invalidateCache)];
	[[trialsController selectedObject] didChangeValueForKey:"folders"];

	[[folderController selectedObject] willChangeValueForKey:"folder_content"];
	[folderController._entity._relations makeObjectsPerformSelector:@selector(_invalidateCache)];
	[[folderController selectedObject] didChangeValueForKey:"folder_content"];

}


-(void) configureIC: someIC forTrial: someTrial
{	var myreq=[CPURLRequest requestWithURL: BaseURL+"0?cmp="+[someTrial valueForKey: "composition_for_javascript"] ];
	var mypackage=[[CPURLConnection sendSynchronousRequest: myreq returningResponse: nil]  rawString];
	var arr = JSON.parse( mypackage );
	if(!arr) return;
	var i,l=arr.length;
	for(i=0;i<l;i++)
	{	var m=arr[i];
		if([m characterAtIndex:0]=='<') next;
		var sel=CPSelectorFromString(m);
		if(sel) [someIC performSelector:sel];
	}
}
-(void) loadImage: sender
{	var o=[[folderContentController arrangedObjects] objectAtIndex: [sender selectedRow]];
	if (o)
	{	if(!_imageControllers) _imageControllers=[CPMutableSet new];
		var ic=[[ImageController alloc] initWithImageID:[o valueForKey:"idimage"] appController: self];
		[_imageControllers addObject:ic];
		[self configureIC: ic forTrial: [trialsController selectedObject]];
//<!> fixme: implement unregistering upon window close in imagesController
	}
}

-(void) loadAnalysis: sender
{	var o=[[analysesController arrangedObjects] objectAtIndex: [sender selectedRow]];
	if (o)
	{	[[AnalysesController alloc] initWithAnalysis:o andAppController: self];
	}
}
-(void) runStacks: sender
{	var o=[trialsController valueForKeyPath:"selection"];
	if (o)
	{	[[StacksController alloc] initWithTrial:o andAppController: self];
	}
}
-(void) runStacks2: sender
{	var o=[trialsController valueForKeyPath:"selection"];
	if (o)
	{	[[Stacks2Controller alloc] initWithTrial:o andAppController: self];
	}
}

-(void) delete:sender
{	[[[CPApp keyWindow] delegate] delete:sender];
}

-(void) collectionView: someView didDoubleClickOnItemAtIndex: someIndex
{	var o=[[someView itemAtIndex: someIndex] representedObject];
	var ic=[[ImageController alloc] initWithImageID:[o valueForKey:"idimage"] appController: self];
	[_imageControllers addObject:ic];
//<!> fixme: implement unregistering upon window close in imagesController
}

// Drag and Drop
-   (CPArray)collectionView:(CPCollectionView)aCollectionView dragTypesForItemsAtIndexes:(CPIndexSet)indices
{	return [PhotoDragType];
}
- (CPData)collectionView:(CPCollectionView)aCollectionView
   dataForItemsAtIndexes:(CPIndexSet)indices
                 forType:(CPString)aType
{	var firstIndex = [indices firstIndex];
	var o=[[aCollectionView itemAtIndex: firstIndex] representedObject];
    return [CPKeyedArchiver archivedDataWithRootObject: o ];
}

-(void) docsCalImport:sender
{	[DocsCalImporter sharedDocsCalImporter];
}

- (void)closeSheet:(id)sender
{
    [CPApp endSheet: trialsettingswindow returnCode:[sender tag]];
}
-(void) didEndSheet: someSheet returnCode: someCode contextInfo: someInfo
{
}

-(void) runSettings:sender
{	[CPApp beginSheet: trialsettingswindow modalForWindow: trialsWindow modalDelegate:self didEndSelector:@selector(didEndSheet:returnCode:contextInfo:) contextInfo:nil];
}
@end
