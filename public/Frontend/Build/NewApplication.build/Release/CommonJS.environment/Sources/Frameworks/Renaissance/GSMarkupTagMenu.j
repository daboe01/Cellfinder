@STATIC;1.0;i;19;GSMarkupTagObject.jt;2615;
objj_executeFile("GSMarkupTagObject.j",YES);
var _1=objj_allocateClassPair(GSMarkupTagObject,"GSMarkupTagMenu"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("allocPlatformObject"),function(_3,_4){
with(_3){
var _5=nil;
var _6=objj_msgSend(_attributes,"objectForKey:","type");
if(_6!=nil){
if(objj_msgSend(_6,"isEqualToString:","font")){
_5=objj_msgSend(objj_msgSend(CPFontManager,"sharedFontManager"),"fontMenu:",YES);
}else{
if(objj_msgSend(_6,"isEqualToString:","main")){
_5=objj_msgSend(CPApp,"mainMenu");
}
}
}
if(_5==nil){
_5=objj_msgSend(CPMenu,"alloc");
}
return _5;
}
}),new objj_method(sel_getUid("initPlatformObject:"),function(_7,_8,_9){
with(_7){
var _a=objj_msgSend(_7,"localizedStringValueForAttribute:","title");
if(objj_msgSend(objj_msgSend(_attributes,"objectForKey:","type"),"isEqualToString:","font")){
if(_a!=nil){
objj_msgSend(_9,"setTitle:",_a);
}
}else{
if(_a!=nil){
_9=objj_msgSend(_9,"initWithTitle:",_a);
}else{
_9=objj_msgSend(_9,"init");
}
}
var _b=objj_msgSend(_attributes,"objectForKey:","type");
if(_b!=nil){
if(objj_msgSend(_b,"isEqualToString:","windows")){
objj_msgSend(CPApp,"setWindowsMenu:",_9);
}else{
if(objj_msgSend(_b,"isEqualToString:","services")){
objj_msgSend(CPApp,"setServicesMenu:",_9);
}else{
if(objj_msgSend(_b,"isEqualToString:","font")){
}
}
}
}
var _c=objj_msgSend(_7,"boolValueForAttribute:","autoenablesItems");
if(_c==0){
objj_msgSend(_9,"setAutoenablesItems:",NO);
}
return _9;
}
}),new objj_method(sel_getUid("postInitPlatformObject:"),function(_d,_e,_f){
with(_d){
var _10=objj_msgSend(_attributes,"objectForKey:","type");
if(_10&&objj_msgSend(_10,"isEqualToString:","main")){
objj_msgSend(CPMenu,"setMenuBarVisible:",YES);
}
var _11=objj_msgSend(_content,"count");
for(var i=0;i<_11;i++){
var tag=objj_msgSend(_content,"objectAtIndex:",i);
var _12=objj_msgSend(tag,"platformObject");
if(objj_msgSend(_12,"isKindOfClass:",objj_msgSend(CPMenu,"class"))){
var _13=_12;
_12=objj_msgSend(objj_msgSend(CPMenuItem,"alloc"),"initWithTitle:action:keyEquivalent:",objj_msgSend(_13,"title"),NULL,"");
objj_msgSend(_12,"setSubmenu:",_13);
objj_msgSend(_f,"addItem:",_12);
objj_msgSend(_f,"setSubmenu:forItem:",_13,_12);
}else{
if(_12!=nil&&objj_msgSend(_12,"isKindOfClass:",objj_msgSend(CPMenuItem,"class"))){
objj_msgSend(_f,"addItem:",_12);
}
}
}
return _f;
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("tagName"),function(_14,_15){
with(_14){
return "menu";
}
}),new objj_method(sel_getUid("localizableAttributes"),function(_16,_17){
with(_16){
return objj_msgSend(CPArray,"arrayWithObject:","title");
}
})]);
