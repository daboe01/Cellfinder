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
{
	return CompoJanusControl_typeArray[_typeIndex];
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
	id addPatchPopover;
	id addCompoWindow;
	id addCompoTV;
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
		var pk=[o valueForKey:"idpatch"];
		var dv=[o valueForKey:"default_value"];
		[valcontroller addObject: @{ "idpatch": idpatch, "idparameter": pk, "value": dv } ];
	}
	[valcontroller reload];
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
		[addPatchPopover setContentViewController: myViewController];
		[myViewController setView: [addCompoWindow contentView]];
	}
	[addPatchPopover showRelativeToRect:NULL ofView: sender preferredEdge: nil];
	[[addCompoTV window] makeFirstResponder: addCompoTV]	
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
