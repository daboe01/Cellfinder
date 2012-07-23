@STATIC;1.0;i;19;GSMarkupTagObject.jI;21;Foundation/CPObject.ji;10;Fireside.jt;5500;
objj_executeFile("GSMarkupTagObject.j",YES);
objj_executeFile("Foundation/CPObject.j",NO);
objj_executeFile("Fireside.j",YES);
var _1=objj_allocateClassPair(GSMarkupTagObject,"GSMarkupColumn"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("name"),function(_3,_4){
with(_3){
return objj_msgSend(_attributes,"objectForKey:","name");
}
}),new objj_method(sel_getUid("isPK"),function(_5,_6){
with(_5){
return objj_msgSend(_5,"boolValueForAttribute:","primaryKey")==1;
}
}),new objj_method(sel_getUid("allocPlatformObject"),function(_7,_8){
with(_7){
return nil;
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("tagName"),function(_9,_a){
with(_9){
return "column";
}
})]);
var _1=objj_allocateClassPair(GSMarkupTagObject,"GSMarkupRelationship"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("name"),function(_b,_c){
with(_b){
return objj_msgSend(_attributes,"objectForKey:","name");
}
}),new objj_method(sel_getUid("target"),function(_d,_e){
with(_d){
return objj_msgSend(_attributes,"objectForKey:","target");
}
}),new objj_method(sel_getUid("targetColumn"),function(_f,_10){
with(_f){
return objj_msgSend(_attributes,"objectForKey:","targetColumn");
}
}),new objj_method(sel_getUid("bindingColumn"),function(_11,_12){
with(_11){
return objj_msgSend(_attributes,"objectForKey:","bindingColumn");
}
}),new objj_method(sel_getUid("isToMany"),function(_13,_14){
with(_13){
return objj_msgSend(_attributes,"objectForKey:","type")=="toMany";
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("tagName"),function(_15,_16){
with(_15){
return "relationship";
}
}),new objj_method(sel_getUid("platformObjectClass"),function(_17,_18){
with(_17){
return objj_msgSend(FSRelationship,"class");
}
})]);
var _1=objj_allocateClassPair(GSMarkupTagObject,"GSMarkupEntity"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initPlatformObject:"),function(_19,_1a,_1b){
with(_19){
var _1c=objj_msgSend(_attributes,"objectForKey:","store");
var _1d=objj_msgSend(_attributes,"objectForKey:","id");
_1b=objj_msgSend(_1b,"initWithName:andStore:",_1d,_1c);
var _1e=objj_msgSend(CPMutableSet,"new");
var _1f;
var i,_20=_content.length;
for(i=0;i<_20;i++){
var v=_content[i];
if(objj_msgSend(v,"isKindOfClass:",objj_msgSend(GSMarkupColumn,"class"))){
if(objj_msgSend(v,"isPK")){
if(_1f){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,"Duplicate PK "+objj_msgSend(v,"name")+"! "+_1f+" already is PK!");
}else{
_1f=objj_msgSend(v,"name");
}
}
objj_msgSend(_1e,"addObject:",objj_msgSend(v,"name"));
}else{
if(objj_msgSend(v,"isKindOfClass:",objj_msgSend(GSMarkupRelationship,"class"))){
var rel=objj_msgSend(objj_msgSend(FSRelationship,"alloc"),"initWithName:source:andTargetEntity:",objj_msgSend(v,"name"),_1b,objj_msgSend(v,"target"));
if(objj_msgSend(v,"bindingColumn")){
objj_msgSend(rel,"setBindingColumn:",objj_msgSend(v,"bindingColumn"));
}
if(objj_msgSend(v,"targetColumn")){
objj_msgSend(rel,"setTargetColumn:",objj_msgSend(v,"targetColumn"));
}
if(objj_msgSend(v,"isToMany")){
objj_msgSend(rel,"setType:",FSRelationshipTypeToMany);
}else{
objj_msgSend(rel,"setType:",FSRelationshipTypeToOne);
}
objj_msgSend(_1b,"addRelationship:",rel);
}
}
}
objj_msgSend(_1b,"setColumns:",_1e);
if(_1f){
objj_msgSend(_1b,"setPk:",_1f);
}
return _1b;
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("tagName"),function(_21,_22){
with(_21){
return "entity";
}
}),new objj_method(sel_getUid("platformObjectClass"),function(_23,_24){
with(_23){
return objj_msgSend(FSEntity,"class");
}
})]);
var _1=objj_allocateClassPair(CPArrayController,"FSArrayController"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_entity"),new objj_ivar("_defaultDict")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("entity"),function(_25,_26){
with(_25){
return _entity;
}
}),new objj_method(sel_getUid("setEntity:"),function(_27,_28,_29){
with(_27){
_entity=_29;
}
}),new objj_method(sel_getUid("pk"),function(_2a,_2b){
with(_2a){
return objj_msgSend(_entity,"pk");
}
}),new objj_method(sel_getUid("selectedObject"),function(_2c,_2d){
with(_2c){
var s=objj_msgSend(_2c,"selectedObjects");
return objj_msgSend(s,"count")?objj_msgSend(s,"objectAtIndex:",0):nil;
}
}),new objj_method(sel_getUid("_defaultNewObject"),function(_2e,_2f){
with(_2e){
return objj_msgSend(_entity,"createObjectWithDictionary:",_defaultDict);
}
}),new objj_method(sel_getUid("setContent:"),function(_30,_31,_32){
with(_30){
if(objj_msgSend(_32,"respondsToSelector:",sel_getUid("defaults"))){
_defaultDict=objj_msgSend(_32,"defaults");
}
objj_msgSendSuper({receiver:_30,super_class:objj_getClass("FSArrayController").super_class},"setContent:",_32);
}
})]);
var _1=objj_allocateClassPair(GSMarkupTagObject,"GSMarkupArrayController"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initPlatformObject:"),function(_33,_34,_35){
with(_33){
_35=objj_msgSend(_35,"init");
objj_msgSend(_35,"setAutomaticallyRearrangesObjects:",YES);
objj_msgSend(_35,"setObjectClass:",objj_msgSend(FSObject,"class"));
objj_msgSend(_35,"setEntity:",objj_msgSend(_attributes,"objectForKey:","entity"));
return _35;
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("tagName"),function(_36,_37){
with(_36){
return "arrayController";
}
}),new objj_method(sel_getUid("platformObjectClass"),function(_38,_39){
with(_38){
return objj_msgSend(FSArrayController,"class");
}
})]);
