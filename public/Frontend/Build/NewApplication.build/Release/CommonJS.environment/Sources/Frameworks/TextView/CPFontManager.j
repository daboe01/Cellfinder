@STATIC;1.0;I;21;Foundation/CPObject.jI;15;AppKit/CPFont.ji;13;CPFontPanel.ji;18;CPFontDescriptor.jt;11962;
objj_executeFile("Foundation/CPObject.j",NO);
objj_executeFile("AppKit/CPFont.j",NO);
objj_executeFile("CPFontPanel.j",YES);
objj_executeFile("CPFontDescriptor.j",YES);
CPNoFontChangeAction=0;
CPViaPanelFontAction=1;
CPAddTraitFontAction=2;
CPSizeUpFontAction=3;
CPSizeDownFontAction=4;
CPHeavierFontAction=5;
CPLighterFontAction=6;
CPRemoveTraitFontAction=7;
CPItalicFontMask=1;
CPBoldFontMask=2;
CPUnboldFontMask=4;
CPExpandedFontMask=32;
CPCompensedFontMask=64;
CPSmallCapsFontMask=128;
CPUnitalicFontMask=16777216;
var _1=nil,_2=Nil,_3=Nil;
var _4=nil,_5=nil;
var _6=objj_allocateClassPair(CPObject,"CPFontManager"),_7=_6.isa;
class_addIvars(_6,[new objj_ivar("_availableFonts"),new objj_ivar("_delegate"),new objj_ivar("_fontMenu"),new objj_ivar("_action"),new objj_ivar("_fontAction"),new objj_ivar("_currentFontTrait"),new objj_ivar("_selectedFont"),new objj_ivar("_isMultiple")]);
objj_registerClassPair(_6);
class_addMethods(_6,[new objj_method(sel_getUid("init"),function(_8,_9){
with(_8){
_8=objj_msgSendSuper({receiver:_8,super_class:objj_getClass("CPFontManager").super_class},"init");
if(_8){
_action=sel_getUid("changeFont:");
}
return _8;
}
}),new objj_method(sel_getUid("availableFonts"),function(_a,_b){
with(_a){
if(!_availableFonts){
_c=document.createElement("span");
_c.fontSize="24px";
_c.appendChild(document.createTextNode("mmmmmmmmmml"));
var _d=document.createElement("div");
_d.style.position="absolute";
_d.style.top="-1000px";
_d.appendChild(_c);
document.getElementsByTagName("body")[0].appendChild(_d);
_e=_f(["monospace","serif","sans-serif","cursive"]);
_availableFonts=[];
for(var i=0;i<_10.length;i++){
var _11=_12(_10[i]);
if(_11){
_availableFonts.push(_10[i]);
}
}
}
return _availableFonts;
}
}),new objj_method(sel_getUid("fontWithNameIsAvailable:"),function(_13,_14,_15){
with(_13){
return _12(_15);
}
}),new objj_method(sel_getUid("orderFrontFontPanel:"),function(_16,_17,_18){
with(_16){
objj_msgSend(objj_msgSend(_16,"fontPanel:",YES),"orderFront:",_18);
}
}),new objj_method(sel_getUid("addFontTrait:"),function(_19,_1a,_1b){
with(_19){
_fontAction=CPAddTraitFontAction;
_currentFontTrait=objj_msgSend(_1b,"tag");
objj_msgSend(_19,"sendAction");
if(_selectedFont){
objj_msgSend(_19,"setSelectedFont:isMultiple:",objj_msgSend(_19,"convertFont:",_selectedFont),_isMultiple);
}
}
}),new objj_method(sel_getUid("modifyFont:"),function(_1c,_1d,_1e){
with(_1c){
_fontAction=objj_msgSend(_1e,"tag");
objj_msgSend(_1c,"sendAction");
if(_selectedFont){
objj_msgSend(_1c,"setSelectedFont:isMultiple:",objj_msgSend(_1c,"convertFont:",_selectedFont),_isMultiple);
}
}
}),new objj_method(sel_getUid("modifyFontViaPanel:"),function(_1f,_20,_21){
with(_1f){
_fontAction=CPViaPanelFontAction;
objj_msgSend(_1f,"sendAction");
if(_selectedFont){
objj_msgSend(_1f,"setSelectedFont:isMultiple:",objj_msgSend(_1f,"convertFont:",_selectedFont),_isMultiple);
}
}
}),new objj_method(sel_getUid("sendAction"),function(_22,_23){
with(_22){
if(!_action){
return NO;
}
return objj_msgSend(CPApp,"sendAction:to:from:",_action,nil,_22);
}
}),new objj_method(sel_getUid("setAction:"),function(_24,_25,_26){
with(_24){
_action=_26;
}
}),new objj_method(sel_getUid("convertFont:toHaveTrait:"),function(_27,_28,_29,_2a){
with(_27){
var _2b=objj_msgSend(objj_msgSend(objj_msgSend(_29,"fontDescriptor"),"fontAttributes"),"copy"),_2c=objj_msgSend(objj_msgSend(_29,"fontDescriptor"),"symbolicTraits");
if(_2a&CPBoldFontMask){
_2c|=CPFontBoldTrait;
}
if(_2a&CPItalicFontMask){
_2c|=CPFontItalicTrait;
}
if(_2a&CPUnboldFontMask){
_2c&=~CPFontBoldTrait;
}
if(_2a&CPUnitalicFontMask){
_2c&=~CPFontItalicTrait;
}
if(_2a&CPExpandedFontMask){
_2c|=CPFontExpandedTrait;
}
if(_2a&CPCompensedFontMask){
_2c|=CPFontCondensedTrait;
}
if(_2a&CPSmallCapsFontMask){
_2c|=CPFontSmallCapsTrait;
}
if(!objj_msgSend(_2b,"containsKey:",CPFontTraitsAttribute)){
objj_msgSend(_2b,"setObject:forKey:",objj_msgSend(CPDictionary,"dictionaryWithObject:forKey:",objj_msgSend(CPNumber,"numberWithUnsignedInt:",_2c),CPFontSymbolicTrait),CPFontTraitsAttribute);
}else{
objj_msgSend(objj_msgSend(_2b,"objectForKey:",CPFontTraitsAttribute),"setObject:forKey:",objj_msgSend(CPNumber,"numberWithUnsignedInt:",_2c),CPFontSymbolicTrait);
}
return objj_msgSend(objj_msgSend(_29,"class"),"fontWithDescriptor:size:",objj_msgSend(CPFontDescriptor,"fontDescriptorWithFontAttributes:",_2b),0);
}
}),new objj_method(sel_getUid("convertFont:toNotHaveTrait:"),function(_2d,_2e,_2f,_30){
with(_2d){
var _31=objj_msgSend(objj_msgSend(objj_msgSend(_2f,"fontDescriptor"),"fontAttributes"),"copy"),_32=objj_msgSend(objj_msgSend(_2f,"fontDescriptor"),"symbolicTraits");
if((_30&CPBoldFontMask)||(_30&CPUnboldFontMask)){
_32&=~CPFontBoldTrait;
}
if((_30&CPItalicFontMask)||(_30&CPUnitalicFontMask)){
_32&=~CPFontItalicTrait;
}
if(_30&CPExpandedFontMask){
_32&=~CPFontExpandedTrait;
}
if(_30&CPCompensedFontMask){
_32&=~CPFontCondensedTrait;
}
if(_30&CPSmallCapsFontMask){
_32&=~CPFontSmallCapsTrait;
}
if(!objj_msgSend(_31,"containsKey:",CPFontTraitsAttribute)){
objj_msgSend(_31,"setObject:forKey:",objj_msgSend(CPDictionary,"dictionaryWithObject:forKey:",objj_msgSend(CPNumber,"numberWithUnsignedInt:",_32),CPFontSymbolicTrait),CPFontTraitsAttribute);
}else{
objj_msgSend(objj_msgSend(_31,"objectForKey:",CPFontTraitsAttribute),"setObject:forKey:",objj_msgSend(CPNumber,"numberWithUnsignedInt:",_32),CPFontSymbolicTrait);
}
return objj_msgSend(objj_msgSend(_2f,"class"),"fontWithDescriptor:size:",objj_msgSend(CPFontDescriptor,"fontDescriptorWithFontAttributes:",_31),0);
}
}),new objj_method(sel_getUid("convertFont:toSize:"),function(_33,_34,_35,_36){
with(_33){
return objj_msgSend(objj_msgSend(_35,"class"),"fontWithDescriptor:size:",objj_msgSend(_35,"fontDescriptor"),_36);
}
}),new objj_method(sel_getUid("convertWeight:ofFont:"),function(_37,_38,_39,_3a){
with(_37){
var _3b=objj_msgSend(objj_msgSend(_3a,"fontDescriptor"),"fontWeightCSSString");
if(!_4){
_4=["lighter","normal","bold","bolder"];
}
if(!_5){
_5=["100","200","300","400","500","600","700","800","900"];
}
CPLog.trace("FIXME: -["+objj_msgSend(_37,"className")+" "+_38+"] stub");
return _3a;
}
}),new objj_method(sel_getUid("convertFont:"),function(_3c,_3d,_3e){
with(_3c){
var _3f=nil;
switch(_fontAction){
case CPNoFontChangeAction:
_3f=_3e;
break;
case CPViaPanelFontAction:
_3f=objj_msgSend(objj_msgSend(_3c,"fontPanel:",NO),"panelConvertFont:",_3e);
break;
case CPAddTraitFontAction:
_3f=objj_msgSend(_3c,"convertFont:toHaveTrait:",_3e,_currentFontTrait);
break;
case CPSizeUpFontAction:
_3f=objj_msgSend(_3c,"convertFont:toSize:",_3e,objj_msgSend(_3e,"size")+1);
break;
case CPSizeDownFontAction:
if(objj_msgSend(_3e,"size")>1){
_3f=objj_msgSend(_3c,"convertFont:toSize:",_3e,objj_msgSend(_3e,"size")-1);
}
break;
default:
CPLog.trace("-["+objj_msgSend(_3c,"className")+" "+_3d+"] unsupporter font action: "+_fontAction+" aFont unchanged");
_3f=_3e;
break;
}
return _3f;
}
}),new objj_method(sel_getUid("setFontMenu:"),function(_40,_41,_42){
with(_40){
_fontMenu=_42;
}
}),new objj_method(sel_getUid("fontMenu:"),function(_43,_44,_45){
with(_43){
if(!_fontMenu&&_45){
_fontMenu=objj_msgSend(objj_msgSend(CPMenu,"alloc"),"initWithTitle:","Font Menu");
var _46=objj_msgSend(_fontMenu,"addItemWithTitle:action:keyEquivalent:","Show Fonts",sel_getUid("orderFrontFontPanel:"),"t");
objj_msgSend(_46,"setTarget:",_43);
_46=objj_msgSend(_fontMenu,"addItemWithTitle:action:keyEquivalent:","Italic",sel_getUid("addFontTrait:"),"i");
objj_msgSend(_46,"setTag:",CPItalicFontMask);
objj_msgSend(_46,"setTarget:",_43);
_46=objj_msgSend(_fontMenu,"addItemWithTitle:action:keyEquivalent:","Bold",sel_getUid("addFontTrait:"),"b");
objj_msgSend(_46,"setTag:",CPBoldFontMask);
objj_msgSend(_46,"setTarget:",_43);
objj_msgSend(_fontMenu,"addItemWithTitle:action:keyEquivalent:","Underline",sel_getUid("underline:"),"u");
objj_msgSend(_fontMenu,"addItem:",objj_msgSend(CPMenuItem,"separatorItem"));
_46=objj_msgSend(_fontMenu,"addItemWithTitle:action:keyEquivalent:","Bigger",sel_getUid("modifyFont:"),"+");
objj_msgSend(_46,"setTag:",CPSizeUpFontAction);
_46=objj_msgSend(_fontMenu,"addItemWithTitle:action:keyEquivalent:","Smaller",sel_getUid("modifyFont:"),"-");
objj_msgSend(_46,"setTag:",CPSizeDownFontAction);
objj_msgSend(_fontMenu,"addItem:",objj_msgSend(CPMenuItem,"separatorItem"));
objj_msgSend(_fontMenu,"addItemWithTitle:action:keyEquivalent:","Show Colors",sel_getUid("orderFrontColorPanel:"),"C");
objj_msgSend(_fontMenu,"addItem:",objj_msgSend(CPMenuItem,"separatorItem"));
_46=objj_msgSend(_fontMenu,"addItemWithTitle:action:keyEquivalent:","Copy Style",sel_getUid("copyFont:"),"C");
objj_msgSend(_46,"setKeyEquivalentModifierMask:",CPAlternateKeyMask);
_46=objj_msgSend(_fontMenu,"addItemWithTitle:action:keyEquivalent:","Paste Style",sel_getUid("pasteFont:"),"V");
objj_msgSend(_46,"setKeyEquivalentModifierMask:",CPAlternateKeyMask);
}
return _fontMenu;
}
}),new objj_method(sel_getUid("fontPanel:"),function(_47,_48,_49){
with(_47){
var _4a=nil,_4b=objj_msgSend(_3,"sharedFontPanelExists");
if((_4b)||(!_4b&&_49)){
_4a=objj_msgSend(_3,"sharedFontPanel");
}
return _4a;
}
}),new objj_method(sel_getUid("selectedFont"),function(_4c,_4d){
with(_4c){
return _selectedFont;
}
}),new objj_method(sel_getUid("setSelectedFont:isMultiple:"),function(_4e,_4f,_50,_51){
with(_4e){
_selectedFont=_50;
_isMultiple=_51;
var _52=objj_msgSend(_4e,"fontPanel:",NO);
if(_52){
objj_msgSend(_52,"setPanelFont:isMultiple:",_selectedFont,_isMultiple);
}
}
})]);
class_addMethods(_7,[new objj_method(sel_getUid("sharedFontManager"),function(_53,_54){
with(_53){
if(!_1){
_1=objj_msgSend(objj_msgSend(_2,"alloc"),"init");
}
return _1;
}
}),new objj_method(sel_getUid("setFontManagerFactory:"),function(_55,_56,_57){
with(_55){
_2=_57;
}
}),new objj_method(sel_getUid("setFontPanelFactory:"),function(_58,_59,_5a){
with(_58){
_3=_5a;
}
})]);
var _c,_e,_10=["American Typewriter","Apple Chancery","Arial","Arial Black","Arial Narrow","Arial Rounded MT Bold","Arial Unicode MS","Big Caslon","Bitstream Vera Sans","Bitstream Vera Sans Mono","Bitstream Vera Serif","Brush Script MT","Cambria","Caslon","Castellar","Cataneo BT","Centaur","Century Gothic","Century Schoolbook","Century Schoolbook L","Comic Sans","Comic Sans MS","Consolas","Constantia","Cooper Black","Copperplate","Copperplate Gothic Bold","Copperplate Gothic Light","Corbel","Courier","Courier New","Futura","Geneva","Georgia","Georgia Ref","Geeza Pro","Gigi","Gill Sans","Gill Sans MT","Gill Sans MT Condensed","Gill Sans MT Ext Condensed Bold","Gill Sans Ultra Bold","Gill Sans Ultra Bold Condensed","Helvetica","Helvetica Narrow","Helvetica Neue","Herculanum","High Tower Text","Highlight LET","Hoefler Text","Impact","Imprint MT Shadow","Lucida","Lucida Bright","Lucida Calligraphy","Lucida Console","Lucida Fax","Lucida Grande","Lucida Handwriting","Lucida Sans","Lucida Sans Typewriter","Lucida Sans Unicode","Marker Felt","Microsoft Sans Serif","Milano LET","Minion Web","MisterEarl BT","Mistral","Monaco","Monotype Corsiva","Monotype.com","New Century Schoolbook","New York","News Gothic MT","Papyrus","Tahoma","Techno","Tempus Sans ITC","Terminal","Textile","Times","Times New Roman","Tiranti Solid LET","Trebuchet MS","Verdana","Verdana Ref","Zapfino"];
var _12=function(_5b){
for(var i=0;i<_e.length;i++){
if(_5c(_e[i],_5b)){
return true;
}
}
return false;
};
var _5d={};
var _5c=function(_5e,_5f){
var a;
if(_5d[_5e]){
a=_5d[_5e];
}else{
_c.style.fontFamily="\""+_5e+"\"";
_5d[_5e]=a={w:_c.offsetWidth,h:_c.offsetHeight};
}
_c.style.fontFamily="\""+_5f+"\", \""+_5e+"\"";
var _60=_c.offsetWidth;
var _61=_c.offsetHeight;
return (a.w!=_60||a.h!=_61);
};
var _f=function(_62){
for(var i=0;i<_62.length;i++){
for(var j=0;j<i;j++){
if(_5c(_62[i],_62[j])){
return [_62[i],_62[j]];
}
}
}
return [_62[0]];
};
objj_msgSend(CPFontManager,"setFontManagerFactory:",objj_msgSend(CPFontManager,"class"));
objj_msgSend(CPFontManager,"setFontPanelFactory:",objj_msgSend(CPFontPanel,"class"));
