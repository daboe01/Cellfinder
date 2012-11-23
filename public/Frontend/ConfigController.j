/*
 *
 */

/////////////////////////////////////////////////////////


@import <Foundation/CPObject.j>
@import <Renaissance/Renaissance.j>


/////////////////////////////////////////////////////////


@implementation AdminController : CPObject
{
	id	trialsWindow;
	id	trialsettingswindow;

}

- init
{	if(self=[super init])
	{	[self setItemSize:0.1];
		[folderCollectionView registerForDraggedTypes:[PhotoDragType]];
	}
	return self;
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

-(void) loadAnalysis: sender
{	var o=[[analysesController arrangedObjects] objectAtIndex: [sender selectedRow]];
	if (o)
	{	[[AnalysesController alloc] initWithAnalysis:o andAppController: self];
	}
}
-(void) runStacks: sender
{	var o=[trialsController valueForKeyPath:"selection"];
	if (o)
	{	[StacksController new];
	}
}
-(void) runStacks2: sender
{	var o=[trialsController valueForKeyPath:"selection"];
	if (o)
	{	[[Stacks2Controller alloc] initWithTrial:o andAppController: self];
	}
}
-(void) applyFilterToAll: sender
{	var o=[trialsController valueForKeyPath:"selection"];
	alert(o);
}



-(void) runSettings:sender
{	[CPApp beginSheet: trialsettingswindow modalForWindow: trialsWindow modalDelegate:self didEndSelector:@selector(didEndSheet:returnCode:contextInfo:) contextInfo:nil];
}
@end


@implementation GSMarkupTagAdminController:GSMarkupTagObject
+ (CPString) tagName
{
  return @"adminController";
}

+ (Class) platformObjectClass
{
	return [AdminController class];
}
@end

