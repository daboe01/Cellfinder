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
	CompoJanusControl_typeArray=[TableViewControl, TableViewControl, TableViewControl, TableViewControl, TableViewPopupImage, TableViewPopup];
}
- viewClass
{
	return CompoJanusControl_typeArray[_typeIndex];
}

@end

@implementation TableViewPopupImage:TableViewPopup
-(void) setItemsController:(id)aController
{
    [super setItemsController:[CPApp delegate].chainsControllerAll]
}
-(void) setItemsFace:(CPString)aFace
{
    [super setItemsFace:"arrangedObjects.name"]
}
-(void) setItemsPredicateFormat:(CPString)aFormat
{
    [super setItemsPredicateFormat:"idpatch_composition == $patch.chain.idpatch_composition"]
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
    id myWindow;
	id addPatchPopover;
	id addCompoWindow;
	id addCompoTV;
    id moveToWindow;
	id searchTerm @accessors;
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

- (void)deleteCompoWarningDidEnd:(CPAlert)anAlert code:(id)code context:(id)context
{
    if(code)	// do it
	{
        [[CPApp delegate].compoController remove:self];
	}
}

-(void) deleteCompo: sender
{
    myalert = [CPAlert new];
    [myalert setMessageText: "Are you sure you want to delete all images of this folder?"];
    [myalert addButtonWithTitle:"Cancel"];
    [myalert addButtonWithTitle:"Delete"];
    [myalert beginSheetModalForWindow:[CPApp mainWindow] modalDelegate:self didEndSelector:@selector(deleteCompoWarningDidEnd:code:context:) contextInfo: nil];
}
-(void) newCompo: sender
{
    [[CPApp delegate].compoController insert:self];
}
-(void) newChain: sender
{
    [[CPApp delegate].chainsController insert:self];
}
-(void) deleteChain: sender
{
    [[CPApp delegate].chainsController remove:self];
}

-(void) performAddCompo: sender
{	var idpatch = [[CPApp delegate].patchRepoController valueForKeyPath:"selection.id"];
	var patchesController = [CPApp delegate].patchesController;
	[patchesController addObject: @{"idpatch": idpatch} ];
	var valcontroller = [CPApp delegate].inputValController;
	var patchParametersController = [CPApp delegate].patchParametersController;

	var a=[[patchParametersController._entity store] fetchObjectsWithKey: "idpatch" equallingValue: idpatch inEntity: patchParametersController._entity options: @{"FSSynchronous":1}];
	var l=[a count];
	for(var i=0; i< l; i++)
	{	var o= [a objectAtIndex:i];
		var pk=[o valueForKey:"id"];
		var dv=[o valueForKey:"default_value"];
		[valcontroller addObject: @{ "idpatch": idpatch, "idparameter": pk, "value": dv } ];
	}
	[valcontroller reload];
    [addPatchPopover close];
}
-(void) cancelAddCompo: sender
{	[addPatchPopover close];

}
-(void) deletePatch: sender
{	[[CPApp delegate].patchesController remove:self];

}

-(void) newPatch: sender
{
	if( !addPatchPopover)
	{	 addPatchPopover =[CPPopover new];
		[addPatchPopover setDelegate:self];
		[addPatchPopover setAnimates:YES];
		[addPatchPopover setBehavior: CPPopoverBehaviorTransient ];
		[addPatchPopover setAppearance: CPPopoverAppearanceMinimal];
		var myViewController=[CPViewController new];
		[addPatchPopover setContentViewController:myViewController];
		[myViewController setView: [addCompoWindow contentView]];
	}
	[addPatchPopover showRelativeToRect:NULL ofView: sender preferredEdge: nil];
	[[addCompoTV window] makeFirstResponder: addCompoTV]
}


-(void) delete:sender
{	[[[CPApp keyWindow] delegate] delete:sender];
}

-(void) setSearchTerm: aTerm
{
    searchTerm=aTerm;

	if(aTerm && aTerm.length)
	{	  [[CPApp delegate].patchRepoController setFilterPredicate: [CPPredicate predicateWithFormat:"name LIKE[cd] %@", aTerm.toLowerCase()]];
	} else [[CPApp delegate].patchRepoController setFilterPredicate: nil];
}

-(void) duplicateCompo:(id)sender
{
    var compoController=[CPApp delegate].compoController;
    var myreq=[CPURLRequest requestWithURL:BaseURL+"duplicate_compo/"+[compoController valueForKeyPath:"selection.id"] ];
    [myreq setHTTPMethod:"POST"];

    var pk=[[CPURLConnection sendSynchronousRequest:myreq returningResponse: nil]  rawString];
    [compoController reload];
    [[CPApp delegate].chainsControllerAll setContent:[[CPApp delegate].chainsControllerAll._entity allObjects] ];
    window.setTimeout(function(){ [compoController selectObjectWithPK:pk] }, 300); 
}
-(void) duplicateChain:(id)sender
{
    var chainsController=[CPApp delegate].chainsController;
    var myreq=[CPURLRequest requestWithURL:BaseURL+"duplicate_chain/"+[chainsController valueForKeyPath:"selection.id"] ];
    [myreq setHTTPMethod:"POST"];
    var pk=[[CPURLConnection sendSynchronousRequest:myreq returningResponse: nil]  rawString];
    [chainsController reload];
    [chainsController selectObjectWithPK:pk];
}
-(void) moveToTrial:(id)sender
{   [moveToWindow makeKeyAndOrderFront:self];
}
-(void) setPrimaryChain:(id)sender
{   var compoController=[CPApp delegate].compoController;
    var chainsController=[CPApp delegate].chainsController;
    [compoController setValue:[chainsController valueForKeyPath:"selection.id"] forKeyPath:"selection.primary_chain"]
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
