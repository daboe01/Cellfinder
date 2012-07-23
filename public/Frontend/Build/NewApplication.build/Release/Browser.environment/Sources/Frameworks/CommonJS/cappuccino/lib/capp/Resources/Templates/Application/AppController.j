@STATIC;1.0;I;21;Foundation/CPObject.jt;912;
objj_executeFile("Foundation/CPObject.j",NO);
var _1=objj_allocateClassPair(CPObject,"AppController"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("applicationDidFinishLaunching:"),function(_3,_4,_5){
with(_3){
var _6=objj_msgSend(objj_msgSend(CPWindow,"alloc"),"initWithContentRect:styleMask:",CGRectMakeZero(),CPBorderlessBridgeWindowMask),_7=objj_msgSend(_6,"contentView");
var _8=objj_msgSend(objj_msgSend(CPTextField,"alloc"),"initWithFrame:",CGRectMakeZero());
objj_msgSend(_8,"setStringValue:","Hello World!");
objj_msgSend(_8,"setFont:",objj_msgSend(CPFont,"boldSystemFontOfSize:",24));
objj_msgSend(_8,"sizeToFit");
objj_msgSend(_8,"setAutoresizingMask:",CPViewMinXMargin|CPViewMaxXMargin|CPViewMinYMargin|CPViewMaxYMargin);
objj_msgSend(_8,"setCenter:",objj_msgSend(_7,"center"));
objj_msgSend(_7,"addSubview:",_8);
objj_msgSend(_6,"orderFront:",_3);
}
})]);
