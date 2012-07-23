@STATIC;1.0;i;20;GSMarkupTagControl.ji;28;GSMarkupTagPopUpButtonItem.jt;3362;
objj_executeFile("GSMarkupTagControl.j",YES);
objj_executeFile("GSMarkupTagPopUpButtonItem.j",YES);
var _1=objj_allocateClassPair(GSMarkupTagControl,"GSMarkupTagPopUpButton"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initPlatformObject:"),function(_3,_4,_5){
with(_3){
_5=objj_msgSendSuper({receiver:_3,super_class:objj_getClass("GSMarkupTagPopUpButton").super_class},"initPlatformObject:",_5);
var _6=objj_msgSend(_3,"localizedStringValueForAttribute:","title");
if(_6!=nil){
objj_msgSend(_5,"setTitle:",_6);
}
var i,_7=objj_msgSend(_content,"count");
for(i=0;i<_7;i++){
var _8=objj_msgSend(_content,"objectAtIndex:",i);
var _6=objj_msgSend(_8,"localizedStringValueForAttribute:","title");
if(_6==nil){
_6="";
}
objj_msgSend(_5,"addItemWithTitle:",_6);
var _9=objj_msgSend(_5,"lastItem");
_9=objj_msgSend(_8,"initPlatformObject:",_9);
objj_msgSend(_8,"setPlatformObject:",_9);
}
var _a=objj_msgSend(_3,"boolValueForAttribute:","pullsDown");
if(_a==1){
objj_msgSend(_5,"setPullsDown:",YES);
}else{
if(_a==0){
objj_msgSend(_5,"setPullsDown:",NO);
}
}
var _b=objj_msgSend(_3,"boolValueForAttribute:","autoenablesItems");
if(_b==0){
objj_msgSend(_5,"setAutoenablesItems:",NO);
}
return _5;
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("tagName"),function(_c,_d){
with(_c){
return "popUpButton";
}
}),new objj_method(sel_getUid("platformObjectClass"),function(_e,_f){
with(_e){
return objj_msgSend(CPPopUpButton,"class");
}
}),new objj_method(sel_getUid("localizableAttributes"),function(_10,_11){
with(_10){
return objj_msgSend(CPArray,"arrayWithObject:","title");
}
})]);
var _1=objj_getClass("CPPopUpButton");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"CPPopUpButton\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("_consolidateItemArrayLengthToArray:"),function(_12,_13,_14){
with(_12){
var _15=objj_msgSend(_12,"itemArray");
var l=_15.length;
var l1=_14.length;
var j;
if(l==l1){
return;
}else{
if(l<l1){
for(j=0;j<(l1-l);j++){
objj_msgSend(_12,"addItemWithTitle:","");
}
}else{
var _16=l1;
for(j=0;j<(l-l1);j++){
objj_msgSend(_12,"removeItemAtIndex:",_16);
}
}
}
}
}),new objj_method(sel_getUid("setIntegerValue:"),function(_17,_18,_19){
with(_17){
objj_msgSend(_17,"selectItemWithTag:",_19);
}
}),new objj_method(sel_getUid("integerValue"),function(_1a,_1b){
with(_1a){
return objj_msgSend(objj_msgSend(_1a,"selectedItem"),"tag");
}
}),new objj_method(sel_getUid("_reverseSetBinding"),function(_1c,_1d){
with(_1c){
var _1e=objj_msgSend(objj_msgSend(_1c,"class"),"_binderClassForBinding:","integerValue"),_1f=objj_msgSend(_1e,"getBinding:forObject:","integerValue",_1c);
objj_msgSend(_1f,"reverseSetValueFor:","integerValue");
}
}),new objj_method(sel_getUid("setItemArray:"),function(_20,_21,_22){
with(_20){
var _23=objj_msgSend(_20,"itemArray");
objj_msgSend(_20,"_consolidateItemArrayLengthToArray:",_22);
var j,l1=_22.length;
for(j=0;j<l1;j++){
objj_msgSend(_23[j],"setTitle:",_22[j]);
}
}
}),new objj_method(sel_getUid("tagArray"),function(_24,_25){
with(_24){
return [];
}
}),new objj_method(sel_getUid("setTagArray:"),function(_26,_27,_28){
with(_26){
var _29=objj_msgSend(_26,"itemArray");
objj_msgSend(_26,"_consolidateItemArrayLengthToArray:",_28);
var j,l1=_28.length;
for(j=0;j<l1;j++){
objj_msgSend(_29[j],"setTag:",_28[j]);
}
}
})]);
