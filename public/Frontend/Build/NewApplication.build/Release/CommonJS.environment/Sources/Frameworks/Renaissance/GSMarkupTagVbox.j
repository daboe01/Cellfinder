@STATIC;1.0;i;17;GSMarkupTagView.ji;18;GSAutoLayoutVBox.jt;1866;
objj_executeFile("GSMarkupTagView.j",YES);
objj_executeFile("GSAutoLayoutVBox.j",YES);
var _1=objj_allocateClassPair(GSMarkupTagView,"GSMarkupTagVbox"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initPlatformObject:"),function(_3,_4,_5){
with(_3){
_5=objj_msgSend(_5,"init");
var _6=objj_msgSend(_attributes,"objectForKey:","type");
if(_6!=nil){
if(objj_msgSend(_6,"isEqualToString:","proportional")){
objj_msgSend(_5,"setBoxType:",GSAutoLayoutProportionalBox);
}
}
var i,_7=objj_msgSend(_content,"count");
for(i=0;i<_7;i++){
var v=objj_msgSend(_content,"objectAtIndex:",i);
var _8=objj_msgSend(v,"platformObject");
if(_8!=nil&&objj_msgSend(_8,"isKindOfClass:",objj_msgSend(CPView,"class"))){
objj_msgSend(_5,"addView:",_8);
var _9=objj_msgSend(v,"gsAutoLayoutHAlignment");
if(_9!=255){
objj_msgSend(_5,"setHorizontalAlignment:forView:",_9,_8);
}
var _a=objj_msgSend(v,"gsAutoLayoutVAlignment");
if(_a!=255){
objj_msgSend(_5,"setVerticalAlignment:forView:",_a,_8);
}
var _b=objj_msgSend(v,"attributes");
var _c=objj_msgSend(_b,"valueForKey:","hborder");
if(_c==nil){
_c=objj_msgSend(_b,"valueForKey:","border");
}
if(_c!=nil){
objj_msgSend(_5,"setHorizontalBorder:forView:",objj_msgSend(_c,"intValue"),_8);
}
var _d=objj_msgSend(_b,"valueForKey:","vborder");
if(_d==nil){
_d=objj_msgSend(_b,"valueForKey:","border");
}
if(_d!=nil){
objj_msgSend(_5,"setVerticalBorder:forView:",objj_msgSend(_d,"intValue"),_8);
}
var _e=objj_msgSend(_b,"valueForKey:","proportion");
if(_e!=nil){
objj_msgSend(_5,"setProportion:forView:",objj_msgSend(_e,"floatValue"),_8);
}
}
}
return _5;
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("tagName"),function(_f,_10){
with(_f){
return "vbox";
}
}),new objj_method(sel_getUid("platformObjectClass"),function(_11,_12){
with(_11){
return objj_msgSend(GSAutoLayoutVBox,"class");
}
})]);
