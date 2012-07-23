@STATIC;1.0;I;21;Foundation/CPObject.jt;374;
objj_executeFile("Foundation/CPObject.j",NO);
var _1=objj_allocateClassPair(Nil,"__project"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_2,[new objj_method(sel_getUid("version"),function(_3,_4){
with(_3){
var _5=objj_msgSend(CPBundle,"bundleForClass:",objj_msgSend(_3,"class"));
return objj_msgSend(_5,"objectForInfoDictionaryKey:","CPBundleVersion");
}
})]);
