/*
 * compobrowser created 2013 by prof. boehringer
 */

/////////////////////////////////////////////////////////

@import "TableViewControl.j"

var _sharedCompoBrowser;
var CompoJanusControl_typeArray;

@implementation CompoJanusControl : TableViewJanusControl
+(void) initialize
{	[super initialize];
/*
		("1","Numeric"),
		("2","Boolean"),
		("3","String"),
		("0","ImmutableString"),
		("5","List"),
		("4","Image")
 */
	CompoJanusControl_typeArray=[TableViewControl, TableViewControl, TableViewControl, TableViewControl, nil, TableViewPopup];
}
- viewClass
{	return CompoJanusControl_typeArray[_typeIndex];
}

@end
@implementation GSMarkupTagCompoJanusControl: GSMarkupTagTableViewJanusControl

+ (Class) platformObjectClass
{
	return [CompoJanusControl class];
}

@end

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
    if(code)	// do it
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
