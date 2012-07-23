@STATIC;1.0;I;23;Foundation/Foundation.jI;15;AppKit/AppKit.jt;1559;
objj_executeFile("Foundation/Foundation.j",NO);
objj_executeFile("AppKit/AppKit.j",NO);
findCibClassDependencies=function(_1){
var _2=objj_msgSend(objj_msgSend(CPCib,"alloc"),"initWithContentsOfURL:",_1),_3={},_4=CPClassFromString;
CPClassFromString=function(_5){
var _6=_4(_5);
_3[_5]=true;
return _6;
};
objj_msgSend(CPApplication,"sharedApplication");
try{
var x=objj_msgSend(_2,"pressInstantiate");
}
catch(e){
CPLog.warn("Exception thrown when instantiating "+_1+": "+e);
}
finally{
CPClassFromString=_4;
}
return Object.keys(_3);
};
var _7=objj_getClass("CPCib");
if(!_7){
throw new SyntaxError("*** Could not find definition for class \"CPCib\"");
}
var _8=_7.isa;
class_addMethods(_7,[new objj_method(sel_getUid("pressInstantiate"),function(_9,_a){
with(_9){
var _b=_bundle,_c=nil;
if(!_b&&_c){
_b=objj_msgSend(CPBundle,"bundleForClass:",objj_msgSend(_c,"class"));
}
var _d=objj_msgSend(objj_msgSend(_CPCibKeyedUnarchiver,"alloc"),"initForReadingWithData:bundle:awakenCustomResources:",_data,_b,_awakenCustomResources),_e=nil;
if(_e){
var _f=nil,_10=objj_msgSend(_e,"keyEnumerator");
while((_f=objj_msgSend(_10,"nextObject"))!==nil){
objj_msgSend(_d,"setClass:forClassName:",objj_msgSend(_e,"objectForKey:",_f),_f);
}
}
objj_msgSend(_d,"setExternalObjectsForProxyIdentifiers:",nil);
var _11=objj_msgSend(_d,"decodeObjectForKey:","CPCibObjectDataKey");
if(!_11||!objj_msgSend(_11,"isKindOfClass:",objj_msgSend(_CPCibObjectData,"class"))){
return NO;
}
var _12=nil;
objj_msgSend(_11,"instantiateWithOwner:topLevelObjects:",_c,_12);
return YES;
}
})]);
