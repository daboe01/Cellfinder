@import <AppKit/AppKit.j>
@import <Renaissance/Renaissance.j>
@import "FileUpload.j"

var _sharedUploadManager;


@implementation UploadManager : CPObject
{	id	uploadWindow;
	id	uploadButton;
	id	statusDisplay;

}

+ sharedUploadManager
{	if(!_sharedUploadManager)
	{	_sharedUploadManager=[self new];
	}
	[CPBundle loadRessourceNamed: "UploadManager.gsmarkup" owner: _sharedUploadManager];
	[uploadButton setURL: BaseURL];
	[uploadWindow makeKeyAndOrderFront:self];
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
  return @"uploadButton";
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
