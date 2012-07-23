@STATIC;1.0;i;17;GSMarkupTagView.jt;3106;
objj_executeFile("GSMarkupTagView.j",YES);
var _1=objj_allocateClassPair(GSMarkupTagView,"GSMarkupTagScrollView"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initPlatformObject:"),function(_3,_4,_5){
with(_3){
_5=objj_msgSend(_5,"init");
if(objj_msgSend(_3,"boolValueForAttribute:","hasHorizontalScroller")==0){
objj_msgSend(_5,"setHasHorizontalScroller:",NO);
}else{
objj_msgSend(_5,"setHasHorizontalScroller:",YES);
}
if(objj_msgSend(_3,"boolValueForAttribute:","hasVerticalScroller")==0){
objj_msgSend(_5,"setHasVerticalScroller:",NO);
}else{
objj_msgSend(_5,"setHasVerticalScroller:",YES);
}
var _6=CPNoBorder;
var _7=objj_msgSend(_attributes,"objectForKey:","borderType");
if(_7!=nil){
if(objj_msgSend(_7,"isEqualToString:","none")==YES){
_6=CPNoBorder;
}else{
if(objj_msgSend(_7,"isEqualToString:","line")==YES){
_6=CPLineBorder;
}else{
if(objj_msgSend(_7,"isEqualToString:","bezel")==YES){
_6=CPBezelBorder;
}else{
if(objj_msgSend(_7,"isEqualToString:","groove")==YES){
_6=CPGrooveBorder;
}
}
}
}
}
objj_msgSend(_5,"setBorderType:",_6);
if(objj_msgSend(_content,"count")>0){
var _8=objj_msgSend(_content,"objectAtIndex:",0);
var v;
v=objj_msgSend(_8,"platformObject");
if(v!=nil&&objj_msgSend(v,"isKindOfClass:",objj_msgSend(CPView,"class"))){
objj_msgSend(_5,"setDocumentView:",v);
var _9=CPViewNotSizable;
if(!objj_msgSend(_5,"hasHorizontalScroller")){
_9|=CPViewWidthSizable;
var _a=objj_msgSend(objj_msgSend(_5,"contentView"),"frame");
var _b=objj_msgSend(objj_msgSend(_5,"documentView"),"frame");
_b.size.width=_a.size.width;
objj_msgSend(objj_msgSend(_5,"documentView"),"setFrame:",_b);
}
objj_msgSend(v,"setAutoresizingMask:",_9);
}
}
return _5;
}
}),new objj_method(sel_getUid("postInitPlatformObject:"),function(_c,_d,_e){
with(_c){
_e=objj_msgSendSuper({receiver:_c,super_class:objj_getClass("GSMarkupTagScrollView").super_class},"postInitPlatformObject:",_e);
if(objj_msgSend(objj_msgSend(_e,"documentView"),"isKindOfClass:",objj_msgSend(CPTextView,"class"))){
var _f=objj_msgSend(objj_msgSend(_e,"contentView"),"frame");
var tv=objj_msgSend(_e,"documentView");
objj_msgSend(tv,"setFrame:",_f);
objj_msgSend(tv,"setHorizontallyResizable:",NO);
objj_msgSend(tv,"setVerticallyResizable:",YES);
objj_msgSend(tv,"setMinSize:",CPMakeSize(0,0));
objj_msgSend(tv,"setMaxSize:",CPMakeSize(10000000,10000000));
objj_msgSend(tv,"setAutoresizingMask:",CPViewHeightSizable|CPViewWidthSizable);
objj_msgSend(objj_msgSend(tv,"textContainer"),"setContainerSize:",CPMakeSize(_f.size.width,10000000));
objj_msgSend(objj_msgSend(tv,"textContainer"),"setWidthTracksTextView:",YES);
}
var _10=objj_msgSend(_c,"intValueForAttribute:","width");
if(_10){
var _11=objj_msgSend(objj_msgSend(_e,"contentView"),"frame");
_11.size.width=_10;
objj_msgSend(objj_msgSend(_e,"contentView"),"setFrame:",_11);
}
return _e;
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("tagName"),function(_12,_13){
with(_12){
return "scrollView";
}
}),new objj_method(sel_getUid("platformObjectClass"),function(_14,_15){
with(_14){
return objj_msgSend(CPScrollView,"class");
}
})]);
