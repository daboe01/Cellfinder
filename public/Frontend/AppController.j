/*
 * Cappuccino fromtend for the New Cellfinder
 *
 * Created by daboe01 on November 16, 2011.
 * Copyright 2011, All rights reserved.
 *
 */

/////////////////////////////////////////////////////////

HostURL=""
BaseURL= HostURL+"/IMG/";

PhotoDragType="PhotoDragType";

/////////////////////////////////////////////////////////

@import <Foundation/CPObject.j>
@import <Renaissance/Renaissance.j>
@import "DottingControllers.j"
@import "AdminController.j"
@import "ImageBrowser.j"
@import "CompoBrowser.j"
@import "UploadManager.j"
@import "TableViewControl.j"
@import "CPWebSocket.j"


/////////////////////////////////////////////////////////

@implementation CPObject (ImageURLHack)

//<!> unused?!
-(CPImage) _cellfinderImageFromID
{	var myURL=BaseURL+[self valueForKey:"id"]+"?width=10000";
	var img=[[CPImage alloc] initWithContentsOfFile: myURL];
	[img setDelegate: self];
	return img;
}
-(CPImage) _cellfinderSpc: someSpc forID: someID
{	var myreq=[CPURLRequest requestWithURL: BaseURL+someID+"?spc="+someSpc ];
	return [[CPURLConnection sendSynchronousRequest: myreq returningResponse: nil]  rawString];

}

@end

@implementation FSObject(Archiving)

- (void)encodeWithCoder: (CPCoder)aCoder
{	var mydata=[_data copy];
	if(_changes) [mydata addEntriesFromDictionary: _changes];
	[aCoder _encodeDictionaryOfObjects: mydata forKey:@"FS.objects"];
}
- (void)initWithCoder:(CPCoder)aCoder
{	self=[self init];
	if(self)
	{	_changes=[aCoder _decodeDictionaryOfObjectsForKey:@"FS.objects"]
	}
	return self;
}
@end

// fixme<!> refactor to cappusance
@implementation CPButtonBar(addbutton)
- (CPButton) addButtonWithImageName:(CPString) aName target:(id) aTarget action:(SEL) aSelector
{   var sendimage=[[CPImage alloc] initWithContentsOfFile: [CPString stringWithFormat:@"%@/%@", [[CPBundle mainBundle] resourcePath], aName]];
    var newbutton = [[CPButton alloc] initWithFrame:CGRectMake(0, 0, 35, 25)];
    [newbutton setBordered:NO];
    [newbutton setImage:sendimage];
    [newbutton setImagePosition:CPImageOnly];
    [newbutton setTarget:aTarget];
    [newbutton setAction:aSelector];
    [self setButtons: [[self buttons] arrayByAddingObject:newbutton] ];
    return newbutton;
}
- (void) registerWithArrayController:(CPArrayController) aController plusTooltip:(CPString)ptt minusTooltip:(CPString)mtt
{
    [[self buttons][1] bind:CPEnabledBinding toObject:aController withKeyPath:"selectedObjects.@count" options:nil];
    if(ptt)
        [[self buttons][0] setToolTip: ptt]
    if(mtt)
        [[self buttons][1] setToolTip: mtt]
    //<!> fixme add insert and remove actions unless already wired!
}
- (void) registerWithArrayController:(CPArrayController) aController
{
    [self registerWithArrayController:aController plusTooltip:nil minusTooltip:nil]
}

@end

@implementation SessionStore : FSStore

-(CPURLRequest) requestForAddressingObjectsWithKey:(CPString)aKey equallingValue:(id)someval inEntity:(FSEntity) someEntity
{   var request = [CPURLRequest requestWithURL: [self baseURL]+"/"+[someEntity name]+"/"+aKey+"/"+someval+"?session="+ window.G_SESSION];
    
    return request;
}
-(CPURLRequest) requestForFuzzilyAddressingObjectsWithKey: aKey equallingValue:(id) someval inEntity:(FSEntity) someEntity
{   var request = [CPURLRequest requestWithURL: [self baseURL]+"/"+[someEntity name]+"/"+aKey+"/like/"+someval+"?session="+ window.G_SESSION];
    return request;
}
-(CPURLRequest) requestForAddressingAllObjectsInEntity:(FSEntity) someEntity
{    return [CPURLRequest requestWithURL: [self baseURL]+"/"+[someEntity name]+"?session="+ window.G_SESSION ];
}
-(CPURLRequest) requestForInsertingObjectInEntity:(FSEntity) someEntity
{   var request = [CPURLRequest requestWithURL: [self baseURL]+"/"+[someEntity name]+"/"+ [someEntity pk]+"?session="+ window.G_SESSION];
    [request setHTTPMethod:"POST"];
    return request;
}

@end


/////////////////////////////////////////////////////////


@implementation AppController : CPControl
{	id	store @accessors;

	id	trialsController;
	id	stacksController;
    id  imagesController;
	id	stacksContentController;
	id	folderController;
	id	folderContentController;
	id	analysesController;
	id	aggregationsController;
	id	tagrepoController;
	id	tagsController;
	id	compoController;
    id	chainsController;
    id	chainsControllerAll;
	id	patchesController;
	id	inputValController;
	id	taglistController;
	id	taglistController2;
	id	parameterlistsController;
	id	parameterlistsControllerBound;
	id  patchRepoController;
	id  patchParametersController;
	id  patchParametersController2;
    id  stacksAnalysesController;
    id  stackAggregationsController;

	id	displayfilters_ac;
	id	uploadfilters_ac;
	id	fixupfilters_ac;
	id	overlayfilters_ac;
	id	analyticsfilters_ac;
	id	aggfilters_ac;
	id	javascriptfilters_ac;
	id	cfifilters_ac;

	id  guiClassesArrayController;

	id	_sharedConfigController;
	id	_sharedImageBrowser @accessors(property=sharedImageBrowser);
	id	_sharedCompoBrowser @accessors(property=sharedCompoBrowser);

	id mainController @accessors;

    id _insertText;
    id _myWatchLocation;
    CPDate lastScanDate;
}
// this is to make the currently GUI controller globally available (to get access to e.g. scale)
- mainController
{	return [[CPApp mainWindow] delegate] || mainController;
}
-(id) sharedConfigController
{
	if(!_sharedConfigController)
	{	[CPBundle loadRessourceNamed: "Admin.gsmarkup" owner: self ];
		var classes=[[[CPBundle mainBundle] infoDictionary] objectForKey:"ViewerClasses"];
		var l=classes.length;
		var a=[CPMutableArray new];
		for(var i=0; i<l; i++)
		{	[a addObject: [CPDictionary dictionaryWithObject: classes[i] forKey: "name"] ];
		}
		[guiClassesArrayController setContent: a ];
	}
// [_sharedConfigController.trialsWindow makeKeyAndOrderFront:_sharedConfigController]
	return _sharedConfigController;
}

-(CPString) baseImageURL
{	return BaseURL;
}

- (void) applicationDidFinishLaunching:(CPNotification)aNotification
{
    store = [[SessionStore alloc] initWithBaseURL: HostURL+"/DB"];
	[CPBundle loadRessourceNamed: "model.gsmarkup" owner:self];
	var model;
	var re = new RegExp("id=([0-9]+)");
	var m = re.exec(document.location);
	if(m)
	{	[trialsController setFilterPredicate: [CPPredicate predicateWithFormat:"id=='"+m[1]+"'" ]];
	} else
	{	var re = new RegExp("\\?([^&#]+)");
		var m = re.exec(document.location);
		if (m) [trialsController setFilterPredicate: [CPPredicate predicateWithFormat:"name=='"+m[1]+"'" ]];

	}
	if( [trialsController filterPredicate])
	{	[trialsController setSelectionIndex: 0];
		var o=[trialsController selectedObject];
		model=[o valueForKey:"editing_controller"]+".gsmarkup";
	}
    var re = new RegExp("&w=([^&]+)");
    var m = re.exec(document.location);
    if(m && m[1]) [self runWatch: _myWatchLocation=m[1]];

	var re = new RegExp("t=([^&#]+)");
	var m = re.exec(document.location);
	if(m) model=m[1];
	if(model) [CPBundle loadRessourceNamed:model owner:self];
	else [self sharedConfigController];

    if(_myWatchLocation)
    {   [CPApp setNextResponder: self];
        _insertText="";
        var myreq=[CPURLRequest requestWithURL: BaseURL+"setup_cam/"+_myWatchLocation];
        [CPURLConnection connectionWithRequest:myreq delegate: nil];
    }
}
-(void) runWatch:(CPString)what
{
    [[CPWebSocket alloc] initWithURL: "ws:augimageserver:3005/echo/"+what delegate:self];
}

- (void)webSocket:aSoc didReceiveMessage:someData
{
    [mainController webSocketActionData:someData]
}
- (void)webSocketDidOpen:aSoc
{
}


-(void) delete:sender
{	[[[CPApp keyWindow] delegate] delete:sender];
}


-(void) uploadImage: sender
{	[UploadManager sharedUploadManager];
}

-(void) runImageBrowser:sender
{	[ImageBrowser sharedImageBrowser];
}
-(void) runCompoBrowser:sender
{	[CompoBrowser sharedImageBrowser];
}
-(void) runPatchesBrowser:sender
{  [patchRepoController setFilterPredicate:nil];
   [CPBundle loadRessourceNamed:"PatchesBrowser.gsmarkup" owner:self];
}

-(void) reaggregateAll:sender
{	var myreq=[CPURLRequest requestWithURL: BaseURL+"reaggregate_all/"+[trialsController valueForKeyPath:"selection.id"] ];
	[CPURLConnection connectionWithRequest: myreq delegate: nil];
}

- (void)insertText:(CPString)aString
{
    var scanDate=[CPDate dateWithTimeIntervalSinceNow:0];
    if( lastScanDate && ([scanDate  timeIntervalSinceDate: lastScanDate ] >0.5 ))   // timeout to prevent frameshift
    {   _insertText="";
    }

    lastScanDate=scanDate;
    
    _insertText += aString;
    var re = new RegExp("([aA]{0,1}[0-9]{8})");
    var m = re.exec(_insertText);
    if(m && m[1])
    {   var loc;
        switch(_myWatchLocation)
        {   case "EG":
                loc="topcon2";
            break;
            case "HHB":
                loc="hhb";
            break;
            default:
                loc="topcon1";
        }

    	var myreq=[CPURLRequest requestWithURL:BaseURL+"trigger/"+loc+"/"+ m[1]];
		[CPURLConnection connectionWithRequest:myreq delegate: self];
        _insertText="";
    }
    if (aString === "\n" || aString === "\r" || aString === " " || aString === "\t")
        _insertText="";
}
-(void) connection:(CPConnection)someConnection didReceiveData: data
{
}

- (void)keyDown:(CPEvent)event
{
    [self interpretKeyEvents:[event]];
}

- (CPResponder)nextResponder
{   return nil;
}

-(void) gotoAutoStacks:(id)sender
{
	var idtrial=[trialsController valueForKeyPath:"selection.id"];
	window.open("http://augimageserver:3000/Frontend/index.html?id="+idtrial+"&t=AutoStacks.gsmarkup",'autostacks');
}

-(void) gotoManualStacks:(id)sender
{
	var idtrial=[trialsController valueForKeyPath:"selection.id"];
	window.open("http://augimageserver:3000/Frontend/index.html?id="+idtrial+"&t=ManualStacks.gsmarkup",'autostacks');
}
-(void) gotoAutoStitching:(id)sender
{
	var idtrial=[trialsController valueForKeyPath:"selection.id"];
	window.open("http://augimageserver:3000/Frontend/index.html?id="+idtrial+"&t=AutoStitching.gsmarkup",'autostacks');
}

-(void) addAllWarningDidEnd:anAlert code:(id)code context:(id)context
{	if(code)
    {
        var myreq=[CPURLRequest requestWithURL: BaseURL+"addStandardAnalysisToAll"+"/"+context];
        [myreq setHTTPMethod:"POST"];
        [myreq setHTTPBody:""];
        [CPURLConnection connectionWithRequest:myreq delegate: self];
    }
}

-(void) addDefaultAnalysisToAll: sender
{	var idtrial=[trialsController valueForKeyPath:"selection.id"];

    var myalert = [CPAlert new];
    [myalert setMessageText: "Are you sure you want to add the default analysis to all images?"];
    [myalert addButtonWithTitle:"Cancel"];
    [myalert addButtonWithTitle:"Add"];
    [myalert beginSheetModalForWindow:[CPApp mainWindow] modalDelegate:self didEndSelector:@selector(addAllWarningDidEnd:code:context:) contextInfo: idtrial];

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
- (void) deleteAllAnalysesWarningDidEnd:anAlert code:(id)code context:(id)context
{	if(code)
    {
        var myreq=[CPURLRequest requestWithURL: BaseURL+"deleteAllAnalyses"+"/"+context];
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
    [myalert beginSheetModalForWindow:[CPApp mainWindow] modalDelegate:self didEndSelector:@selector(reaggregateAllWarningDidEnd:code:context:) contextInfo: idtrial];
}
-(void) deleteAllAnalyses: sender
{	var idtrial=[[CPApp delegate].trialsController valueForKeyPath:"selection.id"];

    var myalert = [CPAlert new];
    [myalert setMessageText: "Are you sure you want to delete all analyses?"];
    [myalert addButtonWithTitle:"Cancel"];
    [myalert addButtonWithTitle:"Delete all analyses"];
    [myalert beginSheetModalForWindow:[CPApp mainWindow] modalDelegate:self didEndSelector:@selector(deleteAllAnalysesWarningDidEnd:code:context:) contextInfo: idtrial];
}

- (void)_refreshFoldersList
{
    [folderController reload];
    [folderContentController reload];
    [imagesController reload];
}
- (void)clusterAll:(id)sender
{
	var idtrial=[[CPApp delegate].trialsController valueForKeyPath:"selection.id"];
    var myreq=[CPURLRequest requestWithURL: BaseURL+"cluster_all_folders"+"/"+idtrial];
    [myreq setHTTPMethod:"POST"];
    [myreq setHTTPBody:""];
    [CPURLConnection connectionWithRequest:myreq delegate:self];
}


@end
