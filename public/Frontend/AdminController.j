/*
 * <!> rename to AdminCentroller
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

-(void) runSettings:sender
{	[CPApp beginSheet: trialsettingswindow modalForWindow: trialsWindow modalDelegate:self didEndSelector:@selector(didEndSheet:returnCode:contextInfo:) contextInfo:nil];
}

//- (void)editColumn:(CPInteger)columnIndex row:(CPInteger)rowIndex withEvent:(CPEvent)theEvent select:(BOOL)flag

-(void) updateTags:sender
{	var myreq=[CPURLRequest requestWithURL: BaseURL+"make_tags" ];
	[CPURLConnection sendSynchronousRequest: myreq returningResponse: nil];
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

