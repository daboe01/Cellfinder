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
{
    var mycompoID;
    try{
        mycompoID=[self valueForKey:"idcomposition_for_editing" ];
    } catch(e)
    {
        mycompoID=nil;
    }
	var myidimage=[self valueForKey:"idimage"];
    var affine;
    try{
        affine=[self valueForKey:"parameter" ];
    } catch(e)
    {
        affine=nil;
    }

    if (window.___forceImageReloadRnd === undefined) window.___forceImageReloadRnd = 1;
    if (window.___forceImageReload) window.___forceImageReloadRnd = Math.floor(Math.random()*100000);
    var rnd = window.___forceImageReloadRnd;

	var myURL= [[CPApp delegate] baseImageURL]+myidimage+"?rnd="+rnd+"&idanalysis="+[self valueForKey:"id"];

    if(affine) myURL+="&affine="+affine;

    if (window.___forceImageReload)
    {   window.___forceImageReload = 0;
        myURL+="&cc=1";
    }

	if(mycompoID && mycompoID !== CPNullMarker) myURL+="&cmp="+mycompoID;
	var mycontroller= [[CPApp delegate] mainController];	// this is hack to get hold of the UI context from within the database context
	var scale = mycontroller._scale;
	var origSize=mycontroller._originalSizeArray[myidimage];
	if(!origSize)
	{	var geom=[self _cellfinderSpc:"geom" forID:myidimage];
		var arr= geom.split(' ');
		origSize= mycontroller._originalSizeArray[myidimage]= CPMakeSize(arr[0],arr[1]);
	}

	myURL+="&width="+ Math.floor(origSize.width *scale* origSize.height*scale);
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
	{	var myurl= BaseURL +myidimage+"?cmp="+mycompoID+"&idanalysis="+ myidanalysis;
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
-(void) insertEmptyAnalysis: sender
{	[myAppController.analysesController insert:sender];
}


-(void) insertAnalysis: sender
{	[myAppController.analysesController add: sender];
	var myAnalysis=  [myAppController.analysesController selectedObject];
    var idimage=[myAppController.folderContentController valueForKeyPath:"selection.idimage"];
    [myAnalysis setValue:idimage forKey:"idimage"];
	var mycompoID  = [myAppController.trialsController valueForKeyPath: "selection.composition_for_celldetection"];
	var myviewingID  = [myAppController.trialsController valueForKeyPath: "selection.composition_for_editing"];
	if(myviewingID !== CPNullMarker) [myAnalysis setValue: myviewingID  forKey:"idcomposition_for_editing"];
	if(mycompoID !== CPNullMarker)
	{
		[myAnalysis setValue: mycompoID  forKey:"idcomposition_for_analysis"];
		[self reloadAnalysis: myAnalysis];
	}
}
-(void) duplicateAnalysis: sender
{	var mySourceAnalysis=  [myAppController.analysesController valueForKeyPath:"selection.id"];
	[myAppController.analysesController insert:sender];
	var myDestinationAnalysis=  [myAppController.analysesController valueForKeyPath:"selection.id"];
	var myreq=[CPURLRequest requestWithURL: BaseURL+'copy_results/'+mySourceAnalysis+'/'+myDestinationAnalysis];
	[CPURLConnection sendSynchronousRequest: myreq returningResponse: nil];

	[self _refreshResults];
}
-(void) _refreshResults
{
	[[myAppController.analysesController selectedObject] willChangeValueForKey:"results"];
	 [myAppController.analysesController._entity._relations makeObjectsPerformSelector:@selector(_invalidateCache)];
	[[myAppController.analysesController selectedObject] didChangeValueForKey:"results"];
}

-(void) connection: someConnection didReceiveData: data
{	[progress stopAnimation:self];

	[self _refreshResults];
	[[myAppController.analysesController selectedObject] willChangeValueForKey:"aggregations"];
	[[myAppController.analysesController selectedObject]  didChangeValueForKey:"aggregations"];
}

-(void) reloadAnalysis: myAnalysis
{   [progress startAnimation: self];
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

-(void) webSocketActionData:(CPData) someData
{
    var re = new RegExp("([0-9]{2,12})");
	var m = re.exec(someData);
	if(m)
    {
        [myAppController.folderController reload];
        [myAppController.folderContentController reload];
        var linkname=[myAppController.trialsController valueForKeyPath:"selection.id"]+m[0];
        [myAppController.folderController setFilterPredicate: [CPPredicate predicateWithFormat:"linkname=='"+linkname+"'" ]];
      }
}

@end

