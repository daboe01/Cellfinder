/*
 * AppController.j
 * NewApplication
 *
 * Created by You on November 16, 2011.
 * Copyright 2011, Your Company All rights reserved.
 */

// fixme: scale support
// add sublayer to support grouping of points into polygon or line ROIs

@import <Foundation/CPObject.j>
@import <Renaissance/Renaissance.j>

@implementation CPObject(SelectMeStub)
-(void) selectMe
{	if( [self respondsToSelector:@selector(setSelected:) ])
		[self setSelected:YES];
}
@end

@implementation DotView : CPView
{	BOOL	_selected;
	id		_data @accessors(property=data);
}
+(double) radius
{	return 4.0;	//<!> fixme GUI configurable
}
+(CPColor) color
{	return [CPColor yellowColor];
}
-(void) setSelected:(BOOL) isSel
{	_selected=isSel;
	[self setNeedsDisplay:YES];
}
-(BOOL) isSelected
{	return _selected;
}
-(id) initWithFrame:(CGRect)aFrame
{	if (self = [super initWithFrame:aFrame])
    {	[self setSelected:NO];
	} return self;
}

+(CPRect) frameFromCentroid: someData
{	var radius=[[self class] radius];
	return CPMakeRect(someData.x-radius-1, someData.y-radius-1, radius*2+1, radius*2+1);

}
-(id) initWithCentroid:(CPPoint)someData
{	var aFrame=[[self class] frameFromCentroid: someData];
	self = [self initWithFrame:aFrame];
	return self;
}

- (void)drawRect:(CPRect)aRect
{	var context = [[CPGraphicsContext currentContext] graphicsPort];
	CGContextSetFillColor(context, [[self class] color]);
	CGContextFillEllipseInRect(context, CPMakeRect(aRect.origin.x+1,aRect.origin.y+1, aRect.size.width-2, aRect.size.height-2));
	if(_selected)
	{	CGContextSetFillColor(context, [CPColor whiteColor]);
		CGContextSetAlpha(context, 0.5);
		CGContextFillEllipseInRect(context, aRect);
	}
}
-(void) translateByX:(double) someX andY:(double) someY
{	var myRect=[self  frame];
	myRect.origin.x += someX;
	myRect.origin.y += someY;
	[self  setFrame: myRect];
}
-(CPPoint) objectValue
{	var myRect=[self frame];
	var radius=[[self class] radius];
	var r=CPMakePoint(myRect.origin.x+1+radius, myRect.origin.y+1+radius)
	return r;
}

@end

@implementation AnnotatedImageView : CPControl
{	CPImageView _backgroundImageView;
	CPPoint		_selOriginOffset;
	CPPoint		_lastPoint;
	id			_currentGraphic;
	CPRect		_marqueeSelectionBounds;
	CPPoint		_marqueeOrigin;
	CALayer		_marqueeLayer;
}

- (id)initWithFrame:(CGRect)aFrame
{	if  (self = [super initWithFrame:aFrame])
    {	_selOriginOffset=CPMakePoint(0, 0);
		_marqueeSelectionBounds=CPRectMakeZero();
		_marqueeLayer=[CALayer layer];
		[self setLayer:_marqueeLayer];
		[_marqueeLayer setDelegate: self];
	}

	return self;
}

-(void) rebuildLayoutForGraphicClass:someClass
{	// removeAllDots to recycle self
	var mySubviews=[self subviews];
    var n = [mySubviews count];
    for(var i = 0; i < n; i++) 
	{	var currSubview = mySubviews[i];
		if ([currSubview respondsToSelector: @selector(isSelected)])
		{	[currSubview removeFromSuperview];
		}
	}

	var theArr=[self objectValue];
	if(!theArr) return;
	var l=[theArr count];
	for(var i=0; i<l; i++)
	{	var ai=[theArr objectAtIndex: i];
		var o=[[someClass alloc] initWithCentroid: CPMakePoint( [ai valueForKey:"row"],  [ai valueForKey:"col"] )];
		[o setData: ai ];
		[self addDotView: o];
	}
}
-(void) sizeToFit
{	//<!> fixme
}
-(void) addDotView:(DotView) someView
{	if(_backgroundImageView)
		[self addSubview:someView positioned: CPWindowAbove relativeTo: _backgroundImageView];
	else [self addSubview:someView];
}


-(void) setObjectValue:(CPArray) someArr
{	[super setObjectValue: someArr];
	[self rebuildLayoutForGraphicClass: [DotView class] ];
}

-(void) setBackgroundImage:(CPImage) someImage
{	var mySize=[someImage size];
	if(_backgroundImageView)	[_backgroundImageView removeFromSuperview];
	var myFrame=CPMakeRect(0,0, mySize.width, mySize.height);
	_backgroundImageView=[[CPImageView alloc] initWithFrame: myFrame];
	[_backgroundImageView setImage: someImage ];
	[self addSubview: _backgroundImageView];
	[self setFrame: myFrame];
}

- (void)drawLayer:(CALayer)layer inContext:(CGContext)context 
{	if(!CPRectEqualToRect (_marqueeSelectionBounds, CPRectMakeZero() )) 
	{	CGContextSetStrokeColor(context, [CPColor lightGrayColor]);
		CGContextStrokeRect(context, _marqueeSelectionBounds);
    }
}

-(GSAutoLayoutAlignment) autolayoutDefaultVerticalAlignment
{	return GSAutoLayoutExpand;
}
-(GSAutoLayoutAlignment) autolayoutDefaultHorizontalAlignment
{	return GSAutoLayoutExpand;
}


- (CPView)graphicsWithinRect:(CPRect)rect
{	var mySubviews=[self subviews];
    var n = [mySubviews count];
	var contentClass=[DotView class];
	var ret=[CPArray new];

    for(var i = 0; i < n; i++) 
	{	var currSubview = mySubviews[i];
		if ( [currSubview isKindOfClass: contentClass])
		{	if( CPRectIntersectsRect( rect, [currSubview frame] ) || CPRectContainsPoint(  [currSubview frame] , rect.origin) )
			{	[ret addObject: currSubview];
			}
		}
	}
	return ret;
}
- (CPView)graphicUnderPoint:(CPPoint)point
{	var ret=[self graphicsWithinRect: CPMakeRect(point.x, point.y, 1,1)]
	return ret.length? ret[0]:nil;
}


- (void)deselectAllSubviews
{	var mySubviews=[self subviews];
    var n = [mySubviews count];
	var contentClass=[DotView class];

    for(var i = 0; i < n; i++) 
	{	var currSubview = mySubviews[i];
		if ([currSubview respondsToSelector: @selector(setSelected:)])
		{	[currSubview setSelected: NO ];
		}
	}
	return nil;
}
-(CPArray) selectedDots
{	var mySubviews=[self subviews];
    var n = [mySubviews count];
	var ret=[CPMutableArray new];

    for(var i = 0; i < n; i++) 
	{	var currSubview = mySubviews[i];
		if ([currSubview respondsToSelector: @selector(isSelected)] && [currSubview isSelected])
		{	[ret addObject: currSubview ];
		}
	}
	return ret;
}


-(void) moveSelectedGraphicsWithEvent:(CPEvent)event
{	var type = [event type];
	if (type == CPLeftMouseUp)
    {	_lastPoint=nil;
		var data=[_currentGraphic data];
		if(data)	// save finalized move in the backend
		{	var p=[_currentGraphic objectValue];
			[data setValue:p.y forKey:"col"];
			[data setValue:p.x forKey:"row"];
		}
		return;
    }
    else if (type == CPLeftMouseDragged)
    {	var curPoint = [self convertPoint:[event locationInWindow] fromView:nil];
		curPoint.x -=  _selOriginOffset.x;
		curPoint.y -=  _selOriginOffset.y;
		if(!_lastPoint) _lastPoint=curPoint;
		if(!CPPointEqualToPoint(_lastPoint, curPoint))
		{	[_currentGraphic translateByX:(curPoint.x - _lastPoint.x) andY:(curPoint.y - _lastPoint.y)];
		}
		_lastPoint=curPoint;
    }
	[CPApp setTarget:self selector:@selector(moveSelectedGraphicsWithEvent:) forNextEventMatchingMask:CPLeftMouseDraggedMask | CPLeftMouseUpMask untilDate:nil inMode:nil dequeue:YES];
}

-(void) dragMarqueeWithEvent: (CPEvent)event
{	var type = [event type];
	if (type == CPLeftMouseUp)
    {	_marqueeSelectionBounds=CPRectMakeZero();
		[_marqueeLayer setNeedsDisplay];
		return;
    }
    else if (type == CPLeftMouseDragged)
    {	var curPoint = [self convertPoint:[event locationInWindow] fromView:nil];
		var x1=Math.min(_marqueeOrigin.x, curPoint.x);
		var y1=Math.min(_marqueeOrigin.y, curPoint.y);
		var x2=Math.max(_marqueeOrigin.x, curPoint.x);
		var y2=Math.max(_marqueeOrigin.y, curPoint.y);
		_marqueeSelectionBounds=CPRectMake( x1, y1, Math.abs(x1-x2), Math.abs(y1-y2));
		[_marqueeLayer setNeedsDisplay];
		[self deselectAllSubviews];
		var arr=[self graphicsWithinRect:_marqueeSelectionBounds];
		[arr makeObjectsPerformSelector:@selector(selectMe)];
    }
	[CPApp setTarget:self selector:@selector(dragMarqueeWithEvent:) forNextEventMatchingMask:CPLeftMouseDraggedMask | CPLeftMouseUpMask untilDate:nil inMode:nil dequeue:YES];
}

- (void)mouseDown:(CPEvent)event
{	var mouseLocation = [self convertPoint:[event locationInWindow] fromView:nil];
	var radius=[DotView radius];
	var myFrame=CPMakeRect(mouseLocation.x-radius-1,mouseLocation.y-radius-1, radius*2+1, radius*2+1);
	var mydot;
	if(mydot=[self graphicUnderPoint: mouseLocation ])
	{	mydotframe=[mydot frame];
		_currentGraphic=mydot;
		if(![event modifierFlags])
			[self deselectAllSubviews];
		[_currentGraphic setSelected: YES];
		_selOriginOffset.x=mydotframe.origin.x-mouseLocation.x;
		_selOriginOffset.y=mydotframe.origin.y-mouseLocation.y;
		[self moveSelectedGraphicsWithEvent: event];
	} else
	{	if([event modifierFlags])	// build the marqueeRect
		{	if(CPRectEqualToRect (_marqueeSelectionBounds, CPRectMakeZero() ))	// anchor a new one
			{	_marqueeSelectionBounds.origin=_marqueeOrigin =mouseLocation;
			}
			[self dragMarqueeWithEvent: event];
		} else
		{	mydot=[[DotView alloc] initWithFrame: myFrame];
			[self addToModelPoint: [mydot objectValue]];	// register newly created point with backend
			[self deselectAllSubviews];
			[self addDotView: mydot];

			_currentGraphic=mydot;
			[self moveSelectedGraphicsWithEvent: event];
		}
	}
}

-(void) addToModelPoint: (CPPoint) point
{	var myArr=[self objectValue];
	var myDict=[CPDictionary new];
	[myDict setObject: point.x forKey:"row"];
	[myDict setObject: point.y forKey:"col"];
	[myArr addObject: myDict];	// saves to database in backend
}

-(void) deleteDots:(CPArray) arr
{	var myArr=[self objectValue];

	var n = [arr count];
    for(var i = 0; i < n; i++) 
	{	var dot=[arr objectAtIndex:i];
		[myArr removeObject: [dot data]];	//also remove in backend
		[dot removeFromSuperview];
	}
}
-(void) delete:sender
{	[self deleteDots: [self selectedDots]];
}

-(CPArray) allDots
{	var mySubviews=[self subviews];
    var n = [mySubviews count];
	var ret=[CPMutableArray new];
    for(var i = 0; i < n; i++) 
	{	var currSubview = mySubviews[i];
		if ([currSubview respondsToSelector: @selector(isSelected)])
		{	[ret addObject: currSubview ];
		}
	}
	return ret;
}

@end

@implementation GSMarkupTagAnnotatedImageView:GSMarkupTagView
+ (CPString) tagName
{	return @"annotatedImageView";
}

+ (Class) platformObjectClass
{	return [AnnotatedImageView class];
}

@end