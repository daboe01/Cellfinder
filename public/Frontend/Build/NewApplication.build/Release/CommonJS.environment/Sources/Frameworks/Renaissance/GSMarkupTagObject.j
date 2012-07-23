@STATIC;1.0;I;21;Foundation/CPBundle.ji;16;GSMarkupAwaker.jt;6192;
objj_executeFile("Foundation/CPBundle.j",NO);
objj_executeFile("GSMarkupAwaker.j",YES);
var _1=objj_getClass("CPObject");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"CPObject\"");
}
var _2=_1.isa;
class_addMethods(_2,[new objj_method(sel_getUid("isSubclassOfClass:"),function(_3,_4,_5){
with(_3){
var _6=objj_msgSend(_3,"class");
if(_6==_5){
return YES;
}else{
while(_6!=Nil){
_6=objj_msgSend(_6,"superclass");
if(_6==_5){
return YES;
}
}
return NO;
}
}
})]);
var _1=objj_allocateClassPair(CPObject,"GSMarkupTagObject"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_attributes"),new objj_ivar("_content"),new objj_ivar("_platformObject"),new objj_ivar("_localizer"),new objj_ivar("_awaker")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initWithAttributes:content:"),function(_7,_8,_9,_a){
with(_7){
_attributes=_9;
_content=_a;
return _7;
}
}),new objj_method(sel_getUid("dealloc"),function(_b,_c){
with(_b){
objj_msgSendSuper({receiver:_b,super_class:objj_getClass("GSMarkupTagObject").super_class},"dealloc");
}
}),new objj_method(sel_getUid("attributes"),function(_d,_e){
with(_d){
return _attributes;
}
}),new objj_method(sel_getUid("content"),function(_f,_10){
with(_f){
return _content;
}
}),new objj_method(sel_getUid("localizableStrings"),function(_11,_12){
with(_11){
var a=objj_msgSend(CPMutableArray,"array");
var att;
var i,_13;
_13=objj_msgSend(_content,"count");
for(i=0;i<_13;i++){
var o=objj_msgSend(_content,"objectAtIndex:",i);
if(objj_msgSend(o,"isKindOfClass:",objj_msgSend(GSMarkupTagObject,"class"))){
var k=objj_msgSend(o,"localizableStrings");
if(k!=nil){
objj_msgSend(a,"addObjectsFromArray:",k);
}
}else{
if(objj_msgSend(o,"isKindOfClass:",objj_msgSend(CPString,"class"))){
objj_msgSend(a,"addObject:",o);
}
}
}
att=objj_msgSend(objj_msgSend(_11,"class"),"localizableAttributes");
_13=objj_msgSend(att,"count");
for(i=0;i<_13;i++){
var _14=objj_msgSend(att,"objectAtIndex:",i);
var _15=objj_msgSend(_attributes,"objectForKey:",_14);
if(_15!=nil){
objj_msgSend(a,"addObject:",_15);
}
}
return a;
}
}),new objj_method(sel_getUid("setAwaker:"),function(_16,_17,_18){
with(_16){
var i,_19;
_awaker=_18;
_19=objj_msgSend(_content,"count");
for(i=0;i<_19;i++){
var o=objj_msgSend(_content,"objectAtIndex:",i);
if(objj_msgSend(o,"isKindOfClass:",objj_msgSend(GSMarkupTagObject,"class"))){
objj_msgSend(o,"setAwaker:",_18);
}
}
}
}),new objj_method(sel_getUid("setPlatformObject:"),function(_1a,_1b,_1c){
with(_1a){
if(_platformObject==_1c){
return;
}
if(_platformObject!=nil){
objj_msgSend(_awaker,"deregisterObject:",_platformObject);
}
_platformObject=_1c;
if(_1c!=nil){
objj_msgSend(_awaker,"registerObject:",_1c);
}
}
}),new objj_method(sel_getUid("platformObject"),function(_1d,_1e){
with(_1d){
if(_platformObject==nil){
var _1f=objj_msgSend(_1d,"allocPlatformObject");
_1f=objj_msgSend(_1d,"initPlatformObject:",_1f);
_1f=objj_msgSend(_1d,"postInitPlatformObject:",_1f);
objj_msgSend(_1d,"setPlatformObject:",_1f);
}
return _platformObject;
}
}),new objj_method(sel_getUid("allocPlatformObject"),function(_20,_21){
with(_20){
var _22=objj_msgSend(_20,"class");
var _23=objj_msgSend(_22,"platformObjectClass");
if(objj_msgSend(_22,"useInstanceOfAttribute")){
var _24=objj_msgSend(_attributes,"objectForKey:","instanceOf");
if(_24!=nil){
var _25=CPClassFromString(_24);
if(_25!=Nil){
if(objj_msgSend(_25,"isSubclassOfClass:",_23)){
_23=_25;
}
}
}
}
return objj_msgSend(_23,"alloc");
}
}),new objj_method(sel_getUid("initPlatformObject:"),function(_26,_27,_28){
with(_26){
return objj_msgSend(_28,"init");
}
}),new objj_method(sel_getUid("postInitPlatformObject:"),function(_29,_2a,_2b){
with(_29){
return _2b;
}
}),new objj_method(sel_getUid("description"),function(_2c,_2d){
with(_2c){
return objj_msgSend(CPString,"stringWithFormat:","%@\var attributes =%@\var content =%@\var platformObject =%@",objj_msgSendSuper({receiver:_2c,super_class:objj_getClass("GSMarkupTagObject").super_class},"description"),objj_msgSend(_attributes,"description"),objj_msgSend(_content,"description"),objj_msgSend(_platformObject,"description"));
}
}),new objj_method(sel_getUid("intValueForAttribute:"),function(_2e,_2f,_30){
with(_2e){
return parseInt(objj_msgSend(_attributes,"objectForKey:",_30));
}
}),new objj_method(sel_getUid("stringValueForAttribute:"),function(_31,_32,_33){
with(_31){
return objj_msgSend(_attributes,"objectForKey:",_33);
}
}),new objj_method(sel_getUid("boolValueForAttribute:"),function(_34,_35,_36){
with(_34){
var _37=objj_msgSend(_attributes,"objectForKey:",_36);
if(_37==nil){
return -1;
}
switch(objj_msgSend(_37,"length")){
case 1:
var a=objj_msgSend(_37,"characterAtIndex:",0);
switch(a){
case "y":
case "Y":
return 1;
case "n":
case "N":
return 0;
}
return -1;
case 2:
var a=objj_msgSend(_37,"characterAtIndex:",0);
if(a=="n"||a=="N"){
var b=objj_msgSend(_37,"characterAtIndex:",1);
if(b=="o"||b=="O"){
return 0;
}
}
return -1;
case 3:
var a=objj_msgSend(_37,"characterAtIndex:",0);
if(a=="y"||a=="Y"){
var b=objj_msgSend(_37,"characterAtIndex:",1);
if(b=="e"||b=="E"){
var c=objj_msgSend(_37,"characterAtIndex:",2);
if(c=="s"||c=="S"){
return 1;
}
}
}
return -1;
}
return -1;
}
}),new objj_method(sel_getUid("setLocalizer:"),function(_38,_39,_3a){
with(_38){
var i,_3b;
_localizer=_3a;
_3b=objj_msgSend(_content,"count");
for(i=0;i<_3b;i++){
var o=objj_msgSend(_content,"objectAtIndex:",i);
if(objj_msgSend(o,"isKindOfClass:",objj_msgSend(GSMarkupTagObject,"class"))){
objj_msgSend(o,"setLocalizer:",_3a);
}
}
}
}),new objj_method(sel_getUid("localizedStringValueForAttribute:"),function(_3c,_3d,_3e){
with(_3c){
var _3f=objj_msgSend(_attributes,"objectForKey:",_3e);
if(_3f==nil){
return nil;
}else{
return _3f;
return objj_msgSend(_localizer,"localizeString:",_3f);
}
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("tagName"),function(_40,_41){
with(_40){
return nil;
}
}),new objj_method(sel_getUid("localizableAttributes"),function(_42,_43){
with(_42){
return nil;
}
}),new objj_method(sel_getUid("platformObjectClass"),function(_44,_45){
with(_44){
return Nil;
}
}),new objj_method(sel_getUid("useInstanceOfAttribute"),function(_46,_47){
with(_46){
return NO;
}
})]);
