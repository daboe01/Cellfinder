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
@import <CPTextView/CPTextView.j>


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

/////////////////////////////////////////////////////////


@implementation AppController : CPControl
{	id	store @accessors;

	id	trialsController;
	id	stacksController;
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
	id  patchRepoController;
	id  patchParametersController;
	id  patchParametersController2;

	id	displayfilters_ac;
	id	uploadfilters_ac;
	id	fixupfilters_ac;
	id	overlayfilters_ac;
	id	analyticsfilters_ac;
	id	perlfilters_ac;
	id	javascriptfilters_ac;
	id	cfifilters_ac;

	id  guiClassesArrayController;

	id	_sharedConfigController;
	id	_sharedImageBrowser @accessors(property=sharedImageBrowser);
	id	_sharedCompoBrowser @accessors(property=sharedCompoBrowser);

	id mainController @accessors;

    id _insertText;
    id _myWatchLocation;
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
{	store=[[FSStore alloc] initWithBaseURL: HostURL+"/DB"];
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
	if(model) [CPBundle loadRessourceNamed: model owner:self];
	else [self sharedConfigController];

    if(_myWatchLocation)
    {   [CPApp setNextResponder: self];
        _insertText="";
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
{   [CPBundle loadRessourceNamed:"PatchesBrowser.gsmarkup" owner:self];
}

-(void) reaggregateAll:sender
{	var myreq=[CPURLRequest requestWithURL: BaseURL+"reaggregate_all/"+[trialsController valueForKeyPath:"selection.id"] ];
	[CPURLConnection connectionWithRequest: myreq delegate: nil];
}

- (void)insertText:(CPString)aString
{
    _insertText += aString;
    var re = new RegExp("([aA]{0,1}[0-9]{8})");
    var m = re.exec(_insertText);
    if(m && m[1])
    {   var loc=_myWatchLocation=="EG"?"topcon2":"topcon1";
    	var myreq=[CPURLRequest requestWithURL: BaseURL+"trigger/"+loc+"/"+ m[1]];
		[CPURLConnection connectionWithRequest:myreq delegate: self];
        _insertText="";
    }
    if (aString === "\n" || aString === "\r" || aString === " ")
        _insertText="";
}
-(void) connection: someConnection didReceiveData: data
{
}

- (void)keyDown:(CPEvent)event
{
    [self interpretKeyEvents:[event]];
}

- (id)nextResponder
{   return nil;
}

@end
