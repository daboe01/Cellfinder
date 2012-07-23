@STATIC;1.0;i;17;GSMarkupTagView.jt;1329;
objj_executeFile("GSMarkupTagView.j",YES);
var _1=objj_allocateClassPair(GSMarkupTagView,"GSMarkupTagSplitView"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initPlatformObject:"),function(_3,_4,_5){
with(_3){
_5=objj_msgSend(_5,"init");
if(objj_msgSend(_3,"boolValueForAttribute:","vertical")==0){
objj_msgSend(_5,"setVertical:",NO);
}else{
objj_msgSend(_5,"setVertical:",YES);
}
var _6=objj_msgSend(_content,"count");
for(var i=0;i<_6;i++){
var _7=objj_msgSend(_content,"objectAtIndex:",i);
var v;
v=objj_msgSend(_7,"platformObject");
if(v!=nil&&objj_msgSend(v,"isKindOfClass:",objj_msgSend(CPView,"class"))){
objj_msgSend(_5,"addSubview:",v);
}
}
return _5;
}
}),new objj_method(sel_getUid("postInitPlatformObject:"),function(_8,_9,_a){
with(_8){
_a=objj_msgSendSuper({receiver:_8,super_class:objj_getClass("GSMarkupTagSplitView").super_class},"postInitPlatformObject:",_a);
var _b;
if(_b=objj_msgSend(_attributes,"objectForKey:","autosaveName")){
objj_msgSend(_a,"setAutosaveName:",_b);
}
objj_msgSend(_a,"adjustSubviews");
return _a;
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("tagName"),function(_c,_d){
with(_c){
return "splitView";
}
}),new objj_method(sel_getUid("platformObjectClass"),function(_e,_f){
with(_e){
return objj_msgSend(CPSplitView,"class");
}
})]);
