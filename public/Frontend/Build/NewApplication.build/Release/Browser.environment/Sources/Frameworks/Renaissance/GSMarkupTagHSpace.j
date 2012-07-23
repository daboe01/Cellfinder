@STATIC;1.0;i;17;GSMarkupTagView.ji;20;GSAutoLayoutHSpace.jt;786;
objj_executeFile("GSMarkupTagView.j",YES);
objj_executeFile("GSAutoLayoutHSpace.j",YES);
var _1=objj_allocateClassPair(GSMarkupTagView,"GSMarkupTagHspace"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_2,[new objj_method(sel_getUid("tagName"),function(_3,_4){
with(_3){
return "hspace";
}
}),new objj_method(sel_getUid("platformObjectClass"),function(_5,_6){
with(_5){
return objj_msgSend(GSAutoLayoutHSpace,"class");
}
})]);
var _1=objj_allocateClassPair(GSMarkupTagView,"GSMarkupTagVspace"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_2,[new objj_method(sel_getUid("tagName"),function(_7,_8){
with(_7){
return "vspace";
}
}),new objj_method(sel_getUid("platformObjectClass"),function(_9,_a){
with(_9){
return objj_msgSend(GSAutoLayoutVSpace,"class");
}
})]);
