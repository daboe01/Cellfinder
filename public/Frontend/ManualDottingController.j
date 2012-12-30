@import "AutoDottingController.j"

@implementation ManualDottingController : AutoDottingController

-(void) _saveValue: someValue forKey: someKey
{	var myAppDelegate= [CPApp delegate];
	var myAggregations= myAppDelegate.aggregationsController;
	if(![[myAggregations arrangedObjects] count])
	{	var newAgg=[CPMutableDictionary new];
		[newAgg setObject: someKey forKey:"name"];
		[newAgg setObject: someValue forKey:"value"];
		[myAggregations addObject: newAgg];
	} else
	{	var myObj= [myAggregations selectedObject];
		[myObj setValue: someValue  forKey:"value"];
	}

}

-(void) annotatedImageView: someView dot: someDot movedToPoint: newPoint
{	var count=[[someView allDots] count];
	[self _saveValue: count forKey: "count"];
}

@end

@implementation GSMarkupTagManualDottingController : GSMarkupTagAutoDottingController
+ (CPString) tagName
{	return @"manualDottingController";
}
+ (Class) platformObjectClass
{	return [ManualDottingController class];
}
@end


@implementation AngulationController : ManualDottingController

-(void) annotatedImageView: someView dot: someDot movedToPoint: newPoint
{	var angle=someView._lastDegrees;
	[self _saveValue: angle forKey: "angle"];
}

-(void) _postInit
{	[super _postInit];
	[self setDrawingAngle];
}
@end


@implementation GSMarkupTagAngulationController : GSMarkupTagManualDottingController
+ (CPString) tagName
{	return @"angulationController";
}
+ (Class) platformObjectClass
{	return [AngulationController class];
}
@end

