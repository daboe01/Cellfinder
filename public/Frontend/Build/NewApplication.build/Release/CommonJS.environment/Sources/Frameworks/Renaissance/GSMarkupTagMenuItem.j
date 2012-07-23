@STATIC;1.0;i;19;GSMarkupTagObject.jt;2811;
objj_executeFile("GSMarkupTagObject.j",YES);
var _1=objj_allocateClassPair(GSMarkupTagObject,"GSMarkupTagMenuItem"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("allocPlatformObject"),function(_3,_4){
with(_3){
return objj_msgSend(CPMenuItem,"alloc");
}
}),new objj_method(sel_getUid("initPlatformObject:"),function(_5,_6,_7){
with(_5){
var _8=objj_msgSend(_5,"localizedStringValueForAttribute:","title");
var _9=objj_msgSend(_attributes,"objectForKey:","keyEquivalent");
var _a=NULL;
var _b=objj_msgSend(_attributes,"objectForKey:","action");
if(_b!=nil){
_a=CPSelectorFromString(_b);
if(_a==NULL){
CPLog("Warning: <%@> has non-existing action '%@'.  Ignored.",objj_msgSend(objj_msgSend(_5,"class"),"tagName"),_b);
}
}
if(_9==nil){
_9=objj_msgSend(_attributes,"objectForKey:","key");
if(_9!=nil){
CPLog("The 'key' attribute of the <menuItem> tag is obsolete; please replace it with 'keyEquivalent'");
}
}
if(_9==nil){
_9="";
}
if(_8==nil){
_8="";
}
_7=objj_msgSend(_7,"initWithTitle:action:keyEquivalent:",_8,_a,_9);
var _c=objj_msgSend(_attributes,"objectForKey:","image");
if(_c!=nil){
objj_msgSend(_7,"setImage:",objj_msgSend(CPImage,"imageNamed:",_c));
}
var _d=objj_msgSend(_attributes,"objectForKey:","tag");
if(_d!=nil){
objj_msgSend(_7,"setTag:",objj_msgSend(_d,"intValue"));
}
var _e=objj_msgSend(_5,"boolValueForAttribute:","enabled");
if(_e==1){
objj_msgSend(_7,"setEnabled:",YES);
}else{
if(_e==0){
objj_msgSend(_7,"setEnabled:",NO);
}
}
var _f=objj_msgSend(_attributes,"objectForKey:","state");
if(_f!=nil){
if(objj_msgSend(_f,"isEqualToString:","on")){
objj_msgSend(_7,"setState:",CPOnState);
}else{
if(objj_msgSend(_f,"isEqualToString:","off")){
objj_msgSend(_7,"setState:",CPOffState);
}else{
if(objj_msgSend(_f,"isEqualToString:","mixed")){
objj_msgSend(_7,"setState:",CPMixedState);
}
}
}
}
var _10=objj_msgSend(_attributes,"objectForKey:","keyEquivalentModifierMask");
if(_10!=nil){
var _11;
var _12=-1;
_11=objj_msgSend(CPDictionary,"dictionaryWithObjectsAndKeys:",objj_msgSend(CPNumber,"numberWithInt:",0),"noKey",objj_msgSend(CPNumber,"numberWithInt:",CPControlKeyMask),"controlKey",objj_msgSend(CPNumber,"numberWithInt:",CPAlternateKeyMask),"alternateKey",objj_msgSend(CPNumber,"numberWithInt:",CPCommandKeyMask),"commandKey",objj_msgSend(CPNumber,"numberWithInt:",CPShiftKeyMask),"shiftKey",nil);
_12=objj_msgSend(_5,"integerMaskValueForAttribute:withMaskValuesDictionary:","keyEquivalentModifierMask",_11);
objj_msgSend(_7,"setKeyEquivalentModifierMask:",_12);
}
return _7;
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("tagName"),function(_13,_14){
with(_13){
return "menuItem";
}
}),new objj_method(sel_getUid("localizableAttributes"),function(_15,_16){
with(_15){
return objj_msgSend(CPArray,"arrayWithObject:","title");
}
})]);
