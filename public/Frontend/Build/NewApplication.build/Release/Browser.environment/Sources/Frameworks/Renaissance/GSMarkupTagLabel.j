@STATIC;1.0;i;17;GSMarkupTagView.jt;1618;
objj_executeFile("GSMarkupTagView.j",YES);
var _1=objj_allocateClassPair(GSMarkupTagView,"GSMarkupTagLabel"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initPlatformObject:"),function(_3,_4,_5){
with(_3){
_5=objj_msgSendSuper({receiver:_3,super_class:objj_getClass("GSMarkupTagLabel").super_class},"initPlatformObject:",_5);
objj_msgSend(_5,"setEditable:",NO);
objj_msgSend(_5,"setBezeled:",NO);
objj_msgSend(_5,"setBordered:",NO);
var _6=objj_msgSend(_3,"boolValueForAttribute:","selectable");
if(_6==0){
objj_msgSend(_5,"setSelectable:",NO);
}else{
objj_msgSend(_5,"setSelectable:",YES);
}
var c=objj_msgSend(_3,"colorValueForAttribute:","textColor");
if(c==nil){
c=objj_msgSend(_3,"colorValueForAttribute:","color");
if(c!=nil){
CPLog("The 'color' attribute of the <label> tag is obsolete; please replace it with 'textColor'");
}
}
if(c!=nil){
objj_msgSend(_5,"setTextColor:",c);
}
var c=objj_msgSend(_3,"colorValueForAttribute:","backgroundColor");
if(c!=nil){
objj_msgSend(_5,"setBackgroundColor:",c);
objj_msgSend(_5,"setDrawsBackground:",YES);
}else{
objj_msgSend(_5,"setDrawsBackground:",NO);
}
var _7=objj_msgSend(_content,"count");
if(_7>0){
var s=objj_msgSend(_content,"objectAtIndex:",0);
if(s!=nil&&objj_msgSend(s,"isKindOfClass:",objj_msgSend(CPString,"class"))){
objj_msgSend(_5,"setStringValue:",s);
}
}
return _5;
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("tagName"),function(_8,_9){
with(_8){
return "label";
}
}),new objj_method(sel_getUid("platformObjectClass"),function(_a,_b){
with(_a){
return objj_msgSend(CPTextField,"class");
}
})]);
