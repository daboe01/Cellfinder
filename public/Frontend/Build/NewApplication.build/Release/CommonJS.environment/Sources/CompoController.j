@STATIC;1.0;I;21;Foundation/CPObject.jI;25;Renaissance/Renaissance.jt;10121;
objj_executeFile("Foundation/CPObject.j",NO);
objj_executeFile("Renaissance/Renaissance.j",NO);
var _1=objj_getClass("FSObject");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"FSObject\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("unpercentedValueForKey:"),function(_3,_4,_5){
with(_3){
var r=objj_msgSend(_3,"valueForKey:",_5);
return objj_msgSend(r,"stringByReplacingOccurrencesOfString:withString:","%","");
}
})]);
var _1=objj_allocateClassPair(CPFormatter,"ReversePercentageFormatter"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("stringForObjectValue:"),function(_6,_7,_8){
with(_6){
return objj_msgSend(_8,"stringByReplacingOccurrencesOfString:withString:","%","");
}
}),new objj_method(sel_getUid("objectValueForString:error:"),function(_9,_a,_b,_c){
with(_9){
if(!objj_msgSend(_b,"isKindOfClass:",objj_msgSend(CPString,"class"))){
_b=objj_msgSend(_b,"stringValue");
}
return objj_msgSend(_b,"stringByAppendingString:","%");
}
})]);
var _1=objj_allocateClassPair(CPSlider,"OptionSlider"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("mouseDown:"),function(_d,_e,_f){
with(_d){
if(objj_msgSend(_f,"modifierFlags")){
objj_msgSend(_d,"setContinuous:",YES);
}else{
objj_msgSend(_d,"setContinuous:",NO);
}
objj_msgSendSuper({receiver:_d,super_class:objj_getClass("OptionSlider").super_class},"mouseDown:",_f);
}
})]);
var _1=objj_allocateClassPair(CPControl,"DualPercentageSlider"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("slider1"),new objj_ivar("slider2")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("setFrame:"),function(_10,_11,_12){
with(_10){
objj_msgSendSuper({receiver:_10,super_class:objj_getClass("DualPercentageSlider").super_class},"setFrame:",_12);
objj_msgSend(slider1,"setFrame:",CPMakeRect(0,0,_12.size.width,32));
objj_msgSend(slider2,"setFrame:",CPMakeRect(0,32,_12.size.width,32));
}
}),new objj_method(sel_getUid("_newSlider"),function(_13,_14){
with(_13){
var _15=objj_msgSend(objj_msgSend(OptionSlider,"alloc"),"initWithFrame:",CPRectMakeZero());
objj_msgSend(_15,"setMinValue:",0);
objj_msgSend(_15,"setMaxValue:",100);
objj_msgSend(_15,"setTarget:",_13);
objj_msgSend(_15,"setAction:",sel_getUid("_sliderChanged:"));
objj_msgSend(_15,"setContinuous:",NO);
objj_msgSend(_13,"addSubview:",_15);
return _15;
}
}),new objj_method(sel_getUid("_sliderChanged:"),function(_16,_17,_18){
with(_16){
objj_msgSend(_16,"_reverseSetBinding");
}
}),new objj_method(sel_getUid("initWithFrame:"),function(_19,_1a,_1b){
with(_19){
if(_19=objj_msgSendSuper({receiver:_19,super_class:objj_getClass("DualPercentageSlider").super_class},"initWithFrame:",_1b)){
slider1=objj_msgSend(_19,"_newSlider");
slider2=objj_msgSend(_19,"_newSlider");
}
return _19;
}
}),new objj_method(sel_getUid("setObjectValue:"),function(_1c,_1d,_1e){
with(_1c){
objj_msgSendSuper({receiver:_1c,super_class:objj_getClass("DualPercentageSlider").super_class},"setObjectValue:",_1e);
var re=new RegExp("^([0-9]+)%s*x([0-9]+)%");
var _1f=_1e.match(re);
objj_msgSend(slider1,"setIntValue:",_1f[1]);
objj_msgSend(slider2,"setIntValue:",_1f[2]);
}
}),new objj_method(sel_getUid("objectValue"),function(_20,_21){
with(_20){
return objj_msgSend(CPString,"stringWithFormat:","%sx%s",objj_msgSend(slider1,"intValue")+"%",objj_msgSend(slider2,"intValue")+"%");
}
}),new objj_method(sel_getUid("autolayoutDefaultHorizontalAlignment"),function(_22,_23){
with(_22){
return GSAutoLayoutExpand;
}
})]);
var _1=objj_allocateClassPair(GSMarkupTagSlider,"GSMarkupTagOptionSlider"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_2,[new objj_method(sel_getUid("tagName"),function(_24,_25){
with(_24){
return "optionSlider";
}
}),new objj_method(sel_getUid("platformObjectClass"),function(_26,_27){
with(_26){
return objj_msgSend(OptionSlider,"class");
}
})]);
var _1=objj_allocateClassPair(GSMarkupTagControl,"GSMarkupTagDualSlider"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initPlatformObject:"),function(_28,_29,_2a){
with(_28){
_2a=objj_msgSendSuper({receiver:_28,super_class:objj_getClass("GSMarkupTagDualSlider").super_class},"initPlatformObject:",_2a);
objj_msgSend(_attributes,"setObject:forKey:","64","height");
objj_msgSend(_attributes,"setObject:forKey:","83","width");
return _2a;
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("tagName"),function(_2b,_2c){
with(_2b){
return "dualSlider";
}
}),new objj_method(sel_getUid("platformObjectClass"),function(_2d,_2e){
with(_2d){
return objj_msgSend(DualPercentageSlider,"class");
}
})]);
var _1=objj_allocateClassPair(CPObject,"CompoController"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_panel"),new objj_ivar("_myAppController"),new objj_ivar("_myNameTable")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("observeValueForKeyPath:ofObject:change:context:"),function(_2f,_30,_31,_32,_33,_34){
with(_2f){
var _35=objj_msgSend(_myAppController,"imageControllersForIDTrial:",_34);
objj_msgSend(_35,"makeObjectsPerformSelector:withObject:",sel_getUid("reload:"),_2f);
}
}),new objj_method(sel_getUid("initWithCompo:andAppController:"),function(_36,_37,_38,_39){
with(_36){
_myAppController=_39;
var _3a=objj_msgSend(_myAppController,"store");
var _3b=objj_msgSend(objj_msgSend(FSEntity,"alloc"),"initWithName:andStore:","parameter_lists",_3a);
objj_msgSend(_3b,"setColumns:",objj_msgSend(CPArray,"arrayWithObjects:","id","idpatch_parameter","value"));
objj_msgSend(_3b,"setPk:","id");
var _3c=objj_msgSend(_38,"valueForKey:","inputParams");
_myNameTable=objj_msgSend(CPMutableDictionary,"new");
var i,l=objj_msgSend(_3c,"count");
var _3d="<gsmarkup><objects><window id=\"panel\" title=\"Inspector\" HUD=\"yes\" closable=\"yes\" x=\"600\" y=\"30\" width=\"200\">";
_3d+="<vbox id=\"toplevel_container\">";
for(i=0;i<l;i++){
var _3e=objj_msgSend(_3c,"objectAtIndex:",i);
switch(objj_msgSend(_3e,"valueForKey:","type")){
case "1":
var _3f="";
if(objj_msgSend(objj_msgSend(_3e,"valueForKey:","range2"),"hasSuffix:","%")){
objj_msgSend(_3e,"setFormatter:forColumnName:",objj_msgSend(ReversePercentageFormatter,"new"),"value");
}
var _40=objj_msgSend(_3e,"unpercentedValueForKey:","range1");
var _41=objj_msgSend(_3e,"unpercentedValueForKey:","range2");
var _42=objj_msgSend(_3e,"unpercentedValueForKey:","value");
_3d+="<hbox><label textColor=\"white\" valign=\"center\" halign=\"min\" width=\"100\">"+objj_msgSend(_3e,"valueForKey:","patch")+"("+objj_msgSend(_3e,"valueForKey:","name")+")"+"</label><label textColor=\"white\" valign=\"center\" halign=\"min\" width=\"20\">"+objj_msgSend(_3e,"valueForKey:","range1")+"</label>"+"<optionSlider continuous=\"NO\" id=\"_connectme1_"+i+"\" valign=\"center\" halign=\"expand\"  min=\""+_40+"\" max=\""+_41+"\" current=\""+_42+"\" /><label textColor=\"white\" valign=\"center\" halign=\"min\" width=\"20\">"+objj_msgSend(_3e,"valueForKey:","range2")+"</label><textField width=\"50\" valign=\"center\" halign=\"center\" id=\"_connectme2_"+i+"\"></textField></hbox>";
break;
case "5":
var _43="_popconnectme"+objj_msgSend(_3e,"valueForKey:","idparameter");
_3d+="<hbox><label textColor=\"white\" valign=\"center\" halign=\"min\" width=\"100\">"+objj_msgSend(_3e,"valueForKey:","patch")+"("+objj_msgSend(_3e,"valueForKey:","name")+")"+"</label><popUpButton id=\"_popupcntme_"+i+"\" valign=\"center\" halign=\"expand\" itemsBinding=\"#CPOwner._myNameTable."+_43+".arrangedObjects.value\" "+"valueBinding=\"#CPOwner._myNameTable."+_43+".selection.id\"/></hbox>";
var ac=objj_msgSend(FSArrayController,"new");
var _44=objj_msgSend(CPPredicate,"predicateWithFormat:argumentArray:","idpatch_parameter=='"+objj_msgSend(_3e,"valueForKey:","idparameter")+"'",nil);
objj_msgSend(ac,"setContent:",objj_msgSend(objj_msgSend(_3b,"allObjects"),"filteredArrayUsingPredicate:",_44));
objj_msgSend(_myNameTable,"setObject:forKey:",ac,_43);
objj_msgSend(ac,"setEntity:",_3b);
break;
default:
var _42=objj_msgSend(_3e,"valueForKey:","value");
var re=new RegExp("^([0-9%]+)s*x([0-9%]+)");
var _45=_42.match(re);
if(_45){
_3d+="<hbox><label textColor=\"white\" valign=\"center\" halign=\"min\" width=\"100\">"+objj_msgSend(_3e,"valueForKey:","patch")+"("+objj_msgSend(_3e,"valueForKey:","name")+")"+"</label><dualSlider id=\"_connectme1_"+i+"\"/><textField width=\"50\" valign=\"center\" halign=\"expand\" id=\"_connectme2_"+i+"\"></textField></hbox>";
}else{
_3d+="<hbox><label textColor=\"white\" valign=\"center\" halign=\"min\" width=\"100\">"+objj_msgSend(_3e,"valueForKey:","patch")+"("+objj_msgSend(_3e,"valueForKey:","name")+")"+"</label> <textField width=\"50\" valign=\"center\" halign=\"expand\" id=\"_connectme2_"+i+"\"></textField></hbox>";
}
}
}
_3d+="</vbox></window></objects><connectors>"+"<outlet source=\"#CPOwner\" target =\"panel\" label =\"_panel\"/></connectors></gsmarkup>";
var _46=objj_msgSend(CPBundle,"loadGSMarkupData:externalNameTable:localizableStringsTable:inBundle:tagMapping:",objj_msgSend(CPData,"dataWithRawString:",_3d),objj_msgSend(CPDictionary,"dictionaryWithObject:forKey:",_36,"CPOwner"),nil,nil,nil);
var _47=objj_msgSend(objj_msgSend(_46,"nameTable"),"allValues");
var i,l=objj_msgSend(_47,"count");
for(i=0;i<l;i++){
var _3e=objj_msgSend(_47,"objectAtIndex:",i);
var _48;
if(_48=objj_msgSend(objj_msgSend(_3e,"attributes"),"objectForKey:","id")){
var po=objj_msgSend(_3e,"platformObject");
var cip;
if(objj_msgSend(_48,"hasPrefix:","_connectme")){
var idx=parseInt(objj_msgSend(_48,"substringFromIndex:",12));
cip=objj_msgSend(_3c,"objectAtIndex:",idx);
objj_msgSend(po,"bind:toObject:withKeyPath:options:",CPValueBinding,cip,"value",nil);
}else{
if(objj_msgSend(_48,"hasPrefix:","_popupcntme")){
var idx=parseInt(objj_msgSend(_48,"substringFromIndex:",12));
cip=objj_msgSend(_3c,"objectAtIndex:",idx);
objj_msgSend(po,"bind:toObject:withKeyPath:options:","integerValue",cip,"value",nil);
}
}
if(cip){
objj_msgSend(cip,"addObserver:forKeyPath:options:context:",_36,"value",CPKeyValueObservingOptionNew,objj_msgSend(_38,"valueForKeyPath:","trial.id"));
}
}
}
}
})]);
