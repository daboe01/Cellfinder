@STATIC;1.0;I;21;Foundation/CPObject.jt;803;
objj_executeFile("Foundation/CPObject.j",NO);
var _1=objj_allocateClassPair(CPObject,"GSMarkupLocalizer"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initWithTable:bundle:"),function(_3,_4,_5,_6){
with(_3){
_bundle=_6;
_table=_5;
return _3;
}
}),new objj_method(sel_getUid("dealloc"),function(_7,_8){
with(_7){
objj_msgSendSuper({receiver:_7,super_class:objj_getClass("GSMarkupLocalizer").super_class},"dealloc");
}
}),new objj_method(sel_getUid("localizeString:"),function(_9,_a,_b){
with(_9){
var _c;
_c=objj_msgSend(_bundle,"localizedStringForKey:value:table:",_b,nil,_table);
if(objj_msgSend(_c,"isEqualToString:","")||objj_msgSend(_c,"isEqualToString:",_b)){
_c=objj_msgSend(_bundle,"localizedStringForKey:value:table:",_b,_b,nil);
}
return _c;
}
})]);
