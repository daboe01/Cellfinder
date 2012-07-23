@STATIC;1.0;i;17;CPLayoutManager.jt;3202;
objj_executeFile("CPLayoutManager.j",YES);
CPLineSweepLeft=0;
CPLineSweepRight=1;
CPLineSweepDown=2;
CPLineSweepUp=3;
CPLineDoesntMoves=0;
CPLineMovesLeft=1;
CPLineMovesRight=2;
CPLineMovesDown=3;
CPLineMovesUp=4;
var _1=objj_allocateClassPair(CPObject,"CPTextContainer"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_size"),new objj_ivar("_textView"),new objj_ivar("_layoutManager"),new objj_ivar("_lineFragmentPadding")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initWithContainerSize:"),function(_3,_4,_5){
with(_3){
_3=objj_msgSendSuper({receiver:_3,super_class:objj_getClass("CPTextContainer").super_class},"init");
if(_3){
_size=_5;
_lineFragmentPadding=0;
}
return _3;
}
}),new objj_method(sel_getUid("init"),function(_6,_7){
with(_6){
return objj_msgSend(_6,"initWithContainerSize:",CPMakeSize(10000000,10000000));
}
}),new objj_method(sel_getUid("containerSize"),function(_8,_9){
with(_8){
return _size;
}
}),new objj_method(sel_getUid("setContainerSize:"),function(_a,_b,_c){
with(_a){
var _d=_size;
_size=_c;
if(_d.width!=_size.width){
objj_msgSend(_layoutManager,"invalidateLayoutForCharacterRange:isSoft:actualCharacterRange:",CPMakeRange(0,objj_msgSend(objj_msgSend(_layoutManager,"textStorage"),"length")),NO,NULL);
}
}
}),new objj_method(sel_getUid("setWidthTracksTextView:"),function(_e,_f,_10){
with(_e){
}
}),new objj_method(sel_getUid("setTextView:"),function(_11,_12,_13){
with(_11){
if(_textView){
objj_msgSend(_11,"_removeAllLines");
objj_msgSend(_textView,"setTextContainer:",nil);
}
_textView=_13;
if(_textView!=nil){
objj_msgSend(_textView,"setTextContainer:",_11);
}
objj_msgSend(_layoutManager,"textContainerChangedTextView:",_11);
}
}),new objj_method(sel_getUid("textView"),function(_14,_15){
with(_14){
return _textView;
}
}),new objj_method(sel_getUid("setLayoutManager:"),function(_16,_17,_18){
with(_16){
if(_layoutManager===_18){
return;
}
_layoutManager=_18;
}
}),new objj_method(sel_getUid("layoutManager"),function(_19,_1a){
with(_19){
return _layoutManager;
}
}),new objj_method(sel_getUid("setLineFragmentPadding:"),function(_1b,_1c,_1d){
with(_1b){
_lineFragmentPadding=_1d;
}
}),new objj_method(sel_getUid("lineFragmentPadding"),function(_1e,_1f){
with(_1e){
return _lineFragmentPadding;
}
}),new objj_method(sel_getUid("containsPoint:"),function(_20,_21,_22){
with(_20){
return CPRectContainsPoint(CPRectMake(0,0,_size.width,_size.height),_22);
}
}),new objj_method(sel_getUid("isSimpleRectangularTextContainer"),function(_23,_24){
with(_23){
return YES;
}
}),new objj_method(sel_getUid("lineFragmentRectForProposedRect:sweepDirection:movementDirection:remainingRect:"),function(_25,_26,_27,_28,_29,_2a){
with(_25){
var _2b=CPRectCreateCopy(_27);
if(_28!=CPLineSweepRight||_29!=CPLineMovesDown){
CPLog.trace("FIXME: unsupported sweep ("+_28+") or movement ("+_29+")");
return CPRectMakeZero();
}
if(_2b.origin.x+_2b.size.width>_size.width){
_2b.size.width=_size.width-_2b.origin.x;
}
if(_2b.size.width<0){
_2b=CPRectMakeZero();
}
if(_2a){
_2a.origin.x=_2b.origin.x+_2b.size.width;
_2a.origin.y=_2b.origin.y;
_2a.size.height=_2b.size.height;
_2a.size.width=_size.width-(_2b.origin.x+_2b.size.width);
}
return _2b;
}
})]);
