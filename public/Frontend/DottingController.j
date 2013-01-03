// this is the root class for all dotting controllers

@import <Foundation/CPObject.j>
@import <Renaissance/Renaissance.j>
@import "AnnotatedImageView.j"
@import "CompoController.j"


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
-(void) _replaceAnalysis
{	var mycompoID=		[self valueForKey:"idcomposition_for_analysis" ];
	var myidimage=		[self valueForKey:"idimage" ];
	var myidanalysis =	[self valueForKey:"id" ];
	if(mycompoID !== CPNullMarker)
	{	myurl= BaseURL +myidimage+"?cmp="+mycompoID+"&idanalysis="+ myidanalysis;
		var myreq=[CPURLRequest requestWithURL: myurl];
		[CPURLConnection sendSynchronousRequest: myreq returningResponse: nil];
	}
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
{	id myAppController;
	id _scale @accessors(property=scale);
	CPSize _originalSize;
}


// this is a hack to get the scaling right
- (void)imageDidLoad:(CPImage)image
{	if(!_originalSize) _originalSize= [image size];
}


- init
{	if(self=[super init])
	{	_scale=1;
		myAppController=[CPApp delegate];
		[[CPRunLoop currentRunLoop] performSelector:@selector(_postInit) target:self argument: nil order:0 modes:[CPDefaultRunLoopMode]];
	} return self;
}


-(void) removeAnalysis: sender
{	[[CPApp delegate].analysesController remove:sender];

}

-(void) insertAnalysis: sender
{	[myAppController.analysesController insert:sender];
	var myAnalysis=  [myAppController.analysesController selectedObject];
	var mycompoID  = [myAppController.trialsController valueForKeyPath: "selection.composition_for_celldetection"];
	[myAnalysis setValue: mycompoID  forKey:"idcomposition_for_analysis"];
	[myAnalysis _replaceAnalysis];
}
-(void) reloadAnalysis: sender
{	var myAnalysis=  [myAppController.analysesController selectedObject];
	[myAnalysis _replaceAnalysis];
	[[myAppController.analysesController selectedObject] willChangeValueForKey:"results"];
	[myAppController.analysesController._entity._relations makeObjectsPerformSelector:@selector(_invalidateCache)];
	[[myAppController.analysesController selectedObject] didChangeValueForKey:"results"];

	[[myAppController.analysesController selectedObject] willChangeValueForKey:"aggregations"];
	[[myAppController.analysesController selectedObject] didChangeValueForKey:"aggregations"];
}

-(void) editAnalysis: sender
{	var myAnalysis=  [myAppController.analysesController selectedObject];
	[[CompoController alloc] initWithCompo: [myAnalysis valueForKey:"analysis_compo"] ];
}

@end

