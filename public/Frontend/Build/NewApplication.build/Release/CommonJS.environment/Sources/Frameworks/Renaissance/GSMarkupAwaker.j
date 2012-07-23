@STATIC;1.0;I;21;Foundation/CPObject.jt;1002;
objj_executeFile("Foundation/CPObject.j",NO);
var _1=objj_allocateClassPair(CPObject,"GSMarkupAwaker"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("init"),function(_3,_4){
with(_3){
_objects=objj_msgSend(CPMutableSet,"new");
return _3;
}
}),new objj_method(sel_getUid("dealloc"),function(_5,_6){
with(_5){
objj_msgSendSuper({receiver:_5,super_class:objj_getClass("GSMarkupAwaker").super_class},"dealloc");
}
}),new objj_method(sel_getUid("registerObject:"),function(_7,_8,_9){
with(_7){
objj_msgSend(_objects,"addObject:",_9);
}
}),new objj_method(sel_getUid("deregisterObject:"),function(_a,_b,_c){
with(_a){
objj_msgSend(_objects,"removeObject:",_c);
}
}),new objj_method(sel_getUid("awakeObjects"),function(_d,_e){
with(_d){
var e=objj_msgSend(_objects,"objectEnumerator");
var _f;
while((_f=objj_msgSend(e,"nextObject"))!=nil){
if(objj_msgSend(_f,"respondsToSelector:",sel_getUid("awakeFromGSMarkup"))){
objj_msgSend(_f,"awakeFromGSMarkup");
}
}
}
})]);
