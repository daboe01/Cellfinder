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
    id  searchTerm @accessors;

    id bulkRenameWindow;
    id replaceRegexField;
    id searchRegexField;
    id testRenameWindow;
    id findTestField;
    id replaceTestField;
}

-(void) setSearchTerm:(id)aTerm
{   if(aTerm && aTerm.length)
    {   [[CPApp delegate].trialsController setFilterPredicate:[CPPredicate predicateWithFormat:"name CONTAINS %@", aTerm]];
    } else [[CPApp delegate].trialsController setFilterPredicate: nil];
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
    [myalert beginSheetModalForWindow:[CPApp mainWindow] modalDelegate:self didEndSelector:@selector(deleteImagesWarningDidEnd:code:context:) contextInfo: idtrial];
}

-(void) bulkRename:(id)sender
{   [bulkRenameWindow makeKeyAndOrderFront:self];
}

-(void) doBulkRename:(id)sender
{
    var idtrial= [[CPApp delegate].trialsController valueForKeyPath:"selection.id"];
    var myurl=BaseURL+"rename_images_regex/"+idtrial;
    var myreq=[CPURLRequest requestWithURL: myurl];
    [myreq setHTTPMethod:"POST"];
    [myreq setHTTPBody:JSON.stringify([ [searchRegexField stringValue], [replaceRegexField stringValue] ]) ];
    [CPURLConnection sendSynchronousRequest:myreq returningResponse: nil];
    [[CPApp delegate] _refreshFoldersList];
    [bulkRenameWindow orderOut:self];
}
-(void) cancelBulkRename:(id)sender
{   [[CPApp delegate] _refreshFoldersList];
    [bulkRenameWindow orderOut:self];
}
-(void) doRenameTest:(id)sender
{
    var myreq=[CPURLRequest requestWithURL:BaseURL+"rename_probe_regex"];
    [myreq setHTTPMethod:"POST"];
    [myreq setHTTPBody:JSON.stringify([ [searchRegexField stringValue], [replaceRegexField stringValue], [findTestField stringValue] ]) ];
    var response=[[CPURLConnection sendSynchronousRequest:myreq returningResponse: nil] rawString];
    [replaceTestField setStringValue:response]
}



-(void) connection:(CPConnection)someConnection didReceiveData: data
{	// fixme: stop spinner
    var appController=[CPApp delegate];
    [appController.folderController reload];
    [appController.folderContentController reload];
}

-(void) insertImage:(id)sender
{
   [UploadManager sharedUploadManager];
}
- (void)deleteWarningDidEnd:(CPAlert)anAlert code:(id)code context:(id)context
{
    if(code)
	{
	    var so=[[CPApp delegate].imagesController selectedObjects];
	    var i,l=[so count];
	    var body='';
	    for(i=0; i < l; i++)
            body+=[[so objectAtIndex:i] valueForKey:"id"]+',';

	    var myreq=[CPURLRequest requestWithURL:BaseURL+"batch_delete_images"];
	    [myreq setHTTPMethod:"POST"];
	    [myreq setHTTPBody:body];
	    [CPURLConnection sendSynchronousRequest:myreq returningResponse:nil];
	    [[CPApp delegate].imagesController reload];
	}
}

-(void) removeImages:(id)sender
{
	var count=[[[CPApp delegate].imagesController selectedObjects] count];
	var myalert = [CPAlert new];
    [myalert setMessageText: "Are you sure you want to delete the selected "+ count +" images?"];
	[myalert addButtonWithTitle:"Cancel"];
	[myalert addButtonWithTitle:"Delete all "+ count];
	[myalert beginSheetModalForWindow:[CPApp mainWindow] modalDelegate:self didEndSelector:@selector(deleteWarningDidEnd:code:context:) contextInfo: nil];
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
