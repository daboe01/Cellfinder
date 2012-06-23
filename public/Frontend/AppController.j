/*
 * AppController.j
 * NewApplication
 *
 * Created by You on November 16, 2011.
 * Copyright 2011, Your Company All rights reserved.
 *
 * <!> fixme
 * change scale when multiple windows are open...
 *
 */

@import <Foundation/CPObject.j>
@import <Renaissance/Renaissance.j>
@import "CompoController.j"
@import "AnnotatedImageView.j"

var BaseURL="http://localhost/cellfinder_image/";

@implementation CPObject (ImageURLHack)
-(CPImage) _cellfinderImageFromID
{	var myURL=BaseURL+[self valueForKey:"id"]+"?width=10000";
	var img=[[CPImage alloc] initWithContentsOfFile: myURL];
	[img setDelegate: self];
	return img;
}
-(CPImage) provideCollectionViewImage
{	var myURL=BaseURL+[self valueForKey:"idimage"]+"?width=10000";
	var img=[[CPImage alloc] initWithContentsOfFile: myURL];
	return img;
}
@end

@implementation SimpleImageViewCollectionItem: CPCollectionViewItem
{	CPImage _img;
	CPImageView _imgv;
}
- (void)imageDidLoad:(CPImage)image
{	var mySize=[image size];
	[_imgv setBounds: CPMakeRect(0, 0, mySize.width, mySize.height)];
}
-(CPView) loadView
{	_img=[_representedObject provideCollectionViewImage];
	_imgv=[CPImageView new];
	[_imgv setImage: _img];
	var size=[_img size];
	if(size) [_imgv setBounds: CPMakeRect(0,0, size.width, size.height)];
	else [_imgv setDelegate: self];
	var myview=[CPBox new];
	var name=[_representedObject valueForKeyPath:"image.name"]
	[myview setTitle: name];
	[myview setTitlePosition: CPBelowBottom];
    [myview setBorderType:  CPLineBorder ];
    [myview setBorderWidth:  2.0 ];

	[myview setContentView: _imgv];
	[self setView: myview];
	return myview;
}
-(void) setRepresentedObject:someObject
{	[super setRepresentedObject: someObject];
	[self loadView];
}
-(void) setSelected:(BOOL) state
{	[[self view] setBorderColor: state? [CPColor yellowColor]: [CPColor blackColor] ];
}
@end

@implementation ImageController : CPObject
{	id		imageSuperview;
	id		rawImageSuperview;
	id		annotatedImageView;
	id		myAppController;
	id		compoPopup;

	CPArrayController _analysesController;
	double	_scale @accessors(property=scale);
	CPSize	_originalSize;
	int		_compoID @accessors(property=compoID);
	int		_imageID;
	id		_progress;
	id		_mywindow;
	id		_rawImage;
	id		_cookedImage;
	id		_analyzedImage;
	int		_idtrial @accessors(property=idtrial);
	int		_updateContinuously @accessors(property=updateContinuously);
	BOOL	_isLoadingImage @accessors(property=isLoadingImage);
}

-(CPImage) getImagePixelCount
{   return Math.floor(_originalSize.width*_scale*_originalSize.height*_scale);
}

-(CPImage) _backgroundImage
{	var _compoID=[_analysesController valueForKeyPath:"selection.idcomposition_for_editing" ];
	var _idimage=[_analysesController valueForKeyPath:"selection.idimage" ];
	var myURL=BaseURL+_idimage+"?cmp="+_compoID;
	if(_originalSize) myURL+="&width="+[self getImagePixelCount];
	var img=[[CPImage alloc] initWithContentsOfFile: myURL];
	return img;
}
- (void)imageDidLoad:(CPImage)image
{	var mySize=[image size];
	var imageView=[[CPImageView alloc] initWithFrame: CPMakeRect(0,0, mySize.width, mySize.height)];
	if(!_originalSize && _scale==1)
	{	_originalSize=CPSizeCreateCopy(mySize);
	//	[_mywindow setMaxSize: _originalSize];	// to small <!> fixme
	}
	[imageView setImage: image ];
	if(image==_cookedImage)
	{	[imageSuperview setDocumentView: imageView];
	} else if(image==_rawImage)
	{	[rawImageSuperview setDocumentView: imageView];
	} else if(image==_analyzedImage)
	{	
		[annotatedImageView bind:"backgroundImage" toObject: self withKeyPath: "_backgroundImage" options:nil];
		[annotatedImageView bind:"scale" toObject: self withKeyPath: "_scale" options:nil];
		[_analysesController setContent: [myAppController.folderContentController valueForKeyPath: "selection.image.analyses"]];	// detach from selection in main GUI (because we are a 'document')
	}
	_isLoadingImage=NO;
	[_progress stopAnimation:self];
}

-(void) _setImageID:(int) imageID 
{	_imageID=imageID;
	var rnd=Math.floor(Math.random()*1000);
	var myURL=[myAppController baseImageURL]+imageID+"?rnd="+rnd;
	if(_originalSize) myURL+="&width="+[self getImagePixelCount];
	_isLoadingImage=YES;
	[_progress startAnimation: self];
	if(_compoID)
	{	 _cookedImage=[[CPImage alloc] initWithContentsOfFile: myURL+'&cmp='+_compoID+"&cc=1"];
		[_cookedImage setDelegate: self];
	}
	_rawImage=[[CPImage alloc] initWithContentsOfFile: myURL];
	[_rawImage setDelegate: self];
	_analyzedImage=[[CPImage alloc] initWithContentsOfFile: myURL];
	[_analyzedImage setDelegate: self];
}
-(id) initWithImageID:(int) someImageID appController:(id) mainController
{	self=[super init];
	_scale=1.0;

	myAppController=mainController;
	_analysesController=[FSArrayController new];
	[_analysesController setEntity: [myAppController.analysesController entity]]
	[CPBundle loadRessourceNamed: "image.gsmarkup" owner:self];
	_compoID=[[compoPopup selectedItem] tag ];
	[self _setImageID: someImageID];
	_idtrial= parseInt([myAppController.trialsController valueForKeyPath:"selection.id"]);

	[_mywindow setTitle:"Image "+someImageID];
	return self;
}
-(void) setScale:(double) someScale
{	_scale=someScale;
	if(!_originalSize) return;
	[self _setImageID: _imageID];
}
-(void) compoChanged:(id) sender
{	_compoID=[[sender selectedItem] tag ];
	[self _setImageID: _imageID];
}

-(void) reload:(id) sender
{	if(![self isLoadingImage])
	 [self _setImageID: _imageID];
}

-(void) editCompo: sender
{	var compoID=[[compoPopup selectedItem] tag];
	var o=[[myAppController.displayfilters_ac entity] objectWithPK: compoID];
	if (o)
	{	[[CompoController alloc] initWithCompo:o andAppController: myAppController];
	}
}
-(void) delete: sender	// delete a dot
{	[annotatedImageView delete: sender];
}
@end

@implementation AppController : CPObject
{	id	store @accessors;	
	id	trialsController;
	id	trialsWindow;
	id	folderContentController;
	id	analysesController;
	id	resultsController;
	id	filterPredicate;

	CPMutableSet	_imageControllers;

	id	trialsettingswindow;
	id	displayfilters_ac;
	id	uploadfilters_ac;
	id	fixupfilters_ac;
	id	overlayfilters_ac;
	id	analyticsfilters_ac;
	id	perlfilters_ac;
	id	javascriptfilters_ac;

}
-(CPString) baseImageURL
{	return BaseURL;
}
-(CPArray) imageControllersForIDTrial:(int) idtrial
{	var all=[_imageControllers allObjects];
	var i,l=all.length;
	var ret=[CPMutableArray new];
	for(i=0;i<l;i++)
	{	if([all[i] idtrial]== idtrial)
		{	[ret addObject: all[i] ];
		}
	} return ret;
}
- (void) applicationDidFinishLaunching:(CPNotification)aNotification
{	store=[[FSStore alloc] initWithBaseURL: "http://127.0.0.1:3000"];
	[CPBundle loadRessourceNamed: "gui.gsmarkup" owner:self];
}
-(void) loadImage: sender
{	var o=[[folderContentController arrangedObjects] objectAtIndex: [sender selectedRow]];
	if (o)
	{	if(!_imageControllers) _imageControllers=[CPMutableSet new];
		var ic=[[ImageController alloc] initWithImageID:[o valueForKey:"idimage"] appController: self];
		[_imageControllers addObject:ic];
//<!> fixme: implement unregistering upon window close in imagesController
	}
}

-(void) loadAnalysis: sender
{	var o=[[analysesController arrangedObjects] objectAtIndex: [sender selectedRow]];
	if (o)
	{	[[AnalysesController alloc] initWithAnalysis:o andAppController: self];
	}
}

-(void) delete:sender
{	[[[CPApp keyWindow] delegate] delete:sender];
}


- (void)closeSheet:(id)sender
{
    [CPApp endSheet: trialsettingswindow returnCode:[sender tag]];
}
-(void) didEndSheet: someSheet returnCode: someCode contextInfo: someInfo
{
}

-(void) runSettings:sender
{	[CPApp beginSheet: trialsettingswindow modalForWindow: trialsWindow modalDelegate:self didEndSelector:@selector(didEndSheet:returnCode:contextInfo:) contextInfo:nil];
}
@end
