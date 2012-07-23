@STATIC;1.0;I;21;Foundation/CPObject.jt;7345;
objj_executeFile("Foundation/CPObject.j",NO);
var _1=objj_allocateClassPair(CPObject,"GSMarkupConnector"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initWithAttributes:content:"),function(_3,_4,_5,_6){
with(_3){
return _3;
}
}),new objj_method(sel_getUid("attributes"),function(_7,_8){
with(_7){
return objj_msgSend(CPDictionary,"dictionary");
}
}),new objj_method(sel_getUid("content"),function(_9,_a){
with(_9){
return nil;
}
}),new objj_method(sel_getUid("establishConnectionUsingNameTable:"),function(_b,_c,_d){
with(_b){
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("tagName"),function(_e,_f){
with(_e){
return nil;
}
}),new objj_method(sel_getUid("getObjectForIdString:usingNameTable:"),function(_10,_11,_12,_13){
with(_10){
var r=objj_msgSend(_12,"rangeOfString:",".");
if(r.location==CPNotFound){
return objj_msgSend(_13,"objectForKey:",_12);
}else{
var _14=objj_msgSend(_12,"substringToIndex:",r.location);
var _15=objj_msgSend(_12,"substringFromIndex:",CPMaxRange(r));
var _16=objj_msgSend(_13,"objectForKey:",_14);
return objj_msgSend(_16,"valueForKeyPath:",_15);
}
}
}),new objj_method(sel_getUid("getPlatformObjectForIdString:usingNameTable:"),function(_17,_18,_19,_1a){
with(_17){
var r=objj_msgSend(_19,"rangeOfString:",".");
if(r.location==CPNotFound){
return objj_msgSend(objj_msgSend(_1a,"objectForKey:",_19),"platformObject");
}else{
var _1b=objj_msgSend(_19,"substringToIndex:",r.location);
var _1c=objj_msgSend(_19,"substringFromIndex:",CPMaxRange(r));
var _1d=objj_msgSend(objj_msgSend(_1a,"objectForKey:",_1b),"platformObject");
return objj_msgSend(_1d,"valueForKeyPath:",_1c);
}
}
})]);
var _1=objj_allocateClassPair(GSMarkupConnector,"GSMarkupOneToOneConnector"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_source"),new objj_ivar("_target"),new objj_ivar("_label")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initWithSource:target:label:"),function(_1e,_1f,_20,_21,_22){
with(_1e){
if(objj_msgSend(_20,"hasPrefix:","#")){
_20=objj_msgSend(_20,"substringFromIndex:",1);
}
_source=_20;
if(objj_msgSend(_21,"hasPrefix:","#")){
_21=objj_msgSend(_21,"substringFromIndex:",1);
}
_target=_21;
_label=_22;
return _1e;
}
}),new objj_method(sel_getUid("initWithAttributes:content:"),function(_23,_24,_25,_26){
with(_23){
return objj_msgSend(_23,"initWithSource:target:label:",objj_msgSend(_25,"objectForKey:","source"),objj_msgSend(_25,"objectForKey:","target"),objj_msgSend(_25,"objectForKey:","label"));
}
}),new objj_method(sel_getUid("attributes"),function(_27,_28){
with(_27){
var d;
var _29;
var _2a;
_29=objj_msgSend(CPString,"stringWithFormat:","#%@",_source);
_2a=objj_msgSend(CPString,"stringWithFormat:","#%@",_target);
d=objj_msgSend(CPDictionary,"dictionaryWithObjectsAndKeys:",_29,"source",_2a,"target",_label,"label",nil);
return d;
}
}),new objj_method(sel_getUid("content"),function(_2b,_2c){
with(_2b){
return nil;
}
}),new objj_method(sel_getUid("setSource:"),function(_2d,_2e,_2f){
with(_2d){
_source=_2f;
}
}),new objj_method(sel_getUid("source"),function(_30,_31){
with(_30){
return _source;
}
}),new objj_method(sel_getUid("setTarget:"),function(_32,_33,_34){
with(_32){
_target=_34;
}
}),new objj_method(sel_getUid("target"),function(_35,_36){
with(_35){
return _target;
}
}),new objj_method(sel_getUid("setLabel:"),function(_37,_38,_39){
with(_37){
_label=_39;
}
}),new objj_method(sel_getUid("label"),function(_3a,_3b){
with(_3a){
return _label;
}
}),new objj_method(sel_getUid("description"),function(_3c,_3d){
with(_3c){
return objj_msgSend(CPString,"stringWithFormat:","<%@ source=\"%@\" target=\"%@\" label=\"%@\">",CPStringFromClass(objj_msgSend(_3c,"class")),_source,_target,_label);
}
})]);
var _1=objj_allocateClassPair(GSMarkupOneToOneConnector,"GSMarkupControlConnector"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initWithAttributes:content:"),function(_3e,_3f,_40,_41){
with(_3e){
var _42;
_42=objj_msgSend(_40,"objectForKey:","action");
if(_42==nil){
_42=objj_msgSend(_40,"objectForKey:","label");
}
return objj_msgSend(_3e,"initWithSource:target:label:",objj_msgSend(_40,"objectForKey:","source"),objj_msgSend(_40,"objectForKey:","target"),_42);
}
}),new objj_method(sel_getUid("attributes"),function(_43,_44){
with(_43){
var d;
var _45;
var _46;
_45=objj_msgSend(CPString,"stringWithFormat:","#%@",_source);
_46=objj_msgSend(CPString,"stringWithFormat:","#%@",_target);
d=objj_msgSend(CPDictionary,"dictionaryWithObjectsAndKeys:",_45,"source",_46,"target",_label,"action",nil);
return d;
}
}),new objj_method(sel_getUid("establishConnectionUsingNameTable:"),function(_47,_48,_49){
with(_47){
var _4a=CPSelectorFromString(_label);
var _4b=objj_msgSend(GSMarkupConnector,"getObjectForIdString:usingNameTable:",_source,_49);
var _4c=objj_msgSend(GSMarkupConnector,"getObjectForIdString:usingNameTable:",_target,_49);
objj_msgSend(_4b,"setAction:",_4a);
objj_msgSend(_4b,"setTarget:",_4c);
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("tagName"),function(_4d,_4e){
with(_4d){
return "control";
}
})]);
var _1=objj_allocateClassPair(GSMarkupOneToOneConnector,"GSMarkupOutletConnector"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initWithAttributes:content:"),function(_4f,_50,_51,_52){
with(_4f){
var _53;
_53=objj_msgSend(_51,"objectForKey:","key");
if(_53==nil){
_53=objj_msgSend(_51,"objectForKey:","label");
}
return objj_msgSend(_4f,"initWithSource:target:label:",objj_msgSend(_51,"objectForKey:","source"),objj_msgSend(_51,"objectForKey:","target"),_53);
}
}),new objj_method(sel_getUid("establishConnectionUsingNameTable:"),function(_54,_55,_56){
with(_54){
var _57=objj_msgSend(GSMarkupConnector,"getObjectForIdString:usingNameTable:",_source,_56);
var _58=objj_msgSend(GSMarkupConnector,"getObjectForIdString:usingNameTable:",_target,_56);
objj_msgSend(_57,"setValue:forKey:",_58,objj_msgSend(_label,"substringFromIndex:",objj_msgSend(_label,"characterAtIndex:",0)=="#"?1:0));
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("tagName"),function(_59,_5a){
with(_59){
return "outlet";
}
})]);
var _1=objj_allocateClassPair(GSMarkupOneToOneConnector,"GSMarkupBindingConnector"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_entityName")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initWithAttributes:content:"),function(_5b,_5c,_5d,_5e){
with(_5b){
var o=objj_msgSend(_5b,"initWithSource:target:label:",objj_msgSend(_5d,"objectForKey:","source"),objj_msgSend(_5d,"objectForKey:","target"),objj_msgSend(_5d,"objectForKey:","label"));
_entityName=objj_msgSend(_5d,"objectForKey:","entity");
return o;
}
}),new objj_method(sel_getUid("establishConnectionUsingNameTable:"),function(_5f,_60,_61){
with(_5f){
var _62=objj_msgSend(GSMarkupConnector,"getObjectForIdString:usingNameTable:",_source,_61);
var _63=objj_msgSend(GSMarkupConnector,"getObjectForIdString:usingNameTable:",_target,_61);
if(objj_msgSend(_62,"isKindOfClass:",objj_msgSend(CPTableView,"class"))&&objj_msgSend(_63,"isKindOfClass:",objj_msgSend(CPArrayController,"class"))){
}
objj_msgSend(_62,"bind:toObject:withKeyPath:options:",CPValueBinding,_63,_label,nil);
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("tagName"),function(_64,_65){
with(_64){
return "binding";
}
})]);
