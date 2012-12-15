/*
 * AppController.j
 * NewApplication
 *
 * Created by You on November 16, 2011.
 * Copyright 2011, Your Company All rights reserved.
 *
 * <!> fixme
 * nothing to declare
 *
 */

@import <Foundation/CPObject.j>
@import <Renaissance/Renaissance.j>
@import "AnnotatedImageView.j"


@implementation DottingController : CPObject
{	id		annotatedImageView;
	id		myAppController;
	id		compoPopup;

	double	_scale @accessors(property=scale);
	CPSize	_originalSize;
	int		_compoID @accessors(property=compoID);
}

-(CPImage) _backgroundImage
{	var mycompoID=[myAppController.analysesController valueForKeyPath:"selection.idcomposition_for_editing" ];
	var myidimage=[myAppController.analysesController valueForKeyPath:"selection.idimage" ];
	var myURL= [myAppController baseImageURL]+myidimage+"?rnd=1";
	if(mycompoID && mycompoID!==CPNullMarker) myURL+="&cmp="+mycompoID;
	if(_originalSize) myURL+="&width="+(Math.floor(_originalSize.width*_scale*_originalSize.height*_scale));
	var img=[[CPImage alloc] initWithContentsOfFile: myURL];
	[img setDelegate:self];
	return img;
}
- (void)imageDidLoad:(CPImage)image
{	_originalSize=CPSizeCreateCopy([image size]);
	[_progress stopAnimation:self];
}

-(void) _configureAnalysis
{	var myreq=[CPURLRequest requestWithURL: BaseURL+"0?cmp="+[myAppController.trialsController valueForKeyPath: "selection.composition_for_javascript"] ];
	var mypackage=[[CPURLConnection sendSynchronousRequest: myreq returningResponse: nil]  rawString];
	var arr = JSON.parse( mypackage );
	if(!arr) return;
	var i,l=arr.length;
	for(i=0;i<l;i++)
	{	var m=arr[i];
		if([m characterAtIndex:0]=='<') next;
		var sel=CPSelectorFromString(m);
		if(sel) [self performSelector:sel];
	}
}


-(void) _postInit
{	_scale=1.0;

	myAppController=[CPApp delegate];
	[CPBundle loadRessourceNamed: "image.gsmarkup" owner:self];
	_compoID=[[compoPopup selectedItem] tag ];


	[self _configureAnalysis];
	[annotatedImageView bind:"scale" toObject: self withKeyPath: "_scale" options:nil];
	[annotatedImageView bind:"backgroundImage" toObject: self withKeyPath: "_backgroundImage" options:nil];
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

// CompoAPI
-(void) setNumberingPoints
{	[annotatedImageView setStyleFlags: [annotatedImageView styleFlags] | AIVStyleNumbers ];
}
-(void) setDrawingLines
{	[annotatedImageView setStyleFlags: [annotatedImageView styleFlags] | AIVStylePolygon ];
}
-(void) setDrawingAngle
{	[annotatedImageView setStyleFlags: [annotatedImageView styleFlags] | AIVStyleAngleInfo ];
}

@end

@implementation GSMarkupTagDottingController:GSMarkupTagObject
+ (CPString) tagName
{
  return @"dottingController";
}
+ (Class) platformObjectClass
{
	return [DottingController class];
}
@end

