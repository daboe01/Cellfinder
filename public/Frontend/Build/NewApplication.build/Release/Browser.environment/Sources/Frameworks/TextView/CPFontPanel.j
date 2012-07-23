@STATIC;1.0;I;22;AppKit/CPFontManager.jI;16;AppKit/CPPanel.ji;17;CPLayoutManager.jt;19319;
objj_executeFile("AppKit/CPFontManager.j",NO);
objj_executeFile("AppKit/CPPanel.j",NO);
objj_executeFile("CPLayoutManager.j",YES);
var _1=0,_2=1,_3=2,_4=3;
var _5=0,_6=1,_7=2,_8=3,_9=4,_a=5,_b=6,_c=7,_d=8,_e=9,_f=10,_10=11;
var _11=32,_12=6,_13=2,_14=32,_15=_11-_13;
var _16=1,_17=2;
var _18=0,_19=1,_1a=2,_1b=3,_1c=4,_1d=5,_1e=6,_1f=7;
var _20=nil;
var _21=objj_allocateClassPair(CPView,"_CPFontPanelCell"),_22=_21.isa;
class_addIvars(_21,[new objj_ivar("_label"),new objj_ivar("_highlightView")]);
objj_registerClassPair(_21);
class_addMethods(_21,[new objj_method(sel_getUid("setRepresentedObject:"),function(_23,_24,_25){
with(_23){
if(!_label){
_label=objj_msgSend(objj_msgSend(CPTextField,"alloc"),"initWithFrame:",CGRectInset(objj_msgSend(_23,"bounds"),2,2));
objj_msgSend(_label,"setFont:",objj_msgSend(CPFont,"systemFontOfSize:",12));
objj_msgSend(_23,"addSubview:",_label);
}
objj_msgSend(_label,"setStringValue:",_25);
objj_msgSend(_label,"sizeToFit");
objj_msgSend(_label,"setFrameOrigin:",CGPointMake(0,0));
}
}),new objj_method(sel_getUid("setSelected:"),function(_26,_27,_28){
with(_26){
if(!_highlightView){
_highlightView=objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",CGRectCreateCopy(objj_msgSend(_26,"bounds")));
objj_msgSend(_highlightView,"setBackgroundColor:",objj_msgSend(CPColor,"lightGrayColor"));
}
if(_28){
objj_msgSend(_26,"addSubview:positioned:relativeTo:",_highlightView,CPWindowBelow,_label);
}else{
objj_msgSend(_highlightView,"removeFromSuperview");
}
}
})]);
var _21=objj_allocateClassPair(CPView,"_CPFontPanelSampleView"),_22=_21.isa;
class_addIvars(_21,[new objj_ivar("_layoutManager"),new objj_ivar("_textStorage"),new objj_ivar("_textContainer")]);
objj_registerClassPair(_21);
class_addMethods(_21,[new objj_method(sel_getUid("initWithFrame:"),function(_29,_2a,_2b){
with(_29){
_29=objj_msgSendSuper({receiver:_29,super_class:objj_getClass("_CPFontPanelSampleView").super_class},"initWithFrame:",_2b);
if(_29){
_textStorage=objj_msgSend(objj_msgSend(CPTextStorage,"alloc"),"init");
_layoutManager=objj_msgSend(objj_msgSend(CPLayoutManager,"alloc"),"init");
_textContainer=objj_msgSend(objj_msgSend(CPTextContainer,"alloc"),"init");
objj_msgSend(_layoutManager,"addTextContainer:",_textContainer);
objj_msgSend(_textStorage,"addLayoutManager:",_layoutManager);
}
return _29;
}
}),new objj_method(sel_getUid("setAttributedString:"),function(_2c,_2d,_2e){
with(_2c){
objj_msgSend(_textStorage,"replaceCharactersInRange:withAttributedString:",CPMakeRange(0,objj_msgSend(_textStorage,"length")),_2e);
objj_msgSend(_2c,"setNeedsDisplay:",YES);
}
}),new objj_method(sel_getUid("drawRect:"),function(_2f,_30,_31){
with(_2f){
var ctx=objj_msgSend(objj_msgSend(CPGraphicsContext,"currentContext"),"graphicsPort"),_32=objj_msgSend(_layoutManager,"glyphRangeForTextContainer:",_textContainer),_33=objj_msgSend(_layoutManager,"usedRectForTextContainer:",_textContainer),_34=objj_msgSend(_2f,"bounds"),pos=CPMakePoint((_34.size.width-_33.size.width)/2,(_34.size.height-_33.size.height)/2);
CGContextSaveGState(ctx);
CGContextSetFillColor(ctx,objj_msgSend(CPColor,"whiteColor"));
CGContextFillRect(ctx,_34);
CGContextRestoreGState(ctx);
objj_msgSend(_layoutManager,"drawGlyphsForGlyphRange:atPoint:",_32,pos);
}
})]);
var _21=objj_allocateClassPair(CPPanel,"CPFontPanel"),_22=_21.isa;
class_addIvars(_21,[new objj_ivar("_toolbarView"),new objj_ivar("_fontNameCollectionView"),new objj_ivar("_typefaceCollectionView"),new objj_ivar("_sizeField"),new objj_ivar("_sizeCollectionView"),new objj_ivar("_sampleView"),new objj_ivar("_availableFonts"),new objj_ivar("_textColorButton"),new objj_ivar("_backgroundColorButton"),new objj_ivar("_textColor"),new objj_ivar("_backgroundColor"),new objj_ivar("_currentColorButtonTag"),new objj_ivar("_setupDone"),new objj_ivar("_fontChanges")]);
objj_registerClassPair(_21);
class_addMethods(_21,[new objj_method(sel_getUid("init"),function(_35,_36){
with(_35){
_35=objj_msgSendSuper({receiver:_35,super_class:objj_getClass("CPFontPanel").super_class},"initWithContentRect:styleMask:",CGRectMake(100,50,378,394),(CPTitledWindowMask|CPClosableWindowMask));
if(_35){
objj_msgSend(objj_msgSend(_35,"contentView"),"setBackgroundColor:",objj_msgSend(CPColor,"colorWithWhite:alpha:",0.95,1));
objj_msgSend(_35,"setTitle:","Font Panel");
objj_msgSend(_35,"setLevel:",CPFloatingWindowLevel);
objj_msgSend(_35,"setFloatingPanel:",YES);
objj_msgSend(_35,"setBecomesKeyOnlyIfNeeded:",YES);
objj_msgSend(_35,"setMinSize:",CGSizeMake(378,394));
_availableFonts=objj_msgSend(objj_msgSend(CPFontManager,"sharedFontManager"),"availableFonts");
_textColor=objj_msgSend(CPColor,"blackColor");
_backgroundColor=objj_msgSend(CPColor,"whiteColor");
_setupDone=NO;
_fontChanges=_18;
}
return _35;
}
}),new objj_method(sel_getUid("_setupCollectionView:withScrollerFrame:"),function(_37,_38,_39,_3a){
with(_37){
var _3b=objj_msgSend(objj_msgSend(CPScrollView,"alloc"),"initWithFrame:",_3a);
objj_msgSend(_3b,"setAutohidesScrollers:",YES);
var _3c=objj_msgSend(objj_msgSend(CPCollectionViewItem,"alloc"),"init");
objj_msgSend(_3c,"setView:",objj_msgSend(objj_msgSend(_CPFontPanelCell,"alloc"),"initWithFrame:",CGRectMakeZero()));
objj_msgSend(_39,"setDelegate:",_37);
objj_msgSend(_39,"setItemPrototype:",_3c);
objj_msgSend(_39,"setMinItemSize:",CGSizeMake(20,16));
objj_msgSend(_39,"setMaxItemSize:",CGSizeMake(1000,16));
objj_msgSend(_39,"setMaxNumberOfColumns:",1);
objj_msgSend(_39,"setVerticalMargin:",0);
objj_msgSend(_39,"setAutoresizingMask:",CPViewWidthSizable|CPViewHeightSizable);
objj_msgSend(_3b,"setDocumentView:",_39);
return _3b;
}
}),new objj_method(sel_getUid("_setupToolbarView"),function(_3d,_3e){
with(_3d){
_toolbarView=objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",CGRectMake(0,_12,CGRectGetWidth(objj_msgSend(_3d,"frame")),_11));
objj_msgSend(_toolbarView,"setAutoresizingMask:",CPViewWidthSizable);
var _3f=0;
_textColorButton=objj_msgSend(objj_msgSend(CPButton,"alloc"),"initWithFrame:",CGRectMake(0,0,_14,_15));
objj_msgSend(_textColorButton,"setTag:",_16);
objj_msgSend(_textColorButton,"setAction:",sel_getUid("orderFrontColorPanel:"));
objj_msgSend(_textColorButton,"setTarget:",_3d);
objj_msgSend(_textColorButton,"setImage:",objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:",objj_msgSend(objj_msgSend(CPBundle,"bundleForClass:",objj_msgSend(CPFontPanel,"class")),"pathForResource:","CPFontPanel/CPFontPanelTextColor.png")));
objj_msgSend(_textColorButton,"setBackgroundColor:",_textColor);
objj_msgSend(_textColorButton,"setAutoresizingMask:",CPViewMinXMargin|CPViewMaxXMargin);
objj_msgSend(_textColorButton,"setBezelStyle:",CPSmallSquareBezelStyle);
objj_msgSend(_textColorButton,"setBordered:",NO);
objj_msgSend(_toolbarView,"addSubview:",_textColorButton);
_3f+=_14+_12;
_40+=(_14+_12);
_backgroundColorButton=objj_msgSend(objj_msgSend(CPButton,"alloc"),"initWithFrame:",CGRectMake(0,0,_14,_15));
objj_msgSend(_backgroundColorButton,"setTag:",_17);
objj_msgSend(_backgroundColorButton,"setAction:",sel_getUid("orderFrontColorPanel:"));
objj_msgSend(_backgroundColorButton,"setTarget:",_3d);
objj_msgSend(_backgroundColorButton,"setImage:",objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:",objj_msgSend(objj_msgSend(CPBundle,"bundleForClass:",objj_msgSend(CPFontPanel,"class")),"pathForResource:","CPFontPanel/CPFontPanelBackgroundColor.png")));
objj_msgSend(_backgroundColorButton,"setBackgroundColor:",_backgroundColor);
objj_msgSend(_backgroundColorButton,"setAutoresizingMask:",CPViewMinXMargin|CPViewMaxXMargin);
objj_msgSend(_backgroundColorButton,"setBezelStyle:",CPSmallSquareBezelStyle);
objj_msgSend(_backgroundColorButton,"setBordered:",NO);
objj_msgSend(_toolbarView,"addSubview:",_backgroundColorButton);
_3f+=_14+_12;
button=objj_msgSend(objj_msgSend(CPPopUpButton,"alloc"),"initWithFrame:",CGRectMake(0,0,_14,_15));
objj_msgSend(button,"addItemsWithTitles:",["none","underline","overline","line-through"]);
objj_msgSend(button,"sizeToFit");
objj_msgSend(button,"setBordered:",NO);
objj_msgSend(button,"setAutoresizingMask:",CPViewMinXMargin|CPViewMaxXMargin);
objj_msgSend(_toolbarView,"addSubview:",button);
_3f+=CGRectGetWidth(objj_msgSend(button,"bounds"))+_12;
button=objj_msgSend(objj_msgSend(CPPopUpButton,"alloc"),"initWithFrame:",CGRectMake(0,0,_14,_15));
objj_msgSend(button,"addItemsWithTitles:",["normal","bold","bolder","lighter"]);
objj_msgSend(button,"sizeToFit");
objj_msgSend(button,"setBordered:",NO);
objj_msgSend(button,"setAutoresizingMask:",CPViewMinXMargin|CPViewMaxXMargin);
objj_msgSend(_toolbarView,"addSubview:",button);
_3f+=CGRectGetWidth(objj_msgSend(button,"bounds"));
var _40=(CGRectGetWidth(objj_msgSend(_toolbarView,"bounds"))-_3f)/2,_41=objj_msgSend(_toolbarView,"subviews"),c=objj_msgSend(_41,"count");
for(var i=0;i<c;i++){
objj_msgSend(_41[i],"setFrameOrigin:",CPPointMake(_40,0));
_40+=CGRectGetWidth(objj_msgSend(_41[i],"bounds"))+_12;
}
}
}),new objj_method(sel_getUid("_setupContents"),function(_42,_43){
with(_42){
if(_setupDone){
return;
}
_setupDone=YES;
objj_msgSend(_42,"_setupToolbarView");
var _44=objj_msgSend(_42,"contentView"),_45=objj_msgSend(CPTextField,"labelWithTitle:","Font name"),_46=objj_msgSend(_44,"bounds"),_47=objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",CGRectMake(0,0,CGRectGetWidth(_46),CGRectGetHeight(_46)-(_12+_11+_13)));
objj_msgSend(_44,"addSubview:",_toolbarView);
objj_msgSend(_45,"setFrameOrigin:",CPPointMake(_12,0));
objj_msgSend(_47,"addSubview:",_45);
_fontNameCollectionView=objj_msgSend(objj_msgSend(CPCollectionView,"alloc"),"initWithFrame:",CGRectMake(0,0,200,300));
var y=CGRectGetHeight(objj_msgSend(_45,"frame"))+_13;
var _48=CGRectGetHeight(objj_msgSend(_47,"bounds"))-y-_13,_49=objj_msgSend(_42,"_setupCollectionView:withScrollerFrame:",_fontNameCollectionView,CGRectMake(_12,y,200,_48));
objj_msgSend(_49,"setAutoresizingMask:",CPViewWidthSizable|CPViewHeightSizable);
objj_msgSend(_47,"addSubview:",_49);
objj_msgSend(_fontNameCollectionView,"setContent:",_availableFonts);
var _4a=_12+200+_13;
_45=objj_msgSend(CPTextField,"labelWithTitle:","Typeface");
objj_msgSend(_45,"setFrameOrigin:",CPPointMake(_4a,0));
objj_msgSend(_45,"setAutoresizingMask:",CPViewMaxXMargin);
objj_msgSend(_47,"addSubview:",_45);
_typefaceCollectionView=objj_msgSend(objj_msgSend(CPCollectionView,"alloc"),"initWithFrame:",CGRectMake(0,0,80,300));
y=CGRectGetHeight(objj_msgSend(_45,"frame"))+_13;
_49=objj_msgSend(_42,"_setupCollectionView:withScrollerFrame:",_typefaceCollectionView,CGRectMake(_4a,y,80,_48));
objj_msgSend(_49,"setAutoresizingMask:",CPViewHeightSizable|CPViewMaxXMargin);
objj_msgSend(_47,"addSubview:",_49);
objj_msgSend(_typefaceCollectionView,"setContent:",["Normal","Italic","Bold","Bold Italic"]);
_4a+=80+_13;
_45=objj_msgSend(CPTextField,"labelWithTitle:","Size");
objj_msgSend(_45,"setFrameOrigin:",CPPointMake(_4a,0));
objj_msgSend(_45,"setAutoresizingMask:",CPViewMaxXMargin);
objj_msgSend(_47,"addSubview:",_45);
y=CGRectGetHeight(objj_msgSend(_45,"frame"))+_13;
_sizeField=objj_msgSend(objj_msgSend(CPTextField,"alloc"),"initWithFrame:",CGRectMake(_4a,y,40,30));
objj_msgSend(_sizeField,"setEditable:",YES);
objj_msgSend(_sizeField,"setBordered:",YES);
objj_msgSend(_sizeField,"setBezeled:",YES);
objj_msgSend(_sizeField,"setDelegate:",_42);
objj_msgSend(_sizeField,"setAutoresizingMask:",CPViewMaxXMargin);
objj_msgSend(_47,"addSubview:",_sizeField);
y+=CGRectGetHeight(objj_msgSend(_sizeField,"frame"))+_13;
_48=CGRectGetHeight(objj_msgSend(_47,"bounds"))-y-_13;
_sizeCollectionView=objj_msgSend(objj_msgSend(CPCollectionView,"alloc"),"initWithFrame:",CGRectMake(0,0,80,300));
_49=objj_msgSend(_42,"_setupCollectionView:withScrollerFrame:",_sizeCollectionView,CGRectMake(_4a,y,80,_48));
objj_msgSend(_49,"setAutoresizingMask:",CPViewHeightSizable|CPViewMaxXMargin);
objj_msgSend(_47,"addSubview:",_49);
objj_msgSend(_sizeCollectionView,"setContent:",["9","10","11","12","13","14","18","24","36","48","72","96"]);
y+=_48+_13;
var _4b=CGRectMake(0,_12+_11+_13,CGRectGetWidth(_46),CGRectGetHeight(objj_msgSend(_47,"bounds")));
var _4c=objj_msgSend(objj_msgSend(CPSplitView,"alloc"),"initWithFrame:",_4b);
objj_msgSend(_4c,"setAutoresizingMask:",CPViewWidthSizable|CPViewMaxYMargin);
objj_msgSend(_4c,"setVertical:",NO);
objj_msgSend(_4c,"addSubview:",_47);
_sampleView=objj_msgSend(objj_msgSend(_CPFontPanelSampleView,"alloc"),"initWithFrame:",CGRectMake(0,0,CGRectGetWidth(_46),0));
objj_msgSend(_sampleView,"setBackgroundColor:",objj_msgSend(CPColor,"whiteColor"));
objj_msgSend(_4c,"addSubview:",_sampleView);
objj_msgSend(_44,"addSubview:",_4c);
}
}),new objj_method(sel_getUid("orderFront:"),function(_4d,_4e,_4f){
with(_4d){
objj_msgSend(_4d,"_setupContents");
objj_msgSendSuper({receiver:_4d,super_class:objj_getClass("CPFontPanel").super_class},"orderFront:",_4f);
}
}),new objj_method(sel_getUid("reloadDefaultFontFamilies"),function(_50,_51){
with(_50){
_availableFonts=objj_msgSend(objj_msgSend(CPFontManager,"sharedFontManager"),"availableFonts");
objj_msgSend(_fontNameCollectionView,"setContent:",_availableFonts);
}
}),new objj_method(sel_getUid("worksWhenModal"),function(_52,_53){
with(_52){
return YES;
}
}),new objj_method(sel_getUid("panelConvertFont:"),function(_54,_55,_56){
with(_54){
var _57=_56,_58=0;
switch(_fontChanges){
case _19:
_58=objj_msgSend(objj_msgSend(_fontNameCollectionView,"selectionIndexes"),"firstIndex");
if(_58!=CPNotFound){
_57=objj_msgSend(CPFont,"fontWithDescriptor:size:",objj_msgSend(objj_msgSend(_56,"fontDescriptor"),"fontDescriptorByAddingAttributes:",objj_msgSend(CPDictionary,"dictionaryWithObject:forKey:",objj_msgSend(_availableFonts,"objectAtIndex:",_58),CPFontNameAttribute)),0);
}
break;
case _1a:
_58=objj_msgSend(objj_msgSend(_typefaceCollectionView,"selectionIndexes"),"firstIndex");
if(_58==_4){
_57=objj_msgSend(objj_msgSend(CPFontManager,"sharedFontManager"),"convertFont:toHaveTrait:",_56,CPBoldFontMask|CPItalicFontMask);
}else{
if(_58==_3){
_57=objj_msgSend(objj_msgSend(CPFontManager,"sharedFontManager"),"convertFont:toHaveTrait:",_56,CPBoldFontMask);
}else{
if(_58==_2){
_57=objj_msgSend(objj_msgSend(CPFontManager,"sharedFontManager"),"convertFont:toHaveTrait:",_56,CPItalicFontMask);
}else{
_57=objj_msgSend(objj_msgSend(CPFontManager,"sharedFontManager"),"convertFont:toNotHaveTrait:",_56,CPBoldFontMask|CPItalicFontMask);
}
}
}
break;
case _1b:
_57=objj_msgSend(objj_msgSend(CPFontManager,"sharedFontManager"),"convertFont:toSize:",_56,objj_msgSend(_sizeField,"floatValue"));
break;
case _18:
break;
default:
CPLog.trace("FIXME: -["+objj_msgSend(_54,"className")+" "+_55+"] unhandled _fontChanges: "+_fontChanges);
break;
}
return _57;
}
}),new objj_method(sel_getUid("setPanelFont:isMultiple:"),function(_59,_5a,_5b,_5c){
with(_59){
objj_msgSend(_59,"_setupContents");
var _5d=objj_msgSend(objj_msgSend(_fontNameCollectionView,"selectionIndexes"),"firstIndex");
if(_5d!=CPNotFound&&objj_msgSend(_availableFonts,"objectAtIndex:",_5d)!==objj_msgSend(_5b,"familyName")){
objj_msgSend(_fontNameCollectionView,"setSelectionIndexes:",objj_msgSend(CPIndexSet,"indexSetWithIndex:",objj_msgSend(_availableFonts,"indexOfObject:",objj_msgSend(_5b,"familyName"))));
}
if(objj_msgSend(_sizeField,"floatValue")!=objj_msgSend(_5b,"size")){
objj_msgSend(_sizeCollectionView,"setSelectionIndexes:",objj_msgSend(CPIndexSet,"indexSetWithIndex:",objj_msgSend(_59,"_sizeCollectionIndexWithSize:",objj_msgSend(_5b,"size"))));
objj_msgSend(_sizeField,"setIntValue:",objj_msgSend(_5b,"size"));
}
var _5e=_1,_5f=objj_msgSend(objj_msgSend(_5b,"fontDescriptor"),"symbolicTraits");
if((_5f&CPFontItalicTrait)&&(_5f&CPFontBoldTrait)){
_5e=_4;
}else{
if(_5f&CPFontItalicTrait){
_5e=_2;
}else{
if(_5f&CPFontBoldTrait){
_5e=_3;
}
}
}
_5d=objj_msgSend(objj_msgSend(_typefaceCollectionView,"selectionIndexes"),"firstIndex");
if(_5d!=CPNotFound&&_5d!=_5e){
objj_msgSend(_typefaceCollectionView,"setSelectionIndexes:",objj_msgSend(CPIndexSet,"indexSetWithIndex:",_5e));
}
objj_msgSend(_sampleView,"setAttributedString:",objj_msgSend(objj_msgSend(CPAttributedString,"alloc"),"initWithString:attributes:",objj_msgSend(_5b,"familyName"),objj_msgSend(CPDictionary,"dictionaryWithObjects:forKeys:",[_5b,objj_msgSend(CPColor,"blackColor")],[CPFontAttributeName,CPForegroundColorAttributeName])));
_fontChanges=_18;
}
}),new objj_method(sel_getUid("_sizeCollectionIndexWithSize:"),function(_60,_61,_62){
with(_60){
switch(_62){
case 9:
return _5;
case 10:
return _6;
case 11:
return _7;
case 12:
return _8;
case 13:
return _9;
case 14:
return _a;
case 18:
return _b;
case 24:
return _c;
case 36:
return _d;
case 48:
return _e;
case 72:
return _f;
case 96:
return _10;
}
return CPNotFound;
}
}),new objj_method(sel_getUid("_sizeFromSizeCollectionIndex:"),function(_63,_64,_65){
with(_63){
switch(_65){
case _5:
return 9;
case _6:
return 10;
case _7:
return 11;
case _8:
return 12;
case _9:
return 13;
case _a:
return 14;
case _b:
return 18;
case _c:
return 24;
case _d:
return 36;
case _e:
return 48;
case _f:
return 72;
case _10:
return 96;
}
return CPNotFound;
}
}),new objj_method(sel_getUid("collectionViewDidChangeSelection:"),function(_66,_67,_68){
with(_66){
var _69=objj_msgSend(objj_msgSend(_68,"selectionIndexes"),"firstIndex");
if(_68===_fontNameCollectionView){
_fontChanges=_19;
objj_msgSend(objj_msgSend(CPFontManager,"sharedFontManager"),"modifyFontViaPanel:",_66);
}else{
if(_68===_typefaceCollectionView){
_fontChanges=_1a;
objj_msgSend(objj_msgSend(CPFontManager,"sharedFontManager"),"modifyFontViaPanel:",_66);
}else{
if(_68===_sizeCollectionView){
var _6a=objj_msgSend(_66,"_sizeFromSizeCollectionIndex:",_69);
if(_6a!=CPNotFound){
objj_msgSend(_sizeField,"setIntValue:",_6a);
}
if(_fontChanges==_18){
_fontChanges=_1b;
objj_msgSend(objj_msgSend(CPFontManager,"sharedFontManager"),"modifyFontViaPanel:",_66);
}
}
}
}
}
}),new objj_method(sel_getUid("controlTextDidChange:"),function(_6b,_6c,_6d){
with(_6b){
_fontChanges=_1b;
objj_msgSend(_sizeCollectionView,"setSelectionIndexes:",objj_msgSend(CPIndexSet,"indexSetWithIndex:",objj_msgSend(_6b,"_sizeCollectionIndexWithSize:",objj_msgSend(_sizeField,"intValue"))));
objj_msgSend(objj_msgSend(CPFontManager,"sharedFontManager"),"modifyFontViaPanel:",_6b);
}
}),new objj_method(sel_getUid("orderFrontColorPanel:"),function(_6e,_6f,_70){
with(_6e){
_currentColorButtonTag=objj_msgSend(_70,"tag");
var _71=objj_msgSend(CPColorPanel,"sharedColorPanel");
objj_msgSend(_71,"setTarget:",_6e);
objj_msgSend(_71,"setAction:",sel_getUid("changeColor:"));
objj_msgSend(_71,"orderFront:",_6e);
}
}),new objj_method(sel_getUid("changeColor:"),function(_72,_73,_74){
with(_72){
if(_currentColorButtonTag==_16){
_textColor=objj_msgSend(_74,"color");
_fontChanges=_1c;
objj_msgSend(_textColorButton,"setBackgroundColor:",_textColor);
}else{
_backgroundColor=objj_msgSend(_74,"color");
_fontChanges=_1d;
objj_msgSend(_backgroundColorButton,"setBackgroundColor:",_backgroundColor);
}
objj_msgSend(objj_msgSend(CPFontManager,"sharedFontManager"),"modifyFontViaPanel:",_72);
}
})]);
class_addMethods(_22,[new objj_method(sel_getUid("sharedFontPanelExists"),function(_75,_76){
with(_75){
return _20!==nil;
}
}),new objj_method(sel_getUid("sharedFontPanel"),function(_77,_78){
with(_77){
if(!_20){
_20=objj_msgSend(objj_msgSend(CPFontPanel,"alloc"),"init");
}
return _20;
}
})]);
