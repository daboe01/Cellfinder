@STATIC;1.0;t;3867;
var _1=objj_allocateClassPair(GSMarkupTagView,"GSMarkupTagControl"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initPlatformObject:"),function(_3,_4,_5){
with(_3){
_5=objj_msgSend(_5,"init");
var _6=objj_msgSend(_attributes,"objectForKey:","action");
if(_6!=nil){
var _7=CPSelectorFromString(_6);
if(_7==NULL){
CPLog("Warning: <%@> has non-existing action '%@'.  Ignored.",objj_msgSend(objj_msgSend(_3,"class"),"tagName"),_6);
}else{
objj_msgSend(_5,"setAction:",_7);
}
}
var _8=objj_msgSend(_3,"boolValueForAttribute:","continuous");
if(_8==1){
objj_msgSend(_5,"setContinuous:",YES);
}else{
if(_8==0){
objj_msgSend(_5,"setContinuous:",NO);
}
}
var _9=objj_msgSend(_3,"boolValueForAttribute:","enabled");
if(_9==1){
objj_msgSend(_5,"setEnabled:",YES);
}else{
if(_9==0){
objj_msgSend(_5,"setEnabled:",NO);
}
}
var _a=objj_msgSend(_attributes,"objectForKey:","tag");
if(_a!=nil){
objj_msgSend(_5,"setTag:",objj_msgSend(_a,"intValue"));
}
var _b=objj_msgSend(_attributes,"objectForKey:","sendActionOn");
if(_b!=nil){
var _c;
var _d=-1;
_c=objj_msgSend(CPDictionary,"dictionaryWithObjectsAndKeys:",objj_msgSend(CPNumber,"numberWithInt:",CPLeftMouseDownMask),"leftMouseDown",objj_msgSend(CPNumber,"numberWithInt:",CPLeftMouseUpMask),"leftMouseUp",objj_msgSend(CPNumber,"numberWithInt:",CPRightMouseDownMask),"rightMouseDown",objj_msgSend(CPNumber,"numberWithInt:",CPRightMouseUpMask),"rightMouseUp",objj_msgSend(CPNumber,"numberWithInt:",CPMouseMovedMask),"mouseMoved",objj_msgSend(CPNumber,"numberWithInt:",CPLeftMouseDraggedMask),"leftMouseDragged",objj_msgSend(CPNumber,"numberWithInt:",CPRightMouseDraggedMask),"rightMouseDragged",objj_msgSend(CPNumber,"numberWithInt:",CPMouseEnteredMask),"mouseEntered",objj_msgSend(CPNumber,"numberWithInt:",CPMouseExitedMask),"mouseExited",objj_msgSend(CPNumber,"numberWithInt:",CPKeyDownMask),"keyDown",objj_msgSend(CPNumber,"numberWithInt:",CPKeyUpMask),"keyUp",objj_msgSend(CPNumber,"numberWithInt:",CPFlagsChangedMask),"flagsChanged",objj_msgSend(CPNumber,"numberWithInt:",CPAppKitDefinedMask),"appKeyDefined",objj_msgSend(CPNumber,"numberWithInt:",CPSystemDefinedMask),"systemDefined",objj_msgSend(CPNumber,"numberWithInt:",CPApplicationDefinedMask),"applicationDefined",objj_msgSend(CPNumber,"numberWithInt:",CPPeriodicMask),"periodic",objj_msgSend(CPNumber,"numberWithInt:",CPCursorUpdateMask),"cursorUpdate",objj_msgSend(CPNumber,"numberWithInt:",CPScrollWheelMask),"scrollWheel",objj_msgSend(CPNumber,"numberWithInt:",CPOtherMouseDownMask),"otherMouseDown",objj_msgSend(CPNumber,"numberWithInt:",CPOtherMouseUpMask),"otherMouseUp",objj_msgSend(CPNumber,"numberWithInt:",CPOtherMouseDraggedMask),"otherMouseDragged",objj_msgSend(CPNumber,"numberWithInt:",CPAnyEventMask),"anyEvent");
_d=objj_msgSend(_3,"integerMaskValueForAttribute:withMaskValuesDictionary:","sendActionOn",_c);
objj_msgSend(_5,"sendActionOn:",_d);
}
var _e=objj_msgSend(_attributes,"objectForKey:","textAlignment");
if(_e==nil){
_e=objj_msgSend(_attributes,"objectForKey:","align");
if(_e!=nil){
CPLog("The 'align' attribute has been renamed to 'textAlignment'.  Please update your gsmarkup files");
}
}
if(_e!=nil){
if(objj_msgSend(_e,"isEqualToString:","left")){
objj_msgSend(_5,"setAlignment:",CPLeftTextAlignment);
}else{
if(objj_msgSend(_e,"isEqualToString:","right")){
objj_msgSend(_5,"setAlignment:",CPRightTextAlignment);
}else{
if(objj_msgSend(_e,"isEqualToString:","center")){
objj_msgSend(_5,"setAlignment:",CPCenterTextAlignment);
}
}
}
}
var f=objj_msgSend(_3,"fontValueForAttribute:","font");
if(f!=nil){
objj_msgSend(_5,"setFont:",f);
}
return _5;
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("tagName"),function(_f,_10){
with(_f){
return "control";
}
}),new objj_method(sel_getUid("platformObjectClass"),function(_11,_12){
with(_11){
return objj_msgSend(CPControl,"class");
}
})]);
