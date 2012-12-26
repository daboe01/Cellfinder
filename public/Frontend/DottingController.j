@import <Foundation/CPObject.j>
@import <Renaissance/Renaissance.j>
@import "AnnotatedImageView.j"


@implementation CPObject (ImageURLForDottingController)

-(CPImage) _backgroundImage
{	var mycompoID=[self valueForKey:"idcomposition_for_editing" ];
	var myidimage=[self valueForKey:"idimage" ];
	var myURL= [[CPApp delegate] baseImageURL]+myidimage+"?rnd=1";
	if(mycompoID && mycompoID!==CPNullMarker) myURL+="&cmp="+mycompoID;
	var mycontroller= [[CPApp mainWindow] delegate];	// this is hack to get hold of the UI context from within the database context
	var scale= mycontroller._scale;
	if(mycontroller._originalSize) myURL+="&width="+ Math.floor(mycontroller._originalSize.width *scale*
																mycontroller._originalSize.height*scale);
	var img=[[CPImage alloc] initWithContentsOfFile: myURL];
	[img setDelegate: mycontroller];
	return img;
}

@end

@implementation CPButtonBar(addObjectAddition)
-(void) addObject:someO
{	var b=[self buttons];
	[b addObject: someO];
	[self setButtons: b];
}
@end

/////////////////////////////////////////////////////////

@implementation DottingController : CPObject
{	id annotatedImageView;
	id _scale @accessors(property=scale);
	CPSize _originalSize;
	CPSize myButtonBar;
}

// this is a hack to get the scaling right
- (void)imageDidLoad:(CPImage)image
{	if(!_originalSize) _originalSize= [image size];
}

- init
{	if(self=[super init])
	{	_scale=1;
		[[CPRunLoop currentRunLoop] performSelector:@selector(_postInit) target:self argument: nil order:0 modes:[CPDefaultRunLoopMode]];
	} return self;
}

-(void) _postInit
{	var myAppDelegate= [CPApp delegate];
	var mycompo= [myAppDelegate.trialsController valueForKeyPath: "selection.composition_for_javascript"];
	if(mycompo !== CPNullMarker)
	{	var myreq=[CPURLRequest requestWithURL: BaseURL+"0?cmp="+mycompo ];
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
	[annotatedImageView bind:"backgroundImage" toObject: myAppDelegate.analysesController withKeyPath: "selection._backgroundImage" options:nil];
	if(myButtonBar)
	{	var actionButton;
		[myButtonBar addObject:actionButton=[CPButtonBar actionPopupButton] ];
		var list=[myAppDelegate.analyticsfilters_ac arrangedObjects];
		var i,j=[list count];
		for(i=0; i<j; i++)
		{	var title=[[list objectAtIndex: i] valueForKey: "name"];
			[actionButton addItemWithTitle: title];
		}
	}
}

-(void) setScale:(double) someScale
{	_scale=someScale;
	[annotatedImageView setScale: _scale];
	[annotatedImageView setBackgroundImage: [[[CPApp delegate].analysesController selectedObject] _backgroundImage]];	// force image update

}

-(void) removeAnalysis: sender
{	[[CPApp delegate].analysesController remove:sender];

}

-(void) insertAnalysis: sender
{	var myAppDelegate= [CPApp delegate];
	[myAppDelegate.analysesController insert:sender];
	var myidanalysis=[myAppDelegate.analysesController valueForKeyPath:"selection.id"];
	var myidimage   =[myAppDelegate.analysesController valueForKeyPath:"selection.idimage"];
	var mycompoID  = [myAppDelegate.trialsController valueForKeyPath: "selection.composition_for_celldetection"];
	if(mycompoID !== CPNullMarker)
	{	myurl= BaseURL +myidimage+"?cmp="+mycompoID+"&idanalysis="+ myidanalysis;
		var myreq=[CPURLRequest requestWithURL: myurl];
		[CPURLConnection sendSynchronousRequest: myreq returningResponse: nil];
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

@implementation GSMarkupTagDottingController : GSMarkupTagObject
+ (CPString) tagName
{
  return @"dottingController";
}
+ (Class) platformObjectClass
{
	return [DottingController class];
}
@end

