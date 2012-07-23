@STATIC;1.0;i;20;GSMarkupTagControl.jt;4488;
objj_executeFile("GSMarkupTagControl.j",YES);
var _1=objj_allocateClassPair(GSMarkupTagControl,"GSMarkupTagButton"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initPlatformObject:"),function(_3,_4,_5){
with(_3){
_5=objj_msgSendSuper({receiver:_3,super_class:objj_getClass("GSMarkupTagButton").super_class},"initPlatformObject:",_5);
var _6=objj_msgSend(_3,"localizedStringValueForAttribute:","title");
if(_6!=nil){
objj_msgSend(_5,"setTitle:",_6);
}else{
objj_msgSend(_5,"setTitle:","");
}
var f=objj_msgSend(_3,"fontValueForAttribute:","font");
if(f==nil){
}
var _7=objj_msgSend(_attributes,"objectForKey:","image");
if(_7!=nil){
objj_msgSend(_5,"setImage:",objj_msgSend(CPImage,"imageNamed:",_7));
}
var _8=objj_msgSend(_attributes,"objectForKey:","imagePosition");
if(_8!=nil&&objj_msgSend(_8,"length")>0){
switch(objj_msgSend(_8,"characterAtIndex:",0)){
case "a":
if(objj_msgSend(_8,"isEqualToString:","above")){
objj_msgSend(_5,"setImagePosition:",CPImageAbove);
}
break;
case "b":
if(objj_msgSend(_8,"isEqualToString:","below")){
objj_msgSend(_5,"setImagePosition:",CPImageBelow);
}
break;
case "l":
if(objj_msgSend(_8,"isEqualToString:","left")){
objj_msgSend(_5,"setImagePosition:",CPImageLeft);
}
break;
case "o":
if(objj_msgSend(_8,"isEqualToString:","overlaps")){
objj_msgSend(_5,"setImagePosition:",CPImageOverlaps);
}
break;
case "r":
if(objj_msgSend(_8,"isEqualToString:","right")){
objj_msgSend(_5,"setImagePosition:",CPImageRight);
}
break;
case "i":
if(objj_msgSend(_8,"isEqualToString:","imageOnly")){
objj_msgSend(_5,"setImagePosition:",CPImageOnly);
}
break;
}
}
var _9=objj_msgSend(_attributes,"objectForKey:","keyEquivalent");
if(_9==nil){
_9=objj_msgSend(_attributes,"objectForKey:","key");
if(_9!=nil){
CPLog("The 'key' attribute of the <button> tag is obsolete; please replace it with 'keyEquivalent'");
}
}
if(_9!=nil){
objj_msgSend(_5,"setKeyEquivalent:",_9);
}
var _a=objj_msgSend(_attributes,"objectForKey:","keyEquivalentModifierMask");
if(_a!=nil){
var _b;
var _c=-1;
_b=objj_msgSend(CPDictionary,"dictionaryWithObjectsAndKeys:",objj_msgSend(CPNumber,"numberWithInt:",0),"noKey",objj_msgSend(CPNumber,"numberWithInt:",CPControlKeyMask),"controlKey",objj_msgSend(CPNumber,"numberWithInt:",CPAlternateKeyMask),"alternateKey",objj_msgSend(CPNumber,"numberWithInt:",CPCommandKeyMask),"commandKey",objj_msgSend(CPNumber,"numberWithInt:",CPShiftKeyMask),"shiftKey");
_c=objj_msgSend(_3,"integerMaskValueForAttribute:withMaskValuesDictionary:","keyEquivalentModifierMask",_b);
objj_msgSend(_5,"setKeyEquivalentModifierMask:",_c);
}
var t=objj_msgSend(_3,"localizedStringValueForAttribute:","alternateTitle");
if(t!=nil){
objj_msgSend(_5,"setAlternateTitle:",t);
}
var _7=objj_msgSend(_attributes,"objectForKey:","alternateImage");
if(_7!=nil){
objj_msgSend(_5,"setAlternateImage:",objj_msgSend(CPImage,"imageNamed:",_7));
}
var _d=objj_msgSend(_attributes,"objectForKey:","type");
var _e=YES;
if(_d!=nil){
switch(objj_msgSend(_d,"characterAtIndex:",0)){
case "m":
if(objj_msgSend(_d,"isEqualToString:","momentaryPushIn")){
objj_msgSend(_5,"setButtonType:",CPMomentaryPushInButton);
}
if(objj_msgSend(_d,"isEqualToString:","momentaryChange")){
objj_msgSend(_5,"setButtonType:",CPMomentaryChangeButton);
}
break;
case "p":
if(objj_msgSend(_d,"isEqualToString:","pushOnPushOff")){
objj_msgSend(_5,"setButtonType:",CPPushOnPushOffButton);
}
break;
case "t":
if(objj_msgSend(_d,"isEqualToString:","toggle")){
objj_msgSend(_5,"setButtonType:",CPToggleButton);
}
break;
case "s":
if(objj_msgSend(_d,"isEqualToString:","switch")){
objj_msgSend(_5,"setButtonType:",CPSwitchButton);
_e=NO;
}
break;
}
}else{
objj_msgSend(_5,"setButtonType:",CPMomentaryPushInButton);
}
if(_e){
if(objj_msgSend(_attributes,"objectForKey:","image")==nil){
objj_msgSend(_5,"setBezelStyle:",CPRoundedBezelStyle);
}else{
objj_msgSend(_5,"setBezelStyle:",CPRegularSquareBezelStyle);
}
}
var _f=objj_msgSend(_attributes,"objectForKey:","sound");
if(_f!=nil){
objj_msgSend(_5,"setSound:",objj_msgSend(CPSound,"soundNamed:",_f));
}
return _5;
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("tagName"),function(_10,_11){
with(_10){
return "button";
}
}),new objj_method(sel_getUid("platformObjectClass"),function(_12,_13){
with(_12){
return objj_msgSend(CPButton,"class");
}
}),new objj_method(sel_getUid("localizableAttributes"),function(_14,_15){
with(_14){
return objj_msgSend(CPArray,"arrayWithObjects:","title","alternateTitle",nil);
}
})]);
