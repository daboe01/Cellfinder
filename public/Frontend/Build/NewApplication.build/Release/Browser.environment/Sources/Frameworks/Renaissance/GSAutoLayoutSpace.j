@STATIC;1.0;I;15;AppKit/CPView.jt;867;
objj_executeFile("AppKit/CPView.j",NO);
var _1=objj_allocateClassPair(CPView,"GSAutoLayoutSpace"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("autolayoutDefaultHorizontalAlignment"),function(_3,_4){
with(_3){
return GSAutoLayoutWeakExpand;
}
}),new objj_method(sel_getUid("autolayoutDefaultVerticalAlignment"),function(_5,_6){
with(_5){
return GSAutoLayoutWeakExpand;
}
}),new objj_method(sel_getUid("autolayoutDefaultHorizontalBorder"),function(_7,_8){
with(_7){
return 0;
}
}),new objj_method(sel_getUid("autolayoutDefaultVerticalBorder"),function(_9,_a){
with(_9){
return 0;
}
}),new objj_method(sel_getUid("sizeToFitContent"),function(_b,_c){
with(_b){
objj_msgSend(_b,"setFrameSize:",CPMakeSize(0,0));
}
}),new objj_method(sel_getUid("minimumSizeForContent"),function(_d,_e){
with(_d){
return CPMakeSize(0,0);
}
})]);
