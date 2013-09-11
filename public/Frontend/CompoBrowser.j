/*
 *
 */

/////////////////////////////////////////////////////////

var _sharedCompoBrowser;


@implementation CompoBrowser : CPObject
{	id myalert;
}

+ sharedImageBrowser
{	if(! _sharedCompoBrowser)
	{	[CPBundle loadRessourceNamed: "CompoBrowser.gsmarkup" owner: [CPApp delegate] ];
		_sharedCompoBrowser = [CPApp delegate]._sharedCompoBrowser;
		_sharedCompoBrowser.myAppController= [CPApp delegate];
	}
	[_sharedCompoBrowser.myWindow makeKeyAndOrderFront: _sharedCompoBrowser ];
	return _sharedCompoBrowser;
}

- (void)deleteWarningDidEnd:(CPAlert)anAlert code:(id)code context:(id)context
{
    if(code)	// doit
	{
	}
}

-(void) deleteCompo: sender
{
	myalert = [CPAlert new];
    [myalert setMessageText: "Are you sure you want to delete all images of this folder?"];
	[myalert addButtonWithTitle:"Cancel"];
	[myalert addButtonWithTitle:"Delete"];
	[myalert beginSheetModalForWindow:myWindow modalDelegate:self didEndSelector:@selector(deleteWarningDidEnd:code:context:) contextInfo: nil];
}

-(void) delete:sender
{	[[[CPApp keyWindow] delegate] delete:sender];
}

@end

@implementation GSMarkupTagCompoBrowser:GSMarkupTagObject
+ (CPString) tagName
{
  return @"compoBrowser";
}
+ (Class) platformObjectClass
{
	return [CompoBrowser class];
}
@end
