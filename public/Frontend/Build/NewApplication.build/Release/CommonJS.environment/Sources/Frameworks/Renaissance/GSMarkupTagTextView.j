@STATIC;1.0;i;38;../../Frameworks/TextView/CPTextView.jt;2292;
objj_executeFile("../../Frameworks/TextView/CPTextView.j",YES);
var _1=objj_allocateClassPair(GSMarkupTagView,"GSMarkupTagTextView"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initPlatformObject:"),function(_3,_4,_5){
with(_3){
_5=objj_msgSendSuper({receiver:_3,super_class:objj_getClass("GSMarkupTagTextView").super_class},"initPlatformObject:",_5);
var _6=objj_msgSend(_content,"count");
if(_6>0){
var s=objj_msgSend(_content,"objectAtIndex:",0);
if(s!=nil&&objj_msgSend(s,"isKindOfClass:",objj_msgSend(CPString,"class"))){
objj_msgSend(_5,"setString:",s);
}
}
var _7=objj_msgSend(_3,"boolValueForAttribute:","editable");
if(_7==1){
objj_msgSend(_5,"setEditable:",YES);
}else{
if(_7==0){
objj_msgSend(_5,"setEditable:",NO);
}
}
var _8=objj_msgSend(_3,"boolValueForAttribute:","selectable");
if(_8==1){
objj_msgSend(_5,"setSelectable:",YES);
}else{
if(_8==0){
objj_msgSend(_5,"setSelectable:",NO);
}
}
var _9;
_9=objj_msgSend(_3,"boolValueForAttribute:","richText");
if(_9==1){
objj_msgSend(_5,"setRichText:",YES);
}else{
if(_9==0){
objj_msgSend(_5,"setRichText:",NO);
}
}
_9=objj_msgSend(_3,"boolValueForAttribute:","usesFontPanel");
if(_9==1){
objj_msgSend(_5,"setUsesFontPanel:",YES);
}else{
if(_9==0){
objj_msgSend(_5,"setUsesFontPanel:",NO);
}
}
_9=objj_msgSend(_3,"boolValueForAttribute:","allowsUndo");
if(_9==1){
objj_msgSend(_5,"setAllowsUndo:",YES);
}else{
if(_9==0){
objj_msgSend(_5,"setAllowsUndo:",NO);
}
}
_9=objj_msgSend(_3,"boolValueForAttribute:","usesRuler");
if(_9==1){
objj_msgSend(_5,"setUsesRuler:",YES);
}else{
if(_9==0){
objj_msgSend(_5,"setUsesRuler:",NO);
}
}
_9=objj_msgSend(_3,"boolValueForAttribute:","importGraphics");
if(_9==1){
objj_msgSend(_5,"setImportsGraphics:",YES);
}else{
if(_9==0){
objj_msgSend(_5,"setImportsGraphics:",NO);
}
}
return _5;
}
}),new objj_method(sel_getUid("postInitPlatformObject:"),function(_a,_b,_c){
with(_a){
return objj_msgSendSuper({receiver:_a,super_class:objj_getClass("GSMarkupTagTextView").super_class},"postInitPlatformObject:",_c);
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("tagName"),function(_d,_e){
with(_d){
return "textView";
}
}),new objj_method(sel_getUid("platformObjectClass"),function(_f,_10){
with(_f){
return objj_msgSend(CPTextView,"class");
}
})]);
