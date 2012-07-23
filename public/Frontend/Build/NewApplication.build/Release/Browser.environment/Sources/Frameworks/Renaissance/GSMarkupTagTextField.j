@STATIC;1.0;i;20;GSMarkupTagControl.jt;2039;
objj_executeFile("GSMarkupTagControl.j",YES);
var _1=objj_allocateClassPair(GSMarkupTagControl,"GSMarkupTagTextField"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initPlatformObject:"),function(_3,_4,_5){
with(_3){
_5=objj_msgSendSuper({receiver:_3,super_class:objj_getClass("GSMarkupTagTextField").super_class},"initPlatformObject:",_5);
var _6=objj_msgSend(_3,"boolValueForAttribute:","editable");
if(_6==0){
objj_msgSend(_5,"setEditable:",NO);
}else{
objj_msgSend(_5,"setEditable:",YES);
}
var _7=objj_msgSend(_3,"boolValueForAttribute:","selectable");
if(_7==0){
objj_msgSend(_5,"setSelectable:",NO);
}else{
objj_msgSend(_5,"setSelectable:",YES);
}
if(objj_msgSend(_5,"respondsToSelector:",sel_getUid("setAllowsEditingTextAttributes:"))){
var _8=objj_msgSend(_3,"boolValueForAttribute:","allowsEditingTextAttributes");
if(_8==1){
objj_msgSend(_5,"setAllowsEditingTextAttributes:",YES);
}else{
objj_msgSend(_5,"setAllowsEditingTextAttributes:",NO);
}
}
if(objj_msgSend(_5,"respondsToSelector:",sel_getUid("setImportsGraphics:"))){
var _9=objj_msgSend(_3,"boolValueForAttribute:","importsGraphics");
if(_9==1){
objj_msgSend(_5,"setImportsGraphics:",YES);
}else{
objj_msgSend(_5,"setImportsGraphics:",NO);
}
}
var c=objj_msgSend(_3,"colorValueForAttribute:","textColor");
if(c!=nil){
objj_msgSend(_5,"setTextColor:",c);
}
var c=objj_msgSend(_3,"colorValueForAttribute:","backgroundColor");
if(c!=nil){
objj_msgSend(_5,"setBackgroundColor:",c);
}
var _a=objj_msgSend(_3,"boolValueForAttribute:","drawsBackground");
if(_a==1){
objj_msgSend(_5,"setDrawsBackground:",YES);
}else{
if(_a==0){
objj_msgSend(_5,"setDrawsBackground:",NO);
}
}
if(_content!=nil){
objj_msgSend(_5,"setStringValue:",_content);
}
objj_msgSend(_5,"setBezeled:",YES);
return _5;
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("tagName"),function(_b,_c){
with(_b){
return "textField";
}
}),new objj_method(sel_getUid("platformObjectClass"),function(_d,_e){
with(_d){
return objj_msgSend(CPTextField,"class");
}
})]);
