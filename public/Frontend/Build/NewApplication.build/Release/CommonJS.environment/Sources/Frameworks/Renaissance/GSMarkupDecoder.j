@STATIC;1.0;I;21;Foundation/CPObject.ji;19;GSMarkupConnector.jt;14723;
objj_executeFile("Foundation/CPObject.j",NO);
objj_executeFile("GSMarkupConnector.j",YES);
var _1=objj_getClass("CPString");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"CPString\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("stringByUppercasingFirstCharacter"),function(_3,_4){
with(_3){
var _5=objj_msgSend(_3,"length");
if(_5<1){
return _3;
}else{
var s;
var c=objj_msgSend(_3,"characterAtIndex:",0);
if(c<"a"||c>"z"){
return _3;
}
c=c.toUpperCase();
s=objj_msgSend(CPString,"stringWithString:",c);
if(_5==1){
return s;
}else{
return objj_msgSend(s,"stringByAppendingString:",objj_msgSend(_3,"substringFromIndex:",1));
}
}
}
}),new objj_method(sel_getUid("trimmedString"),function(_6,_7){
with(_6){
var t=_6.replace(/^\s+|\s+$/g,"");
if(!t){
return "";
}
return objj_msgSend(CPString,"stringWithString:",t);
}
})]);
var _1=objj_getClass("CPData");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"CPData\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("initWithContentsOfURL:"),function(_8,_9,_a){
with(_8){
var _b=objj_msgSend(CPURLConnection,"sendSynchronousRequest:returningResponse:error:",objj_msgSend(CPURLRequest,"requestWithURL:",_a),nil,nil);
if(_b==nil){
return nil;
}
return _b;
}
}),new objj_method(sel_getUid("initWithContentsOfFile:"),function(_c,_d,_e){
with(_c){
return objj_msgSend(_c,"initWithContentsOfURL:",objj_msgSend(CPURL,"URLWithString:",_e));
}
})]);
var _1=objj_allocateClassPair(CPObject,"GSMarkupDecoder"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_uniqueID"),new objj_ivar("_nameTable"),new objj_ivar("_externalNameTable"),new objj_ivar("_tagNameToObjectClass"),new objj_ivar("_xmlStr"),new objj_ivar("_objects"),new objj_ivar("_connectors")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initWithContentsOfFile:"),function(_f,_10,_11){
with(_f){
var d=objj_msgSend(objj_msgSend(CPData,"alloc"),"initWithContentsOfFile:",_11);
return objj_msgSend(_f,"initWithData:",d);
}
}),new objj_method(sel_getUid("initWithData:"),function(_12,_13,_14){
with(_12){
return objj_msgSend(_12,"initWithXMLString:",objj_msgSend(_14,"rawString"));
}
}),new objj_method(sel_getUid("objectClassForTagName:mappedByFormatArray:"),function(_15,_16,_17,arr){
with(_15){
var c;
var _18=objj_msgSend(_17,"stringByUppercasingFirstCharacter");
var _19=objj_msgSend(_tagNameToObjectClass,"objectForKey:",_17);
if(_19!=nil){
objj_msgSend(arr,"insertObject:atIndex:",_19,0);
}
var i,cnt=arr.length;
for(i=0;i<cnt;i++){
_19=objj_msgSend(CPString,"stringWithFormat:",arr[i],_18);
c=CPClassFromString(_19);
if(c!=Nil){
return c;
}
}
return Nil;
}
}),new objj_method(sel_getUid("objectClassForTagName:"),function(_1a,_1b,_1c){
with(_1a){
return objj_msgSend(_1a,"objectClassForTagName:mappedByFormatArray:",_1c,objj_msgSend(CPArray,"arrayWithObjects:","GSMarkup%@Tag","GSMarkupTag%@","GS%@Tag","GSTag%@","%@Tag","Tag%@"));
}
}),new objj_method(sel_getUid("connectorClassForTagName:"),function(_1d,_1e,_1f){
with(_1d){
if(_1f=="control"){
return objj_msgSend(GSMarkupControlConnector,"class");
}else{
if(_1f=="outlet"){
return objj_msgSend(GSMarkupOutletConnector,"class");
}
}
return objj_msgSend(_1d,"objectClassForTagName:mappedByFormatArray:",_1f,objj_msgSend(CPArray,"arrayWithObjects:","GSMarkup%@Connector","GSMarkupConnector%@","GS%@Connector","GSConnector%@","%@Connector","Connector%@"));
}
}),new objj_method(sel_getUid("entityClassForTagName:"),function(_20,_21,_22){
with(_20){
return objj_msgSend(_20,"objectClassForTagName:mappedByFormatArray:",_22,objj_msgSend(CPArray,"arrayWithObjects:","GSMarkup%@"));
}
}),new objj_method(sel_getUid("attributesForDOMNode:"),function(_23,_24,_25){
with(_23){
var _26=_25.attributes;
if(!_26){
return nil;
}
var ret=objj_msgSend(CPMutableDictionary,"dictionary");
var i,cnt=_26.length;
for(i=0;i<cnt;i++){
objj_msgSend(ret,"setValue:forKey:",_26[i].nodeValue,_26[i].nodeName);
}
return ret;
}
}),new objj_method(sel_getUid("insertChildrenOfDOMNode:intoContainer:"),function(_27,_28,_29,_2a){
with(_27){
if(!_29){
return nil;
}
var _2b;
if(_2b=_29.childNodes){
var _2c=objj_msgSend(CPMutableArray,"new");
var _2d=_2b.length;
var i;
for(i=0;i<_2d;i++){
var co=objj_msgSend(_27,"insertMarkupObjectFromDOMNode:intoContainer:",_2b[i],nil);
if(co){
objj_msgSend(_2c,"addObject:",co);
}else{
var cnv=_2b[i].nodeValue;
var ts=objj_msgSend(cnv,"trimmedString");
if(ts&&ts.length){
return objj_msgSend(CPArray,"arrayWithObject:",cnv);
}
}
}
return _2c;
}
return nil;
}
}),new objj_method(sel_getUid("insertMarkupObjectFromDOMNode:intoContainer:"),function(_2e,_2f,o,_30){
with(_2e){
var _31;
_31=objj_msgSend(_2e,"objectClassForTagName:",o.nodeName);
if(!_31){
_31=objj_msgSend(_2e,"connectorClassForTagName:",o.nodeName);
}
if(!_31){
_31=objj_msgSend(_2e,"entityClassForTagName:",o.nodeName);
}
if(_31){
var _32=objj_msgSend(_2e,"attributesForDOMNode:",o);
var oid=objj_msgSend(_32,"objectForKey:","id");
if(!oid){
oid=objj_msgSend(CPString,"stringWithFormat:","%@%d",o.nodeName,++_uniqueID);
}
var _33=objj_msgSend(_32,"allKeys");
var i,_34=objj_msgSend(_33,"count");
for(i=0;i<_34;i++){
var key,_35;
key=objj_msgSend(_33,"objectAtIndex:",i);
if(!objj_msgSend(key,"length")){
continue;
}
_35=objj_msgSend(_32,"objectForKey:",key);
if(_30!=_connectors&&objj_msgSend(_35,"hasPrefix:","#")){
if(_30==_entites){
objj_msgSend(_32,"setObject:forKey:",objj_msgSend(GSMarkupConnector,"getObjectForIdString:usingNameTable:",objj_msgSend(_35,"substringFromIndex:",1),_externalNameTable),key);
}else{
if(key!="itemsBinding"&&key!="valueBinding"){
var _36;
var _36=objj_msgSend(objj_msgSend(GSMarkupOutletConnector,"alloc"),"initWithSource:target:label:",oid,_35,key);
if(_36){
objj_msgSend(_connectors,"addObject:",_36);
objj_msgSend(_32,"removeObjectForKey:",key);
}
}
}
}
}
var _37=objj_msgSend(objj_msgSend(_31,"alloc"),"initWithAttributes:content:",_32,objj_msgSend(_2e,"insertChildrenOfDOMNode:intoContainer:",o,_30));
if(!_37){
return nil;
}
if(_30){
objj_msgSend(_30,"addObject:",_37);
}
if(_30!=_connectors){
objj_msgSend(_nameTable,"setObject:forKey:",_37,oid);
}
return _37;
}
return nil;
}
}),new objj_method(sel_getUid("parseXMLString:"),function(_38,_39,_3a){
with(_38){
_parseXml=function(_3b){
if(typeof window.DOMParser!="undefined"){
return (new window.DOMParser()).parseFromString(_3b,"text/xml");
}else{
if(typeof window.ActiveXObject!="undefined"&&new window.ActiveXObject("Microsoft.XMLDOM")){
var _3c=new window.ActiveXObject("Microsoft.XMLDOM");
_3c.async="false";
_3c.loadXML(_3b);
return _3c;
}else{
throw new Error("No XML parser found");
}
}
};
var t=_parseXml(_3a);
if(!t){
return nil;
}
return t;
}
}),new objj_method(sel_getUid("initWithXMLString:"),function(_3d,_3e,_3f){
with(_3d){
_xmlStr=_3f;
_nameTable=objj_msgSend(CPMutableDictionary,"dictionary");
_tagNameToObjectClass=objj_msgSend(CPMutableDictionary,"dictionary");
_objects=objj_msgSend(CPMutableArray,"array");
_connectors=objj_msgSend(CPMutableArray,"array");
_entites=objj_msgSend(CPMutableArray,"array");
return _3d;
}
}),new objj_method(sel_getUid("setExternalNameTable:"),function(_40,_41,_42){
with(_40){
_externalNameTable=_42;
}
}),new objj_method(sel_getUid("setObjectClass:forTagName:"),function(_43,_44,_45,_46){
with(_43){
objj_msgSend(_tagNameToObjectClass,"setObject:forKey:",_45,_46);
}
}),new objj_method(sel_getUid("processDOMNode:intoContainer:"),function(_47,_48,_49,_4a){
with(_47){
if(!_49){
return;
}
var _4b;
if(_4b=_49.childNodes){
var _4c=_4b.length;
for(i=0;i<_4c;i++){
objj_msgSend(_47,"insertMarkupObjectFromDOMNode:intoContainer:",_4b[i],_4a);
}
}
}
}),new objj_method(sel_getUid("_postprocessEntities"),function(_4d,_4e){
with(_4d){
var i,l=_entites.length;
for(i=0;i<l;i++){
var e=_entites[i];
var eFS=objj_msgSend(e,"platformObject");
var _4f=objj_msgSend(eFS,"relationships");
if(!_4f){
continue;
}
var j,l1=_4f.length;
for(j=0;j<l1;j++){
objj_msgSend(_4f[j],"setTarget:",objj_msgSend(objj_msgSend(_nameTable,"objectForKey:",objj_msgSend(_4f[j],"target")),"platformObject"));
}
}
}
}),new objj_method(sel_getUid("_getObjectForIdString:"),function(_50,_51,_52){
with(_50){
var ret;
if(objj_msgSend(_52,"hasPrefix:","#")){
ret=objj_msgSend(GSMarkupConnector,"getObjectForIdString:usingNameTable:",objj_msgSend(_52,"substringFromIndex:",1),_externalNameTable);
}else{
ret=objj_msgSend(GSMarkupConnector,"getPlatformObjectForIdString:usingNameTable:",_52,_nameTable);
}
return ret;
}
}),new objj_method(sel_getUid("_postprocessForBindings:"),function(_53,_54,_55){
with(_53){
var i,l=_55.length;
for(i=0;i<l;i++){
var o=_55[i];
if(!objj_msgSend(o,"respondsToSelector:",sel_getUid("platformObject"))){
continue;
}
var oPO=objj_msgSend(o,"platformObject");
var _56;
if(_56=objj_msgSend(objj_msgSend(o,"attributes"),"objectForKey:","itemsBinding")){
var r=objj_msgSend(_56,"rangeOfString:",".");
if(r.location!=CPNotFound){
r=objj_msgSend(_56,"rangeOfString:options:",".",CPBackwardsSearch);
var _57=objj_msgSend(_56,"componentsSeparatedByString:",".");
var _58=objj_msgSend(_57,"subarrayWithRange:",CPMakeRange(0,_57.length-2));
var _59=(_58.length>1)?_58.join("."):_58[0];
var _5a=objj_msgSend(_53,"_getObjectForIdString:",_59);
var _5b=objj_msgSend(_56,"substringFromIndex:",CPMaxRange(r));
var _5c=objj_msgSend(_5a,"pk");
if(objj_msgSend(oPO,"isKindOfClass:",objj_msgSend(CPPopUpButton,"class"))){
if(_5b&&_5c){
objj_msgSend(oPO,"bind:toObject:withKeyPath:options:","itemArray",_5a,"arrangedObjects."+_5b,nil);
objj_msgSend(oPO,"bind:toObject:withKeyPath:options:","tagArray",_5a,"arrangedObjects."+_5c,nil);
}
}
}
}
if(_56=objj_msgSend(objj_msgSend(o,"attributes"),"objectForKey:","valueBinding")){
var r=objj_msgSend(_56,"rangeOfString:",".");
if(objj_msgSend(oPO,"isKindOfClass:",objj_msgSend(CPTableView,"class"))){
var _5d=objj_msgSend(_53,"_getObjectForIdString:",_56);
objj_msgSend(oPO,"bind:toObject:withKeyPath:options:","content",_5d,"arrangedObjects",nil);
objj_msgSend(oPO,"bind:toObject:withKeyPath:options:","sortDescriptors",_5d,"sortDescriptors",nil);
var _5e=objj_msgSend(o,"content");
var j,l1=_5e.length;
for(j=0;j<l1;j++){
var _5f=_5e[j];
if(_5f&&objj_msgSend(_5f,"isKindOfClass:",objj_msgSend(GSMarkupTagTableColumn,"class"))){
objj_msgSend(objj_msgSend(_5f,"platformObject"),"bind:toObject:withKeyPath:options:",CPValueBinding,_5d,"arrangedObjects."+objj_msgSend(objj_msgSend(_5f,"attributes"),"objectForKey:","identifier"),nil);
}
}
}else{
var _60=objj_msgSend(_56,"substringToIndex:",r.location);
var _5d=objj_msgSend(_53,"_getObjectForIdString:",_60);
var _61=objj_msgSend(_56,"substringFromIndex:",CPMaxRange(r));
if(objj_msgSend(oPO,"isKindOfClass:",objj_msgSend(CPPredicateEditor,"class"))){
objj_msgSend(oPO,"setObjectValue:",objj_msgSend(_53,"_getObjectForIdString:",_56));
objj_msgSend(_5d,"bind:toObject:withKeyPath:options:","filterPredicate",oPO,"objectValue",nil);
}else{
var _62=CPValueBinding;
if(objj_msgSend(oPO,"isKindOfClass:",objj_msgSend(FSArrayController,"class"))){
_62="contentArray";
}else{
if(objj_msgSend(oPO,"isKindOfClass:",objj_msgSend(CPPopUpButton,"class"))){
_62="integerValue";
}
}
objj_msgSend(oPO,"bind:toObject:withKeyPath:options:",_62,_5d,_61,nil);
}
}
}
if(_56=objj_msgSend(objj_msgSend(o,"attributes"),"objectForKey:","filterPredicate")){
if(objj_msgSend(oPO,"isKindOfClass:",objj_msgSend(FSArrayController,"class"))){
objj_msgSend(oPO,"setClearsFilterPredicateOnInsertion:",NO);
objj_msgSend(oPO,"setFilterPredicate:",objj_msgSend(_53,"_getObjectForIdString:",_56));
}
}
if(_56=objj_msgSend(objj_msgSend(o,"attributes"),"objectForKey:","formatterClass")){
var _63=objj_msgSend(objj_msgSend(o,"attributes"),"objectForKey:","displayFormat");
var _64=objj_msgSend(objj_msgSend(o,"attributes"),"objectForKey:","editingFormat");
var _65=(objj_msgSend(o,"boolValueForAttribute:","editingFormat")==1);
if(!_63&&!_64){
objj_msgSend(oPO,"setFormatter:",objj_msgSend(CPClassFromString(_56),"new"));
}else{
objj_msgSend(oPO,"setFormatter:",objj_msgSend(CPClassFromString(_56),"formatterWithDisplayFormat:editingFormat:emptyIsValid:",_63,_64,_65));
}
}
objj_msgSend(_53,"_postprocessForBindings:",objj_msgSend(o,"content"));
}
}
}),new objj_method(sel_getUid("_postprocessForEntities:"),function(_66,_67,_68){
with(_66){
var i,l=_68.length;
for(i=0;i<l;i++){
var o=_68[i];
if(!objj_msgSend(o,"respondsToSelector:",sel_getUid("platformObject"))){
continue;
}
var oPO=objj_msgSend(o,"platformObject");
if(objj_msgSend(oPO,"isKindOfClass:",objj_msgSend(FSArrayController,"class"))){
var _69;
if(_69=objj_msgSend(objj_msgSend(o,"attributes"),"objectForKey:","sortDescriptor")){
objj_msgSend(oPO,"setSortDescriptors:",[objj_msgSend(_66,"_getObjectForIdString:",_69)]);
}
if(_69=objj_msgSend(objj_msgSend(o,"attributes"),"objectForKey:","entity")){
var _6a=objj_msgSend(objj_msgSend(_nameTable,"objectForKey:",_69),"platformObject");
objj_msgSend(oPO,"setEntity:",_6a);
}
if(objj_msgSend(o,"boolValueForAttribute:","autoFetch")==1){
var _6b=objj_msgSend(objj_msgSend(o,"attributes"),"objectForKey:","entity");
if(_6b){
var _6a;
if(_6a=objj_msgSend(objj_msgSend(_nameTable,"objectForKey:",_6b),"platformObject")){
objj_msgSend(oPO,"setContent:",objj_msgSend(_6a,"allObjects"));
}
}
}
}
objj_msgSend(_66,"_postprocessForEntities:",objj_msgSend(o,"content"));
}
}
}),new objj_method(sel_getUid("parse"),function(_6c,_6d){
with(_6c){
var t=objj_msgSend(_6c,"parseXMLString:",_xmlStr);
var _6e=t.getElementsByTagName("objects");
if(_6e){
objj_msgSend(_6c,"processDOMNode:intoContainer:",_6e[0],_objects);
}
var _6f=t.getElementsByTagName("entities");
if(_6f){
objj_msgSend(_6c,"processDOMNode:intoContainer:",_6f[0],_entites);
objj_msgSend(_6c,"_postprocessEntities");
}
var _70=t.getElementsByTagName("connectors");
if(_70){
objj_msgSend(_6c,"processDOMNode:intoContainer:",_70[0],_connectors);
}
objj_msgSend(_6c,"_postprocessForEntities:",_objects);
objj_msgSend(_6c,"_postprocessForBindings:",_objects);
}
}),new objj_method(sel_getUid("nameTable"),function(_71,_72){
with(_71){
return _nameTable;
}
}),new objj_method(sel_getUid("objects"),function(_73,_74){
with(_73){
return _objects;
}
}),new objj_method(sel_getUid("connectors"),function(_75,_76){
with(_75){
return _connectors;
}
}),new objj_method(sel_getUid("entities"),function(_77,_78){
with(_77){
return _entities;
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("initialize"),function(_79,_7a){
with(_79){
if(_79=objj_msgSendSuper({receiver:_79,super_class:objj_getMetaClass("GSMarkupDecoder").super_class},"initialize")){
}
return _79;
}
}),new objj_method(sel_getUid("decoderWithContentsOfFile:"),function(_7b,_7c,_7d){
with(_7b){
return objj_msgSend(objj_msgSend(_7b,"alloc"),"initWithContentsOfFile:",_7d);
}
})]);
