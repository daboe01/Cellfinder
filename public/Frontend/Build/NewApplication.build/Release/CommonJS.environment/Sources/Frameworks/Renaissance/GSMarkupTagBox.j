@STATIC;1.0;i;17;GSMarkupTagView.jt;4130;
objj_executeFile("GSMarkupTagView.j",YES);
var _1=objj_allocateClassPair(CPView,"GSMarkupBoxContentView"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("firstSubview"),function(_3,_4){
with(_3){
var _5=objj_msgSend(_3,"subviews");
if(_5!=nil&&objj_msgSend(_5,"count")>0){
return objj_msgSend(_5,"objectAtIndex:",0);
}else{
return nil;
}
}
}),new objj_method(sel_getUid("sizeToFit"),function(_6,_7){
with(_6){
var _8=objj_msgSend(_6,"firstSubview");
objj_msgSend(_6,"setAutoresizesSubviews:",NO);
if(_8){
objj_msgSend(_6,"setFrameSize:",objj_msgSend(_8,"frame").size);
}else{
objj_msgSend(_6,"setFrameSize:",CPMakeSize(50,50));
}
objj_msgSend(_6,"setAutoresizesSubviews:",YES);
}
}),new objj_method(sel_getUid("autolayoutDefaultVerticalAlignment"),function(_9,_a){
with(_9){
var _b=objj_msgSend(_9,"firstSubview");
if(_b){
return objj_msgSend(_b,"autolayoutDefaultVerticalAlignment");
}else{
return objj_msgSendSuper({receiver:_9,super_class:objj_getClass("GSMarkupBoxContentView").super_class},"autolayoutDefaultVerticalAlignment");
}
}
}),new objj_method(sel_getUid("autolayoutDefaultHorizontalAlignment"),function(_c,_d){
with(_c){
var _e=objj_msgSend(_c,"firstSubview");
if(_e){
return objj_msgSend(_e,"autolayoutDefaultHorizontalAlignment");
}else{
return objj_msgSendSuper({receiver:_c,super_class:objj_getClass("GSMarkupBoxContentView").super_class},"autolayoutDefaultHorizontalAlignment");
}
}
})]);
var _1=objj_allocateClassPair(GSMarkupTagView,"GSMarkupTagBox"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initPlatformObject:"),function(_f,_10,_11){
with(_f){
_11=objj_msgSend(_11,"init");
var _12=objj_msgSend(_f,"localizedStringValueForAttribute:","title");
if(_12==nil){
}else{
objj_msgSend(_11,"setTitlePosition:",CPAtTop);
objj_msgSend(_11,"setTitle:",_12);
}
if(objj_msgSend(_f,"boolValueForAttribute:","hasBorder")==0){
objj_msgSend(_11,"setBorderType:",CPNoBorder);
}
if(_content!=nil&&objj_msgSend(_content,"count")>0){
var _13=objj_msgSend(objj_msgSend(_content,"objectAtIndex:",0),"platformObject");
if(objj_msgSend(_13,"isKindOfClass:",objj_msgSend(CPView,"class"))){
var v=objj_msgSend(GSMarkupBoxContentView,"new");
objj_msgSend(_11,"setAutoresizingMask:",objj_msgSend(_13,"autoresizingMask"));
objj_msgSend(v,"setAutoresizingMask:",CPViewWidthSizable|CPViewHeightSizable);
objj_msgSend(v,"addSubview:",_13);
objj_msgSend(_11,"setAutoresizesSubviews:",NO);
objj_msgSend(_11,"setContentView:",v);
objj_msgSend(v,"sizeToFit");
objj_msgSend(_11,"sizeToFit");
objj_msgSend(_11,"setAutoresizesSubviews:",YES);
}
}
return _11;
}
}),new objj_method(sel_getUid("gsAutoLayoutVAlignment"),function(_14,_15){
with(_14){
var _16=objj_msgSendSuper({receiver:_14,super_class:objj_getClass("GSMarkupTagBox").super_class},"gsAutoLayoutVAlignment");
if(_16!=255){
return _16;
}
var _17=objj_msgSend(_content,"objectAtIndex:",0);
if(objj_msgSend(_17,"isKindOfClass:",objj_msgSend(GSMarkupTagView,"class"))){
_16=objj_msgSend(_17,"gsAutoLayoutVAlignment");
if(_16!=255){
if(_16==GSAutoLayoutExpand||_16==GSAutoLayoutWeakExpand){
return _16;
}else{
return GSAutoLayoutAlignCenter;
}
}
}
return 255;
}
}),new objj_method(sel_getUid("gsAutoLayoutHAlignment"),function(_18,_19){
with(_18){
var _1a=objj_msgSendSuper({receiver:_18,super_class:objj_getClass("GSMarkupTagBox").super_class},"gsAutoLayoutHAlignment");
if(_1a!=255){
return _1a;
}
var _1b=objj_msgSend(_content,"objectAtIndex:",0);
if(objj_msgSend(_1b,"isKindOfClass:",objj_msgSend(GSMarkupTagView,"class"))){
_1a=objj_msgSend(_1b,"gsAutoLayoutHAlignment");
if(_1a!=255){
if(_1a==GSAutoLayoutExpand||_1a==GSAutoLayoutWeakExpand){
return _1a;
}else{
return GSAutoLayoutAlignCenter;
}
}
}
return 255;
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("tagName"),function(_1c,_1d){
with(_1c){
return "box";
}
}),new objj_method(sel_getUid("platformObjectClass"),function(_1e,_1f){
with(_1e){
return objj_msgSend(CPBox,"class");
}
}),new objj_method(sel_getUid("localizableAttributes"),function(_20,_21){
with(_20){
return objj_msgSend(CPArray,"arrayWithObject:","title");
}
})]);
