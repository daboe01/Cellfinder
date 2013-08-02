@import <Foundation/CPObject.j>
@import <AppKit/CPAlert.j>
@import <AppKit/CPUserDefaultsController.j>
@import <Renaissance/Renaissance.j>

@import <Cup/Cup.j>
@import <Cup/CupByteCountTransformer.j>

var _sharedUploadManager;


@implementation UploadManager : CPObject
{	id					queueController @accessors;
	id					myCuploader @accessors;
	id					tableView;
	id					uploadWindow;
	id					prefixField;
	var					appController @accessors;
}

+ sharedUploadManager
{	if(!_sharedUploadManager)
	{	_sharedUploadManager=[self new];
	}
	_sharedUploadManager.appController= [CPApp delegate];
	var idtrial= [_sharedUploadManager.appController.trialsController valueForKeyPath:"selection.id"]

	_sharedUploadManager.myCuploader=[[Cup alloc] initWithURL: HostURL+"/upload/"+ idtrial];
	_sharedUploadManager.queueController=[_sharedUploadManager.myCuploader queueController]
	[CPBundle loadRessourceNamed: "UploadManager.gsmarkup" owner: _sharedUploadManager];
	[_sharedUploadManager.myCuploader setDropTarget: _sharedUploadManager.tableView];
	[_sharedUploadManager.myCuploader setRemoveCompletedFiles: YES];
	[_sharedUploadManager.myCuploader setAutoUpload: YES];
	[_sharedUploadManager.myCuploader setDelegate: _sharedUploadManager];
	[_sharedUploadManager.uploadWindow makeKeyAndOrderFront:self];
	return _sharedUploadManager;
}
- (void) changePrefix: sender
{	var idtrial= [appController.trialsController valueForKeyPath:"selection.id"]
	[myCuploader setURL: HostURL+"/upload/"+ idtrial+"?prefix="+[sender stringValue]];
}

- (void)cup:(Cup)aCup uploadDidCompleteForFile:(CupFile)aFile
{
	[[appController.trialsController selectedObject] willChangeValueForKey:"folders"];
	 [appController.trialsController._entity._relations makeObjectsPerformSelector:@selector(_invalidateCache)];
	 [appController.folderController._entity._relations makeObjectsPerformSelector:@selector(_invalidateCache)];
	[[appController.trialsController selectedObject] didChangeValueForKey:"folders"];

	[[appController.folderContentController selectedObject] willChangeValueForKey:"images"];
	 [appController.folderContentController._entity._relations makeObjectsPerformSelector:@selector(_invalidateCache)];
	[[appController.folderContentController selectedObject] didChangeValueForKey:"images"];

}

@end