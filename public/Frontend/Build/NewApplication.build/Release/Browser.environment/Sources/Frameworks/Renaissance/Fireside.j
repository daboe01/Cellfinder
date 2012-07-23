@STATIC;1.0;I;21;Foundation/CPObject.ji;16;FSMutableArray.jt;18446;
objj_executeFile("Foundation/CPObject.j",NO);
objj_executeFile("FSMutableArray.j",YES);
var _1=objj_getClass("CPArray");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"CPArray\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("allObjects"),function(_3,_4){
with(_3){
return _3;
}
})]);
var _1=objj_getClass("CPDictionary");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"CPDictionary\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("toJSON"),function(_5,_6){
with(_5){
var _7=objj_msgSend(_5,"allKeys");
var i,l=_7.length;
var o={};
for(i=0;i<l;i++){
var _8=_7[i];
o[_8]=objj_msgSend(_5,"objectForKey:",_8);
}
return JSON.stringify(o);
}
})]);
var _9;
var _1=objj_allocateClassPair(CPObject,"FSEntity"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_name"),new objj_ivar("_pk"),new objj_ivar("_columns"),new objj_ivar("_relations"),new objj_ivar("_store"),new objj_ivar("_pkcache"),new objj_ivar("_formatters")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("name"),function(_a,_b){
with(_a){
return _name;
}
}),new objj_method(sel_getUid("setName:"),function(_c,_d,_e){
with(_c){
_name=_e;
}
}),new objj_method(sel_getUid("pk"),function(_f,_10){
with(_f){
return _pk;
}
}),new objj_method(sel_getUid("setPk:"),function(_11,_12,_13){
with(_11){
_pk=_13;
}
}),new objj_method(sel_getUid("columns"),function(_14,_15){
with(_14){
return _columns;
}
}),new objj_method(sel_getUid("setColumns:"),function(_16,_17,_18){
with(_16){
_columns=_18;
}
}),new objj_method(sel_getUid("store"),function(_19,_1a){
with(_19){
return _store;
}
}),new objj_method(sel_getUid("setStore:"),function(_1b,_1c,_1d){
with(_1b){
_store=_1d;
}
}),new objj_method(sel_getUid("initWithName:andStore:"),function(_1e,_1f,_20,_21){
with(_1e){
_1e=objj_msgSendSuper({receiver:_1e,super_class:objj_getClass("FSEntity").super_class},"init");
if(_1e){
_store=_21;
_name=_20;
}
return _1e;
}
}),new objj_method(sel_getUid("init"),function(_22,_23){
with(_22){
return objj_msgSend(_22,"initWithName:andStore:",nil,nil);
}
}),new objj_method(sel_getUid("createObject"),function(_24,_25){
with(_24){
return objj_msgSend(_24,"createObjectWithDictionary:",nil);
}
}),new objj_method(sel_getUid("createObjectWithDictionary:"),function(_26,_27,_28){
with(_26){
var r=objj_msgSend(objj_msgSend(FSObject,"alloc"),"initWithEntity:",_26);
if(_28){
r._changes=_28;
var _29=objj_msgSend(_28,"allKeys");
var i,l=objj_msgSend(_29,"count");
for(i=0;i<l;i++){
var _2a=objj_msgSend(_29,"objectAtIndex:",i);
var _2b=objj_msgSend(_28,"objectForKey:",_2a);
var _2c;
if(_2c=objj_msgSend(_26,"formatterForColumnName:",_2a)){
_2b=objj_msgSend(_2c,"objectValueForString:error:",_2b,nil);
objj_msgSend(_28,"setObject:forKey:",_2b,_2a);
}
}
}
return r;
}
}),new objj_method(sel_getUid("insertObject:"),function(_2d,_2e,_2f){
with(_2d){
if(objj_msgSend(_2f,"isKindOfClass:",objj_msgSend(CPDictionary,"class"))){
_2f=objj_msgSend(_2d,"createObjectWithDictionary:",_2f);
}else{
if(!objj_msgSend(_2f,"isKindOfClass:",objj_msgSend(FSObject,"class"))){
}
}
objj_msgSend(objj_msgSend(_2d,"store"),"insertObject:",_2f);
return _2f;
}
}),new objj_method(sel_getUid("deleteObject:"),function(_30,_31,_32){
with(_30){
objj_msgSend(objj_msgSend(_30,"store"),"deleteObject:",_32);
}
}),new objj_method(sel_getUid("setFormatter:forColumnName:"),function(_33,_34,_35,_36){
with(_33){
if(!_formatters){
_formatters=objj_msgSend(CPMutableDictionary,"new");
}
objj_msgSend(_formatters,"setObject:forKey:",_35,_36);
}
}),new objj_method(sel_getUid("formatterForColumnName:"),function(_37,_38,_39){
with(_37){
if(!_formatters){
return nil;
}
return objj_msgSend(_formatters,"objectForKey:",_39);
}
}),new objj_method(sel_getUid("objectWithPK:"),function(_3a,_3b,_3c){
with(_3a){
var a=objj_msgSend(objj_msgSend(_3a,"store"),"fetchObjectsWithKey:equallingValue:inEntity:",objj_msgSend(_3a,"pk"),_3c,_3a);
if(objj_msgSend(a,"count")==1){
return objj_msgSend(a,"objectAtIndex:",0);
}
return nil;
}
}),new objj_method(sel_getUid("relationOfName:"),function(_3d,_3e,_3f){
with(_3d){
var _40=objj_msgSend(_relations,"allObjects");
var i,l=objj_msgSend(_40,"count");
for(i=0;i<l;i++){
var r=_40[i];
if(objj_msgSend(r,"name")==_3f){
return r;
}
}
return nil;
}
}),new objj_method(sel_getUid("relationships"),function(_41,_42){
with(_41){
return objj_msgSend(_relations,"allObjects");
}
}),new objj_method(sel_getUid("addRelationship:"),function(_43,_44,_45){
with(_43){
if(!_relations){
_relations=objj_msgSend(CPSet,"setWithObject:",_45);
}else{
objj_msgSend(_relations,"addObject:",_45);
}
}
}),new objj_method(sel_getUid("allObjects"),function(_46,_47){
with(_46){
return objj_msgSend(_store,"fetchAllObjectsInEntity:",_46);
}
}),new objj_method(sel_getUid("_registerObjectInPKCache:"),function(_48,_49,_4a){
with(_48){
if(!_pkcache){
_pkcache=objj_msgSend(CPMutableArray,"new");
}
_pkcache[objj_msgSend(_4a,"valueForKey:",_pk)]=_4a;
}
}),new objj_method(sel_getUid("_registeredObjectForPK:"),function(_4b,_4c,_4d){
with(_4b){
if(!_pkcache){
return nil;
}
return _pkcache[_4d];
}
}),new objj_method(sel_getUid("_hasCaches"),function(_4e,_4f){
with(_4e){
var _50=objj_msgSend(_relations,"allObjects");
var i,l=objj_msgSend(_50,"count");
for(i=0;i<l;i++){
var r=objj_msgSend(_50,"objectAtIndex:",i);
if(r._target_cache&&objj_msgSend(r._target_cache,"count")){
return YES;
}
}
return NO;
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("relationshipsWithTargetProperty:"),function(_51,_52,_53){
with(_51){
var ret=[];
if(!_9){
return ret;
}
var i,l=_9.length;
for(i=0;i<l;i++){
var r=_9[i];
if(objj_msgSend(r,"targetColumn")==_53){
objj_msgSend(ret,"addObject:",r);
}
}
return ret;
}
}),new objj_method(sel_getUid("_registerRelationship:"),function(_54,_55,_56){
with(_54){
if(!_9){
_9=objj_msgSend(CPMutableArray,"new");
}
return objj_msgSend(_9,"addObject:",_56);
}
})]);
FSRelationshipTypeToOne=0;
FSRelationshipTypeToMany=1;
var _1=objj_allocateClassPair(CPObject,"FSRelationship"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_name"),new objj_ivar("_source"),new objj_ivar("_target"),new objj_ivar("_bindingColumn"),new objj_ivar("_targetColumn"),new objj_ivar("_type"),new objj_ivar("_target_cache")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("name"),function(_57,_58){
with(_57){
return _name;
}
}),new objj_method(sel_getUid("setName:"),function(_59,_5a,_5b){
with(_59){
_name=_5b;
}
}),new objj_method(sel_getUid("source"),function(_5c,_5d){
with(_5c){
return _source;
}
}),new objj_method(sel_getUid("setSource:"),function(_5e,_5f,_60){
with(_5e){
_source=_60;
}
}),new objj_method(sel_getUid("target"),function(_61,_62){
with(_61){
return _target;
}
}),new objj_method(sel_getUid("setTarget:"),function(_63,_64,_65){
with(_63){
_target=_65;
}
}),new objj_method(sel_getUid("bindingColumn"),function(_66,_67){
with(_66){
return _bindingColumn;
}
}),new objj_method(sel_getUid("setBindingColumn:"),function(_68,_69,_6a){
with(_68){
_bindingColumn=_6a;
}
}),new objj_method(sel_getUid("_targetColumn"),function(_6b,_6c){
with(_6b){
return _targetColumn;
}
}),new objj_method(sel_getUid("setTargetColumn:"),function(_6d,_6e,_6f){
with(_6d){
_targetColumn=_6f;
}
}),new objj_method(sel_getUid("type"),function(_70,_71){
with(_70){
return _type;
}
}),new objj_method(sel_getUid("setType:"),function(_72,_73,_74){
with(_72){
_type=_74;
}
}),new objj_method(sel_getUid("initWithName:source:andTargetEntity:"),function(_75,_76,_77,_78,_79){
with(_75){
_75=objj_msgSendSuper({receiver:_75,super_class:objj_getClass("FSRelationship").super_class},"init");
if(_75){
_target=_79;
_name=_77;
_source=_78;
_type=FSRelationshipTypeToOne;
}
objj_msgSend(FSEntity,"_registerRelationship:",_75);
return _75;
}
}),new objj_method(sel_getUid("init"),function(_7a,_7b){
with(_7a){
return objj_msgSend(_7a,"initWithName:source:andTargetEntity:",nil,nil,nil);
}
}),new objj_method(sel_getUid("targetColumn"),function(_7c,_7d){
with(_7c){
if(_targetColumn&&_targetColumn.length){
return _targetColumn;
}
return objj_msgSend(_target,"pk");
}
}),new objj_method(sel_getUid("fetchObjectsForKey:"),function(_7e,_7f,_80){
with(_7e){
if(!_80){
return nil;
}
var _81;
if(!_target_cache){
_target_cache=[];
}
if(_81=_target_cache[_80]){
return _81;
}
var res=objj_msgSend(objj_msgSend(_target,"store"),"fetchObjectsWithKey:equallingValue:inEntity:",objj_msgSend(_7e,"targetColumn"),_80,_target);
_target_cache[_80]=res;
return res;
}
}),new objj_method(sel_getUid("_invalidateCache"),function(_82,_83){
with(_82){
_target_cache=[];
}
})]);
var _1=objj_allocateClassPair(CPObject,"FSObject"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_data"),new objj_ivar("_changes"),new objj_ivar("_formatters"),new objj_ivar("_entity")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("entity"),function(_84,_85){
with(_84){
return _entity;
}
}),new objj_method(sel_getUid("setEntity:"),function(_86,_87,_88){
with(_86){
_entity=_88;
}
}),new objj_method(sel_getUid("initWithEntity:"),function(_89,_8a,_8b){
with(_89){
_89=objj_msgSendSuper({receiver:_89,super_class:objj_getClass("FSObject").super_class},"init");
if(_89){
_entity=_8b;
}
return _89;
}
}),new objj_method(sel_getUid("_setDataFromJSONObject:"),function(_8c,_8d,o){
with(_8c){
_data=objj_msgSend(CPMutableDictionary,"dictionary");
var _8e=objj_msgSend(objj_msgSend(_entity,"columns"),"allObjects");
var i,l=_8e.length;
for(i=0;i<l;i++){
var _8f=_8e[i];
objj_msgSend(_data,"setObject:forKey:",o[_8f],_8f);
}
}
}),new objj_method(sel_getUid("setFormatter:forColumnName:"),function(_90,_91,_92,_93){
with(_90){
if(!_formatters){
_formatters=objj_msgSend(CPMutableDictionary,"new");
}
objj_msgSend(_formatters,"setObject:forKey:",_92,_93);
}
}),new objj_method(sel_getUid("formatterForColumnName:"),function(_94,_95,_96){
with(_94){
if(!_formatters){
return nil;
}
return objj_msgSend(_formatters,"objectForKey:",_96);
}
}),new objj_method(sel_getUid("description"),function(_97,_98){
with(_97){
return objj_msgSend(_data,"description");
}
}),new objj_method(sel_getUid("typeOfKey:"),function(_99,_9a,_9b){
with(_99){
if(objj_msgSend(objj_msgSend(_entity,"columns"),"containsObject:",_9b)){
return 0;
}
if(objj_msgSend(_entity,"relationOfName:",_9b)){
return 1;
}
return CPNotFound;
}
}),new objj_method(sel_getUid("valueForKey:"),function(_9c,_9d,_9e){
with(_9c){
var _9f=objj_msgSend(_9c,"typeOfKey:",_9e);
if(_9f==0){
if(!_data){
}
var o=objj_msgSend(_changes,"objectForKey:",_9e);
if(!o){
o=objj_msgSend(_data,"objectForKey:",_9e);
}
if(o){
if(!objj_msgSend(o,"isKindOfClass:",objj_msgSend(CPString,"class"))){
o=objj_msgSend(o,"stringValue");
}
}
var _a0=objj_msgSend(_9c,"formatterForColumnName:",_9e);
if(_a0||(_a0=objj_msgSend(_entity,"formatterForColumnName:",_9e))){
return objj_msgSend(_a0,"stringForObjectValue:",o);
}else{
return o;
}
}else{
if(_9f==1){
var rel=objj_msgSend(_entity,"relationOfName:",_9e);
var _a1=objj_msgSend(rel,"bindingColumn");
if(!_a1){
_a1=objj_msgSend(_entity,"pk");
}
var _a2=(objj_msgSend(rel,"type")==FSRelationshipTypeToMany);
var _a3=objj_msgSend(rel,"fetchObjectsForKey:",objj_msgSend(_9c,"valueForKey:",_a1));
if(_a2){
var r=objj_msgSend(objj_msgSend(FSMutableArray,"alloc"),"initWithArray:ofEntity:",_a3,objj_msgSend(rel,"target"));
var _a4=objj_msgSend(CPDictionary,"dictionaryWithObject:forKey:",objj_msgSend(_9c,"valueForKey:",_a1),rel._targetColumn);
objj_msgSend(r,"setDefaults:",_a4);
return r;
}else{
return (_a3&&_a3.length)?objj_msgSend(_a3,"objectAtIndex:",0):nil;
}
}else{
var _a5=sel_getName(_9e);
if(_a5&&objj_msgSend(_9c,"respondsToSelector:",_a5)){
return objj_msgSend(_9c,"performSelector:",_a5);
}else{
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,"Key "+_9e+" is not a column in entity "+objj_msgSend(_entity,"name"));
}
}
}
}
}),new objj_method(sel_getUid("setValue:forKey:"),function(_a6,_a7,_a8,_a9){
with(_a6){
var _aa=objj_msgSend(_a6,"typeOfKey:",_a9);
var _ab=objj_msgSend(_a6,"valueForKey:",_a9);
if(_ab===_a8){
return;
}
if(_aa==0){
if(!_changes){
_changes=objj_msgSend(CPMutableDictionary,"dictionary");
}
objj_msgSend(_a6,"willChangeValueForKey:",_a9);
var _ac=objj_msgSend(_a6,"formatterForColumnName:",_a9);
if(_ac||(_ac=objj_msgSend(_entity,"formatterForColumnName:",_a9))){
_a8=objj_msgSend(_ac,"objectValueForString:error:",_a8,nil);
}
objj_msgSend(_changes,"setObject:forKey:",_a8,_a9);
objj_msgSend(_a6,"didChangeValueForKey:",_a9);
objj_msgSend(objj_msgSend(_entity,"store"),"writeChangesInObject:",_a6);
var _ad=objj_msgSend(FSEntity,"relationshipsWithTargetProperty:",_a9);
if(_ad){
var i,l=_ad.length;
for(i=0;i<l;i++){
var rel=_ad[i];
if(objj_msgSend(rel,"type")==FSRelationshipTypeToMany){
objj_msgSend(rel,"_invalidateCache");
var _ae=objj_msgSend(objj_msgSend(rel,"source"),"objectWithPK:",_ab);
var _af=objj_msgSend(rel,"fetchObjectsForKey:",_ab);
objj_msgSend(_ae,"willChangeValueForKey:",objj_msgSend(rel,"name"));
objj_msgSend(_ae,"setValue:forKey:",_af,objj_msgSend(rel,"name"));
objj_msgSend(_ae,"didChangeValueForKey:",objj_msgSend(rel,"name"));
}
}
}
}else{
if(_aa==1){
}else{
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,"Key "+_a9+" is not a column");
}
}
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_b0,_b1,_b2){
with(_b0){
objj_msgSendSuper({receiver:_b0,super_class:objj_getClass("FSObject").super_class},"encodeWithCoder:",_b2);
var _b3=objj_msgSend(_data,"copy");
if(_changes){
objj_msgSend(_b3,"addEntriesFromDictionary:",_changes);
}
objj_msgSend(_b2,"_encodeDictionaryOfObjects:forKey:",_b3,"FS.objects");
}
}),new objj_method(sel_getUid("initWithCoder:"),function(_b4,_b5,_b6){
with(_b4){
_b4=objj_msgSendSuper({receiver:_b4,super_class:objj_getClass("FSObject").super_class},"initWithCoder:",_b6);
if(_b4){
_changes=objj_msgSend(_b6,"_decodeDictionaryOfObjectsForKey:","FS.objects");
}
return _b4;
}
})]);
var _1=objj_allocateClassPair(CPObject,"FSStore"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_baseURL"),new objj_ivar("_fetchLimit")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("baseURL"),function(_b7,_b8){
with(_b7){
return _baseURL;
}
}),new objj_method(sel_getUid("setBaseURL:"),function(_b9,_ba,_bb){
with(_b9){
_baseURL=_bb;
}
}),new objj_method(sel_getUid("fetchLimit"),function(_bc,_bd){
with(_bc){
return _fetchLimit;
}
}),new objj_method(sel_getUid("setFetchLimit:"),function(_be,_bf,_c0){
with(_be){
_fetchLimit=_c0;
}
}),new objj_method(sel_getUid("requestForAddressingObjectsWithKey:equallingValue:inEntity:"),function(_c1,_c2,_c3,_c4,_c5){
with(_c1){
var _c6=objj_msgSend(CPURLRequest,"requestWithURL:",objj_msgSend(_c1,"baseURL")+"/"+objj_msgSend(_c5,"name")+"/"+_c3+"/"+_c4);
return _c6;
}
}),new objj_method(sel_getUid("requestForAddressingAllObjectsInEntity:"),function(_c7,_c8,_c9){
with(_c7){
return objj_msgSend(CPURLRequest,"requestWithURL:",objj_msgSend(_c7,"baseURL")+"/"+objj_msgSend(_c9,"name"));
}
}),new objj_method(sel_getUid("initWithBaseURL:"),function(_ca,_cb,_cc){
with(_ca){
_ca=objj_msgSendSuper({receiver:_ca,super_class:objj_getClass("FSStore").super_class},"init");
if(_ca){
_baseURL=_cc;
}
return _ca;
}
}),new objj_method(sel_getUid("fetchObjectsForURLRequest:inEntity:"),function(_cd,_ce,_cf,_d0){
with(_cd){
var _d1=objj_msgSend(CPURLConnection,"sendSynchronousRequest:returningResponse:",_cf,nil);
var j=JSON.parse(objj_msgSend(_d1,"rawString"));
var a=objj_msgSend(CPMutableArray,"new");
var i,l=j.length;
for(i=0;i<l;i++){
var pk=j[i][objj_msgSend(_d0,"pk")];
var _d2;
if(_d2=objj_msgSend(_d0,"_registeredObjectForPK:",pk)){
objj_msgSend(a,"addObject:",_d2);
}else{
var t=objj_msgSend(objj_msgSend(FSObject,"alloc"),"initWithEntity:",_d0);
objj_msgSend(t,"_setDataFromJSONObject:",j[i]);
objj_msgSend(_d0,"_registerObjectInPKCache:",t);
objj_msgSend(a,"addObject:",t);
}
}
return a;
}
}),new objj_method(sel_getUid("fetchAllObjectsInEntity:"),function(_d3,_d4,_d5){
with(_d3){
return objj_msgSend(_d3,"fetchObjectsForURLRequest:inEntity:",objj_msgSend(_d3,"requestForAddressingAllObjectsInEntity:",_d5),_d5);
}
}),new objj_method(sel_getUid("fetchObjectsWithKey:equallingValue:inEntity:"),function(_d6,_d7,_d8,_d9,_da){
with(_d6){
if(_d8==objj_msgSend(_da,"pk")){
var _db;
if(_db=objj_msgSend(_da,"_registeredObjectForPK:",_d9)){
return objj_msgSend(CPArray,"arrayWithObject:",_db);
}
}
var _dc=objj_msgSend(_d6,"requestForAddressingObjectsWithKey:equallingValue:inEntity:",_d8,_d9,_da);
return objj_msgSend(_d6,"fetchObjectsForURLRequest:inEntity:",_dc,_da);
}
}),new objj_method(sel_getUid("writeChangesInObject:"),function(_dd,_de,obj){
with(_dd){
if(objj_msgSend(objj_msgSend(obj,"entity"),"pk")===undefined){
return;
}
if(!obj._changes){
return;
}
var _df=objj_msgSend(_dd,"requestForAddressingObjectsWithKey:equallingValue:inEntity:",objj_msgSend(objj_msgSend(obj,"entity"),"pk"),objj_msgSend(obj,"valueForKey:",objj_msgSend(objj_msgSend(obj,"entity"),"pk")),objj_msgSend(obj,"entity"));
objj_msgSend(_df,"setHTTPMethod:","PUT");
objj_msgSend(_df,"setHTTPBody:",objj_msgSend(obj._changes,"toJSON"));
objj_msgSend(CPURLConnection,"sendSynchronousRequest:returningResponse:",_df,nil);
}
}),new objj_method(sel_getUid("insertObject:"),function(_e0,_e1,_e2){
with(_e0){
var _e3=objj_msgSend(_e2,"entity");
var _e4=objj_msgSend(CPURLRequest,"requestWithURL:",objj_msgSend(_e0,"baseURL")+"/"+objj_msgSend(_e3,"name")+"/"+objj_msgSend(_e3,"pk"));
objj_msgSend(_e4,"setHTTPMethod:","POST");
objj_msgSend(_e4,"setHTTPBody:",objj_msgSend(_e2._changes,"toJSON"));
var _e5=objj_msgSend(CPURLConnection,"sendSynchronousRequest:returningResponse:",_e4,nil);
var j=JSON.parse(objj_msgSend(_e5,"rawString"));
var pk=j["pk"];
objj_msgSend(_e2,"willChangeValueForKey:",objj_msgSend(_e3,"pk"));
if(!_e2._data){
_e2._data=objj_msgSend(CPMutableDictionary,"new");
}
objj_msgSend(_e2._data,"setObject:forKey:",pk,objj_msgSend(_e3,"pk"));
objj_msgSend(_e2,"didChangeValueForKey:",objj_msgSend(_e3,"pk"));
}
}),new objj_method(sel_getUid("deleteObject:"),function(_e6,_e7,obj){
with(_e6){
var _e8=objj_msgSend(_e6,"requestForAddressingObjectsWithKey:equallingValue:inEntity:",objj_msgSend(objj_msgSend(obj,"entity"),"pk"),objj_msgSend(obj,"valueForKey:",objj_msgSend(objj_msgSend(obj,"entity"),"pk")),objj_msgSend(obj,"entity"));
objj_msgSend(_e8,"setHTTPMethod:","DELETE");
objj_msgSend(CPURLConnection,"sendSynchronousRequest:returningResponse:",_e8,nil);
}
})]);
