/*
 * AppController.j
 * NewApplication
 *
 * Created by You on November 16, 2011.
 * Copyright 2011, Your Company All rights reserved.
 */

@import <Foundation/CPObject.j>
@import <Renaissance/Renaissance.j>
@import <CoreText/CGContextText.j>

AIVStylePlain=0;
AIVStyleNumbers=1;
AIVStylePolygon=2;
AIVStyleLengthInfo=4;
AIVStyleAngleInfo=8;


var mySortFunction=function(a,b,context)
{
	return [b valueForKey:"id"]-[a valueForKey:"id"];
}

var myFastSortFunction=function(a,b,context)
{
	return b._id - a._id;
}


@implementation CPObject(SelectMeStub)
-(void) selectMe
{	if( [self respondsToSelector:@selector(setSelected:) ])
		[self setSelected:YES];
}
@end

@implementation DotView : CPView
{	BOOL	_selected;
	id		_data @accessors(property=data);
	id		_id @accessors(property=id);
}
+(double) radius
{	return 5.0;	//<!> fixme GUI configurable
}
+(CPColor) color
{	return [CPColor yellowColor];
}
+(CPColor) shadowColor
{	return [CPColor orangeColor];
}
+(CPColor) textColor
{	return [CPColor blackColor];
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
	var myrect=CPMakeRect(aRect.origin.x+2,aRect.origin.y+2, aRect.size.width-2, aRect.size.height-2);
	CGContextFillEllipseInRect(context, myrect);
	CGContextSetStrokeColor(context, [[self class] shadowColor]);
	CGContextStrokeEllipseInRect(context, myrect);
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
    double		_scale;
	unsigned	_styleFlags @accessors(property=styleFlags);
	id			_delegate @accessors(property=delegate);
	BOOL		_sendDelegateMoves;
}

-(void) setDelegate: someDelegate
{	_delegate=someDelegate;
	_sendDelegateMoves= _delegate && [_delegate respondsToSelector:@selector(annotatedImageView:dot:movedToPoint:)];
}

- (CPString)stringForObjectValue:(id)theObject	// factor out GUI scaling 
{
	return parseInt(theObject*_scale);
}

- (id)objectValueForString:(CPString)aString error:(out CPError)theError
{
	return parseInt(aString/_scale);
}

- (id)initWithFrame:(CGRect)aFrame
{	if  (self = [super initWithFrame:aFrame])
    {	_selOriginOffset=CPMakePoint(0, 0);
		_marqueeSelectionBounds=CPRectMakeZero();
		_marqueeLayer=[CALayer layer];
		[self setLayer:_marqueeLayer];
		[_marqueeLayer setDelegate: self];
        _scale=1.0;
		[_marqueeLayer setNeedsDisplay];
	}

	return self;
}

-(void) setNeedsDisplay:(BOOL) flag
{	if(flag) [_marqueeLayer setNeedsDisplay];
	[super setNeedsDisplay:flag];
}
-(void) rebuildLayoutForGraphicClass: someClass
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
	[theArr sortUsingFunction: mySortFunction context:nil];
	var l=[theArr count];
	for(var i=0; i<l; i++)
	{	var ai=[theArr objectAtIndex: i];
		var o=[[someClass alloc] initWithCentroid: CPMakePoint( [ai valueForKey:"row"],  [ai valueForKey:"col"] )];
		[o setData: ai ];
		[o setId: [ai valueForKey:"id"] ]
		[self addDotView: o];
	}
	[_marqueeLayer setNeedsDisplay];
}

-(int) indexOfDot: someDot
{	var theArr=[self objectValue];
	if(!theArr) return CPNotFound;
	var l=[theArr count];
	for(var i=0; i<l; i++)
	{	var ai=[theArr objectAtIndex: i];
		if(ai === someDot) return i;
	}
	return CPNotFound;
}


-(void) sizeToFit
{	// this is here to make renaissance happy
}

-(void) addDotView:(DotView) someView
{	[self addSubview:someView positioned: CPWindowAbove relativeTo: _backgroundImageView];
}


-(void) setObjectValue:(CPArray) someArr
{
	[super setObjectValue: someArr];
    [[someArr entity] setFormatter: self forColumnName:"row"];
    [[someArr entity] setFormatter: self forColumnName:"col"];
	[self rebuildLayoutForGraphicClass: [DotView class] ];
}

- (void)imageDidLoad:(CPImage)image
{	[self setBackgroundImage: image];
}
-(void) setBackgroundImage:(CPImage) someImage
{	if([someImage loadStatus]!==  CPImageLoadStatusCompleted)
	{	[someImage setDelegate: self];
		return;
	}

	if(_backgroundImageView) [_backgroundImageView removeFromSuperview];
	var mySize=[someImage size];
	var myFrame=CPMakeRect(0,0, mySize.width, mySize.height);
	[self setFrame: myFrame];
	_backgroundImageView=[[CPImageView alloc] initWithFrame: myFrame];
	[_backgroundImageView setImageScaling: CPScaleNone];
	[_backgroundImageView setImage: someImage ];
	[self addSubview: _backgroundImageView positioned: CPWindowBelow relativeTo: nil];
	[self setNeedsDisplay: YES];
}
-(CPImage) backgroundImage
{	return [_backgroundImageView image];
}
-(double) scale
{	return _scale;
}
-(double) setScale:(double) someScale
{	_scale=someScale;
    [self setObjectValue:[self objectValue]];
}
- (void)drawLayer:(CALayer)layer inContext:(CGContext)context 
{	var contentClass=[DotView class];
	if(!CPRectEqualToRect (_marqueeSelectionBounds, CPRectMakeZero() )) 
	{	CGContextSetStrokeColor(context, [CPColor lightGrayColor]);
		CGContextStrokeRect(context, _marqueeSelectionBounds);
	}
	if( _styleFlags & AIVStylePolygon)
	{	CGContextBeginPath(context);
		var mySubviews=[self allDots];
		var n = [mySubviews count];
		var isFirst=YES;
		for(var i = 0; i < n; i++) 
		{	var currSubview = mySubviews[i];
			var o=[currSubview objectValue];
			if(!o) continue;
			if(isFirst)
			{	CGContextMoveToPoint(context, o.x, o.y);
				isFirst=NO;
			}
			else CGContextAddLineToPoint(context, o.x, o.y);
		}
		CGContextClosePath(context);
		CGContextSetStrokeColor(context, [CPColor yellowColor]);
		CGContextStrokePath(context);
	}	// else?!
	if( _styleFlags & AIVStyleAngleInfo)
	{	CGContextBeginPath(context);
		var mySubviews=[self allDots];
		var n = [mySubviews count];
		if (n)
		{	var  lastPoint= [mySubviews[0] objectValue];
			var firstPoint=[mySubviews[n-1] objectValue];
			CGContextMoveToPoint(context, firstPoint.x, firstPoint.y);
			CGContextAddLineToPoint(context, lastPoint.x, lastPoint.y);
			CGContextClosePath(context);
			CGContextSetStrokeColor(context, [CPColor yellowColor]);
			CGContextStrokePath(context);

			var radians=(lastPoint.x>firstPoint.x)? Math.atan((lastPoint.y-firstPoint.y)/(lastPoint.x-firstPoint.x)):
											  (3.14-Math.atan((lastPoint.y-firstPoint.y)/(firstPoint.x- lastPoint.x)));
			CGContextMoveToPoint(context, firstPoint.x, firstPoint.y);
			CGContextAddLineToPoint(context, firstPoint.x+50, firstPoint.y);
			CGContextClosePath(context);
			CGContextStrokePath(context);
			CGContextMoveToPoint(context, firstPoint.x, firstPoint.y);
			CGContextAddArc	(context, firstPoint.x, firstPoint.y, 50,0,radians,NO); 	 
			CGContextClosePath(context);
			CGContextStrokePath(context);

			CGContextSelectFont(context, [CPFont systemFontOfSize:8]);
			CGContextSetTextPosition(context, firstPoint.x-4, firstPoint.y+1)
			CGContextShowText(context, Math.floor(radians*57.2957795*(-1)));
		}
	}
	if(_styleFlags & AIVStyleNumbers )
	{	CGContextSelectFont(context, [CPFont systemFontOfSize:8]);
		CGContextSetFillColor(context, [contentClass textColor]);
		CGContextSetStrokeColor(context, [contentClass textColor]);
		var mySubviews=[self allDots];
		var n = [mySubviews count];
		for(var i = 0; i < n; i++) 
		{	var currSubview = mySubviews[i];
			var o=[currSubview objectValue];

			CGContextSetTextPosition(context, o.x-2, o.y+1)
			CGContextShowText(context, n-i);
		}
	}
	if( _styleFlags & AIVStyleLengthInfo )
	{	CGContextSelectFont(context, [CPFont systemFontOfSize:12]);
		var mySubviews=[self subviews];
		var n = [mySubviews count];
		var lastPoint, currPoint;
		for(var i = 0; i < n; i++) 
		{	var currSubview = mySubviews[i];
			if ( [currSubview isKindOfClass: contentClass])
			{
				currPoint=[currSubview objectValue];
				if(lastPoint)
				{	var midPoint=CGPointMake((lastPoint.x+currPoint.x)/2, (lastPoint.y+currPoint.y)/2);
					var dist=Math.sqrt((lastPoint.x-currPoint.x)*(lastPoint.x-currPoint.x)+ (lastPoint.y-currPoint.y)*(lastPoint.y-currPoint.y));
					var distString=[CPString stringWithFormat:"%3.2f", dist];
					CGContextSetTextPosition(context, midPoint.x+2, midPoint.y+2);
					CGContextSetFillColor(context, [CPColor blackColor]);
					CGContextSetStrokeColor(context, [CPColor blackColor]);
					CGContextShowText(context, distString);
					CGContextSetTextPosition(context, midPoint.x+1, midPoint.y+1);
					CGContextSetFillColor(context, [contentClass color]);
					CGContextSetStrokeColor(context, [contentClass color]);
					CGContextShowText(context, distString);
				}
				lastPoint=currPoint;
			}
		}
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
		[_marqueeLayer setNeedsDisplay];
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
		if(_sendDelegateMoves)
			[_delegate annotatedImageView:self dot: _currentGraphic movedToPoint:curPoint];
    }
	[_marqueeLayer setNeedsDisplay];
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
			var obV=[self addToModelPoint: [mydot objectValue]];	// register newly created point with backend
			[mydot setData:obV];
			[mydot setId: [obV valueForKey:"id"]];

			if(_sendDelegateMoves)
				[_delegate annotatedImageView: self dot: mydot movedToPoint: mouseLocation];
			[self deselectAllSubviews];
			[self addDotView: mydot];

			_currentGraphic=mydot;
			[self moveSelectedGraphicsWithEvent: event];
		}
	}
}

-(CPDictionary) addToModelPoint: (CPPoint) point
{	var myArr=[self objectValue];
	var myDict=[CPDictionary new];
	[myDict setObject: point.x forKey:"row"];
	[myDict setObject: point.y forKey:"col"];
	[myArr addObject: myDict];	// saves to database in backend
	return [myArr lastObject];
}

-(void) deleteDots:(CPArray) arr
{	var myArr=[self objectValue];

	var n = [arr count];
    for(var i = 0; i < n; i++) 
	{	var dot=[arr objectAtIndex:i];
		if([dot data])
			[myArr removeObject: [dot data]];	//also remove in backend
		[dot removeFromSuperview];
	}
	[_marqueeLayer setNeedsDisplay];
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
	[ret sortUsingFunction: myFastSortFunction context:nil];
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