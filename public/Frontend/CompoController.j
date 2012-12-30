/*
 * AppController.j
 * NewApplication
 *
 * Created by You on November 16, 2011.
 * Copyright 2011, Your Company All rights reserved.
 */

@import <Foundation/CPObject.j>
@import <Renaissance/Renaissance.j>


@implementation FSObject(percentage)
-(id) unpercentedValueForKey:(CPString) aString
{	var r= [self valueForKey: aString];
	return [r stringByReplacingOccurrencesOfString:"%" withString: ""];
}
@end

@implementation ReversePercentageFormatter : CPFormatter

- (CPString)stringForObjectValue:(id)theObject	// no percentage sign in UI 
{
	return [theObject stringByReplacingOccurrencesOfString:"%" withString: ""];
}

- (id)objectValueForString:(CPString)aString error:(out CPError)theError
{	if(![aString isKindOfClass:[CPString class]]) aString=[aString stringValue];
	return [aString stringByAppendingString:"%"];

}
@end

@implementation OptionSlider: CPSlider
- (void)mouseDown:(CPEvent)anEvent
{	if(![anEvent modifierFlags])
		 [self setContinuous:YES];
	else [self setContinuous: NO];
	[super mouseDown: anEvent];
}
@end

@implementation DualPercentageSlider: CPControl
{	CPSlider slider1;
	CPSlider slider2;
}

-(void) setFrame:(CPFrame) someFrame
{	[super setFrame: someFrame];
	[slider1 setFrame: CPMakeRect(0,0, someFrame.size.width,32)];
	[slider2 setFrame: CPMakeRect(0,32,someFrame.size.width,32)];
}

-(CPSlider) _newSlider
{	var slider=[[OptionSlider alloc] initWithFrame: CPRectMakeZero()];
	[slider setMinValue: 0];
	[slider setMaxValue: 100];
	[slider setTarget:self];
	[slider setAction:@selector(_sliderChanged:)];
	[slider setContinuous: NO];
	[self addSubview: slider];
	return slider;
}

-(void) _sliderChanged: sender
{	[self _reverseSetBinding];
}

-(id) initWithFrame:(CPFrame) someFrame
{	if(self=[super initWithFrame: someFrame]) 
	{	slider1=[self _newSlider];
		slider2=[self _newSlider];
	}
	return self;
}
-(void) setObjectValue:(id) someValue
{	[super setObjectValue: someValue];

	var re = new RegExp('^([0-9]+)%\s*x([0-9]+)%');

	var match=someValue.match(re);
	[slider1 setIntValue: match[1] ];
	[slider2 setIntValue: match[2] ];
}

-(CPString) objectValue
{	return [CPString stringWithFormat:"%sx%s", [slider1 intValue ]+"%", [slider2 intValue ]+"%" ];
}

- (GSAutoLayoutAlignment) autolayoutDefaultHorizontalAlignment
{	return GSAutoLayoutExpand;
}
@end

@implementation GSMarkupTagOptionSlider:GSMarkupTagSlider
+(CPString) tagName
{	return @"optionSlider";
}
+(Class) platformObjectClass
{	return [OptionSlider class];
}
@end

@implementation GSMarkupTagDualSlider:GSMarkupTagControl
+ (CPString) tagName
{	return @"dualSlider";
}

+ (Class) platformObjectClass
{	return [DualPercentageSlider class];
}

- (id) initPlatformObject: (id)platformObject
{	platformObject = [super initPlatformObject: platformObject];
	[_attributes setObject: @"64" forKey: @"height"];
	[_attributes setObject: @"83" forKey: @"width"];
	return platformObject;
}
@end

@implementation CompoController : CPObject
{	id		_panel;
	id		_myAppController;
	id		_myNameTable;
}

- (void)observeValueForKeyPath:(CPString)keyPath ofObject:(id)object change:(CPDictionary)change context:(id)idtrial
{	var affectedImageControllers=[_myAppController imageControllersForIDTrial: idtrial];
	[affectedImageControllers makeObjectsPerformSelector:@selector(reload:) withObject:self];
}

-(void) initWithCompo:(id) compo
{	_myAppController=[CPApp delegate];
alert(compo)
	var store=[_myAppController store];	// for the popUpButton entities
	var placeholderEntity = [[FSEntity alloc] initWithName: "parameter_lists" andStore: store];	// for feeding the popUpButtons only
	[placeholderEntity setColumns:[CPArray arrayWithObjects: "id","idpatch_parameter","value"]];
	[placeholderEntity setPk: "id"];

	var inputParams=[compo valueForKey:"inputParams"];

	_myNameTable=[CPMutableDictionary new];
	
// step 1: build the panel via dynamically generated markup
	var i,l=[inputParams count];
	var markup='<gsmarkup><objects><window id="panel" title="Inspector" HUD="yes" closable="yes" x="600" y="30" width="200">';
	markup+='<vbox id="toplevel_container">';

	for(i=0;i<l;i++)
	{	var input=[inputParams objectAtIndex:i];

		switch([input valueForKey:"type"])	// numeric field-> make a slider
		{	case "1":
			{	var formatter="";
				if([[input valueForKey:"range2"] hasSuffix:"%"])
				{	[input setFormatter: [ReversePercentageFormatter new] forColumnName:"value"];
				}
				var minVal=[input unpercentedValueForKey:"range1"];
				var maxVal=[input unpercentedValueForKey:"range2"];
				var curVal=[input unpercentedValueForKey:"value"];

				markup+='<hbox><label textColor="white" valign="center" halign="min" width="100">'+ [input valueForKey:"patch"]+'('+[input valueForKey:"name"]+')'+
						'</label><label textColor="white" valign="center" halign="min" width="20">'+[input valueForKey:"range1"]+'</label>'+
						'<optionSlider continuous="NO" id="_connectme1_'+i+'" valign="center" halign="expand"  min="'+
						 minVal+'" max="'+maxVal+'" current="'+
						 curVal+'" /><label textColor="white" valign="center" halign="min" width="20">'+[input valueForKey:"range2"]+
						'</label><textField width="50" valign="center" halign="center" id="_connectme2_'+i+'"></textField></hbox>';
			}
			break;
			case "5":	// popUpButton
			{	var entityName= '_popconnectme'+[input valueForKey:"idparameter"];
				markup+='<hbox><label textColor="white" valign="center" halign="min" width="100">'+[input valueForKey:"patch"]+'('+[input valueForKey:"name"]+')'+
						'</label><popUpButton id="_popupcntme_'+i+'" valign="center" halign="expand" itemsBinding="#CPOwner._myNameTable.'+entityName+'.arrangedObjects.value" '+
						'valueBinding="#CPOwner._myNameTable.'+entityName+'.selection.id"/></hbox>';
				var ac = [FSArrayController new];
				var predicate=[CPPredicate predicateWithFormat: "idpatch_parameter=='"+[input valueForKey:"idparameter"]+"'"  argumentArray: nil  ] ;
				[ac setContent: [[placeholderEntity allObjects] filteredArrayUsingPredicate: predicate ]];
				[_myNameTable setObject: ac forKey: entityName];
				[ac setEntity: placeholderEntity];
			}
			break;
			default:
			{	var curVal=[input valueForKey:"value"];
				var re = new RegExp('^([0-9%]+)\s*x([0-9%]+)');
				var match=curVal.match(re);
				if(match)
				{		markup+='<hbox><label textColor="white" valign="center" halign="min" width="100">'+[input valueForKey:"patch"]+'('+[input valueForKey:"name"]+')'+
						'</label><dualSlider id="_connectme1_'+i+'"/><textField width="50" valign="center" halign="expand" id="_connectme2_'+i+'"></textField></hbox>';

				} else
				{
					markup+='<hbox><label textColor="white" valign="center" halign="min" width="100">'+[input valueForKey:"patch"]+'('+[input valueForKey:"name"]+')'+
						'</label> <textField width="50" valign="center" halign="expand" id="_connectme2_'+i+'"></textField></hbox>';
				}
			}
		}
	}
	markup+='</vbox></window></objects><connectors>'+
			'<outlet source="#CPOwner" target ="panel" label ="_panel"/></connectors></gsmarkup>';
	var parser=[CPBundle loadGSMarkupData: [CPData dataWithRawString: markup] externalNameTable: [CPDictionary dictionaryWithObject: self forKey:"CPOwner"]
			localizableStringsTable: nil inBundle: nil tagMapping: nil];

// step 2: connect gui to db-objects
	var contents=[[parser nameTable] allValues];
	var i,l=[contents count];
	for(i=0;i<l;i++)
	{
		var input=[contents objectAtIndex: i];
		var peek;
		if(peek= [[input attributes] objectForKey:"id"])
		{	var po=[input platformObject];

			var cip;
			if([peek hasPrefix:"_connectme"])
			{	var idx=parseInt([peek substringFromIndex:12]);
				cip=[inputParams objectAtIndex: idx];
				[po bind: CPValueBinding toObject: cip withKeyPath: "value" options:nil];
			} else if([peek hasPrefix:"_popupcntme"])
			{	var idx=parseInt([peek substringFromIndex:12]);
				cip=[inputParams objectAtIndex: idx];
				[po bind: "integerValue" toObject: cip withKeyPath: "value" options:nil];
			}
		//	if(cip) [cip addObserver: self forKeyPath:"value" options:CPKeyValueObservingOptionNew context: [compo valueForKeyPath:"trial.id"] ];

		}
	}
}
@end
