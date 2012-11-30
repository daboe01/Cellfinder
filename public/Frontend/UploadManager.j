@import <AppKit/AppKit.j>
@import <Renaissance/Renaissance.j>
@import "FileUpload.j"

var _sharedUploadManager;


@implementation UploadManager : CPObject
{
	id	uploadButton;
	id	statusDisplay;

}

+ sharedUploadManager
{	if(!_sharedUploadManager)
	{
	}
	[CPBundle loadRessourceNamed: "gui.gsmarkup" owner:self];
	spinnerImg=[[CPImage alloc] initWithContentsOfFile: [CPString stringWithFormat:@"%@/%@", [[CPBundle mainBundle] resourcePath],"spinner.gif" ]];

	_store.stacksEntity=[stacksController entity];
	_store.stacksDirEntity=[stacksDirController entity];
	[stacksController setContent: [[stacksController entity] allObjects] ];
    [typePopup addObserver:self
                forKeyPath:@"itemArray"
				   options: (CPKeyValueObservingOptionNew)
				   context: NULL];
	[uploadButton setURL: BaseURL];
	[mainWindow makeKeyAndOrderFront:self];
}

-(void) uploadButton:(UploadButton)button didChangeSelection:(CPArray)selection
{
    [statusDisplay setStringValue:"Selection has been made: " + selection];

    [button submit];
}

-(void) uploadButton:(UploadButton)button didFailWithError:(CPString)anError
{
    [statusDisplay setStringValue: anError];
}

-(void) uploadButton:(UploadButton)button didFinishUploadWithData:(CPString)response
{
    [statusDisplay setStringValue: response];
    [button resetSelection];
	[self performSelector:@selector(reload:) withObject:self afterDelay: 2000];
}

-(void) uploadButtonDidBeginUpload:(UploadButton)button
{
    [statusDisplay setStringValue:"Upload: " + [button selection]];
}

@end

@implementation GSMarkupUploadButton : GSMarkupTagButton
+ (CPString) tagName
{
  return @"levelIndicator";
}

+ (Class) platformObjectClass
{
  return [UploadButton class];
}

- (id) initPlatformObject: (id)platformObject
{	platformObject = [super initPlatformObject: platformObject];

	[platformObject allowsMultipleFiles:  [self boolValueForAttribute: @"allowsMultipleFiles"]==1 ];
	[platformObject setURL:  [self stringValueForAttribute: @"URL"] ];
    [platformObject setBordered:YES];

	return platformObject;
}
@end
