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
-(void) newTrial: sender
{	[[CPApp delegate].trialsController addObject: @{"name": "New trial"}];
}

- (void)deleteTrialWarningDidEnd:(CPAlert)anAlert code:(id)code context:(id)context
{	if(code)
	{	[[CPApp delegate].trialsController remove: self]
	}
}

-(void) removeTrial: sender
{
	var myalert = [CPAlert new];
	[myalert setMessageText: "Are you sure you want to delete this trial?"];
	[myalert addButtonWithTitle:"Cancel"];
	[myalert addButtonWithTitle:"Delete"];
	[myalert beginSheetModalForWindow: trialsWindow modalDelegate:self didEndSelector:@selector(deleteTrialWarningDidEnd:code:context:) contextInfo: nil];

}


-(void) rebuildFromRepo: sender
{	var idtrial=[[CPApp delegate].trialsController valueForKeyPath:"selection.id"];
    var myreq=[CPURLRequest requestWithURL: BaseURL+"rebuildFromRepository"+"/"+idtrial];
    [myreq setHTTPMethod: "POST"];
    [myreq setHTTPBody: "" ];
    [CPURLConnection connectionWithRequest:myreq delegate: self];
    // fixme: start spinner
}

- (void)deleteImagesWarningDidEnd:(CPAlert)anAlert code:(id)code context:(id)context
{	if(code)
    {
        var myreq=[CPURLRequest requestWithURL: BaseURL+"deleteAllImages"+"/"+context];
        [myreq setHTTPMethod: "POST"];
        [myreq setHTTPBody: "" ];
        [CPURLConnection connectionWithRequest:myreq delegate: self];
    }
}

-(void) deleteAllImages: sender
{	var idtrial=[[CPApp delegate].trialsController valueForKeyPath:"selection.id"];

    var myalert = [CPAlert new];
    [myalert setMessageText: "Are you sure you want to delete all images from this trial?"];
    [myalert addButtonWithTitle:"Cancel"];
    [myalert addButtonWithTitle:"Delete"];
    [myalert beginSheetModalForWindow: trialsWindow modalDelegate:self didEndSelector:@selector(deleteImagesWarningDidEnd:code:context:) contextInfo: idtrial];
}

- (void) addAllWarningDidEnd:anAlert code:(id)code context:(id)context
{	if(code)
    {
        var myreq=[CPURLRequest requestWithURL: BaseURL+"addStandardAnalysisToAll"+"/"+context];
        [myreq setHTTPMethod: "POST"];
        [myreq setHTTPBody: "" ];
        [CPURLConnection connectionWithRequest:myreq delegate: self];
    }
}

-(void) addDefaultAnalysisToAll: sender
{	var idtrial=[[CPApp delegate].trialsController valueForKeyPath:"selection.id"];

    var myalert = [CPAlert new];
    [myalert setMessageText: "Are you sure you want to add the default analysis to all images?"];
    [myalert addButtonWithTitle:"Cancel"];
    [myalert addButtonWithTitle:"Add"];
    [myalert beginSheetModalForWindow: trialsWindow modalDelegate:self didEndSelector:@selector(addAllWarningDidEnd:code:context:) contextInfo: idtrial];

}

- (void) reaggregateAllWarningDidEnd:anAlert code:(id)code context:(id)context
{	if(code)
    {
        var myreq=[CPURLRequest requestWithURL: BaseURL+"reaggregate_all"+"/"+context];
        [myreq setHTTPMethod: "POST"];
        [myreq setHTTPBody: "" ];
        [CPURLConnection connectionWithRequest:myreq delegate: self];
    }
}


-(void) reaggregateAll: sender
{	var idtrial=[[CPApp delegate].trialsController valueForKeyPath:"selection.id"];

    var myalert = [CPAlert new];
    [myalert setMessageText: "Are you sure you want to reaggregate all analyses?"];
    [myalert addButtonWithTitle:"Cancel"];
    [myalert addButtonWithTitle:"Reaggregate all"];
    [myalert beginSheetModalForWindow: trialsWindow modalDelegate:self didEndSelector:@selector(reaggregateAllWarningDidEnd:code:context:) contextInfo: idtrial];

}


-(void) connection: someConnection didReceiveData: data
{	// fixme: stop spinner
    var appController=[CPApp delegate];
    [appController.folderController reload];
    [appController.folderContentController reload];
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
