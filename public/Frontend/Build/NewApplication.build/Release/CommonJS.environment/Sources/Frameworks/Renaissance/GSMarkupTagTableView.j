@STATIC;1.0;i;20;GSMarkupTagControl.jt;3903;
objj_executeFile("GSMarkupTagControl.j",YES);
var _1=objj_getClass("CPTableView");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"CPTableView\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("sizeToFit"),function(_3,_4){
with(_3){
}
})]);
var _1=objj_allocateClassPair(GSMarkupTagControl,"GSMarkupTagTableView"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initPlatformObject:"),function(_5,_6,_7){
with(_5){
_7=objj_msgSendSuper({receiver:_5,super_class:objj_getClass("GSMarkupTagTableView").super_class},"initPlatformObject:",_7);
var _8=objj_msgSend(_attributes,"objectForKey:","doubleAction");
if(_8!=nil){
objj_msgSend(_7,"setDoubleAction:",CPSelectorFromString(_8));
}
var _9=objj_msgSend(_5,"boolValueForAttribute:","allowsColumnReordering");
if(_9==1){
objj_msgSend(_7,"setAllowsColumnReordering:",YES);
}else{
if(_9==0){
objj_msgSend(_7,"setAllowsColumnReordering:",NO);
}
}
var _9=objj_msgSend(_5,"boolValueForAttribute:","allowsColumnResizing");
if(_9==1){
objj_msgSend(_7,"setAllowsColumnResizing:",YES);
}else{
if(_9==0){
objj_msgSend(_7,"setAllowsColumnResizing:",NO);
}
}
var _9=objj_msgSend(_5,"boolValueForAttribute:","allowsMultipleSelection");
if(_9==1){
objj_msgSend(_7,"setAllowsMultipleSelection:",YES);
}else{
if(_9==0){
objj_msgSend(_7,"setAllowsMultipleSelection:",NO);
}
}
var _9=objj_msgSend(_5,"boolValueForAttribute:","allowsEmptySelection");
if(_9==1){
objj_msgSend(_7,"setAllowsEmptySelection:",YES);
}else{
if(_9==0){
objj_msgSend(_7,"setAllowsEmptySelection:",NO);
}
}
var _9=objj_msgSend(_5,"boolValueForAttribute:","usesAlternatingRowBackgroundColors")||objj_msgSend(_5,"boolValueForAttribute:","zebra");
if(_9==1){
objj_msgSend(_7,"setUsesAlternatingRowBackgroundColors:",YES);
}
var _9=objj_msgSend(_5,"boolValueForAttribute:","allowsColumnSelection");
if(_9==1){
objj_msgSend(_7,"setAllowsColumnSelection:",YES);
}else{
if(_9==0){
objj_msgSend(_7,"setAllowsColumnSelection:",NO);
}
}
var c=objj_msgSend(_5,"colorValueForAttribute:","backgroundColor");
if(c!=nil){
objj_msgSend(_7,"setBackgroundColor:",c);
}
var _9=objj_msgSend(_5,"boolValueForAttribute:","drawsGrid");
if(_9==1){
objj_msgSend(_7,"setDrawsGrid:",YES);
}else{
if(_9==0){
objj_msgSend(_7,"setDrawsGrid:",NO);
}
}
var c=objj_msgSend(_5,"colorValueForAttribute:","gridColor");
if(c!=nil){
objj_msgSend(_7,"setGridColor:",c);
}
var i,_a;
_a=objj_msgSend(_content,"count");
for(i=0;i<_a;i++){
var _b=objj_msgSend(_content,"objectAtIndex:",i);
if(_b!=nil&&objj_msgSend(_b,"isKindOfClass:",objj_msgSend(GSMarkupTagTableColumn,"class"))){
objj_msgSend(_7,"addTableColumn:",objj_msgSend(_b,"platformObject"));
}
}
return _7;
}
}),new objj_method(sel_getUid("postInitPlatformObject:"),function(_c,_d,_e){
with(_c){
objj_msgSend(_e,"sizeToFit");
var _f=objj_msgSend(_attributes,"objectForKey:","autosaveName");
if(_f!=nil){
objj_msgSend(_e,"setAutosaveName:",_f);
objj_msgSend(_e,"setAutosaveTableColumns:",YES);
}
return _e;
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("tagName"),function(_10,_11){
with(_10){
return "tableView";
}
}),new objj_method(sel_getUid("platformObjectClass"),function(_12,_13){
with(_12){
return objj_msgSend(CPTableView,"class");
}
})]);
var _1=objj_allocateClassPair(GSMarkupTagObject,"GSMarkupTagSortDescriptor"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initPlatformObject:"),function(_14,_15,_16){
with(_14){
_16=objj_msgSend(CPSortDescriptor,"sortDescriptorWithKey:ascending:",objj_msgSend(_14,"stringValueForAttribute:","key"),objj_msgSend(_14,"boolValueForAttribute:","ascending")!=0);
return _16;
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("tagName"),function(_17,_18){
with(_17){
return "sortDescriptor";
}
}),new objj_method(sel_getUid("platformObjectClass"),function(_19,_1a){
with(_19){
return nil;
}
})]);
