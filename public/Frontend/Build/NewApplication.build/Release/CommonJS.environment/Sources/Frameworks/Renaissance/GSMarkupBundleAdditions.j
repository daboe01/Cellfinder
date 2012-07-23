@STATIC;1.0;I;21;Foundation/CPBundle.ji;17;GSMarkupDecoder.ji;16;GSMarkupAwaker.ji;19;GSMarkupLocalizer.ji;19;GSMarkupConnector.jt;5130;
objj_executeFile("Foundation/CPBundle.j",NO);
objj_executeFile("GSMarkupDecoder.j",YES);
objj_executeFile("GSMarkupAwaker.j",YES);
objj_executeFile("GSMarkupLocalizer.j",YES);
objj_executeFile("GSMarkupConnector.j",YES);
GSMarkupBundleDidLoadGSMarkupNotification="GSMarkupBundleDidLoadGSMarkupNotification";
var _1;
var _2=objj_getClass("CPBundle");
if(!_2){
throw new SyntaxError("*** Could not find definition for class \"CPBundle\"");
}
var _3=_2.isa;
class_addMethods(_2,[new objj_method(sel_getUid("localizedStringForKey:value:table:"),function(_4,_5,_6,_7,_8){
with(_4){
if(!_6||!_8){
return _7;
}
return _6;
}
})]);
class_addMethods(_3,[new objj_method(sel_getUid("registerStaticObject:withName:"),function(_9,_a,_b,_c){
with(_9){
if(_1==nil){
_1=objj_msgSend(CPMutableDictionary,"new");
}
objj_msgSend(_1,"setObject:forKey:",_b,_c);
}
}),new objj_method(sel_getUid("loadGSMarkupData:externalNameTable:localizableStringsTable:inBundle:tagMapping:"),function(_d,_e,_f,_10,_11,_12,_13){
with(_d){
objj_msgSend(_d,"registerStaticObject:withName:",objj_msgSend(CPApplication,"sharedApplication"),"CPApp");
var _14=NO;
if(_f==nil){
return NO;
}
if(_12==nil){
_12=objj_msgSend(CPBundle,"mainBundle");
}
var _15;
var _16;
var _17;
var _18;
var i,_19;
var e;
var key;
var _1a=nil;
var _1b=objj_msgSend(GSMarkupAwaker,"new");
var _1c=objj_msgSend(objj_msgSend(GSMarkupDecoder,"alloc"),"initWithXMLString:",objj_msgSend(_f,"rawString"));
objj_msgSend(_1c,"setExternalNameTable:",_10);
objj_msgSend(_1c,"parse");
var _1d=objj_msgSend(_1c,"objects");
if(_13!=nil){
e=objj_msgSend(_13,"keyEnumerator");
while((key=objj_msgSend(e,"nextObject"))!=nil){
var _1e=objj_msgSend(_13,"objectForKey:",key);
objj_msgSend(_1c,"setObjectClass:forTagName:",_1e,key);
}
}
_18=objj_msgSend(CPMutableArray,"arrayWithCapacity:",objj_msgSend(_1d,"count"));
var _1f=objj_msgSend(objj_msgSend(GSMarkupLocalizer,"alloc"),"initWithTable:bundle:",_11,_12);
_15=objj_msgSend(objj_msgSend(_1c,"nameTable"),"mutableCopy");
_17=objj_msgSend(_1c,"connectors");
_19=objj_msgSend(_1d,"count");
for(i=0;i<_19;i++){
var o;
var _20;
o=objj_msgSend(_1d,"objectAtIndex:",i);
objj_msgSend(o,"setLocalizer:",_1f);
objj_msgSend(o,"setAwaker:",_1b);
_20=objj_msgSend(o,"platformObject");
if(_20!=nil){
objj_msgSend(_18,"addObject:",_20);
}
}
e=objj_msgSend(objj_msgSend(_15,"allKeys"),"objectEnumerator");
while((key=objj_msgSend(e,"nextObject"))!=nil){
var _21=objj_msgSend(_15,"objectForKey:",key);
var _20=objj_msgSend(_21,"platformObject");
if(_20!=nil){
objj_msgSend(_15,"setObject:forKey:",_20,key);
}else{
objj_msgSend(_15,"removeObjectForKey:",key);
}
}
e=objj_msgSend(_10,"keyEnumerator");
while((key=objj_msgSend(e,"nextObject"))!=nil){
var _21=objj_msgSend(_10,"objectForKey:",key);
if(objj_msgSend(key,"isEqualToString:","CPTopLevelObjects")&&objj_msgSend(_21,"isKindOfClass:",objj_msgSend(CPMutableArray,"class"))){
_1a=_21;
}else{
objj_msgSend(_15,"setObject:forKey:",_21,key);
}
}
if(_1!=nil){
objj_msgSend(_15,"addEntriesFromDictionary:",_1);
}
_19=objj_msgSend(_17,"count");
for(i=0;i<_19;i++){
var _22=objj_msgSend(_17,"objectAtIndex:",i);
objj_msgSend(_22,"establishConnectionUsingNameTable:",_15);
}
var _23=objj_msgSend(_15,"objectForKey:","CPOwner");
if(_23!=nil){
objj_msgSend(_1b,"registerObject:",_23);
}
objj_msgSend(_1b,"awakeObjects");
var _23=objj_msgSend(_15,"objectForKey:","CPOwner");
var _1d=objj_msgSend(CPMutableArray,"array");
var n;
_19=objj_msgSend(_18,"count");
for(i=0;i<_19;i++){
var _21=objj_msgSend(_18,"objectAtIndex:",i);
objj_msgSend(_1d,"addObject:",_21);
}
n=objj_msgSend(CPNotification,"notificationWithName:object:userInfo:",GSMarkupBundleDidLoadGSMarkupNotification,_23,objj_msgSend(CPDictionary,"dictionaryWithObject:forKey:",_1d,"CPTopLevelObjects"));
if(_23!=nil){
if(objj_msgSend(_23,"respondsToSelector:",sel_getUid("bundleDidLoadGSMarkup:"))){
objj_msgSend(_23,"bundleDidLoadGSMarkup:",n);
}
}
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotification:",n);
if(_1a!=nil){
_19=objj_msgSend(_18,"count");
for(i=0;i<_19;i++){
var _21=objj_msgSend(_18,"objectAtIndex:",i);
objj_msgSend(_1a,"addObject:",_21);
}
}
_16=objj_msgSend(_10,"objectForKey:","GSMarkupNameTable");
if(_16!=nil&&objj_msgSend(_16,"isKindOfClass:",objj_msgSend(CPMutableDictionary,"class"))==YES){
var k;
objj_msgSend(_16,"removeAllObjects");
e=objj_msgSend(_15,"keyEnumerator");
while((k=objj_msgSend(e,"nextObject"))!=nil){
if(objj_msgSend(_10,"objectForKey:",k)==nil){
objj_msgSend(_16,"setObject:forKey:",objj_msgSend(_15,"objectForKey:",k),k);
}
}
}
_14=YES;
return _14?_1c:nil;
}
}),new objj_method(sel_getUid("loadRessourceNamed:owner:"),function(_24,_25,_26,_27){
with(_24){
var _28=objj_msgSend(objj_msgSend(CPData,"alloc"),"initWithContentsOfURL:",objj_msgSend(CPURL,"URLWithString:",objj_msgSend(CPString,"stringWithFormat:","%@/%@",objj_msgSend(objj_msgSend(CPBundle,"mainBundle"),"resourcePath"),_26)));
return objj_msgSend(CPBundle,"loadGSMarkupData:externalNameTable:localizableStringsTable:inBundle:tagMapping:",_28,objj_msgSend(CPDictionary,"dictionaryWithObject:forKey:",_27,"CPOwner"),nil,nil,nil);
}
})]);
