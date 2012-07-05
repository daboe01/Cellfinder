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

@import <Foundation/CPObject.j>
@import <Renaissance/Renaissance.j>
@import "AnnotatedImageView.j"


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
	var myURL= [myAppController baseImageURL]+_idimage+"?cmp="+_compoID;
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
	}
	_isLoadingImage=NO;
	[_progress stopAnimation:self];
}

-(void) _setImageID:(int) imageID 
{	_imageID=imageID;
	var rnd=Math.floor(Math.random()*100000);
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
	[annotatedImageView bind:"backgroundImage" toObject: self withKeyPath: "_backgroundImage" options:nil];
	[annotatedImageView bind:"scale" toObject: self withKeyPath: "_scale" options:nil];
}
-(id) initWithImageID:(int) someImageID appController:(id) mainController
{	self=[super init];
	_scale=1.0;

	myAppController=mainController;
	_analysesController=[FSArrayController new];
	[_analysesController setEntity: [myAppController.analysesController entity]]
	[_analysesController setContent: [myAppController.folderContentController valueForKeyPath: "selection.image.analyses"]];	// detach from selection in main GUI (because we are a 'document')
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


