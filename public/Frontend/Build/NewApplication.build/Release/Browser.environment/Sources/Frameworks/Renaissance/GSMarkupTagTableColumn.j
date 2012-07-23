@STATIC;1.0;i;19;GSMarkupTagObject.jt;1714;
objj_executeFile("GSMarkupTagObject.j",YES);
var _1=objj_allocateClassPair(GSMarkupTagObject,"GSMarkupTagTableColumn"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initPlatformObject:"),function(_3,_4,_5){
with(_3){
var _6=objj_msgSend(_attributes,"objectForKey:","identifier");
if(_6!=nil){
_5=objj_msgSend(_5,"initWithIdentifier:",_6);
}else{
_5=objj_msgSend(_5,"init");
}
var _7=objj_msgSend(_3,"boolValueForAttribute:","editable");
if(_7==1){
objj_msgSend(_5,"setEditable:",YES);
}else{
if(_7==0){
objj_msgSend(_5,"setEditable:",NO);
}
}
var _8=objj_msgSend(_3,"localizedStringValueForAttribute:","title");
if(_8!=nil){
objj_msgSend(objj_msgSend(_5,"headerView"),"setStringValue:",_8);
}
var _9=objj_msgSend(_attributes,"objectForKey:","minWidth");
if(_9!=nil){
objj_msgSend(_5,"setMinWidth:",objj_msgSend(_9,"intValue"));
}
var _9=objj_msgSend(_attributes,"objectForKey:","maxWidth");
if(_9!=nil){
objj_msgSend(_5,"setMaxWidth:",objj_msgSend(_9,"intValue"));
}
var _9=objj_msgSend(_attributes,"objectForKey:","width");
if(_9!=nil){
objj_msgSend(_5,"setWidth:",objj_msgSend(_9,"intValue"));
}
var _a=objj_msgSend(_3,"boolValueForAttribute:","resizable");
if(_a==1){
objj_msgSend(_5,"setResizable:",YES);
}else{
if(_a==0){
objj_msgSend(_5,"setResizable:",NO);
}
}
return _5;
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("tagName"),function(_b,_c){
with(_b){
return "tableColumn";
}
}),new objj_method(sel_getUid("platformObjectClass"),function(_d,_e){
with(_d){
return objj_msgSend(CPTableColumn,"class");
}
}),new objj_method(sel_getUid("localizableAttributes"),function(_f,_10){
with(_f){
return objj_msgSend(CPArray,"arrayWithObject:","title");
}
})]);
