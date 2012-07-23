@STATIC;1.0;I;15;AppKit/CPView.jt;5340;
objj_executeFile("AppKit/CPView.j",NO);
CPTextDidBeginEditingNotification="CPTextDidBeginEditingNotification";
CPTextDidChangeNotification="CPTextDidChangeNotification";
CPTextDidEndEditingNotification="CPTextDidEndEditingNotification";
CPParagraphSeparatorCharacter=8233;
CPLineSeparatorCharacter=8232;
CPTabCharacter=9;
CPFormFeedCharacter=12;
CPNewlineCharacter=10;
CPCarriageReturnCharacter=13;
CPEnterCharacter=3;
CPBackspaceCharacter=8;
CPBackTabCharacter=25;
CPDeleteCharacter=127;
var _1=objj_allocateClassPair(CPView,"CPText"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("changeFont:"),function(_3,_4,_5){
with(_3){
CPLog.error("-[CPText "+_4+"] subclass responsibility");
}
}),new objj_method(sel_getUid("copy:"),function(_6,_7,_8){
with(_6){
var _9=objj_msgSend(_6,"selectedRange");
if(_9.length<1){
return;
}
var _a=objj_msgSend(CPPasteboard,"generalPasteboard"),_b=objj_msgSend(_stringValue,"substringWithRange:",_9);
objj_msgSend(_a,"declareTypes:owner:",[CPStringPboardType],nil);
objj_msgSend(_a,"setString:forType:",_b,CPStringPboardType);
}
}),new objj_method(sel_getUid("copyFont:"),function(_c,_d,_e){
with(_c){
CPLog.error("-[CPText "+_d+"] subclass responsibility");
}
}),new objj_method(sel_getUid("cut:"),function(_f,_10,_11){
with(_f){
objj_msgSend(_f,"copy:",_11);
objj_msgSend(_f,"replaceCharactersInRange:withString:",objj_msgSend(_f,"selectedRange"),"");
}
}),new objj_method(sel_getUid("delete:"),function(_12,_13,_14){
with(_12){
CPLog.error("-[CPText "+_13+"] subclass responsibility");
}
}),new objj_method(sel_getUid("font:"),function(_15,_16,_17){
with(_15){
CPLog.error("-[CPText "+_16+"] subclass responsibility");
return nil;
}
}),new objj_method(sel_getUid("isHorizontallyResizable"),function(_18,_19){
with(_18){
CPLog.error("-[CPText "+_19+"] subclass responsibility");
return NO;
}
}),new objj_method(sel_getUid("isRichText"),function(_1a,_1b){
with(_1a){
CPLog.error("-[CPText "+_1b+"] subclass responsibility");
return NO;
}
}),new objj_method(sel_getUid("isRulerVisible"),function(_1c,_1d){
with(_1c){
CPLog.error("-[CPText "+_1d+"] subclass responsibility");
return NO;
}
}),new objj_method(sel_getUid("isVerticallyResizable"),function(_1e,_1f){
with(_1e){
CPLog.error("-[CPText "+_1f+"] subclass responsibility");
return NO;
}
}),new objj_method(sel_getUid("maxSize"),function(_20,_21){
with(_20){
CPLog.error("-[CPText "+_21+"] subclass responsibility");
return CPMakeSize(0,0);
}
}),new objj_method(sel_getUid("minSize"),function(_22,_23){
with(_22){
CPLog.error("-[CPText "+_23+"] subclass responsibility");
return CPMakeSize(0,0);
}
}),new objj_method(sel_getUid("paste:"),function(_24,_25,_26){
with(_24){
var _27=objj_msgSend(CPPasteboard,"generalPasteboard"),_28=objj_msgSend(_27,"stringForType:",CPStringPboardType);
if(_28){
objj_msgSend(_24,"replaceCharactersInRange:withString:",objj_msgSend(_24,"selectedRange"),_28);
}
}
}),new objj_method(sel_getUid("pasteFont:"),function(_29,_2a,_2b){
with(_29){
CPLog.error("-[CPText "+_2a+"] subclass responsibility");
}
}),new objj_method(sel_getUid("replaceCharactersInRange:withString:"),function(_2c,_2d,_2e,_2f){
with(_2c){
CPLog.error("-[CPText "+_2d+"] subclass responsibility");
}
}),new objj_method(sel_getUid("scrollRangeToVisible:"),function(_30,_31,_32){
with(_30){
CPLog.error("-[CPText "+_31+"] subclass responsibility");
}
}),new objj_method(sel_getUid("selectedAll:"),function(_33,_34,_35){
with(_33){
CPLog.error("-[CPText "+_34+"] subclass responsibility");
}
}),new objj_method(sel_getUid("selectedRange"),function(_36,_37){
with(_36){
CPLog.error("-[CPText "+_37+"] subclass responsibility");
return CPMakeRange(CPNotFound,0);
}
}),new objj_method(sel_getUid("setFont:"),function(_38,_39,_3a){
with(_38){
CPLog.error("-[CPText "+_39+"] subclass responsibility");
}
}),new objj_method(sel_getUid("setFont:rang:"),function(_3b,_3c,_3d,_3e){
with(_3b){
CPLog.error("-[CPText "+_3c+"] subclass responsibility");
}
}),new objj_method(sel_getUid("setHorizontallyResizable:"),function(_3f,_40,_41){
with(_3f){
CPLog.error("-[CPText "+_40+"] subclass responsibility");
}
}),new objj_method(sel_getUid("setMaxSize:"),function(_42,_43,_44){
with(_42){
CPLog.error("-[CPText "+_43+"] subclass responsibility");
}
}),new objj_method(sel_getUid("setMinSize:"),function(_45,_46,_47){
with(_45){
CPLog.error("-[CPText "+_46+"] subclass responsibility");
}
}),new objj_method(sel_getUid("setString:"),function(_48,_49,_4a){
with(_48){
objj_msgSend(_48,"replaceCharactersInRange:withString:",CPMakeRange(0,objj_msgSend(objj_msgSend(_48,"string"),"length")),_4a);
}
}),new objj_method(sel_getUid("setUsesFontPanel:"),function(_4b,_4c,_4d){
with(_4b){
CPLog.error("-[CPText "+_4c+"] subclass responsibility");
}
}),new objj_method(sel_getUid("setVerticallyResizable:"),function(_4e,_4f,_50){
with(_4e){
CPLog.error("-[CPText "+_4f+"] subclass responsibility");
}
}),new objj_method(sel_getUid("string"),function(_51,_52){
with(_51){
CPLog.error("-[CPText "+_52+"] subclass responsibility");
return nil;
}
}),new objj_method(sel_getUid("underline:"),function(_53,_54,_55){
with(_53){
CPLog.error("-[CPText "+_54+"] subclass responsibility");
}
}),new objj_method(sel_getUid("usesFontPanel"),function(_56,_57){
with(_56){
CPLog.error("-[CPText "+_57+"] subclass responsibility");
return NO;
}
})]);
