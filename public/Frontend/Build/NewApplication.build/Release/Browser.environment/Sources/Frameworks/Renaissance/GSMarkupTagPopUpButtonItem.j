@STATIC;1.0;i;19;GSMarkupTagObject.jt;1360;
objj_executeFile("GSMarkupTagObject.j",YES);
var _1=objj_allocateClassPair(GSMarkupTagObject,"GSMarkupTagPopUpButtonItem"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("allocPlatformObject"),function(_3,_4){
with(_3){
return nil;
}
}),new objj_method(sel_getUid("initPlatformObject:"),function(_5,_6,_7){
with(_5){
var _8=objj_msgSend(_attributes,"objectForKey:","tag");
if(_8!=nil){
objj_msgSend(_7,"setTag:",objj_msgSend(_8,"intValue"));
}
var _9=objj_msgSend(_attributes,"objectForKey:","action");
if(_9!=nil){
var _a=CPSelectorFromString(_9);
if(_a==NULL){
CPLog("Warning: <%@> has non-existing action '%@'.  Ignored.",objj_msgSend(objj_msgSend(_5,"class"),"tagName"),_9);
}else{
objj_msgSend(_7,"setAction:",_a);
}
}
var _b=objj_msgSend(_attributes,"objectForKey:","keyEquivalent");
if(_b==nil){
_b=objj_msgSend(_attributes,"objectForKey:","key");
if(_b!=nil){
CPLog("The 'key' attribute of the <popUpButtonItem> tag is obsolete; please replace it with 'keyEquivalent'");
}
}
if(_b!=nil){
objj_msgSend(_7,"setKeyEquivalent:",_b);
}
return _7;
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("tagName"),function(_c,_d){
with(_c){
return "popUpButtonItem";
}
}),new objj_method(sel_getUid("localizableAttributes"),function(_e,_f){
with(_e){
return objj_msgSend(CPArray,"arrayWithObject:","title");
}
})]);
