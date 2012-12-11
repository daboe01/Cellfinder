/*
 * AppController.j
 * NewApplication
 *
 * Created by You on November 16, 2011.
 * Copyright 2011, Your Company All rights reserved.
 *
 * <!> fixme
 * nothing to declare currently...
 *
 */

/////////////////////////////////////////////////////////

HostURL="http://localhost:3000"
BaseURL= HostURL+"/IMG/";

PhotoDragType="PhotoDragType";

/////////////////////////////////////////////////////////

@import <Foundation/CPObject.j>
@import <Renaissance/Renaissance.j>
@import "CompoController.j"
@import "StacksController.j"
@import "Stacks2Controller.j"
@import "DocsCalImporter.j"
@import "ConfigController.j"
@import "ImageBrowser.j"


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
-(CPImage) _cellfinderGeom
{	return [self _cellfinderSpc: "geom" forID: [self valueForKey:"id"] ];
}
@end

@implementation FSObject(Archiving)

- (void)encodeWithCoder: (CPCoder)aCoder
{
	var mydata=[_data copy];
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


@implementation AppController : CPObject
{	id	store @accessors;	
	id	trialsController;
	id	stacksController;
	id	stacksContentController;
	id	folderController;
	id	folderContentController;
	id	analysesController;

	id	displayfilters_ac;
	id	uploadfilters_ac;
	id	fixupfilters_ac;
	id	overlayfilters_ac;
	id	analyticsfilters_ac;
	id	perlfilters_ac;
	id	javascriptfilters_ac;
	id  guiClassesArrayController;
	id	_sharedConfigController;
	id	_sharedImageBrowser;
}

- sharedConfigController;
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
alert(guiClassesArrayController);
	}
// [_sharedConfigController.trialsWindow makeKeyAndOrderFront:_sharedConfigController]
	return _sharedConfigController;
}

-(CPString) baseImageURL
{	return BaseURL;
}

- (void) applicationDidFinishLaunching:(CPNotification)aNotification
{	store=[[FSStore alloc] initWithBaseURL: HostURL+"/DBI"];
	[CPBundle loadRessourceNamed: "model.gsmarkup" owner:self];

	var model;
	var re = new RegExp("id=([0-9]+)");
	var m = re.exec(document.location);
	if(m)
	{	[trialsController setFilterPredicate: [CPPredicate predicateWithFormat:"id=='"+m[1]+"'" ]];
	} else
	{	var re = new RegExp("\\?([^&]+)");
		var m = re.exec(document.location);
		if (m) [trialsController setFilterPredicate: [CPPredicate predicateWithFormat:"name=='"+m[1]+"'" ]];

	}
	if([trialsController filterPredicate])
	{	[trialsController setSelectionIndex:0];
		var o=[trialsController selectedObject];
		model=[o valueForKey:"editing_controller"]+".gsmarkup";
	}
	var re = new RegExp("t=([^&]+)");
	var m = re.exec(document.location);
	if(m) model=m[1];
	if(model) [CPBundle loadRessourceNamed: model owner:self];
	else [self sharedConfigController];

}

-(void) delete:sender
{	[[[CPApp keyWindow] delegate] delete:sender];
}


-(void) docsCalImport:sender
{	[DocsCalImporter sharedDocsCalImporter];
}

-(void) runImageBrowser:sender
{	[ImageBrowser sharedImageBrowser];
}

@end

/////////////////////////////////////////////////////////

@implementation GSMarkupTagStacks2Controller:GSMarkupTagObject
+ (CPString) tagName
{
  return @"stacks2Controller";
}
+ (Class) platformObjectClass
{
	return [Stacks2Controller class];
}
@end
