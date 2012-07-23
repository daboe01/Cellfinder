@STATIC;1.0;i;17;GSMarkupTagView.jt;1326;
objj_executeFile("GSMarkupTagView.j",YES);
var _1=objj_allocateClassPair(GSMarkupTagControl,"GSMarkupTagSlider"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initPlatformObject:"),function(_3,_4,_5){
with(_3){
_5=objj_msgSendSuper({receiver:_3,super_class:objj_getClass("GSMarkupTagSlider").super_class},"initPlatformObject:",_5);
var _6;
var _7;
var _8;
_6=objj_msgSend(_attributes,"objectForKey:","min");
if(_6!=nil){
objj_msgSend(_5,"setMinValue:",objj_msgSend(_6,"doubleValue"));
}
_7=objj_msgSend(_attributes,"objectForKey:","max");
if(_7!=nil){
objj_msgSend(_5,"setMaxValue:",objj_msgSend(_7,"doubleValue"));
}
_8=objj_msgSend(_attributes,"objectForKey:","current");
if(_8!=nil){
objj_msgSend(_5,"setDoubleValue:",objj_msgSend(_8,"doubleValue"));
}
var _9;
_9=objj_msgSend(_attributes,"objectForKey:","height");
if(_9==nil){
objj_msgSend(_attributes,"setObject:forKey:","16","height");
}
var _a;
_a=objj_msgSend(_attributes,"objectForKey:","width");
if(_a==nil){
objj_msgSend(_attributes,"setObject:forKey:","83","width");
}
return _5;
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("tagName"),function(_b,_c){
with(_b){
return "slider";
}
}),new objj_method(sel_getUid("platformObjectClass"),function(_d,_e){
with(_d){
return objj_msgSend(CPSlider,"class");
}
})]);
