@STATIC;1.0;t;3933;
var _1=objj_allocateClassPair(CPImageView,"CPImageViewProp"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("setObjectValue:"),function(_3,_4,_5){
with(_3){
var _6=objj_msgSend(_5,"size");
if(_6){
objj_msgSend(_3,"setBounds:",CPMakeRect(0,0,_6.width,_6.height));
}
objj_msgSendSuper({receiver:_3,super_class:objj_getClass("CPImageViewProp").super_class},"setObjectValue:",_5);
}
})]);
var _1=objj_allocateClassPair(GSMarkupTagControl,"GSMarkupTagImage"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initPlatformObject:"),function(_7,_8,_9){
with(_7){
_9=objj_msgSendSuper({receiver:_7,super_class:objj_getClass("GSMarkupTagImage").super_class},"initPlatformObject:",_9);
objj_msgSend(_9,"setEditable:",NO);
var _a=objj_msgSend(_7,"boolValueForAttribute:","editable");
if(_a==1){
objj_msgSend(_9,"setEditable:",YES);
}else{
if(_a==0){
objj_msgSend(_9,"setEditable:",NO);
}
}
var _b=objj_msgSend(_attributes,"objectForKey:","name");
if(_b!=nil){
objj_msgSend(_9,"setImage:",objj_msgSend(CPImage,"imageNamed:",_b));
}
var _b=objj_msgSend(_attributes,"objectForKey:","ressource");
if(_b!=nil){
objj_msgSend(_9,"setImage:",objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:",objj_msgSend(CPString,"stringWithFormat:","%@/%@",objj_msgSend(objj_msgSend(CPBundle,"mainBundle"),"resourcePath"),_b)));
}
var _c=objj_msgSend(_attributes,"objectForKey:","scaling");
if(_c!=nil&&objj_msgSend(_c,"length")>0){
switch(objj_msgSend(_c,"characterAtIndex:",0)){
case "n":
if(objj_msgSend(_c,"isEqualToString:","none")){
objj_msgSend(_9,"setImageScaling:",CPScaleNone);
}
break;
case "p":
if(objj_msgSend(_c,"isEqualToString:","proportionally")){
objj_msgSend(_9,"setImageScaling:",CPScaleProportionally);
}
break;
case "t":
if(objj_msgSend(_c,"isEqualToString:","toFit")){
objj_msgSend(_9,"setImageScaling:",CPScaleToFit);
}
break;
}
}
var _d=objj_msgSend(_attributes,"objectForKey:","imageAlignment");
if(_d==nil){
_d=objj_msgSend(_attributes,"objectForKey:","alignment");
if(_d!=nil){
CPLog("The 'alignment' attribute has been renamed to 'imageAlignment'.  Please update your gsmarkup files");
}
}
if(_d!=nil&&objj_msgSend(_d,"length")>0){
switch(objj_msgSend(_d,"characterAtIndex:",0)){
case "b":
if(objj_msgSend(_d,"isEqualToString:","bottom")){
objj_msgSend(_9,"setImageAlignment:",CPImageAlignBottom);
}else{
if(objj_msgSend(_d,"isEqualToString:","bottomLeft")){
objj_msgSend(_9,"setImageAlignment:",CPImageAlignBottomLeft);
}else{
if(objj_msgSend(_d,"isEqualToString:","bottomRight")){
objj_msgSend(_9,"setImageAlignment:",CPImageAlignBottomRight);
}
}
}
break;
case "c":
if(objj_msgSend(_d,"isEqualToString:","center")){
objj_msgSend(_9,"setImageAlignment:",CPImageAlignCenter);
}
break;
case "l":
if(objj_msgSend(_d,"isEqualToString:","left")){
objj_msgSend(_9,"setImageAlignment:",CPImageAlignLeft);
}
break;
case "r":
if(objj_msgSend(_d,"isEqualToString:","right")){
objj_msgSend(_9,"setImageAlignment:",CPImageAlignRight);
}
break;
case "t":
if(objj_msgSend(_d,"isEqualToString:","top")){
objj_msgSend(_9,"setImageAlignment:",CPImageAlignTop);
}else{
if(objj_msgSend(_d,"isEqualToString:","topLeft")){
objj_msgSend(_9,"setImageAlignment:",CPImageAlignTopLeft);
}else{
if(objj_msgSend(_d,"isEqualToString:","topRight")){
objj_msgSend(_9,"setImageAlignment:",CPImageAlignTopRight);
}
}
}
break;
}
}
var _e;
_e=objj_msgSend(_attributes,"objectForKey:","height");
if(_e==nil){
objj_msgSend(_attributes,"setObject:forKey:","100","height");
}
var _f;
_f=objj_msgSend(_attributes,"objectForKey:","width");
if(_f==nil){
objj_msgSend(_attributes,"setObject:forKey:","100","width");
}
return _9;
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("tagName"),function(_10,_11){
with(_10){
return "image";
}
}),new objj_method(sel_getUid("platformObjectClass"),function(_12,_13){
with(_12){
return objj_msgSend(CPImageViewProp,"class");
}
})]);
