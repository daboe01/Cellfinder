@STATIC;1.0;I;21;Foundation/CPObject.jt;7088;
objj_executeFile("Foundation/CPObject.j",NO);
var _1=objj_allocateClassPair(CPMutableArray,"FSMutableArray"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_entity"),new objj_ivar("_proxyObject"),new objj_ivar("_defaults")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("entity"),function(_3,_4){
with(_3){
return _entity;
}
}),new objj_method(sel_getUid("setEntity:"),function(_5,_6,_7){
with(_5){
_entity=_7;
}
}),new objj_method(sel_getUid("defaults"),function(_8,_9){
with(_8){
return _defaults;
}
}),new objj_method(sel_getUid("setDefaults:"),function(_a,_b,_c){
with(_a){
_defaults=_c;
}
}),new objj_method(sel_getUid("initWithArray:ofEntity:"),function(_d,_e,_f,_10){
with(_d){
_d=objj_msgSendSuper({receiver:_d,super_class:objj_getClass("FSMutableArray").super_class},"init");
_proxyObject=_f;
_entity=_10;
return _d;
}
}),new objj_method(sel_getUid("copy"),function(_11,_12){
with(_11){
var i=0,_13=[],_14=objj_msgSend(_11,"count");
for(;i<_14;i++){
objj_msgSend(_13,"addObject:",objj_msgSend(_11,"objectAtIndex:",i));
}
return _13;
}
}),new objj_method(sel_getUid("_representedObject"),function(_15,_16){
with(_15){
return _proxyObject;
}
}),new objj_method(sel_getUid("_setRepresentedObject:"),function(_17,_18,_19){
with(_17){
objj_msgSend(_proxyObject,"setArray:",_19);
}
}),new objj_method(sel_getUid("count"),function(_1a,_1b){
with(_1a){
return objj_msgSend(objj_msgSend(_1a,"_representedObject"),"count");
}
}),new objj_method(sel_getUid("indexOfObject:inRange:"),function(_1c,_1d,_1e,_1f){
with(_1c){
var _20=_1f.location,_21=_1f.length,_22=!!_1e.isa;
for(;_20<_21;++_20){
var _23=objj_msgSend(_1c,"objectAtIndex:",_20);
if(_1e===_23||_22&&!!_23.isa&&objj_msgSend(_1e,"isEqual:",_23)){
return _20;
}
}
return CPNotFound;
}
}),new objj_method(sel_getUid("indexOfObject:"),function(_24,_25,_26){
with(_24){
return objj_msgSend(_24,"indexOfObject:inRange:",_26,CPMakeRange(0,objj_msgSend(_24,"count")));
}
}),new objj_method(sel_getUid("indexOfObjectIdenticalTo:inRange:"),function(_27,_28,_29,_2a){
with(_27){
var _2b=_2a.location,_2c=_2a.length;
for(;_2b<_2c;++_2b){
if(_29===objj_msgSend(_27,"objectAtIndex:",_2b)){
return _2b;
}
}
return CPNotFound;
}
}),new objj_method(sel_getUid("indexOfObjectIdenticalTo:"),function(_2d,_2e,_2f){
with(_2d){
return objj_msgSend(_2d,"indexOfObjectIdenticalTo:inRange:",_2f,CPMakeRange(0,objj_msgSend(_2d,"count")));
}
}),new objj_method(sel_getUid("objectAtIndex:"),function(_30,_31,_32){
with(_30){
return objj_msgSend(objj_msgSend(_30,"objectsAtIndexes:",objj_msgSend(CPIndexSet,"indexSetWithIndex:",_32)),"firstObject");
}
}),new objj_method(sel_getUid("objectsAtIndexes:"),function(_33,_34,_35){
with(_33){
return objj_msgSend(objj_msgSend(_33,"_representedObject"),"objectsAtIndexes:",_35);
}
}),new objj_method(sel_getUid("_addToDBObject:"),function(_36,_37,_38){
with(_36){
if(_defaults){
if(objj_msgSend(_38,"isKindOfClass:",objj_msgSend(CPDictionary,"class"))){
objj_msgSend(_38,"addEntriesFromDictionary:",_defaults);
}else{
if(objj_msgSend(_38,"isKindOfClass:",objj_msgSend(FSObject,"class"))){
if(!_38._changes){
_38._changes=objj_msgSend(CPMutableDictionary,"dictionary");
}
objj_msgSend(_38._changes,"addEntriesFromDictionary:",_defaults);
}
}
}
return objj_msgSend(_entity,"insertObject:",_38);
}
}),new objj_method(sel_getUid("addObject:"),function(_39,_3a,_3b){
with(_39){
objj_msgSend(_39,"insertObject:atIndex:",_3b,objj_msgSend(_39,"count"));
}
}),new objj_method(sel_getUid("addObjectsFromArray:"),function(_3c,_3d,_3e){
with(_3c){
var _3f=0,_40=objj_msgSend(_3e,"count");
objj_msgSend(_3c,"insertObjects:atIndexes:",_3e,objj_msgSend(CPIndexSet,"indexSetWithIndexesInRange:",CPMakeRange(objj_msgSend(_3c,"count"),_40)));
}
}),new objj_method(sel_getUid("insertObject:atIndex:"),function(_41,_42,_43,_44){
with(_41){
objj_msgSend(_41,"insertObjects:atIndexes:",[_43],objj_msgSend(CPIndexSet,"indexSetWithIndex:",_44));
}
}),new objj_method(sel_getUid("insertObjects:atIndexes:"),function(_45,_46,_47,_48){
with(_45){
var _49=objj_msgSend(objj_msgSend(_45,"_representedObject"),"copy");
var _4a=[];
var l=objj_msgSend(_47,"count");
for(var i=0;i<l;i++){
var o=objj_msgSend(_47,"objectAtIndex:",i);
if(_entity){
o=objj_msgSend(_45,"_addToDBObject:",o);
}
objj_msgSend(_4a,"addObject:",o);
}
objj_msgSend(_49,"insertObjects:atIndexes:",_4a,_48);
objj_msgSend(_45,"_setRepresentedObject:",_49);
}
}),new objj_method(sel_getUid("removeObject:"),function(_4b,_4c,_4d){
with(_4b){
objj_msgSend(_4b,"removeObject:inRange:",_4d,CPMakeRange(0,objj_msgSend(_4b,"count")));
}
}),new objj_method(sel_getUid("removeObjectsInArray:"),function(_4e,_4f,_50){
with(_4e){
var l=objj_msgSend(_50,"count");
for(var i=0;i<l;i++){
objj_msgSend(_entity,"deleteObject:",objj_msgSend(_50,"objectAtIndex:",i));
}
var _51=objj_msgSend(objj_msgSend(_4e,"_representedObject"),"copy");
objj_msgSend(_51,"removeObjectsInArray:",_50);
objj_msgSend(_4e,"_setRepresentedObject:",_51);
}
}),new objj_method(sel_getUid("removeObject:inRange:"),function(_52,_53,_54,_55){
with(_52){
var _56;
while((_56=objj_msgSend(_52,"indexOfObject:inRange:",_54,_55))!==CPNotFound){
objj_msgSend(_entity,"deleteObject:",objj_msgSend(_52,"objectAtIndex:",_56));
objj_msgSend(_52,"removeObjectAtIndex:",_56);
_55=CPIntersectionRange(CPMakeRange(_56,length-_56),_55);
}
}
}),new objj_method(sel_getUid("removeLastObject"),function(_57,_58){
with(_57){
objj_msgSend(_57,"removeObjectsAtIndexes:",objj_msgSend(CPIndexSet,"indexSetWithIndex:",objj_msgSend(_57,"count")-1));
}
}),new objj_method(sel_getUid("removeObjectAtIndex:"),function(_59,_5a,_5b){
with(_59){
objj_msgSend(_59,"removeObjectsAtIndexes:",objj_msgSend(CPIndexSet,"indexSetWithIndex:",_5b));
}
}),new objj_method(sel_getUid("removeObjectsAtIndexes:"),function(_5c,_5d,_5e){
with(_5c){
var _5f=objj_msgSend(objj_msgSend(_5c,"_representedObject"),"copy");
var _60=objj_msgSend(objj_msgSend(_5c,"_representedObject"),"objectsAtIndexes:",_5e);
var l=objj_msgSend(_60,"count");
for(var i=0;i<l;i++){
objj_msgSend(_entity,"deleteObject:",objj_msgSend(_60,"objectAtIndex:",i));
}
objj_msgSend(_5f,"removeObjectsAtIndexes:",_5e);
objj_msgSend(_5c,"_setRepresentedObject:",_5f);
}
}),new objj_method(sel_getUid("replaceObjectAtIndex:withObject:"),function(_61,_62,_63,_64){
with(_61){
objj_msgSend(_61,"replaceObjectsAtIndexes:withObjects:",objj_msgSend(CPIndexSet,"indexSetWithIndex:",_63),[_64]);
}
}),new objj_method(sel_getUid("replaceObjectsAtIndexes:withObjects:"),function(_65,_66,_67,_68){
with(_65){
var _69=objj_msgSend(objj_msgSend(_65,"_representedObject"),"copy");
objj_msgSend(_69,"replaceObjectsAtIndexes:withObjects:",_67,_68);
objj_msgSend(_65,"_setRepresentedObject:",_69);
}
}),new objj_method(sel_getUid("description"),function(_6a,_6b){
with(_6a){
return objj_msgSend(objj_msgSend(_6a,"_representedObject"),"description");
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("alloc"),function(_6c,_6d){
with(_6c){
var _6e=[];
_6e.isa=_6c;
var _6f=class_copyIvarList(_6c),_70=_6f.length;
while(_70--){
_6e[ivar_getName(_6f[_70])]=nil;
}
return _6e;
}
})]);
