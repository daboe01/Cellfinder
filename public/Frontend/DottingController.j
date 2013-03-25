// this is the root class for all dotting controllers

@import <Foundation/CPObject.j>
@import <Renaissance/Renaissance.j>
@import "AnnotatedImageView.j"
@import "CompoController.j"

@implementation IdStoringImage:CPImage
{	var myidimage @accessors;
}
@end

@implementation CPObject (ImageURLForDottingController)
-(CPImage) _backgroundImage
{	var mycompoID=[self valueForKey:"idcomposition_for_editing" ];
	var myidimage=[self valueForKey:"idimage" ];
	var myURL= [[CPApp delegate] baseImageURL]+myidimage+"?rnd=1";
	if(mycompoID && mycompoID !== CPNullMarker) myURL+="&cmp="+mycompoID;
	var mycontroller= [[CPApp delegate] mainController];	// this is hack to get hold of the UI context from within the database context
	var scale= mycontroller._scale;
	if(mycontroller._originalSizeArray[myidimage]) myURL+="&width="+ Math.floor(mycontroller._originalSizeArray[myidimage]	     *scale*
																				mycontroller._originalSizeArray[myidimage].height*scale);
	var img=[[IdStoringImage alloc] initWithContentsOfFile: myURL];
	img.myidimage= myidimage;
	[img setDelegate: mycontroller];
	return img;
}
-(void) _replaceAnalysisWithDelegate: someDelegate
{	var mycompoID=		[self valueForKey:"idcomposition_for_analysis" ];
	var myidimage=		[self valueForKey:"idimage" ];
	var myidanalysis =	[self valueForKey:"id" ];
	if(mycompoID !== CPNullMarker)
	{	myurl= BaseURL +myidimage+"?cmp="+mycompoID+"&idanalysis="+ myidanalysis;
		var myreq=[CPURLRequest requestWithURL: myurl];
		[CPURLConnection connectionWithRequest:myreq delegate: someDelegate];
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
	id _originalSizeArray;
	id progress;
}


// this is a hack to get the scaling right
- (void)imageDidLoad:(CPImage)image
{	if(!_originalSizeArray[image.myidimage]) _originalSizeArray[image.myidimage]= [image size];
}


- init
{	if(self=[super init])
	{	_scale=1;
		myAppController=[CPApp delegate];
		[myAppController setMainController: self];
		_originalSizeArray=[];
		[[CPRunLoop currentRunLoop] performSelector:@selector(_postInit) target:self argument: nil order:0 modes:[CPDefaultRunLoopMode]];
	} return self;
}

-(void) _postInit
{
// nothing to do here (yet)
}

-(void) removeAnalysis: sender
{	[[CPApp delegate].analysesController remove:sender];

}

-(void) insertAnalysis: sender
{	[myAppController.analysesController insert:sender];
	var myAnalysis=  [myAppController.analysesController selectedObject];
	var mycompoID  = [myAppController.trialsController valueForKeyPath: "selection.composition_for_celldetection"];
	[myAnalysis setValue: mycompoID  forKey:"idcomposition_for_analysis"];
	[self reloadAnalysis:self];
}

-(void) connection: someConnection didReceiveData: data
{	[progress stopAnimation:self];
	[[myAppController.analysesController selectedObject] willChangeValueForKey:"results"];
	[myAppController.analysesController._entity._relations makeObjectsPerformSelector:@selector(_invalidateCache)];
	[[myAppController.analysesController selectedObject] didChangeValueForKey:"results"];
	[[myAppController.analysesController selectedObject] willChangeValueForKey:"aggregations"];
	[[myAppController.analysesController selectedObject] didChangeValueForKey:"aggregations"];
}

-(void) reloadAnalysis: sender
{	var myAnalysis=  [myAppController.analysesController selectedObject];
	[progress startAnimation: self];
	[myAnalysis _replaceAnalysisWithDelegate: self];

}

-(void) editAnalysis: sender
{	var myAnalysis=  [myAppController.analysesController selectedObject];
	[[CompoController alloc] initWithCompo: [myAnalysis valueForKey:"analysis_compo"] ];
}
-(void) reaggregate: sender
{	[[myAppController.analysesController selectedObject] willChangeValueForKey:"aggregations"];
	[myAppController.analysesController._entity._relations makeObjectsPerformSelector:@selector(_invalidateCache)];
	[[myAppController.analysesController selectedObject] didChangeValueForKey:"aggregations"];
}

@end

