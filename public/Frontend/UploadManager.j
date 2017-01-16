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
	var					uploadPrefix @accessors;
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
- (void) setUploadPrefix:(CPString)somePrefix
{	var idtrial = [appController.trialsController valueForKeyPath:"selection.id"];
	uploadPrefix = somePrefix;
	[myCuploader setURL:HostURL+"/upload/"+ idtrial+"?prefix="+encodeURIComponent(uploadPrefix||'')];
}

- (void)cup:(Cup)aCup uploadDidCompleteForFile:(CupFile)aFile
{
	[[CPApp delegate] _refreshFoldersList];
}

@end
