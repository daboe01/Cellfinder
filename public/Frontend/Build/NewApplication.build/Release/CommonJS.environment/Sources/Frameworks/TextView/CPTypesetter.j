@STATIC;1.0;I;21;Foundation/CPObject.ji;20;CPSimpleTypesetter.jt;1721;
objj_executeFile("Foundation/CPObject.j",NO);
CPTypesetterZeroAdvancementAction=(1<<0);
CPTypesetterWhitespaceAction=(1<<1);
CPSTypesetterHorizontalTabAction=(1<<2);
CPTypesetterLineBreakAction=(1<<3);
CPTypesetterParagraphBreakAction=(1<<4);
CPTypesetterContainerBreakAction=(1<<5);
var _1=Nil;
var _2=objj_allocateClassPair(CPObject,"CPTypesetter"),_3=_2.isa;
objj_registerClassPair(_2);
class_addMethods(_2,[new objj_method(sel_getUid("actionForControlCharacterAtIndex:"),function(_4,_5,_6){
with(_4){
CPLog.error("-[CPTypesetter "+cmd+"] subclass responsability");
return CPTypesetterZeroAdvancementAction;
}
}),new objj_method(sel_getUid("layoutManager"),function(_7,_8){
with(_7){
CPLog.error("-[CPTypesetter "+cmd+"] subclass responsability");
return nil;
}
}),new objj_method(sel_getUid("currentTextContainer"),function(_9,_a){
with(_9){
CPLog.error("-[CPTypesetter "+cmd+"] subclass responsability");
return nil;
}
}),new objj_method(sel_getUid("textContainers"),function(_b,_c){
with(_b){
CPLog.error("-[CPTypesetter "+cmd+"] subclass responsability");
return nil;
}
}),new objj_method(sel_getUid("layoutGlyphsInLayoutManager:startingAtGlyphIndex:maxNumberOfLineFragments:nextGlyphIndex:"),function(_d,_e,_f,_10,_11,_12){
with(_d){
CPLog.error("-[CPTypesetter "+cmd+"] subclass responsability");
}
})]);
class_addMethods(_3,[new objj_method(sel_getUid("sharedSystemTypesetter"),function(_13,_14){
with(_13){
return objj_msgSend(_1,"sharedInstance");
}
}),new objj_method(sel_getUid("_setSystemTypesetterFactory:"),function(_15,_16,_17){
with(_15){
_1=_17;
}
})]);
objj_executeFile("CPSimpleTypesetter.j",YES);
objj_msgSend(CPTypesetter,"_setSystemTypesetterFactory:",objj_msgSend(CPSimpleTypesetter,"class"));
