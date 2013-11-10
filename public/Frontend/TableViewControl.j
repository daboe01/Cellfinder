@import <AppKit/CPControl.j>

// fixme: janus-controls do not adjust width when the user rearranges table colums


@implementation TableViewControl : CPControl
{	id			_myView;
	CPString 	_face @accessors(property=face);
	BOOL		_editable  @accessors(property=editable);
}
- viewClass
{	return CPTextField;
}
- initWithFrame:(CGRect) myFrame
{	self=[super initWithFrame: myFrame];
	_myView =[[[self viewClass] alloc] initWithFrame: myFrame];
	return self;
}

-(void) setObjectValue: myVal
{	_value=myVal;
	var v=[myVal valueForKeyPath: _face];
	[_myView setObjectValue: v||""];
}
-(void) _installView
{	[_myView removeFromSuperview];
	[self addSubview: _myView];
	var mybounds= [self bounds];
	if(![self isKindOfClass: TableViewJanusControl])
		mybounds.size.height+=2;
	[_myView setFrame:mybounds];
	[_myView setTarget: self];
	[_myView setAction: @selector(viewChanged:)];
}

- (void) viewChanged: sender
{	[[self objectValue] setValue:[sender stringValue] forKeyPath: _face];
}

- (id)initWithCoder:(id)aCoder
{
    self=[super initWithCoder:aCoder];
    if (self != nil)
    {
		_myView =[aCoder decodeObjectForKey:"_myView"];
		_face=[aCoder decodeObjectForKey:"_face"];
		_editable=[aCoder decodeObjectForKey:"_editable"];
		if(![self isKindOfClass: TableViewJanusControl])
		{	if(_editable) [self setEditable:YES];
        	[self _installView];
		}
		
    }
    return self;
}

- (void)encodeWithCoder:(id)aCoder
{
    [super encodeWithCoder:aCoder];
    [aCoder encodeObject:_myView forKey:"_myView"];
    [aCoder encodeObject:_face forKey:"_face"];
    [aCoder encodeObject:_editable forKey:"_editable"];

}

-(void) setThemeState: aState
{	[super   setThemeState: aState];
	[_myView setThemeState: aState];
}
-(void) unsetThemeState: aState
{	[super   unsetThemeState: aState];
	[_myView unsetThemeState: aState];
}
- (void)mouseDown:(CPEvent)  theEvent {
	[[self nextResponder] mouseDown:theEvent];
}

- (void)setEditable:(BOOL)isEditable
{	_editable=isEditable;
	if(_editable)
	{	[_myView setEditable:YES];
		[_myView setSendsActionOnEndEditing:YES];
		[_myView setSelectable:YES];
		[_myView selectText:nil];
		[_myView setBezeled:NO];
		[_myView setDelegate:self];
	}
}
@end



var _itemsControllerHash;
@implementation TableViewPopup: TableViewControl
{	id	_itemsController @accessors(property=itemsController);
	CPString _itemsFace @accessors(property=itemsFace);
	CPString _itemsValue @accessors(property=itemsValue);
	CPString _itemsIDs @accessors(property=itemsIDs);
	CPString _itemsPredicateFormat @accessors(property=itemsPredicateFormat);
}
+(void) initialize
{	[super initialize];
	_itemsControllerHash=[CPMutableArray new];
}
-(void) setItemsController: aController
{	_itemsControllerHash[[self hash]]= aController
	_itemsController=aController;
}
- viewClass
{	return CPPopUpButton;
}

- (void) viewChanged: sender
{	[[self objectValue] setValue:[sender selectedTag] forKeyPath: _face];
}

- (id)initWithCoder:(id)aCoder
{
    self=[super initWithCoder:aCoder];
    if (self != nil)
    {
		_itemsController = _itemsControllerHash[[aCoder decodeObjectForKey:"_itemsController"]];
		_itemsFace =[aCoder decodeObjectForKey:"_itemsFace"];
		_itemsValue =[aCoder decodeObjectForKey:"_itemsValue"];
		_itemsIDs =[aCoder decodeObjectForKey:"_itemsIDs"];
		_itemsPredicateFormat =[aCoder decodeObjectForKey:"_itemsPredicateFormat"];

    }
    return self;
}

- (void)encodeWithCoder:(id)aCoder
{
    [super encodeWithCoder:aCoder];
    [aCoder encodeObject: [self hash] forKey:"_itemsController"];
    [aCoder encodeObject: _itemsFace forKey:"_itemsFace"];
    [aCoder encodeObject: _itemsValue forKey:"_itemsValue"];
    [aCoder encodeObject: _itemsIDs forKey:"_itemsIDs"];
    [aCoder encodeObject: _itemsPredicateFormat forKey:"_itemsPredicateFormat"];

}
- (void)mouseDown:(CPEvent)  theEvent {
    [_myView mouseDown:theEvent];
}
-(void) _setupView
{	if(!_itemsController)
	{	[_myView setItemArray:[]];
		return;
	}
	var options=@{"PredicateFormat": _itemsPredicateFormat, "valueFace": _itemsValue, "Owner":_value};
	[_myView bind:"itemArray" toObject: _itemsController withKeyPath: _itemsFace options: options];
}

-(void) setObjectValue: myVal
{	_value= myVal;
	[self _setupView];
	var v=[myVal valueForKeyPath: _face];
	[_myView setSelectedTag: v || -1];
}

@end

var TableViewJanusControl_typeArray;

@implementation TableViewJanusControl : TableViewPopup
{	CPString	_type @accessors(property=type);
	unsigned	_typeIndex;
}

- initWithFrame:(CGRect) myFrame
{	self=[super initWithFrame: myFrame];
	return self;
}
-(void) _installJanusView
{	if(_myView) [_myView removeFromSuperview];
	else return;
	[self addSubview: _myView];
	var mybounds= [self bounds];
	[_myView setFrame:mybounds];
	[_myView setFace: _face];
	[_myView setThemeState: _themeState];
	[_myView _installView];
	if( [_myView isKindOfClass: TableViewPopup])
	{	[_myView setItemsFace: _itemsFace];
		[_myView setItemsValue: _itemsValue];
		[_myView setItemsIDs: _itemsIDs]
		[_myView setItemsPredicateFormat: _itemsPredicateFormat];
		[_myView setItemsController: _itemsController];
	} else
	{	[_myView setEditable:_editable];
	}
}

-(void) setObjectValue: myVal
{	_value=myVal;
	[[self subviews] makeObjectsPerformSelector: @selector(removeFromSuperview)];
	if(myVal)
	{	_typeIndex= [myVal valueForKeyPath: _type];
	} else
	{	_typeIndex=0;
	}
	_myView = [[[self viewClass] alloc] initWithFrame: [self frame]];
	[self _installJanusView];
	[_myView setObjectValue: myVal];
}


+(void) initialize
{	[super initialize];
	TableViewJanusControl_typeArray=[TableViewControl, TableViewPopup];
}

// 0: textfield
// 1: popup

-(void) setType:(unsigned) aType
{	_type=aType;
}
- viewClass
{	return TableViewJanusControl_typeArray[_typeIndex];
}
- (id)initWithCoder:(id)aCoder
{
    self=[super initWithCoder:aCoder];
    if (self != nil)
    {	[self setType: [aCoder decodeObjectForKey:"_type"]];
    }
    return self;
}
- (void)encodeWithCoder:(id)aCoder
{	[super encodeWithCoder:aCoder];
    [aCoder encodeObject: _type forKey:"_type"];
}

- itemsController
{	return [_myView itemsController];
}
- (void)setEditable:(BOOL)isEditable
{	_editable=isEditable;
}
- (void)mouseDown:(CPEvent)  theEvent {
	[[self nextResponder] mouseDown:theEvent];
}
@end

@implementation GSMarkupTagTableViewControl:GSMarkupTagControl
+ (CPString) tagName
{
  return @"tableViewControl";
}

+ (Class) platformObjectClass
{
	return [TableViewControl class];
}

- (id) initPlatformObject: (id)platformObject
{	platformObject = [super initPlatformObject: platformObject];
  
	var editable = [self boolValueForAttribute: @"editable"];
	if (editable == 1) [platformObject setEditable: YES];
	var face = [self stringValueForAttribute: @"face"];
	if (face != nil) [platformObject setFace: face];

	return platformObject;
}

@end


@implementation GSMarkupTagTableViewPopup: GSMarkupTagTableViewControl
+ (CPString) tagName
{
  return @"tableViewPopup";
}

+ (Class) platformObjectClass
{
	return [TableViewPopup class];
}

- (id) initPlatformObject: (id)platformObject
{	platformObject = [super initPlatformObject: platformObject];
  
	var itemsFace = [self stringValueForAttribute: @"itemsFace"];
	if (itemsFace != nil) [platformObject setItemsFace: itemsFace];
	var itemsValue = [self stringValueForAttribute: @"itemsValue"];
	if (itemsValue != nil) [platformObject setItemsValue: itemsValue];
	var itemsIDs = [self stringValueForAttribute: @"itemsIDs"];
	if (itemsIDs != nil) [platformObject setItemsIDs: itemsIDs];
	var itemsPredicateFormat = [self stringValueForAttribute: @"itemsPredicateFormat"];
	if (itemsPredicateFormat != nil) [platformObject setItemsPredicateFormat: itemsPredicateFormat];

	return platformObject;
}

@end

@implementation GSMarkupTagTableViewJanusControl: GSMarkupTagTableViewPopup
+ (CPString) tagName
{
  return @"tableViewJanusView";
}

+ (Class) platformObjectClass
{
	return [TableViewJanusControl class];
}

- (id) initPlatformObject: (id)platformObject
{	platformObject = [super initPlatformObject: platformObject];
  
	var type = [self stringValueForAttribute: @"type"];
	[platformObject setType: type];

	return platformObject;
}

@end

