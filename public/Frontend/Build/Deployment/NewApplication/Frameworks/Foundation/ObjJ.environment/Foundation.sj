@STATIC;1.0;p;12;Foundation.jt;3147;@STATIC;1.0;i;9;CPArray.ji;10;CPBundle.ji;16;CPCharacterSet.ji;9;CPCoder.ji;23;CPComparisonPredicate.ji;21;CPCompoundPredicate.ji;8;CPData.ji;8;CPDate.ji;14;CPDictionary.ji;14;CPEnumerator.ji;13;CPException.ji;14;CPExpression.ji;13;CPFormatter.ji;12;CPIndexSet.ji;14;CPInvocation.ji;17;CPKeyedArchiver.ji;19;CPKeyedUnarchiver.ji;18;CPKeyValueCoding.ji;21;CPKeyValueObserving.ji;16;CPMutableArray.ji;14;CPMutableSet.ji;16;CPNotification.ji;22;CPNotificationCenter.ji;8;CPNull.ji;10;CPNumber.ji;10;CPObject.ji;15;CPObjJRuntime.ji;13;CPPredicate.ji;29;CPPropertyListSerialization.ji;9;CPRange.ji;11;CPRunLoop.ji;11;CPScanner.ji;7;CPSet.ji;18;CPSortDescriptor.ji;10;CPString.ji;9;CPTimer.ji;15;CPUndoManager.ji;7;CPURL.ji;17;CPURLConnection.ji;14;CPURLRequest.ji;15;CPURLResponse.ji;16;CPUserDefaults.ji;9;CPValue.ji;20;CPValueTransformer.jt;2304;
objj_executeFile("CPArray.j",YES);
objj_executeFile("CPBundle.j",YES);
objj_executeFile("CPCharacterSet.j",YES);
objj_executeFile("CPCoder.j",YES);
objj_executeFile("CPComparisonPredicate.j",YES);
objj_executeFile("CPCompoundPredicate.j",YES);
objj_executeFile("CPData.j",YES);
objj_executeFile("CPDate.j",YES);
/* objj_executeFile("CPDateFormatter.j",YES) */ (undefined);
/* objj_executeFile("CPDecimal.j",YES) */ (undefined);
/* objj_executeFile("CPDecimalNumber.j",YES) */ (undefined);
objj_executeFile("CPDictionary.j",YES);
objj_executeFile("CPEnumerator.j",YES);
objj_executeFile("CPException.j",YES);
objj_executeFile("CPExpression.j",YES);
objj_executeFile("CPFormatter.j",YES);
objj_executeFile("CPIndexSet.j",YES);
/* objj_executeFile("CPIndexPath.j",YES) */ (undefined);
objj_executeFile("CPInvocation.j",YES);
/* objj_executeFile("CPJSONPConnection.j",YES) */ (undefined);
objj_executeFile("CPKeyedArchiver.j",YES);
objj_executeFile("CPKeyedUnarchiver.j",YES);
objj_executeFile("CPKeyValueCoding.j",YES);
objj_executeFile("CPKeyValueObserving.j",YES);
objj_executeFile("CPMutableArray.j",YES);
objj_executeFile("CPMutableSet.j",YES);
objj_executeFile("CPNotification.j",YES);
objj_executeFile("CPNotificationCenter.j",YES);
objj_executeFile("CPNull.j",YES);
objj_executeFile("CPNumber.j",YES);
/* objj_executeFile("CPNumberFormatter.j",YES) */ (undefined);
objj_executeFile("CPObject.j",YES);
objj_executeFile("CPObjJRuntime.j",YES);
/* objj_executeFile("CPOperation.j",YES) */ (undefined);
/* objj_executeFile("CPOperationQueue.j",YES) */ (undefined);
objj_executeFile("CPPredicate.j",YES);
objj_executeFile("CPPropertyListSerialization.j",YES);
objj_executeFile("CPRange.j",YES);
objj_executeFile("CPRunLoop.j",YES);
objj_executeFile("CPScanner.j",YES);
objj_executeFile("CPSet.j",YES);
objj_executeFile("CPSortDescriptor.j",YES);
objj_executeFile("CPString.j",YES);
objj_executeFile("CPTimer.j",YES);
objj_executeFile("CPUndoManager.j",YES);
objj_executeFile("CPURL.j",YES);
objj_executeFile("CPURLConnection.j",YES);
objj_executeFile("CPURLRequest.j",YES);
objj_executeFile("CPURLResponse.j",YES);
objj_executeFile("CPUserDefaults.j",YES);
/* objj_executeFile("CPUserSessionManager.j",YES) */ (undefined);
objj_executeFile("CPValue.j",YES);
objj_executeFile("CPValueTransformer.j",YES);
p;10;CPObject.jt;6715;@STATIC;1.0;t;6696;
var _1=objj_allocateClassPair(Nil,"CPObject"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("isa")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("init"),function(_3,_4){
with(_3){
return _3;
}
}),new objj_method(sel_getUid("copy"),function(_5,_6){
with(_5){
return _5;
}
}),new objj_method(sel_getUid("mutableCopy"),function(_7,_8){
with(_7){
return objj_msgSend(_7,"copy");
}
}),new objj_method(sel_getUid("dealloc"),function(_9,_a){
with(_9){
}
}),new objj_method(sel_getUid("class"),function(_b,_c){
with(_b){
return isa;
}
}),new objj_method(sel_getUid("isKindOfClass:"),function(_d,_e,_f){
with(_d){
return objj_msgSend(isa,"isSubclassOfClass:",_f);
}
}),new objj_method(sel_getUid("isMemberOfClass:"),function(_10,_11,_12){
with(_10){
return _10.isa===_12;
}
}),new objj_method(sel_getUid("isProxy"),function(_13,_14){
with(_13){
return NO;
}
}),new objj_method(sel_getUid("respondsToSelector:"),function(_15,_16,_17){
with(_15){
return !!class_getInstanceMethod(isa,_17);
}
}),new objj_method(sel_getUid("implementsSelector:"),function(_18,_19,_1a){
with(_18){
var _1b=class_copyMethodList(isa),_1c=_1b.length;
while(_1c--){
if(method_getName(_1b[_1c])===_1a){
return YES;
}
}
return NO;
}
}),new objj_method(sel_getUid("methodForSelector:"),function(_1d,_1e,_1f){
with(_1d){
return class_getMethodImplementation(isa,_1f);
}
}),new objj_method(sel_getUid("methodSignatureForSelector:"),function(_20,_21,_22){
with(_20){
return nil;
}
}),new objj_method(sel_getUid("description"),function(_23,_24){
with(_23){
return "<"+class_getName(isa)+" 0x"+objj_msgSend(CPString,"stringWithHash:",objj_msgSend(_23,"UID"))+">";
}
}),new objj_method(sel_getUid("performSelector:"),function(_25,_26,_27){
with(_25){
return objj_msgSend(_25,_27);
}
}),new objj_method(sel_getUid("performSelector:withObject:"),function(_28,_29,_2a,_2b){
with(_28){
return objj_msgSend(_28,_2a,_2b);
}
}),new objj_method(sel_getUid("performSelector:withObject:withObject:"),function(_2c,_2d,_2e,_2f,_30){
with(_2c){
return objj_msgSend(_2c,_2e,_2f,_30);
}
}),new objj_method(sel_getUid("performSelector:withObjects:"),function(_31,_32,_33,_34){
with(_31){
var _35=[_31,_33].concat(Array.prototype.slice.apply(arguments,[3]));
return objj_msgSend.apply(this,_35);
}
}),new objj_method(sel_getUid("forwardingTargetForSelector:"),function(_36,_37,_38){
with(_36){
return nil;
}
}),new objj_method(sel_getUid("forwardInvocation:"),function(_39,_3a,_3b){
with(_39){
objj_msgSend(_39,"doesNotRecognizeSelector:",objj_msgSend(_3b,"selector"));
}
}),new objj_method(sel_getUid("doesNotRecognizeSelector:"),function(_3c,_3d,_3e){
with(_3c){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,(class_isMetaClass(isa)?"+":"-")+" ["+objj_msgSend(_3c,"className")+" "+_3e+"] unrecognized selector sent to "+(class_isMetaClass(isa)?"class "+class_getName(isa):"instance 0x"+objj_msgSend(CPString,"stringWithHash:",objj_msgSend(_3c,"UID"))));
}
}),new objj_method(sel_getUid("awakeAfterUsingCoder:"),function(_3f,_40,_41){
with(_3f){
return _3f;
}
}),new objj_method(sel_getUid("classForKeyedArchiver"),function(_42,_43){
with(_42){
return objj_msgSend(_42,"classForCoder");
}
}),new objj_method(sel_getUid("classForCoder"),function(_44,_45){
with(_44){
return objj_msgSend(_44,"class");
}
}),new objj_method(sel_getUid("replacementObjectForArchiver:"),function(_46,_47,_48){
with(_46){
return objj_msgSend(_46,"replacementObjectForCoder:",_48);
}
}),new objj_method(sel_getUid("replacementObjectForKeyedArchiver:"),function(_49,_4a,_4b){
with(_49){
return objj_msgSend(_49,"replacementObjectForCoder:",_4b);
}
}),new objj_method(sel_getUid("replacementObjectForCoder:"),function(_4c,_4d,_4e){
with(_4c){
return _4c;
}
}),new objj_method(sel_getUid("className"),function(_4f,_50){
with(_4f){
return isa.name;
}
}),new objj_method(sel_getUid("autorelease"),function(_51,_52){
with(_51){
return _51;
}
}),new objj_method(sel_getUid("hash"),function(_53,_54){
with(_53){
return objj_msgSend(_53,"UID");
}
}),new objj_method(sel_getUid("UID"),function(_55,_56){
with(_55){
if(typeof _55._UID==="undefined"){
_55._UID=objj_generateObjectUID();
}
return _UID+"";
}
}),new objj_method(sel_getUid("isEqual:"),function(_57,_58,_59){
with(_57){
return _57===_59||objj_msgSend(_57,"UID")===objj_msgSend(_59,"UID");
}
}),new objj_method(sel_getUid("retain"),function(_5a,_5b){
with(_5a){
return _5a;
}
}),new objj_method(sel_getUid("release"),function(_5c,_5d){
with(_5c){
}
}),new objj_method(sel_getUid("self"),function(_5e,_5f){
with(_5e){
return _5e;
}
}),new objj_method(sel_getUid("superclass"),function(_60,_61){
with(_60){
return isa.super_class;
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("load"),function(_62,_63){
with(_62){
}
}),new objj_method(sel_getUid("initialize"),function(_64,_65){
with(_64){
}
}),new objj_method(sel_getUid("new"),function(_66,_67){
with(_66){
return objj_msgSend(objj_msgSend(_66,"alloc"),"init");
}
}),new objj_method(sel_getUid("alloc"),function(_68,_69){
with(_68){
return class_createInstance(_68);
}
}),new objj_method(sel_getUid("allocWithCoder:"),function(_6a,_6b,_6c){
with(_6a){
return objj_msgSend(_6a,"alloc");
}
}),new objj_method(sel_getUid("class"),function(_6d,_6e){
with(_6d){
return _6d;
}
}),new objj_method(sel_getUid("superclass"),function(_6f,_70){
with(_6f){
return super_class;
}
}),new objj_method(sel_getUid("isSubclassOfClass:"),function(_71,_72,_73){
with(_71){
var _74=_71;
for(;_74;_74=_74.super_class){
if(_74===_73){
return YES;
}
}
return NO;
}
}),new objj_method(sel_getUid("isKindOfClass:"),function(_75,_76,_77){
with(_75){
return objj_msgSend(_75,"isSubclassOfClass:",_77);
}
}),new objj_method(sel_getUid("isMemberOfClass:"),function(_78,_79,_7a){
with(_78){
return _78===_7a;
}
}),new objj_method(sel_getUid("instancesRespondToSelector:"),function(_7b,_7c,_7d){
with(_7b){
return !!class_getInstanceMethod(_7b,_7d);
}
}),new objj_method(sel_getUid("instanceMethodForSelector:"),function(_7e,_7f,_80){
with(_7e){
return class_getMethodImplementation(_7e,_80);
}
}),new objj_method(sel_getUid("description"),function(_81,_82){
with(_81){
return class_getName(isa);
}
}),new objj_method(sel_getUid("setVersion:"),function(_83,_84,_85){
with(_83){
class_setVersion(_83,_85);
}
}),new objj_method(sel_getUid("version"),function(_86,_87){
with(_86){
return class_getVersion(_86);
}
})]);
CPDescriptionOfObject=function(_88){
if(_88.isa){
return objj_msgSend(_88,"description");
}
if(typeof (_88)!=="object"){
return String(_88);
}
var _89="JSObject\n{\n";
for(var _8a in _88){
if(_88.hasOwnProperty(_8a)){
_89+="   "+_8a+": "+CPDescriptionOfObject(_88[_8a])+"\n";
}
}
_89+="}";
return _89.split("\n").join("\n\t");
};
p;10;CPString.jt;13409;@STATIC;1.0;i;13;CPException.ji;10;CPObject.ji;15;CPObjJRuntime.ji;9;CPRange.ji;18;CPSortDescriptor.ji;7;CPURL.ji;9;CPValue.jt;13276;
objj_executeFile("CPException.j",YES);
objj_executeFile("CPObject.j",YES);
objj_executeFile("CPObjJRuntime.j",YES);
objj_executeFile("CPRange.j",YES);
objj_executeFile("CPSortDescriptor.j",YES);
objj_executeFile("CPURL.j",YES);
objj_executeFile("CPValue.j",YES);
CPCaseInsensitiveSearch=1;
CPLiteralSearch=2;
CPBackwardsSearch=4;
CPAnchoredSearch=8;
CPNumericSearch=64;
CPDiacriticInsensitiveSearch=128;
var _1=new CFMutableDictionary(),_2=["/",".","*","+","?","|","$","^","(",")","[","]","{","}","\\"],_3=new RegExp("(\\"+_2.join("|\\")+")","g"),_4=new RegExp("(^\\s+|\\s+$)","g");
var _5=objj_allocateClassPair(CPObject,"CPString"),_6=_5.isa;
objj_registerClassPair(_5);
class_addMethods(_5,[new objj_method(sel_getUid("initWithString:"),function(_7,_8,_9){
with(_7){
if(objj_msgSend(_7,"class")===CPString){
return String(_9);
}
var _a=new String(_9);
_a.isa=objj_msgSend(_7,"class");
return _a;
}
}),new objj_method(sel_getUid("initWithFormat:"),function(_b,_c,_d){
with(_b){
if(!_d){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,"initWithFormat: the format can't be 'nil'");
}
_b=ObjectiveJ.sprintf.apply(this,Array.prototype.slice.call(arguments,2));
return _b;
}
}),new objj_method(sel_getUid("description"),function(_e,_f){
with(_e){
return _e;
}
}),new objj_method(sel_getUid("length"),function(_10,_11){
with(_10){
return length;
}
}),new objj_method(sel_getUid("characterAtIndex:"),function(_12,_13,_14){
with(_12){
return charAt(_14);
}
}),new objj_method(sel_getUid("stringByAppendingFormat:"),function(_15,_16,_17){
with(_15){
if(!_17){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,"initWithFormat: the format can't be 'nil'");
}
return _15+ObjectiveJ.sprintf.apply(this,Array.prototype.slice.call(arguments,2));
}
}),new objj_method(sel_getUid("stringByAppendingString:"),function(_18,_19,_1a){
with(_18){
return _18+_1a;
}
}),new objj_method(sel_getUid("stringByPaddingToLength:withString:startingAtIndex:"),function(_1b,_1c,_1d,_1e,_1f){
with(_1b){
if(length==_1d){
return _1b;
}
if(_1d<length){
return substr(0,_1d);
}
var _20=_1b,_21=_1e.substring(_1f),_22=_1d-length;
while((_22-=_21.length)>=0){
_20+=_21;
}
if(-_22<_21.length){
_20+=_21.substring(0,-_22);
}
return _20;
}
}),new objj_method(sel_getUid("componentsSeparatedByString:"),function(_23,_24,_25){
with(_23){
return split(_25);
}
}),new objj_method(sel_getUid("substringFromIndex:"),function(_26,_27,_28){
with(_26){
return substr(_28);
}
}),new objj_method(sel_getUid("substringWithRange:"),function(_29,_2a,_2b){
with(_29){
if(_2b.location<0||((_2b).location+(_2b).length)>length){
objj_msgSend(CPException,"raise:reason:",CPRangeException,"aRange out of bounds");
}
return substr(_2b.location,_2b.length);
}
}),new objj_method(sel_getUid("substringToIndex:"),function(_2c,_2d,_2e){
with(_2c){
if(_2e>length){
objj_msgSend(CPException,"raise:reason:",CPRangeException,"index out of bounds");
}
return substring(0,_2e);
}
}),new objj_method(sel_getUid("rangeOfString:"),function(_2f,_30,_31){
with(_2f){
return objj_msgSend(_2f,"rangeOfString:options:",_31,0);
}
}),new objj_method(sel_getUid("rangeOfString:options:"),function(_32,_33,_34,_35){
with(_32){
return objj_msgSend(_32,"rangeOfString:options:range:",_34,_35,nil);
}
}),new objj_method(sel_getUid("rangeOfString:options:range:"),function(_36,_37,_38,_39,_3a){
with(_36){
if(!_38){
return CPMakeRange(CPNotFound,0);
}
var _3b=(_3a==nil)?_36:objj_msgSend(_36,"substringWithRange:",_3a),_3c=CPNotFound;
if(_39&CPCaseInsensitiveSearch){
_3b=_3b.toLowerCase();
_38=_38.toLowerCase();
}
if(_39&CPBackwardsSearch){
_3c=_3b.lastIndexOf(_38);
if(_39&CPAnchoredSearch&&_3c+_38.length!=_3b.length){
_3c=CPNotFound;
}
}else{
if(_39&CPAnchoredSearch){
_3c=_3b.substr(0,_38.length).indexOf(_38)!=CPNotFound?0:CPNotFound;
}else{
_3c=_3b.indexOf(_38);
}
}
if(_3c==CPNotFound){
return CPMakeRange(CPNotFound,0);
}
return CPMakeRange(_3c+(_3a?_3a.location:0),_38.length);
}
}),new objj_method(sel_getUid("stringByEscapingRegexControlCharacters"),function(_3d,_3e){
with(_3d){
return _3d.replace(_3,"\\$1");
}
}),new objj_method(sel_getUid("stringByReplacingOccurrencesOfString:withString:"),function(_3f,_40,_41,_42){
with(_3f){
return _3f.replace(new RegExp(objj_msgSend(_41,"stringByEscapingRegexControlCharacters"),"g"),_42);
}
}),new objj_method(sel_getUid("stringByReplacingOccurrencesOfString:withString:options:range:"),function(_43,_44,_45,_46,_47,_48){
with(_43){
var _49=substring(0,_48.location),_4a=substr(_48.location,_48.length),end=substring(_48.location+_48.length,_43.length),_45=objj_msgSend(_45,"stringByEscapingRegexControlCharacters"),_4b;
if(_47&CPCaseInsensitiveSearch){
_4b=new RegExp(_45,"gi");
}else{
_4b=new RegExp(_45,"g");
}
return _49+""+_4a.replace(_4b,_46)+""+end;
}
}),new objj_method(sel_getUid("stringByReplacingCharactersInRange:withString:"),function(_4c,_4d,_4e,_4f){
with(_4c){
return ""+substring(0,_4e.location)+_4f+substring(_4e.location+_4e.length,_4c.length);
}
}),new objj_method(sel_getUid("stringByTrimmingWhitespace"),function(_50,_51){
with(_50){
return _50.replace(_4,"");
}
}),new objj_method(sel_getUid("compare:"),function(_52,_53,_54){
with(_52){
return objj_msgSend(_52,"compare:options:",_54,nil);
}
}),new objj_method(sel_getUid("caseInsensitiveCompare:"),function(_55,_56,_57){
with(_55){
return objj_msgSend(_55,"compare:options:",_57,CPCaseInsensitiveSearch);
}
}),new objj_method(sel_getUid("compare:options:"),function(_58,_59,_5a,_5b){
with(_58){
var lhs=_58,rhs=_5a;
if(_5b&CPCaseInsensitiveSearch){
lhs=lhs.toLowerCase();
rhs=rhs.toLowerCase();
}
if(_5b&CPDiacriticInsensitiveSearch){
lhs=lhs.stripDiacritics();
rhs=rhs.stripDiacritics();
}
if(lhs<rhs){
return CPOrderedAscending;
}
if(lhs>rhs){
return CPOrderedDescending;
}
return CPOrderedSame;
}
}),new objj_method(sel_getUid("compare:options:range:"),function(_5c,_5d,_5e,_5f,_60){
with(_5c){
var lhs=objj_msgSend(_5c,"substringWithRange:",_60),rhs=_5e;
return objj_msgSend(lhs,"compare:options:",rhs,_5f);
}
}),new objj_method(sel_getUid("hasPrefix:"),function(_61,_62,_63){
with(_61){
return _63&&_63!=""&&indexOf(_63)==0;
}
}),new objj_method(sel_getUid("hasSuffix:"),function(_64,_65,_66){
with(_64){
return _66&&_66!=""&&length>=_66.length&&lastIndexOf(_66)==(length-_66.length);
}
}),new objj_method(sel_getUid("isEqual:"),function(_67,_68,_69){
with(_67){
if(_67===_69){
return YES;
}
if(!_69||!objj_msgSend(_69,"isKindOfClass:",objj_msgSend(CPString,"class"))){
return NO;
}
return objj_msgSend(_67,"isEqualToString:",_69);
}
}),new objj_method(sel_getUid("isEqualToString:"),function(_6a,_6b,_6c){
with(_6a){
return _6a==String(_6c);
}
}),new objj_method(sel_getUid("UID"),function(_6d,_6e){
with(_6d){
var UID=_1.valueForKey(_6d);
if(!UID){
UID=objj_generateObjectUID();
_1.setValueForKey(_6d,UID);
}
return UID+"";
}
}),new objj_method(sel_getUid("commonPrefixWithString:"),function(_6f,_70,_71){
with(_6f){
return objj_msgSend(_6f,"commonPrefixWithString:options:",_71,0);
}
}),new objj_method(sel_getUid("commonPrefixWithString:options:"),function(_72,_73,_74,_75){
with(_72){
var len=0,lhs=_72,rhs=_74,min=MIN(objj_msgSend(lhs,"length"),objj_msgSend(rhs,"length"));
if(_75&CPCaseInsensitiveSearch){
lhs=objj_msgSend(lhs,"lowercaseString");
rhs=objj_msgSend(rhs,"lowercaseString");
}
for(;len<min;len++){
if(objj_msgSend(lhs,"characterAtIndex:",len)!==objj_msgSend(rhs,"characterAtIndex:",len)){
break;
}
}
return objj_msgSend(_72,"substringToIndex:",len);
}
}),new objj_method(sel_getUid("capitalizedString"),function(_76,_77){
with(_76){
var _78=_76.split(/\b/g),i=0,_79=_78.length;
for(;i<_79;i++){
if(i==0||(/\s$/).test(_78[i-1])){
_78[i]=_78[i].substring(0,1).toUpperCase()+_78[i].substring(1).toLowerCase();
}else{
_78[i]=_78[i].toLowerCase();
}
}
return _78.join("");
}
}),new objj_method(sel_getUid("lowercaseString"),function(_7a,_7b){
with(_7a){
return toLowerCase();
}
}),new objj_method(sel_getUid("uppercaseString"),function(_7c,_7d){
with(_7c){
return toUpperCase();
}
}),new objj_method(sel_getUid("doubleValue"),function(_7e,_7f){
with(_7e){
return parseFloat(_7e,10);
}
}),new objj_method(sel_getUid("boolValue"),function(_80,_81){
with(_80){
var _82=new RegExp("^\\s*[\\+,\\-]?0*");
return RegExp("^[Y,y,t,T,1-9]").test(_80.replace(_82,""));
}
}),new objj_method(sel_getUid("floatValue"),function(_83,_84){
with(_83){
return parseFloat(_83,10);
}
}),new objj_method(sel_getUid("intValue"),function(_85,_86){
with(_85){
return parseInt(_85,10);
}
}),new objj_method(sel_getUid("pathComponents"),function(_87,_88){
with(_87){
if(length===0){
return [""];
}
if(_87==="/"){
return ["/"];
}
var _89=split("/");
if(_89[0]===""){
_89[0]="/";
}
var _8a=_89.length-1;
if(_8a>0){
if(_89[_8a]===""){
_89[_8a]="/";
}
while(_8a--){
while(_89[_8a]===""){
_89.splice(_8a--,1);
}
}
}
return _89;
}
}),new objj_method(sel_getUid("pathExtension"),function(_8b,_8c){
with(_8b){
if(lastIndexOf(".")===CPNotFound){
return "";
}
return substr(lastIndexOf(".")+1);
}
}),new objj_method(sel_getUid("lastPathComponent"),function(_8d,_8e){
with(_8d){
var _8f=objj_msgSend(_8d,"pathComponents"),_90=_8f.length-1,_91=_8f[_90];
return _90>0&&_91==="/"?_8f[_90-1]:_91;
}
}),new objj_method(sel_getUid("stringByAppendingPathComponent:"),function(_92,_93,_94){
with(_92){
var _95=objj_msgSend(_92,"pathComponents"),_96=_94&&_94!=="/"?objj_msgSend(_94,"pathComponents"):[];
return objj_msgSend(CPString,"pathWithComponents:",_95.concat(_96));
}
}),new objj_method(sel_getUid("stringByAppendingPathExtension:"),function(_97,_98,ext){
with(_97){
if(ext.indexOf("/")>=0||length===0||_97==="/"){
return _97;
}
var _99=objj_msgSend(_97,"pathComponents"),_9a=_99.length-1;
if(_9a>0&&_99[_9a]==="/"){
_99.splice(_9a--,1);
}
_99[_9a]=_99[_9a]+"."+ext;
return objj_msgSend(CPString,"pathWithComponents:",_99);
}
}),new objj_method(sel_getUid("stringByDeletingLastPathComponent"),function(_9b,_9c){
with(_9b){
if(length===0){
return "";
}else{
if(_9b==="/"){
return "/";
}
}
var _9d=objj_msgSend(_9b,"pathComponents"),_9e=_9d.length-1;
if(_9d[_9e]==="/"){
_9e--;
}
_9d.splice(_9e,_9d.length-_9e);
return objj_msgSend(CPString,"pathWithComponents:",_9d);
}
}),new objj_method(sel_getUid("stringByDeletingPathExtension"),function(_9f,_a0){
with(_9f){
var _a1=objj_msgSend(_9f,"pathExtension");
if(_a1===""){
return _9f;
}else{
if(lastIndexOf(".")<1){
return _9f;
}
}
return substr(0,objj_msgSend(_9f,"length")-(_a1.length+1));
}
}),new objj_method(sel_getUid("stringByStandardizingPath"),function(_a2,_a3){
with(_a2){
return objj_msgSend(objj_msgSend(CPURL,"URLWithString:",_a2),"absoluteString");
}
})]);
class_addMethods(_6,[new objj_method(sel_getUid("alloc"),function(_a4,_a5){
with(_a4){
if(objj_msgSend(_a4,"class")!==CPString){
return objj_msgSendSuper({receiver:_a4,super_class:objj_getMetaClass("CPString").super_class},"alloc");
}
return new String;
}
}),new objj_method(sel_getUid("string"),function(_a6,_a7){
with(_a6){
return objj_msgSend(objj_msgSend(_a6,"alloc"),"init");
}
}),new objj_method(sel_getUid("stringWithHash:"),function(_a8,_a9,_aa){
with(_a8){
var _ab=parseInt(_aa,10).toString(16);
return "000000".substring(0,MAX(6-_ab.length,0))+_ab;
}
}),new objj_method(sel_getUid("stringWithString:"),function(_ac,_ad,_ae){
with(_ac){
if(!_ae){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,"stringWithString: the string can't be 'nil'");
}
return objj_msgSend(objj_msgSend(_ac,"alloc"),"initWithString:",_ae);
}
}),new objj_method(sel_getUid("stringWithFormat:"),function(_af,_b0,_b1){
with(_af){
if(!_b1){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,"initWithFormat: the format can't be 'nil'");
}
return ObjectiveJ.sprintf.apply(this,Array.prototype.slice.call(arguments,2));
}
}),new objj_method(sel_getUid("pathWithComponents:"),function(_b2,_b3,_b4){
with(_b2){
var _b5=_b4.length,_b6="",i=-1,_b7=true,_b8=false;
while(++i<_b5){
var _b9=_b4[i],_ba=_b9.length-1;
if(_ba>=0&&(_b9!=="/"||_b7)){
if(_ba>0&&_b9.indexOf("/",_ba)===_ba){
_b9=_b9.substring(0,_ba);
}
if(_b7){
if(_b9==="/"){
_b8=true;
}
_b7=false;
}else{
if(!_b8){
_b6+="/";
}else{
_b8=false;
}
}
_b6+=_b9;
}
}
return _b6;
}
})]);
var _5=objj_getClass("CPString");
if(!_5){
throw new SyntaxError("*** Could not find definition for class \"CPString\"");
}
var _6=_5.isa;
class_addMethods(_5,[new objj_method(sel_getUid("objectFromJSON"),function(_bb,_bc){
with(_bb){
return JSON.parse(_bb);
}
})]);
class_addMethods(_6,[new objj_method(sel_getUid("JSONFromObject:"),function(_bd,_be,_bf){
with(_bd){
return JSON.stringify(_bf);
}
})]);
var _5=objj_getClass("CPString");
if(!_5){
throw new SyntaxError("*** Could not find definition for class \"CPString\"");
}
var _6=_5.isa;
class_addMethods(_6,[new objj_method(sel_getUid("UUID"),function(_c0,_c1){
with(_c0){
var g="",i=0;
for(;i<32;i++){
g+=FLOOR(RAND()*15).toString(15);
}
return g;
}
})]);
var _c2=[[192,198],[224,230],[231,231],[232,235],[236,239],[242,246],[249,252]],_c3=[65,97,99,101,105,111,117];
String.prototype.stripDiacritics=function(){
var _c4="";
for(var _c5=0;_c5<this.length;_c5++){
var _c6=this.charCodeAt(_c5);
for(var i=0;i<_c2.length;i++){
var _c7=_c2[i];
if(_c6>=_c7[0]&&_c6<=_c7[_c7.length-1]){
_c6=_c3[i];
break;
}
}
_c4+=String.fromCharCode(_c6);
}
return _c4;
};
String.prototype.isa=CPString;
p;13;CPException.jt;4359;@STATIC;1.0;i;9;CPCoder.ji;10;CPObject.ji;10;CPString.jt;4297;
objj_executeFile("CPCoder.j",YES);
objj_executeFile("CPObject.j",YES);
objj_executeFile("CPString.j",YES);
CPInvalidArgumentException="CPInvalidArgumentException";
CPUnsupportedMethodException="CPUnsupportedMethodException";
CPRangeException="CPRangeException";
CPInternalInconsistencyException="CPInternalInconsistencyException";
var _1=objj_allocateClassPair(CPObject,"CPException"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_userInfo")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initWithName:reason:userInfo:"),function(_3,_4,_5,_6,_7){
with(_3){
_3=objj_msgSendSuper({receiver:_3,super_class:objj_getClass("CPException").super_class},"init");
if(_3){
name=_5;
message=_6;
_userInfo=_7;
}
return _3;
}
}),new objj_method(sel_getUid("name"),function(_8,_9){
with(_8){
return name;
}
}),new objj_method(sel_getUid("reason"),function(_a,_b){
with(_a){
return message;
}
}),new objj_method(sel_getUid("userInfo"),function(_c,_d){
with(_c){
return _userInfo;
}
}),new objj_method(sel_getUid("description"),function(_e,_f){
with(_e){
return message;
}
}),new objj_method(sel_getUid("raise"),function(_10,_11){
with(_10){
throw _10;
}
}),new objj_method(sel_getUid("isEqual:"),function(_12,_13,_14){
with(_12){
if(!_14||!_14.isa){
return NO;
}
return objj_msgSend(_14,"isKindOfClass:",CPException)&&name===objj_msgSend(_14,"name")&&message===objj_msgSend(_14,"message")&&(_userInfo===objj_msgSend(_14,"userInfo")||(objj_msgSend(_userInfo,"isEqual:",objj_msgSend(_14,"userInfo"))));
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("alloc"),function(_15,_16){
with(_15){
var _17=new Error();
_17.isa=objj_msgSend(_15,"class");
return _17;
}
}),new objj_method(sel_getUid("raise:reason:"),function(_18,_19,_1a,_1b){
with(_18){
objj_msgSend(objj_msgSend(_18,"exceptionWithName:reason:userInfo:",_1a,_1b,nil),"raise");
}
}),new objj_method(sel_getUid("exceptionWithName:reason:userInfo:"),function(_1c,_1d,_1e,_1f,_20){
with(_1c){
return objj_msgSend(objj_msgSend(_1c,"alloc"),"initWithName:reason:userInfo:",_1e,_1f,_20);
}
})]);
var _1=objj_getClass("CPException");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"CPException\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("copy"),function(_21,_22){
with(_21){
return objj_msgSend(objj_msgSend(_21,"class"),"exceptionWithName:reason:userInfo:",name,message,_userInfo);
}
})]);
var _23="CPExceptionNameKey",_24="CPExceptionReasonKey",_25="CPExceptionUserInfoKey";
var _1=objj_getClass("CPException");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"CPException\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("initWithCoder:"),function(_26,_27,_28){
with(_26){
if(_26=objj_msgSendSuper({receiver:_26,super_class:objj_getClass("CPException").super_class},"init")){
name=objj_msgSend(_28,"decodeObjectForKey:",_23);
message=objj_msgSend(_28,"decodeObjectForKey:",_24);
_userInfo=objj_msgSend(_28,"decodeObjectForKey:",_25);
}
return _26;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_29,_2a,_2b){
with(_29){
objj_msgSend(_2b,"encodeObject:forKey:",name,_23);
objj_msgSend(_2b,"encodeObject:forKey:",message,_24);
objj_msgSend(_2b,"encodeObject:forKey:",_userInfo,_25);
}
})]);
Error.prototype.isa=CPException;
Error.prototype._userInfo=null;
objj_msgSend(CPException,"initialize");
_CPRaiseInvalidAbstractInvocation=function(_2c,_2d){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,"*** -"+sel_getName(_2d)+" cannot be sent to an abstract object of class "+objj_msgSend(_2c,"className")+": Create a concrete instance!");
};
_CPRaiseInvalidArgumentException=function(_2e,_2f,_30){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,((class_isMetaClass(_2e.isa)?"+":"-")+"["+objj_msgSend(_2e,"className")+" "+_2f+"]: ")+_30);
};
_CPRaiseRangeException=function(_31,_32,_33,_34){
objj_msgSend(CPException,"raise:reason:",CPRangeException,((class_isMetaClass(_31.isa)?"+":"-")+"["+objj_msgSend(_31,"className")+" "+_32+"]: ")+"index ("+_33+") beyond bounds ("+_34+")");
};
_CPReportLenientDeprecation=function(_35,_36,_37){
CPLog.warn("["+CPStringFromClass(_35)+" "+CPStringFromSelector(_36)+"] is deprecated, using "+CPStringFromSelector(_37)+" instead.");
};
p;9;CPCoder.jt;1914;@STATIC;1.0;i;13;CPException.ji;10;CPObject.jt;1862;
objj_executeFile("CPException.j",YES);
objj_executeFile("CPObject.j",YES);
var _1=objj_allocateClassPair(CPObject,"CPCoder"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("allowsKeyedCoding"),function(_3,_4){
with(_3){
return NO;
}
}),new objj_method(sel_getUid("encodeValueOfObjCType:at:"),function(_5,_6,_7,_8){
with(_5){
_CPRaiseInvalidAbstractInvocation(_5,_6);
}
}),new objj_method(sel_getUid("encodeDataObject:"),function(_9,_a,_b){
with(_9){
_CPRaiseInvalidAbstractInvocation(_9,_a);
}
}),new objj_method(sel_getUid("encodeObject:"),function(_c,_d,_e){
with(_c){
}
}),new objj_method(sel_getUid("encodePoint:"),function(_f,_10,_11){
with(_f){
objj_msgSend(_f,"encodeNumber:",_11.x);
objj_msgSend(_f,"encodeNumber:",_11.y);
}
}),new objj_method(sel_getUid("encodeRect:"),function(_12,_13,_14){
with(_12){
objj_msgSend(_12,"encodePoint:",_14.origin);
objj_msgSend(_12,"encodeSize:",_14.size);
}
}),new objj_method(sel_getUid("encodeSize:"),function(_15,_16,_17){
with(_15){
objj_msgSend(_15,"encodeNumber:",_17.width);
objj_msgSend(_15,"encodeNumber:",_17.height);
}
}),new objj_method(sel_getUid("encodePropertyList:"),function(_18,_19,_1a){
with(_18){
}
}),new objj_method(sel_getUid("encodeRootObject:"),function(_1b,_1c,_1d){
with(_1b){
objj_msgSend(_1b,"encodeObject:",_1d);
}
}),new objj_method(sel_getUid("encodeBycopyObject:"),function(_1e,_1f,_20){
with(_1e){
objj_msgSend(_1e,"encodeObject:",_20);
}
}),new objj_method(sel_getUid("encodeConditionalObject:"),function(_21,_22,_23){
with(_21){
objj_msgSend(_21,"encodeObject:",_23);
}
})]);
var _1=objj_getClass("CPObject");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"CPObject\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("awakeAfterUsingCoder:"),function(_24,_25,_26){
with(_24){
return _24;
}
})]);
p;15;CPObjJRuntime.jt;348;@STATIC;1.0;t;330;
CPStringFromSelector=function(_1){
return sel_getName(_1);
};
CPSelectorFromString=function(_2){
return sel_registerName(_2);
};
CPClassFromString=function(_3){
return objj_getClass(_3);
};
CPStringFromClass=function(_4){
return class_getName(_4);
};
CPOrderedAscending=-1;
CPOrderedSame=0;
CPOrderedDescending=1;
CPNotFound=-1;
p;9;CPRange.jt;1244;@STATIC;1.0;t;1225;
CPMakeRange=function(_1,_2){
return {location:_1,length:_2};
};
CPCopyRange=function(_3){
return {location:_3.location,length:_3.length};
};
CPMakeRangeCopy=function(_4){
return {location:_4.location,length:_4.length};
};
CPEmptyRange=function(_5){
return _5.length===0;
};
CPMaxRange=function(_6){
return _6.location+_6.length;
};
CPEqualRanges=function(_7,_8){
return ((_7.location===_8.location)&&(_7.length===_8.length));
};
CPLocationInRange=function(_9,_a){
return (_9>=_a.location)&&(_9<CPMaxRange(_a));
};
CPUnionRange=function(_b,_c){
var _d=MIN(_b.location,_c.location);
return CPMakeRange(_d,MAX(CPMaxRange(_b),CPMaxRange(_c))-_d);
};
CPIntersectionRange=function(_e,_f){
if(CPMaxRange(_e)<_f.location||CPMaxRange(_f)<_e.location){
return CPMakeRange(0,0);
}
var _10=MAX(_e.location,_f.location);
return CPMakeRange(_10,MIN(CPMaxRange(_e),CPMaxRange(_f))-_10);
};
CPRangeInRange=function(_11,_12){
return (_11.location<=_12.location&&CPMaxRange(_11)>=CPMaxRange(_12));
};
CPStringFromRange=function(_13){
return "{"+_13.location+", "+_13.length+"}";
};
CPRangeFromString=function(_14){
var _15=_14.indexOf(",");
return {location:parseInt(_14.substr(1,_15-1)),length:parseInt(_14.substring(_15+1,_14.length))};
};
p;18;CPSortDescriptor.jt;3227;@STATIC;1.0;i;10;CPObject.ji;15;CPObjJRuntime.ji;10;CPString.jt;3158;
objj_executeFile("CPObject.j",YES);
objj_executeFile("CPObjJRuntime.j",YES);
objj_executeFile("CPString.j",YES);
var _1=objj_allocateClassPair(CPObject,"CPSortDescriptor"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_key"),new objj_ivar("_selector"),new objj_ivar("_ascending")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initWithKey:ascending:"),function(_3,_4,_5,_6){
with(_3){
return objj_msgSend(_3,"initWithKey:ascending:selector:",_5,_6,sel_getUid("compare:"));
}
}),new objj_method(sel_getUid("initWithKey:ascending:selector:"),function(_7,_8,_9,_a,_b){
with(_7){
_7=objj_msgSendSuper({receiver:_7,super_class:objj_getClass("CPSortDescriptor").super_class},"init");
if(_7){
_key=_9;
_ascending=_a;
_selector=_b;
}
return _7;
}
}),new objj_method(sel_getUid("ascending"),function(_c,_d){
with(_c){
return _ascending;
}
}),new objj_method(sel_getUid("key"),function(_e,_f){
with(_e){
return _key;
}
}),new objj_method(sel_getUid("selector"),function(_10,_11){
with(_10){
return _selector;
}
}),new objj_method(sel_getUid("compareObject:withObject:"),function(_12,_13,_14,_15){
with(_12){
return (_ascending?1:-1)*objj_msgSend(objj_msgSend(_14,"valueForKeyPath:",_key),"performSelector:withObject:",_selector,objj_msgSend(_15,"valueForKeyPath:",_key));
}
}),new objj_method(sel_getUid("reversedSortDescriptor"),function(_16,_17){
with(_16){
return objj_msgSend(objj_msgSend(objj_msgSend(_16,"class"),"alloc"),"initWithKey:ascending:selector:",_key,!_ascending,_selector);
}
}),new objj_method(sel_getUid("description"),function(_18,_19){
with(_18){
return objj_msgSend(CPString,"stringWithFormat:","(%@, %@, %@)",objj_msgSend(_18,"key"),objj_msgSend(_18,"ascending")?"ascending":"descending",CPStringFromSelector(objj_msgSend(_18,"selector")));
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("sortDescriptorWithKey:ascending:"),function(_1a,_1b,_1c,_1d){
with(_1a){
return objj_msgSend(objj_msgSend(_1a,"alloc"),"initWithKey:ascending:",_1c,_1d);
}
}),new objj_method(sel_getUid("sortDescriptorWithKey:ascending:selector:"),function(_1e,_1f,_20,_21,_22){
with(_1e){
return objj_msgSend(objj_msgSend(_1e,"alloc"),"initWithKey:ascending:selector:",_20,_21,_22);
}
})]);
var _23="CPSortDescriptorKeyKey",_24="CPSortDescriptorAscendingKey",_25="CPSortDescriptorSelectorKey";
var _1=objj_getClass("CPSortDescriptor");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"CPSortDescriptor\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("initWithCoder:"),function(_26,_27,_28){
with(_26){
if(_26=objj_msgSendSuper({receiver:_26,super_class:objj_getClass("CPSortDescriptor").super_class},"init")){
_key=objj_msgSend(_28,"decodeObjectForKey:",_23);
_ascending=objj_msgSend(_28,"decodeBoolForKey:",_24);
_selector=CPSelectorFromString(objj_msgSend(_28,"decodeObjectForKey:",_25));
}
return _26;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_29,_2a,_2b){
with(_29){
objj_msgSend(_2b,"encodeObject:forKey:",_key,_23);
objj_msgSend(_2b,"encodeBool:forKey:",_ascending,_24);
objj_msgSend(_2b,"encodeObject:forKey:",CPStringFromSelector(_selector),_25);
}
})]);
p;7;CPURL.jt;6448;@STATIC;1.0;i;10;CPObject.ji;10;CPString.jt;6399;
objj_executeFile("CPObject.j",YES);
objj_executeFile("CPString.j",YES);
CPURLNameKey="CPURLNameKey";
CPURLLocalizedNameKey="CPURLLocalizedNameKey";
CPURLIsRegularFileKey="CPURLIsRegularFileKey";
CPURLIsDirectoryKey="CPURLIsDirectoryKey";
CPURLIsSymbolicLinkKey="CPURLIsSymbolicLinkKey";
CPURLIsVolumeKey="CPURLIsVolumeKey";
CPURLIsPackageKey="CPURLIsPackageKey";
CPURLIsSystemImmutableKey="CPURLIsSystemImmutableKey";
CPURLIsUserImmutableKey="CPURLIsUserImmutableKey";
CPURLIsHiddenKey="CPURLIsHiddenKey";
CPURLHasHiddenExtensionKey="CPURLHasHiddenExtensionKey";
CPURLCreationDateKey="CPURLCreationDateKey";
CPURLContentAccessDateKey="CPURLContentAccessDateKey";
CPURLContentModificationDateKey="CPURLContentModificationDateKey";
CPURLAttributeModificationDateKey="CPURLAttributeModificationDateKey";
CPURLLinkCountKey="CPURLLinkCountKey";
CPURLParentDirectoryURLKey="CPURLParentDirectoryURLKey";
CPURLVolumeURLKey="CPURLTypeIdentifierKey";
CPURLTypeIdentifierKey="CPURLTypeIdentifierKey";
CPURLLocalizedTypeDescriptionKey="CPURLLocalizedTypeDescriptionKey";
CPURLLabelNumberKey="CPURLLabelNumberKey";
CPURLLabelColorKey="CPURLLabelColorKey";
CPURLLocalizedLabelKey="CPURLLocalizedLabelKey";
CPURLEffectiveIconKey="CPURLEffectiveIconKey";
CPURLCustomIconKey="CPURLCustomIconKey";
var _1=objj_allocateClassPair(CPObject,"CPURL"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("init"),function(_3,_4){
with(_3){
return nil;
}
}),new objj_method(sel_getUid("initWithScheme:host:path:"),function(_5,_6,_7,_8,_9){
with(_5){
var _a=(_7?_7+":":"")+(_8?_8+"//":"")+(_9||"");
return objj_msgSend(_5,"initWithString:",_a);
}
}),new objj_method(sel_getUid("initWithString:"),function(_b,_c,_d){
with(_b){
return objj_msgSend(_b,"initWithString:relativeToURL:",_d,nil);
}
}),new objj_method(sel_getUid("initWithString:relativeToURL:"),function(_e,_f,_10,_11){
with(_e){
var _12=new CFURL(_10,_11);
_12.isa=objj_msgSend(_e,"class");
return _12;
}
}),new objj_method(sel_getUid("absoluteURL"),function(_13,_14){
with(_13){
return _13.absoluteURL();
}
}),new objj_method(sel_getUid("baseURL"),function(_15,_16){
with(_15){
return _15.baseURL();
}
}),new objj_method(sel_getUid("absoluteString"),function(_17,_18){
with(_17){
return _17.absoluteString();
}
}),new objj_method(sel_getUid("relativeString"),function(_19,_1a){
with(_19){
return _19.string();
}
}),new objj_method(sel_getUid("path"),function(_1b,_1c){
with(_1b){
return objj_msgSend(_1b,"absoluteURL").path();
}
}),new objj_method(sel_getUid("pathComponents"),function(_1d,_1e){
with(_1d){
var _1f=_1d.pathComponents();
return objj_msgSend(_1f,"copy");
}
}),new objj_method(sel_getUid("relativePath"),function(_20,_21){
with(_20){
return _20.path();
}
}),new objj_method(sel_getUid("scheme"),function(_22,_23){
with(_22){
return _22.scheme();
}
}),new objj_method(sel_getUid("user"),function(_24,_25){
with(_24){
return objj_msgSend(_24,"absoluteURL").user();
}
}),new objj_method(sel_getUid("password"),function(_26,_27){
with(_26){
return objj_msgSend(_26,"absoluteURL").password();
}
}),new objj_method(sel_getUid("host"),function(_28,_29){
with(_28){
return objj_msgSend(_28,"absoluteURL").domain();
}
}),new objj_method(sel_getUid("port"),function(_2a,_2b){
with(_2a){
var _2c=objj_msgSend(_2a,"absoluteURL").portNumber();
if(_2c===-1){
return nil;
}
return _2c;
}
}),new objj_method(sel_getUid("parameterString"),function(_2d,_2e){
with(_2d){
return _2d.queryString();
}
}),new objj_method(sel_getUid("fragment"),function(_2f,_30){
with(_2f){
return _2f.fragment();
}
}),new objj_method(sel_getUid("isEqual:"),function(_31,_32,_33){
with(_31){
if(_31===_33){
return YES;
}
if(!_33||!objj_msgSend(_33,"isKindOfClass:",objj_msgSend(CPURL,"class"))){
return NO;
}
return objj_msgSend(_31,"isEqualToURL:",_33);
}
}),new objj_method(sel_getUid("isEqualToURL:"),function(_34,_35,_36){
with(_34){
if(_34===_36){
return YES;
}
return objj_msgSend(objj_msgSend(_34,"absoluteString"),"isEqual:",objj_msgSend(_36,"absoluteString"));
}
}),new objj_method(sel_getUid("lastPathComponent"),function(_37,_38){
with(_37){
return objj_msgSend(_37,"absoluteURL").lastPathComponent();
}
}),new objj_method(sel_getUid("pathExtension"),function(_39,_3a){
with(_39){
return _39.pathExtension();
}
}),new objj_method(sel_getUid("URLByDeletingLastPathComponent"),function(_3b,_3c){
with(_3b){
var _3d=_3b.createCopyDeletingLastPathComponent();
_3d.isa=objj_msgSend(_3b,"class");
return _3d;
}
}),new objj_method(sel_getUid("standardizedURL"),function(_3e,_3f){
with(_3e){
return _3e.standardizedURL();
}
}),new objj_method(sel_getUid("isFileURL"),function(_40,_41){
with(_40){
return objj_msgSend(_40,"scheme")==="file";
}
}),new objj_method(sel_getUid("description"),function(_42,_43){
with(_42){
return objj_msgSend(_42,"absoluteString");
}
}),new objj_method(sel_getUid("resourceValueForKey:"),function(_44,_45,_46){
with(_44){
return _44.resourcePropertyForKey(_46);
}
}),new objj_method(sel_getUid("setResourceValue:forKey:"),function(_47,_48,_49,_4a){
with(_47){
return _47.setResourcePropertyForKey(_4a,_49);
}
}),new objj_method(sel_getUid("staticResourceData"),function(_4b,_4c){
with(_4b){
return _4b.staticResourceData();
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("alloc"),function(_4d,_4e){
with(_4d){
var _4f=new CFURL();
_4f.isa=objj_msgSend(_4d,"class");
return _4f;
}
}),new objj_method(sel_getUid("URLWithString:"),function(_50,_51,_52){
with(_50){
return objj_msgSend(objj_msgSend(_50,"alloc"),"initWithString:",_52);
}
}),new objj_method(sel_getUid("URLWithString:relativeToURL:"),function(_53,_54,_55,_56){
with(_53){
return objj_msgSend(objj_msgSend(_53,"alloc"),"initWithString:relativeToURL:",_55,_56);
}
})]);
var _57="CPURLURLStringKey",_58="CPURLBaseURLKey";
var _1=objj_getClass("CPURL");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"CPURL\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("initWithCoder:"),function(_59,_5a,_5b){
with(_59){
return objj_msgSend(_59,"initWithString:relativeToURL:",objj_msgSend(_5b,"decodeObjectForKey:",_57),objj_msgSend(_5b,"decodeObjectForKey:",_58));
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_5c,_5d,_5e){
with(_5c){
objj_msgSend(_5e,"encodeObject:forKey:",_baseURL,_58);
objj_msgSend(_5e,"encodeObject:forKey:",_string,_57);
}
})]);
CFURL.prototype.isa=objj_msgSend(CPURL,"class");
p;9;CPValue.jt;1690;@STATIC;1.0;i;9;CPCoder.ji;10;CPObject.jt;1643;
objj_executeFile("CPCoder.j",YES);
objj_executeFile("CPObject.j",YES);
var _1=objj_allocateClassPair(CPObject,"CPValue"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_JSObject")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initWithJSObject:"),function(_3,_4,_5){
with(_3){
_3=objj_msgSendSuper({receiver:_3,super_class:objj_getClass("CPValue").super_class},"init");
if(_3){
_JSObject=_5;
}
return _3;
}
}),new objj_method(sel_getUid("JSObject"),function(_6,_7){
with(_6){
return _JSObject;
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("valueWithJSObject:"),function(_8,_9,_a){
with(_8){
return objj_msgSend(objj_msgSend(_8,"alloc"),"initWithJSObject:",_a);
}
})]);
var _b="CPValueValueKey";
var _1=objj_getClass("CPValue");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"CPValue\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("initWithCoder:"),function(_c,_d,_e){
with(_c){
_c=objj_msgSendSuper({receiver:_c,super_class:objj_getClass("CPValue").super_class},"init");
if(_c){
_JSObject=JSON.parse(objj_msgSend(_e,"decodeObjectForKey:",_b));
}
return _c;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_f,_10,_11){
with(_f){
objj_msgSend(_11,"encodeObject:forKey:",JSON.stringify(_JSObject),_b);
}
})]);
CPJSObjectCreateJSON=function(_12){
CPLog.warn("CPJSObjectCreateJSON deprecated, use JSON.stringify() or CPString's objectFromJSON");
return JSON.stringify(_12);
};
CPJSObjectCreateWithJSON=function(_13){
CPLog.warn("CPJSObjectCreateWithJSON deprecated, use JSON.parse() or CPString's JSONFromObject");
return JSON.parse(_13);
};
p;13;CPFormatter.jt;1511;@STATIC;1.0;i;13;CPException.ji;10;CPObject.jt;1459;
objj_executeFile("CPException.j",YES);
objj_executeFile("CPObject.j",YES);
var _1=objj_allocateClassPair(CPObject,"CPFormatter"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("stringForObjectValue:"),function(_3,_4,_5){
with(_3){
_CPRaiseInvalidAbstractInvocation(_3,_4);
return nil;
}
}),new objj_method(sel_getUid("editingStringForObjectValue:"),function(_6,_7,_8){
with(_6){
return objj_msgSend(_6,"stringForObjectValue:",_8);
}
}),new objj_method(sel_getUid("getObjectValue:forString:errorDescription:"),function(_9,_a,_b,_c,_d){
with(_9){
_CPRaiseInvalidAbstractInvocation(_9,_a);
return NO;
}
}),new objj_method(sel_getUid("isPartialStringValid:newEditingString:errorDescription:"),function(_e,_f,_10,_11,_12){
with(_e){
_10(nil);
if(_12){
_12(nil);
}
return YES;
}
}),new objj_method(sel_getUid("isPartialStringValid:proposedSelectedRange:originalString:originalSelectedRange:errorDescription:"),function(_13,_14,_15,_16,_17,_18,_19){
with(_13){
var _1a=nil,_1b=objj_msgSend(_13,"isPartialStringValid:newEditingString:errorDescription:",_15,function(_1c){
if(arguments.length){
return _1a=_1c;
}
return _1a;
},_19);
if(!_1b){
_15(_1a);
if(_1a!==nil){
_16(CPMakeRange(_1a.length,0));
}
}
return _1b;
}
}),new objj_method(sel_getUid("initWithCoder:"),function(_1d,_1e,_1f){
with(_1d){
return objj_msgSend(_1d,"init");
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_20,_21,_22){
with(_20){
}
})]);
p;10;CPBundle.jt;4159;@STATIC;1.0;i;14;CPDictionary.ji;16;CPNotification.ji;22;CPNotificationCenter.ji;10;CPObject.jt;4058;
objj_executeFile("CPDictionary.j",YES);
objj_executeFile("CPNotification.j",YES);
objj_executeFile("CPNotificationCenter.j",YES);
objj_executeFile("CPObject.j",YES);
CPBundleDidLoadNotification="CPBundleDidLoadNotification";
var _1={};
var _2=objj_allocateClassPair(CPObject,"CPBundle"),_3=_2.isa;
class_addIvars(_2,[new objj_ivar("_bundle"),new objj_ivar("_delegate")]);
objj_registerClassPair(_2);
class_addMethods(_2,[new objj_method(sel_getUid("initWithURL:"),function(_4,_5,_6){
with(_4){
_6=new CFURL(_6);
var _7=_6.absoluteString(),_8=_1[_7];
if(_8){
return _8;
}
_4=objj_msgSendSuper({receiver:_4,super_class:objj_getClass("CPBundle").super_class},"init");
if(_4){
_bundle=new CFBundle(_6);
_1[_7]=_4;
}
return _4;
}
}),new objj_method(sel_getUid("initWithPath:"),function(_9,_a,_b){
with(_9){
return objj_msgSend(_9,"initWithURL:",_b);
}
}),new objj_method(sel_getUid("classNamed:"),function(_c,_d,_e){
with(_c){
}
}),new objj_method(sel_getUid("bundleURL"),function(_f,_10){
with(_f){
return _bundle.bundleURL();
}
}),new objj_method(sel_getUid("bundlePath"),function(_11,_12){
with(_11){
return objj_msgSend(objj_msgSend(_11,"bundleURL"),"path");
}
}),new objj_method(sel_getUid("resourcePath"),function(_13,_14){
with(_13){
return objj_msgSend(objj_msgSend(_13,"resourceURL"),"path");
}
}),new objj_method(sel_getUid("resourceURL"),function(_15,_16){
with(_15){
return _bundle.resourcesDirectoryURL();
}
}),new objj_method(sel_getUid("principalClass"),function(_17,_18){
with(_17){
var _19=objj_msgSend(_17,"objectForInfoDictionaryKey:","CPPrincipalClass");
return _19?CPClassFromString(_19):Nil;
}
}),new objj_method(sel_getUid("bundleIdentifier"),function(_1a,_1b){
with(_1a){
return objj_msgSend(_1a,"objectForInfoDictionaryKey:","CPBundleIdentifier");
}
}),new objj_method(sel_getUid("isLoaded"),function(_1c,_1d){
with(_1c){
return _bundle.isLoaded();
}
}),new objj_method(sel_getUid("pathForResource:"),function(_1e,_1f,_20){
with(_1e){
return _bundle.pathForResource(_20);
}
}),new objj_method(sel_getUid("infoDictionary"),function(_21,_22){
with(_21){
return _bundle.infoDictionary();
}
}),new objj_method(sel_getUid("objectForInfoDictionaryKey:"),function(_23,_24,_25){
with(_23){
return _bundle.valueForInfoDictionaryKey(_25);
}
}),new objj_method(sel_getUid("loadWithDelegate:"),function(_26,_27,_28){
with(_26){
_delegate=_28;
_bundle.addEventListener("load",function(){
objj_msgSend(_delegate,"bundleDidFinishLoading:",_26);
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:userInfo:",CPBundleDidLoadNotification,_26,nil);
});
_bundle.addEventListener("error",function(){
CPLog.error("Could not find bundle: "+_26);
});
_bundle.load(YES);
}
}),new objj_method(sel_getUid("staticResourceURLs"),function(_29,_2a){
with(_29){
var _2b=[],_2c=_bundle.staticResources(),_2d=0,_2e=objj_msgSend(_2c,"count");
for(;_2d<_2e;++_2d){
objj_msgSend(_2b,"addObject:",_2c[_2d].URL());
}
return _2b;
}
}),new objj_method(sel_getUid("environments"),function(_2f,_30){
with(_2f){
return _bundle.environments();
}
}),new objj_method(sel_getUid("mostEligibleEnvironment"),function(_31,_32){
with(_31){
return _bundle.mostEligibleEnvironment();
}
}),new objj_method(sel_getUid("description"),function(_33,_34){
with(_33){
return objj_msgSendSuper({receiver:_33,super_class:objj_getClass("CPBundle").super_class},"description")+"("+objj_msgSend(_33,"bundlePath")+")";
}
})]);
class_addMethods(_3,[new objj_method(sel_getUid("bundleWithURL:"),function(_35,_36,_37){
with(_35){
return objj_msgSend(objj_msgSend(_35,"alloc"),"initWithURL:",_37);
}
}),new objj_method(sel_getUid("bundleWithPath:"),function(_38,_39,_3a){
with(_38){
return objj_msgSend(_38,"bundleWithURL:",_3a);
}
}),new objj_method(sel_getUid("bundleForClass:"),function(_3b,_3c,_3d){
with(_3b){
return objj_msgSend(_3b,"bundleWithURL:",CFBundle.bundleForClass(_3d).bundleURL());
}
}),new objj_method(sel_getUid("mainBundle"),function(_3e,_3f){
with(_3e){
return objj_msgSend(CPBundle,"bundleWithPath:",CFBundle.mainBundle().bundleURL());
}
})]);
p;14;CPDictionary.jt;8914;@STATIC;1.0;i;9;CPArray.ji;14;CPEnumerator.ji;13;CPException.ji;8;CPNull.ji;10;CPObject.jt;8818;
objj_executeFile("CPArray.j",YES);
objj_executeFile("CPEnumerator.j",YES);
objj_executeFile("CPException.j",YES);
objj_executeFile("CPNull.j",YES);
objj_executeFile("CPObject.j",YES);
var _1=objj_allocateClassPair(CPEnumerator,"_CPDictionaryValueEnumerator"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_keyEnumerator"),new objj_ivar("_dictionary")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initWithDictionary:"),function(_3,_4,_5){
with(_3){
_3=objj_msgSendSuper({receiver:_3,super_class:objj_getClass("_CPDictionaryValueEnumerator").super_class},"init");
if(_3){
_keyEnumerator=objj_msgSend(_5,"keyEnumerator");
_dictionary=_5;
}
return _3;
}
}),new objj_method(sel_getUid("nextObject"),function(_6,_7){
with(_6){
var _8=objj_msgSend(_keyEnumerator,"nextObject");
if(_8===nil){
return nil;
}
return objj_msgSend(_dictionary,"objectForKey:",_8);
}
})]);
var _1=objj_allocateClassPair(CPObject,"CPDictionary"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initWithDictionary:"),function(_9,_a,_b){
with(_9){
var _c="",_d=objj_msgSend(objj_msgSend(CPDictionary,"alloc"),"init");
for(_c in _b._buckets){
objj_msgSend(_d,"setObject:forKey:",objj_msgSend(_b,"objectForKey:",_c),_c);
}
return _d;
}
}),new objj_method(sel_getUid("initWithObjects:forKeys:"),function(_e,_f,_10,_11){
with(_e){
_e=objj_msgSendSuper({receiver:_e,super_class:objj_getClass("CPDictionary").super_class},"init");
if(objj_msgSend(_10,"count")!=objj_msgSend(_11,"count")){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,"Counts are different.("+objj_msgSend(_10,"count")+"!="+objj_msgSend(_11,"count")+")");
}
if(_e){
var i=objj_msgSend(_11,"count");
while(i--){
objj_msgSend(_e,"setObject:forKey:",_10[i],_11[i]);
}
}
return _e;
}
}),new objj_method(sel_getUid("initWithObjectsAndKeys:"),function(_12,_13,_14){
with(_12){
var _15=arguments.length;
if(_15%2!==0){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,"Key-value count is mismatched. ("+_15+" arguments passed)");
}
_12=objj_msgSendSuper({receiver:_12,super_class:objj_getClass("CPDictionary").super_class},"init");
if(_12){
var _16=2;
for(;_16<_15;_16+=2){
var _17=arguments[_16];
if(_17===nil){
break;
}
objj_msgSend(_12,"setObject:forKey:",_17,arguments[_16+1]);
}
}
return _12;
}
}),new objj_method(sel_getUid("copy"),function(_18,_19){
with(_18){
return objj_msgSend(CPDictionary,"dictionaryWithDictionary:",_18);
}
}),new objj_method(sel_getUid("count"),function(_1a,_1b){
with(_1a){
return _count;
}
}),new objj_method(sel_getUid("allKeys"),function(_1c,_1d){
with(_1c){
return objj_msgSend(_keys,"copy");
}
}),new objj_method(sel_getUid("allValues"),function(_1e,_1f){
with(_1e){
var _20=_keys.length,_21=[];
while(_20--){
_21.push(_1e.valueForKey(_keys[_20]));
}
return _21;
}
}),new objj_method(sel_getUid("allKeysForObject:"),function(_22,_23,_24){
with(_22){
var _25=_keys.length,_26=0,_27=[],_28=nil,_29=nil;
for(;_26<_25;++_26){
_28=_keys[_26];
_29=_buckets[_28];
if(_29.isa&&_24&&_24.isa&&objj_msgSend(_29,"respondsToSelector:",sel_getUid("isEqual:"))&&objj_msgSend(_29,"isEqual:",_24)){
_27.push(_28);
}else{
if(_29===_24){
_27.push(_28);
}
}
}
return _27;
}
}),new objj_method(sel_getUid("keysSortedByValueUsingSelector:"),function(_2a,_2b,_2c){
with(_2a){
return objj_msgSend(objj_msgSend(_2a,"allKeys"),"sortedArrayUsingFunction:",function(a,b){
a=objj_msgSend(_2a,"objectForKey:",a);
b=objj_msgSend(_2a,"objectForKey:",b);
return objj_msgSend(a,"performSelector:withObject:",_2c,b);
});
}
}),new objj_method(sel_getUid("keyEnumerator"),function(_2d,_2e){
with(_2d){
return objj_msgSend(_keys,"objectEnumerator");
}
}),new objj_method(sel_getUid("objectEnumerator"),function(_2f,_30){
with(_2f){
return objj_msgSend(objj_msgSend(_CPDictionaryValueEnumerator,"alloc"),"initWithDictionary:",_2f);
}
}),new objj_method(sel_getUid("isEqualToDictionary:"),function(_31,_32,_33){
with(_31){
if(_31===_33){
return YES;
}
var _34=objj_msgSend(_31,"count");
if(_34!==objj_msgSend(_33,"count")){
return NO;
}
var _35=_34;
while(_35--){
var _36=_keys[_35],_37=_buckets[_36],_38=_33._buckets[_36];
if(_37===_38){
continue;
}
if(_37&&_37.isa&&_38&&_38.isa&&objj_msgSend(_37,"respondsToSelector:",sel_getUid("isEqual:"))&&objj_msgSend(_37,"isEqual:",_38)){
continue;
}
return NO;
}
return YES;
}
}),new objj_method(sel_getUid("isEqual:"),function(_39,_3a,_3b){
with(_39){
if(_39===_3b){
return YES;
}
if(!objj_msgSend(_3b,"isKindOfClass:",objj_msgSend(CPDictionary,"class"))){
return NO;
}
return objj_msgSend(_39,"isEqualToDictionary:",_3b);
}
}),new objj_method(sel_getUid("objectForKey:"),function(_3c,_3d,_3e){
with(_3c){
var _3f=_buckets[_3e];
return (_3f===undefined)?nil:_3f;
}
}),new objj_method(sel_getUid("removeAllObjects"),function(_40,_41){
with(_40){
_40.removeAllValues();
}
}),new objj_method(sel_getUid("removeObjectForKey:"),function(_42,_43,_44){
with(_42){
_42.removeValueForKey(_44);
}
}),new objj_method(sel_getUid("removeObjectsForKeys:"),function(_45,_46,_47){
with(_45){
var _48=_47.length;
while(_48--){
objj_msgSend(_45,"removeObjectForKey:",_47[_48]);
}
}
}),new objj_method(sel_getUid("setObject:forKey:"),function(_49,_4a,_4b,_4c){
with(_49){
_49.setValueForKey(_4c,_4b);
}
}),new objj_method(sel_getUid("addEntriesFromDictionary:"),function(_4d,_4e,_4f){
with(_4d){
if(!_4f){
return;
}
var _50=objj_msgSend(_4f,"allKeys"),_51=objj_msgSend(_50,"count");
while(_51--){
var key=_50[_51];
objj_msgSend(_4d,"setObject:forKey:",objj_msgSend(_4f,"objectForKey:",key),key);
}
}
}),new objj_method(sel_getUid("description"),function(_52,_53){
with(_52){
var _54="{\n\t",_55=_keys,_56=0,_57=_count;
for(;_56<_57;++_56){
var key=_55[_56],_58=valueForKey(key);
_54+=key+" = \""+CPDescriptionOfObject(_58).split("\n").join("\n\t")+"\"\n\t";
}
return _54+"}";
}
}),new objj_method(sel_getUid("containsKey:"),function(_59,_5a,_5b){
with(_59){
var _5c=objj_msgSend(_59,"objectForKey:",_5b);
return ((_5c!==nil)&&(_5c!==undefined));
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("alloc"),function(_5d,_5e){
with(_5d){
var _5f=new CFMutableDictionary();
_5f.isa=objj_msgSend(_5d,"class");
return _5f;
}
}),new objj_method(sel_getUid("dictionary"),function(_60,_61){
with(_60){
return objj_msgSend(objj_msgSend(_60,"alloc"),"init");
}
}),new objj_method(sel_getUid("dictionaryWithDictionary:"),function(_62,_63,_64){
with(_62){
return objj_msgSend(objj_msgSend(_62,"alloc"),"initWithDictionary:",_64);
}
}),new objj_method(sel_getUid("dictionaryWithObject:forKey:"),function(_65,_66,_67,_68){
with(_65){
return objj_msgSend(objj_msgSend(_65,"alloc"),"initWithObjects:forKeys:",[_67],[_68]);
}
}),new objj_method(sel_getUid("dictionaryWithObjects:forKeys:"),function(_69,_6a,_6b,_6c){
with(_69){
return objj_msgSend(objj_msgSend(_69,"alloc"),"initWithObjects:forKeys:",_6b,_6c);
}
}),new objj_method(sel_getUid("dictionaryWithJSObject:"),function(_6d,_6e,_6f){
with(_6d){
return objj_msgSend(_6d,"dictionaryWithJSObject:recursively:",_6f,NO);
}
}),new objj_method(sel_getUid("dictionaryWithJSObject:recursively:"),function(_70,_71,_72,_73){
with(_70){
var key="",_74=objj_msgSend(objj_msgSend(_70,"alloc"),"init");
for(key in _72){
if(!_72.hasOwnProperty(key)){
continue;
}
var _75=_72[key];
if(_75===null){
objj_msgSend(_74,"setObject:forKey:",objj_msgSend(CPNull,"null"),key);
continue;
}
if(_73){
if(_75.constructor===Object){
_75=objj_msgSend(CPDictionary,"dictionaryWithJSObject:recursively:",_75,YES);
}else{
if(objj_msgSend(_75,"isKindOfClass:",CPArray)){
var _76=[],i=0,_77=_75.length;
for(;i<_77;i++){
var _78=_75[i];
if(_78===null){
_76.push(objj_msgSend(CPNull,"null"));
}else{
if(_78.constructor===Object){
_76.push(objj_msgSend(CPDictionary,"dictionaryWithJSObject:recursively:",_78,YES));
}else{
_76.push(_78);
}
}
}
_75=_76;
}
}
}
objj_msgSend(_74,"setObject:forKey:",_75,key);
}
return _74;
}
}),new objj_method(sel_getUid("dictionaryWithObjectsAndKeys:"),function(_79,_7a,_7b){
with(_79){
arguments[0]=objj_msgSend(_79,"alloc");
arguments[1]=sel_getUid("initWithObjectsAndKeys:");
return objj_msgSend.apply(this,arguments);
}
})]);
var _1=objj_getClass("CPDictionary");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"CPDictionary\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("initWithCoder:"),function(_7c,_7d,_7e){
with(_7c){
return objj_msgSend(_7e,"_decodeDictionaryOfObjectsForKey:","CP.objects");
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_7f,_80,_81){
with(_7f){
objj_msgSend(_81,"_encodeDictionaryOfObjects:forKey:",_7f,"CP.objects");
}
})]);
var _1=objj_allocateClassPair(CPDictionary,"CPMutableDictionary"),_2=_1.isa;
objj_registerClassPair(_1);
CFDictionary.prototype.isa=CPDictionary;
CFMutableDictionary.prototype.isa=CPMutableDictionary;
p;9;CPArray.jt;16239;@STATIC;1.0;i;14;CPEnumerator.ji;13;CPException.ji;10;CPObject.ji;9;CPRange.ji;18;CPSortDescriptor.ji;20;_CPJavaScriptArray.jt;16106;
objj_executeFile("CPEnumerator.j",YES);
objj_executeFile("CPException.j",YES);
objj_executeFile("CPObject.j",YES);
objj_executeFile("CPRange.j",YES);
objj_executeFile("CPSortDescriptor.j",YES);
CPEnumerationNormal=0;
CPEnumerationConcurrent=1<<0;
CPEnumerationReverse=1<<1;
CPBinarySearchingFirstEqual=1<<8;
CPBinarySearchingLastEqual=1<<9;
CPBinarySearchingInsertionIndex=1<<10;
var _1=Array.prototype.concat,_2=Array.prototype.join,_3=Array.prototype.push;
var _4=objj_allocateClassPair(CPObject,"CPArray"),_5=_4.isa;
objj_registerClassPair(_4);
class_addMethods(_4,[new objj_method(sel_getUid("init"),function(_6,_7){
with(_6){
if(_6===_8){
arguments[0]=objj_msgSend(_CPJavaScriptArray,"alloc");
return objj_msgSend.apply(this,arguments);
}
return objj_msgSendSuper({receiver:_6,super_class:objj_getClass("CPArray").super_class},"init");
}
}),new objj_method(sel_getUid("initWithArray:"),function(_9,_a,_b){
with(_9){
if(_9===_8){
arguments[0]=objj_msgSend(_CPJavaScriptArray,"alloc");
return objj_msgSend.apply(this,arguments);
}
return objj_msgSendSuper({receiver:_9,super_class:objj_getClass("CPArray").super_class},"init");
}
}),new objj_method(sel_getUid("initWithArray:copyItems:"),function(_c,_d,_e,_f){
with(_c){
if(_c===_8){
arguments[0]=objj_msgSend(_CPJavaScriptArray,"alloc");
return objj_msgSend.apply(this,arguments);
}
return objj_msgSendSuper({receiver:_c,super_class:objj_getClass("CPArray").super_class},"init");
}
}),new objj_method(sel_getUid("initWithObjects:"),function(_10,_11,_12){
with(_10){
if(_10===_8){
arguments[0]=objj_msgSend(_CPJavaScriptArray,"alloc");
return objj_msgSend.apply(this,arguments);
}
return objj_msgSendSuper({receiver:_10,super_class:objj_getClass("CPArray").super_class},"init");
}
}),new objj_method(sel_getUid("initWithObjects:count:"),function(_13,_14,_15,_16){
with(_13){
if(_13===_8){
arguments[0]=objj_msgSend(_CPJavaScriptArray,"alloc");
return objj_msgSend.apply(this,arguments);
}
return objj_msgSendSuper({receiver:_13,super_class:objj_getClass("CPArray").super_class},"init");
}
}),new objj_method(sel_getUid("initWithCapacity:"),function(_17,_18,_19){
with(_17){
if(_17===_8){
arguments[0]=objj_msgSend(_CPJavaScriptArray,"alloc");
return objj_msgSend.apply(this,arguments);
}
return objj_msgSendSuper({receiver:_17,super_class:objj_getClass("CPArray").super_class},"init");
}
}),new objj_method(sel_getUid("containsObject:"),function(_1a,_1b,_1c){
with(_1a){
return objj_msgSend(_1a,"indexOfObject:",_1c)!==CPNotFound;
}
}),new objj_method(sel_getUid("containsObjectIdenticalTo:"),function(_1d,_1e,_1f){
with(_1d){
return objj_msgSend(_1d,"indexOfObjectIdenticalTo:",_1f)!==CPNotFound;
}
}),new objj_method(sel_getUid("count"),function(_20,_21){
with(_20){
_CPRaiseInvalidAbstractInvocation(_20,_21);
}
}),new objj_method(sel_getUid("firstObject"),function(_22,_23){
with(_22){
var _24=objj_msgSend(_22,"count");
if(_24>0){
return objj_msgSend(_22,"objectAtIndex:",0);
}
return nil;
}
}),new objj_method(sel_getUid("lastObject"),function(_25,_26){
with(_25){
var _27=objj_msgSend(_25,"count");
if(_27<=0){
return nil;
}
return objj_msgSend(_25,"objectAtIndex:",_27-1);
}
}),new objj_method(sel_getUid("objectAtIndex:"),function(_28,_29,_2a){
with(_28){
_CPRaiseInvalidAbstractInvocation(_28,_29);
}
}),new objj_method(sel_getUid("objectsAtIndexes:"),function(_2b,_2c,_2d){
with(_2b){
var _2e=CPNotFound,_2f=[];
while((_2e=objj_msgSend(_2d,"indexGreaterThanIndex:",_2e))!==CPNotFound){
_2f.push(objj_msgSend(_2b,"objectAtIndex:",_2e));
}
return _2f;
}
}),new objj_method(sel_getUid("objectEnumerator"),function(_30,_31){
with(_30){
return objj_msgSend(objj_msgSend(_CPArrayEnumerator,"alloc"),"initWithArray:",_30);
}
}),new objj_method(sel_getUid("reverseObjectEnumerator"),function(_32,_33){
with(_32){
return objj_msgSend(objj_msgSend(_CPReverseArrayEnumerator,"alloc"),"initWithArray:",_32);
}
}),new objj_method(sel_getUid("indexOfObject:"),function(_34,_35,_36){
with(_34){
return objj_msgSend(_34,"indexOfObject:inRange:",_36,nil);
}
}),new objj_method(sel_getUid("indexOfObject:inRange:"),function(_37,_38,_39,_3a){
with(_37){
if(_39&&_39.isa){
var _3b=_3a?_3a.location:0,_3c=_3a?CPMaxRange(_3a):objj_msgSend(_37,"count");
for(;_3b<_3c;++_3b){
if(objj_msgSend(objj_msgSend(_37,"objectAtIndex:",_3b),"isEqual:",_39)){
return _3b;
}
}
return CPNotFound;
}
return objj_msgSend(_37,"indexOfObjectIdenticalTo:inRange:",_39,_3a);
}
}),new objj_method(sel_getUid("indexOfObjectIdenticalTo:"),function(_3d,_3e,_3f){
with(_3d){
return objj_msgSend(_3d,"indexOfObjectIdenticalTo:inRange:",_3f,nil);
}
}),new objj_method(sel_getUid("indexOfObjectIdenticalTo:inRange:"),function(_40,_41,_42,_43){
with(_40){
var _44=_43?_43.location:0,_45=_43?CPMaxRange(_43):objj_msgSend(_40,"count");
for(;_44<_45;++_44){
if(objj_msgSend(_40,"objectAtIndex:",_44)===_42){
return _44;
}
}
return CPNotFound;
}
}),new objj_method(sel_getUid("indexOfObjectPassingTest:"),function(_46,_47,_48){
with(_46){
return objj_msgSend(_46,"indexOfObjectWithOptions:passingTest:context:",CPEnumerationNormal,_48,undefined);
}
}),new objj_method(sel_getUid("indexOfObjectPassingTest:context:"),function(_49,_4a,_4b,_4c){
with(_49){
return objj_msgSend(_49,"indexOfObjectWithOptions:passingTest:context:",CPEnumerationNormal,_4b,_4c);
}
}),new objj_method(sel_getUid("indexOfObjectWithOptions:passingTest:"),function(_4d,_4e,_4f,_50){
with(_4d){
return objj_msgSend(_4d,"indexOfObjectWithOptions:passingTest:context:",_4f,_50,undefined);
}
}),new objj_method(sel_getUid("indexOfObjectWithOptions:passingTest:context:"),function(_51,_52,_53,_54,_55){
with(_51){
if(_53&CPEnumerationReverse){
var _56=objj_msgSend(_51,"count")-1,_57=-1,_58=-1;
}else{
var _56=0,_57=objj_msgSend(_51,"count"),_58=1;
}
for(;_56!==_57;_56+=_58){
if(_54(objj_msgSend(_51,"objectAtIndex:",_56),_56,_55)){
return _56;
}
}
return CPNotFound;
}
}),new objj_method(sel_getUid("indexOfObject:inSortedRange:options:usingComparator:"),function(_59,_5a,_5b,_5c,_5d,_5e){
with(_59){
if(!_5e){
_CPRaiseInvalidArgumentException(_59,_5a,"comparator is nil");
}
if((_5d&CPBinarySearchingFirstEqual)&&(_5d&CPBinarySearchingLastEqual)){
_CPRaiseInvalidArgumentException(_59,_5a,"both CPBinarySearchingFirstEqual and CPBinarySearchingLastEqual options cannot be specified");
}
var _5f=objj_msgSend(_59,"count");
if(_5f<=0){
return (_5d&CPBinarySearchingInsertionIndex)?0:CPNotFound;
}
var _60=_5c?_5c.location:0,_61=(_5c?CPMaxRange(_5c):objj_msgSend(_59,"count"))-1;
if(_60<0){
_CPRaiseRangeException(_59,_5a,_60,_5f);
}
if(_61>=_5f){
_CPRaiseRangeException(_59,_5a,_61,_5f);
}
while(_60<=_61){
var _62=FLOOR((_60+_61)/2),_63=_5e(_5b,objj_msgSend(_59,"objectAtIndex:",_62));
if(_63>0){
_60=_62+1;
}else{
if(_63<0){
_61=_62-1;
}else{
if(_5d&CPBinarySearchingFirstEqual){
while(_62>_60&&_5e(_5b,objj_msgSend(_59,"objectAtIndex:",_62-1))===CPOrderedSame){
--_62;
}
}else{
if(_5d&CPBinarySearchingLastEqual){
while(_62<_61&&_5e(_5b,objj_msgSend(_59,"objectAtIndex:",_62+1))===CPOrderedSame){
++_62;
}
if(_5d&CPBinarySearchingInsertionIndex){
++_62;
}
}
}
return _62;
}
}
}
if(_5d&CPBinarySearchingInsertionIndex){
return MAX(_60,0);
}
return CPNotFound;
}
}),new objj_method(sel_getUid("makeObjectsPerformSelector:"),function(_64,_65,_66){
with(_64){
objj_msgSend(_64,"makeObjectsPerformSelector:withObjects:",_66,nil);
}
}),new objj_method(sel_getUid("makeObjectsPerformSelector:withObject:"),function(_67,_68,_69,_6a){
with(_67){
return objj_msgSend(_67,"makeObjectsPerformSelector:withObjects:",_69,[_6a]);
}
}),new objj_method(sel_getUid("makeObjectsPerformSelector:withObjects:"),function(_6b,_6c,_6d,_6e){
with(_6b){
if(!_6d){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,"makeObjectsPerformSelector:withObjects: 'aSelector' can't be nil");
}
var _6f=0,_70=objj_msgSend(_6b,"count");
if(objj_msgSend(_6e,"count")){
var _71=objj_msgSend([nil,_6d],"arrayByAddingObjectsFromArray:",_6e);
for(;_6f<_70;++_6f){
_71[0]=objj_msgSend(_6b,"objectAtIndex:",_6f);
objj_msgSend.apply(this,_71);
}
}else{
for(;_6f<_70;++_6f){
objj_msgSend(objj_msgSend(_6b,"objectAtIndex:",_6f),_6d);
}
}
}
}),new objj_method(sel_getUid("enumerateObjectsUsingBlock:"),function(_72,_73,_74){
with(_72){
var _75=0,_76=objj_msgSend(_72,"count"),_77=NO,_78=function(_79){
if(arguments.length){
return _77=_79;
}
return _77;
};
for(;_75<_76;++_75){
_74(objj_msgSend(_72,"objectAtIndex:",_75),_75,_78);
if(_77){
return;
}
}
}
}),new objj_method(sel_getUid("enumerateObjectsWithOptions:usingBlock:"),function(_7a,_7b,_7c,_7d){
with(_7a){
var _7e=NO;
if(_7c&CPEnumerationReverse){
var _7f=objj_msgSend(_7a,"count")-1,_80=-1,_81=-1;
}else{
var _7f=0,_80=objj_msgSend(_7a,"count"),_81=1;
}
for(;_7f!==_80;_7f+=_81){
_7d(objj_msgSend(_7a,"objectAtIndex:",_7f),_7f,function(_82){
if(arguments.length){
return _7e=_82;
}
return _7e;
});
if(_7e){
return;
}
}
}
}),new objj_method(sel_getUid("firstObjectCommonWithArray:"),function(_83,_84,_85){
with(_83){
var _86=objj_msgSend(_83,"count");
if(!objj_msgSend(_85,"count")||!_86){
return nil;
}
var _87=0;
for(;_87<_86;++_87){
var _88=objj_msgSend(_83,"objectAtIndex:",_87);
if(objj_msgSend(_85,"containsObject:",_88)){
return _88;
}
}
return nil;
}
}),new objj_method(sel_getUid("isEqualToArray:"),function(_89,_8a,_8b){
with(_89){
if(_89===_8b){
return YES;
}
if(!objj_msgSend(_8b,"isKindOfClass:",CPArray)){
return NO;
}
var _8c=objj_msgSend(_89,"count"),_8d=objj_msgSend(_8b,"count");
if(_8b===nil||_8c!==_8d){
return NO;
}
var _8e=0;
for(;_8e<_8c;++_8e){
var lhs=objj_msgSend(_89,"objectAtIndex:",_8e),rhs=objj_msgSend(_8b,"objectAtIndex:",_8e);
if(lhs!==rhs&&(lhs&&!lhs.isa||rhs&&!rhs.isa||!objj_msgSend(lhs,"isEqual:",rhs))){
return NO;
}
}
return YES;
}
}),new objj_method(sel_getUid("isEqual:"),function(_8f,_90,_91){
with(_8f){
return (_8f===_91)||objj_msgSend(_8f,"isEqualToArray:",_91);
}
}),new objj_method(sel_getUid("_javaScriptArrayCopy"),function(_92,_93){
with(_92){
var _94=0,_95=objj_msgSend(_92,"count"),_96=[];
for(;_94<_95;++_94){
_3.call(_96,objj_msgSend(_92,"objectAtIndex:",_94));
}
return _96;
}
}),new objj_method(sel_getUid("arrayByAddingObject:"),function(_97,_98,_99){
with(_97){
var _9a=objj_msgSend(_97,"_javaScriptArrayCopy");
_3.call(_9a,_99);
return objj_msgSend(objj_msgSend(_97,"class"),sel_getUid("arrayWithArray:"),_9a);
}
}),new objj_method(sel_getUid("arrayByAddingObjectsFromArray:"),function(_9b,_9c,_9d){
with(_9b){
if(!_9d){
return objj_msgSend(_9b,"copy");
}
var _9d=_9d.isa===_CPJavaScriptArray?_9d:objj_msgSend(_9d,"_javaScriptArrayCopy"),_9e=_1.call(objj_msgSend(_9b,"_javaScriptArrayCopy"),_9d);
return objj_msgSend(objj_msgSend(_9b,"class"),sel_getUid("arrayWithArray:"),_9e);
}
}),new objj_method(sel_getUid("subarrayWithRange:"),function(_9f,_a0,_a1){
with(_9f){
if(!_a1){
return objj_msgSend(_9f,"copy");
}
if(_a1.location<0||CPMaxRange(_a1)>_9f.length){
objj_msgSend(CPException,"raise:reason:",CPRangeException,"subarrayWithRange: aRange out of bounds");
}
var _a2=_a1.location,_a3=CPMaxRange(_a1),_a4=[];
for(;_a2<_a3;++_a2){
_3.call(_a4,objj_msgSend(_9f,"objectAtIndex:",_a2));
}
return objj_msgSend(objj_msgSend(_9f,"class"),sel_getUid("arrayWithArray:"),_a4);
}
}),new objj_method(sel_getUid("sortedArrayUsingDescriptors:"),function(_a5,_a6,_a7){
with(_a5){
var _a8=objj_msgSend(_a5,"copy");
objj_msgSend(_a8,"sortUsingDescriptors:",_a7);
return _a8;
}
}),new objj_method(sel_getUid("sortedArrayUsingFunction:"),function(_a9,_aa,_ab){
with(_a9){
return objj_msgSend(_a9,"sortedArrayUsingFunction:context:",_ab,nil);
}
}),new objj_method(sel_getUid("sortedArrayUsingFunction:context:"),function(_ac,_ad,_ae,_af){
with(_ac){
var _b0=objj_msgSend(_ac,"copy");
objj_msgSend(_b0,"sortUsingFunction:context:",_ae,_af);
return _b0;
}
}),new objj_method(sel_getUid("sortedArrayUsingSelector:"),function(_b1,_b2,_b3){
with(_b1){
var _b4=objj_msgSend(_b1,"copy");
objj_msgSend(_b4,"sortUsingSelector:",_b3);
return _b4;
}
}),new objj_method(sel_getUid("componentsJoinedByString:"),function(_b5,_b6,_b7){
with(_b5){
return _2.call(objj_msgSend(_b5,"_javaScriptArrayCopy"),_b7);
}
}),new objj_method(sel_getUid("description"),function(_b8,_b9){
with(_b8){
var _ba=0,_bb=objj_msgSend(_b8,"count"),_bc="(";
for(;_ba<_bb;++_ba){
if(_ba===0){
_bc+="\n\t";
}
var _bd=objj_msgSend(_b8,"objectAtIndex:",_ba);
_bc+=CPDescriptionOfObject(_bd);
if(_ba!==_bb-1){
_bc+=",\n\t";
}else{
_bc+="\n";
}
}
return _bc+")";
}
}),new objj_method(sel_getUid("pathsMatchingExtensions:"),function(_be,_bf,_c0){
with(_be){
var _c1=0,_c2=objj_msgSend(_be,"count"),_c3=[];
for(;_c1<_c2;++_c1){
if(_be[_c1].isa&&objj_msgSend(_be[_c1],"isKindOfClass:",objj_msgSend(CPString,"class"))&&objj_msgSend(_c0,"containsObject:",objj_msgSend(_be[_c1],"pathExtension"))){
_c3.push(_be[_c1]);
}
}
return _c3;
}
}),new objj_method(sel_getUid("copy"),function(_c4,_c5){
with(_c4){
return objj_msgSend(objj_msgSend(_c4,"class"),"arrayWithArray:",_c4);
}
})]);
class_addMethods(_5,[new objj_method(sel_getUid("alloc"),function(_c6,_c7){
with(_c6){
if(_c6===CPArray||_c6===CPMutableArray){
return objj_msgSend(_CPPlaceholderArray,"alloc");
}
return objj_msgSendSuper({receiver:_c6,super_class:objj_getMetaClass("CPArray").super_class},"alloc");
}
}),new objj_method(sel_getUid("array"),function(_c8,_c9){
with(_c8){
return objj_msgSend(objj_msgSend(_c8,"alloc"),"init");
}
}),new objj_method(sel_getUid("arrayWithArray:"),function(_ca,_cb,_cc){
with(_ca){
return objj_msgSend(objj_msgSend(_ca,"alloc"),"initWithArray:",_cc);
}
}),new objj_method(sel_getUid("arrayWithObject:"),function(_cd,_ce,_cf){
with(_cd){
return objj_msgSend(objj_msgSend(_cd,"alloc"),"initWithObjects:",_cf);
}
}),new objj_method(sel_getUid("arrayWithObjects:"),function(_d0,_d1,_d2){
with(_d0){
arguments[0]=objj_msgSend(_d0,"alloc");
arguments[1]=sel_getUid("initWithObjects:");
return objj_msgSend.apply(this,arguments);
}
}),new objj_method(sel_getUid("arrayWithObjects:count:"),function(_d3,_d4,_d5,_d6){
with(_d3){
return objj_msgSend(objj_msgSend(_d3,"alloc"),"initWithObjects:count:",_d5,_d6);
}
})]);
var _4=objj_getClass("CPArray");
if(!_4){
throw new SyntaxError("*** Could not find definition for class \"CPArray\"");
}
var _5=_4.isa;
class_addMethods(_4,[new objj_method(sel_getUid("initWithCoder:"),function(_d7,_d8,_d9){
with(_d7){
return objj_msgSend(_d9,"decodeObjectForKey:","CP.objects");
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_da,_db,_dc){
with(_da){
objj_msgSend(_dc,"_encodeArrayOfObjects:forKey:",_da,"CP.objects");
}
})]);
var _4=objj_allocateClassPair(CPEnumerator,"_CPArrayEnumerator"),_5=_4.isa;
class_addIvars(_4,[new objj_ivar("_array"),new objj_ivar("_index")]);
objj_registerClassPair(_4);
class_addMethods(_4,[new objj_method(sel_getUid("initWithArray:"),function(_dd,_de,_df){
with(_dd){
_dd=objj_msgSendSuper({receiver:_dd,super_class:objj_getClass("_CPArrayEnumerator").super_class},"init");
if(_dd){
_array=_df;
_index=-1;
}
return _dd;
}
}),new objj_method(sel_getUid("nextObject"),function(_e0,_e1){
with(_e0){
if(++_index>=objj_msgSend(_array,"count")){
return nil;
}
return objj_msgSend(_array,"objectAtIndex:",_index);
}
})]);
var _4=objj_allocateClassPair(CPEnumerator,"_CPReverseArrayEnumerator"),_5=_4.isa;
class_addIvars(_4,[new objj_ivar("_array"),new objj_ivar("_index")]);
objj_registerClassPair(_4);
class_addMethods(_4,[new objj_method(sel_getUid("initWithArray:"),function(_e2,_e3,_e4){
with(_e2){
_e2=objj_msgSendSuper({receiver:_e2,super_class:objj_getClass("_CPReverseArrayEnumerator").super_class},"init");
if(_e2){
_array=_e4;
_index=objj_msgSend(_array,"count");
}
return _e2;
}
}),new objj_method(sel_getUid("nextObject"),function(_e5,_e6){
with(_e5){
if(--_index<0){
return nil;
}
return objj_msgSend(_array,"objectAtIndex:",_index);
}
})]);
var _8=nil;
var _4=objj_allocateClassPair(CPArray,"_CPPlaceholderArray"),_5=_4.isa;
objj_registerClassPair(_4);
class_addMethods(_5,[new objj_method(sel_getUid("alloc"),function(_e7,_e8){
with(_e7){
if(!_8){
_8=objj_msgSendSuper({receiver:_e7,super_class:objj_getMetaClass("_CPPlaceholderArray").super_class},"alloc");
}
return _8;
}
})]);
objj_executeFile("_CPJavaScriptArray.j",YES);
p;14;CPEnumerator.jt;357;@STATIC;1.0;i;10;CPObject.jt;324;
objj_executeFile("CPObject.j",YES);
var _1=objj_allocateClassPair(CPObject,"CPEnumerator"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("nextObject"),function(_3,_4){
with(_3){
return nil;
}
}),new objj_method(sel_getUid("allObjects"),function(_5,_6){
with(_5){
return [];
}
})]);
p;20;_CPJavaScriptArray.jt;7130;@STATIC;1.0;i;16;CPMutableArray.jt;7090;
objj_executeFile("CPMutableArray.j",YES);
var _1=Array.prototype.concat,_2=Array.prototype.indexOf,_3=Array.prototype.join,_4=Array.prototype.pop,_5=Array.prototype.push,_6=Array.prototype.slice,_7=Array.prototype.splice;
var _8=objj_allocateClassPair(CPMutableArray,"_CPJavaScriptArray"),_9=_8.isa;
objj_registerClassPair(_8);
class_addMethods(_8,[new objj_method(sel_getUid("initWithArray:"),function(_a,_b,_c){
with(_a){
return objj_msgSend(_a,"initWithArray:copyItems:",_c,NO);
}
}),new objj_method(sel_getUid("initWithArray:copyItems:"),function(_d,_e,_f,_10){
with(_d){
if(!_10&&objj_msgSend(_f,"isKindOfClass:",_CPJavaScriptArray)){
return _6.call(_f,0);
}
_d=objj_msgSendSuper({receiver:_d,super_class:objj_getClass("_CPJavaScriptArray").super_class},"init");
var _11=0;
if(objj_msgSend(_f,"isKindOfClass:",_CPJavaScriptArray)){
var _12=_f.length;
for(;_11<_12;++_11){
var _13=_f[_11];
_d[_11]=(_13&&_13.isa)?objj_msgSend(_13,"copy"):_13;
}
return _d;
}
var _12=objj_msgSend(_f,"count");
for(;_11<_12;++_11){
var _13=objj_msgSend(_f,"objectAtIndex:",_11);
_d[_11]=(_10&&_13&&_13.isa)?objj_msgSend(_13,"copy"):_13;
}
return _d;
}
}),new objj_method(sel_getUid("initWithObjects:"),function(_14,_15,_16){
with(_14){
var _17=2,_18=arguments.length;
for(;_17<_18;++_17){
if(arguments[_17]===nil){
break;
}
}
return _6.call(arguments,2,_17);
}
}),new objj_method(sel_getUid("initWithObjects:count:"),function(_19,_1a,_1b,_1c){
with(_19){
if(objj_msgSend(_1b,"isKindOfClass:",_CPJavaScriptArray)){
return _6.call(_1b,0);
}
var _1d=[],_1e=0;
for(;_1e<_1c;++_1e){
_5.call(_1d,objj_msgSend(_1b,"objectAtIndex:",_1e));
}
return _1d;
}
}),new objj_method(sel_getUid("initWithCapacity:"),function(_1f,_20,_21){
with(_1f){
return _1f;
}
}),new objj_method(sel_getUid("count"),function(_22,_23){
with(_22){
return _22.length;
}
}),new objj_method(sel_getUid("objectAtIndex:"),function(_24,_25,_26){
with(_24){
if(_26>=_24.length||_26<0){
_CPRaiseRangeException(_24,_25,_26,_24.length);
}
return _24[_26];
}
}),new objj_method(sel_getUid("indexOfObject:inRange:"),function(_27,_28,_29,_2a){
with(_27){
if(_29&&_29.isa){
var _2b=_2a?_2a.location:0,_2c=_2a?CPMaxRange(_2a):_27.length;
for(;_2b<_2c;++_2b){
if(objj_msgSend(_27[_2b],"isEqual:",_29)){
return _2b;
}
}
return CPNotFound;
}
return objj_msgSend(_27,"indexOfObjectIdenticalTo:inRange:",_29,_2a);
}
}),new objj_method(sel_getUid("indexOfObjectIdenticalTo:inRange:"),function(_2d,_2e,_2f,_30){
with(_2d){
if(_2&&!_30){
return _2.call(_2d,_2f);
}
var _31=_30?_30.location:0,_32=_30?CPMaxRange(_30):_2d.length;
for(;_31<_32;++_31){
if(_2d[_31]===_2f){
return _31;
}
}
return CPNotFound;
}
}),new objj_method(sel_getUid("makeObjectsPerformSelector:withObjects:"),function(_33,_34,_35,_36){
with(_33){
if(!_35){
_CPRaiseInvalidArgumentException(_33,_34,"attempt to pass a nil selector");
}
var _37=0,_38=_33.length;
if(objj_msgSend(_36,"count")){
var _39=objj_msgSend([nil,_35],"arrayByAddingObjectsFromArray:",_36);
for(;_37<_38;++_37){
_39[0]=_33[_37];
objj_msgSend.apply(this,_39);
}
}else{
for(;_37<_38;++_37){
objj_msgSend(_33[_37],_35);
}
}
}
}),new objj_method(sel_getUid("arrayByAddingObject:"),function(_3a,_3b,_3c){
with(_3a){
if(_3c&&_3c.isa&&objj_msgSend(_3c,"isKindOfClass:",_CPJavaScriptArray)){
return _1.call(_3a,[_3c]);
}
return _1.call(_3a,_3c);
}
}),new objj_method(sel_getUid("arrayByAddingObjectsFromArray:"),function(_3d,_3e,_3f){
with(_3d){
if(!_3f){
return objj_msgSend(_3d,"copy");
}
return _1.call(_3d,objj_msgSend(_3f,"isKindOfClass:",_CPJavaScriptArray)?_3f:objj_msgSend(_3f,"_javaScriptArrayCopy"));
}
}),new objj_method(sel_getUid("subarrayWithRange:"),function(_40,_41,_42){
with(_40){
if(_42.location<0||CPMaxRange(_42)>_40.length){
objj_msgSend(CPException,"raise:reason:",CPRangeException,_41+" aRange out of bounds");
}
return _6.call(_40,_42.location,CPMaxRange(_42));
}
}),new objj_method(sel_getUid("componentsJoinedByString:"),function(_43,_44,_45){
with(_43){
return _3.call(_43,_45);
}
}),new objj_method(sel_getUid("insertObject:atIndex:"),function(_46,_47,_48,_49){
with(_46){
if(_49>_46.length||_49<0){
_CPRaiseRangeException(_46,_47,_49,_46.length);
}
_7.call(_46,_49,0,_48);
}
}),new objj_method(sel_getUid("removeObjectAtIndex:"),function(_4a,_4b,_4c){
with(_4a){
if(_4c>=_4a.length||_4c<0){
_CPRaiseRangeException(_4a,_4b,_4c,_4a.length);
}
_7.call(_4a,_4c,1);
}
}),new objj_method(sel_getUid("addObject:"),function(_4d,_4e,_4f){
with(_4d){
_5.call(_4d,_4f);
}
}),new objj_method(sel_getUid("removeAllObjects"),function(_50,_51){
with(_50){
_7.call(_50,0,_50.length);
}
}),new objj_method(sel_getUid("removeLastObject"),function(_52,_53){
with(_52){
_4.call(_52);
}
}),new objj_method(sel_getUid("removeObjectsInRange:"),function(_54,_55,_56){
with(_54){
if(_56.location<0||CPMaxRange(_56)>_54.length){
objj_msgSend(CPException,"raise:reason:",CPRangeException,_55+" aRange out of bounds");
}
_7.call(_54,_56.location,_56.length);
}
}),new objj_method(sel_getUid("replaceObjectAtIndex:withObject:"),function(_57,_58,_59,_5a){
with(_57){
if(_59>=_57.length||_59<0){
_CPRaiseRangeException(_57,_58,_59,_57.length);
}
_57[_59]=_5a;
}
}),new objj_method(sel_getUid("replaceObjectsInRange:withObjectsFromArray:range:"),function(_5b,_5c,_5d,_5e,_5f){
with(_5b){
if(_5d.location<0||CPMaxRange(_5d)>_5b.length){
objj_msgSend(CPException,"raise:reason:",CPRangeException,_5c+" aRange out of bounds");
}
if(_5f&&(_5f.location<0||CPMaxRange(_5f)>_5e.length)){
objj_msgSend(CPException,"raise:reason:",CPRangeException,_5c+" otherRange out of bounds");
}
if(_5f&&(_5f.location!==0||_5f.length!==objj_msgSend(_5e,"count"))){
_5e=objj_msgSend(_5e,"subarrayWithRange:",_5f);
}
if(_5e.isa!==_CPJavaScriptArray){
_5e=objj_msgSend(_5e,"_javaScriptArrayCopy");
}
_7.apply(_5b,[_5d.location,_5d.length].concat(_5e));
}
}),new objj_method(sel_getUid("setArray:"),function(_60,_61,_62){
with(_60){
if(objj_msgSend(_62,"isKindOfClass:",_CPJavaScriptArray)){
_7.apply(_60,[0,_60.length].concat(_62));
}else{
objj_msgSendSuper({receiver:_60,super_class:objj_getClass("_CPJavaScriptArray").super_class},"setArray:",_62);
}
}
}),new objj_method(sel_getUid("addObjectsFromArray:"),function(_63,_64,_65){
with(_63){
if(objj_msgSend(_65,"isKindOfClass:",_CPJavaScriptArray)){
_7.apply(_63,[_63.length,0].concat(_65));
}else{
objj_msgSendSuper({receiver:_63,super_class:objj_getClass("_CPJavaScriptArray").super_class},"addObjectsFromArray:",_65);
}
}
}),new objj_method(sel_getUid("copy"),function(_66,_67){
with(_66){
return _6.call(_66,0);
}
}),new objj_method(sel_getUid("classForCoder"),function(_68,_69){
with(_68){
return CPArray;
}
})]);
class_addMethods(_9,[new objj_method(sel_getUid("alloc"),function(_6a,_6b){
with(_6a){
return [];
}
}),new objj_method(sel_getUid("array"),function(_6c,_6d){
with(_6c){
return [];
}
}),new objj_method(sel_getUid("arrayWithArray:"),function(_6e,_6f,_70){
with(_6e){
return objj_msgSend(objj_msgSend(_6e,"alloc"),"initWithArray:",_70);
}
}),new objj_method(sel_getUid("arrayWithObject:"),function(_71,_72,_73){
with(_71){
return [_73];
}
})]);
Array.prototype.isa=_CPJavaScriptArray;
p;16;CPMutableArray.jt;8132;@STATIC;1.0;i;9;CPArray.jt;8100;
objj_executeFile("CPArray.j",YES);
var _1=objj_allocateClassPair(CPArray,"CPMutableArray"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("addObject:"),function(_3,_4,_5){
with(_3){
_CPRaiseInvalidAbstractInvocation(_3,_4);
}
}),new objj_method(sel_getUid("addObjectsFromArray:"),function(_6,_7,_8){
with(_6){
var _9=0,_a=objj_msgSend(_8,"count");
for(;_9<_a;++_9){
objj_msgSend(_6,"addObject:",objj_msgSend(_8,"objectAtIndex:",_9));
}
}
}),new objj_method(sel_getUid("insertObject:atIndex:"),function(_b,_c,_d,_e){
with(_b){
_CPRaiseInvalidAbstractInvocation(_b,_c);
}
}),new objj_method(sel_getUid("insertObjects:atIndexes:"),function(_f,_10,_11,_12){
with(_f){
var _13=objj_msgSend(_12,"count"),_14=objj_msgSend(_11,"count");
if(_13!==_14){
objj_msgSend(CPException,"raise:reason:",CPRangeException,"the counts of the passed-in array ("+_14+") and index set ("+_13+") must be identical.");
}
var _15=objj_msgSend(_12,"lastIndex");
if(_15>=objj_msgSend(_f,"count")+_13){
objj_msgSend(CPException,"raise:reason:",CPRangeException,"the last index ("+_15+") must be less than the sum of the original count ("+objj_msgSend(_f,"count")+") and the insertion count ("+_13+").");
}
var _16=0,_17=objj_msgSend(_12,"firstIndex");
for(;_16<_14;++_16,_17=objj_msgSend(_12,"indexGreaterThanIndex:",_17)){
objj_msgSend(_f,"insertObject:atIndex:",objj_msgSend(_11,"objectAtIndex:",_16),_17);
}
}
}),new objj_method(sel_getUid("insertObject:inArraySortedByDescriptors:"),function(_18,_19,_1a,_1b){
with(_18){
var _1c,_1d=objj_msgSend(_1b,"count");
if(_1d){
_1c=objj_msgSend(_18,"indexOfObject:inSortedRange:options:usingComparator:",_1a,nil,CPBinarySearchingInsertionIndex,function(lhs,rhs){
var _1e=0,_1f=CPOrderedSame;
while(_1e<_1d&&((_1f=objj_msgSend(objj_msgSend(_1b,"objectAtIndex:",_1e),"compareObject:withObject:",lhs,rhs))===CPOrderedSame)){
++_1e;
}
return _1f;
});
}else{
_1c=objj_msgSend(_18,"count");
}
objj_msgSend(_18,"insertObject:atIndex:",_1a,_1c);
return _1c;
}
}),new objj_method(sel_getUid("replaceObjectAtIndex:withObject:"),function(_20,_21,_22,_23){
with(_20){
_CPRaiseInvalidAbstractInvocation(_20,_21);
}
}),new objj_method(sel_getUid("replaceObjectsAtIndexes:withObjects:"),function(_24,_25,_26,_27){
with(_24){
var i=0,_28=objj_msgSend(_26,"firstIndex");
while(_28!==CPNotFound){
objj_msgSend(_24,"replaceObjectAtIndex:withObject:",_28,objj_msgSend(_27,"objectAtIndex:",i++));
_28=objj_msgSend(_26,"indexGreaterThanIndex:",_28);
}
}
}),new objj_method(sel_getUid("replaceObjectsInRange:withObjectsFromArray:range:"),function(_29,_2a,_2b,_2c,_2d){
with(_29){
objj_msgSend(_29,"removeObjectsInRange:",_2b);
if(_2d&&(_2d.location!==0||_2d.length!==objj_msgSend(_2c,"count"))){
_2c=objj_msgSend(_2c,"subarrayWithRange:",_2d);
}
var _2e=objj_msgSend(CPIndexSet,"indexSetWithIndexesInRange:",CPMakeRange(_2b.location,objj_msgSend(_2c,"count")));
objj_msgSend(_29,"insertObjects:atIndexes:",_2c,_2e);
}
}),new objj_method(sel_getUid("replaceObjectsInRange:withObjectsFromArray:"),function(_2f,_30,_31,_32){
with(_2f){
objj_msgSend(_2f,"replaceObjectsInRange:withObjectsFromArray:range:",_31,_32,nil);
}
}),new objj_method(sel_getUid("setArray:"),function(_33,_34,_35){
with(_33){
if(_33===_35){
return;
}
objj_msgSend(_33,"removeAllObjects");
objj_msgSend(_33,"addObjectsFromArray:",_35);
}
}),new objj_method(sel_getUid("removeAllObjects"),function(_36,_37){
with(_36){
while(objj_msgSend(_36,"count")){
objj_msgSend(_36,"removeLastObject");
}
}
}),new objj_method(sel_getUid("removeLastObject"),function(_38,_39){
with(_38){
_CPRaiseInvalidAbstractInvocation(_38,_39);
}
}),new objj_method(sel_getUid("removeObject:"),function(_3a,_3b,_3c){
with(_3a){
objj_msgSend(_3a,"removeObject:inRange:",_3c,CPMakeRange(0,length));
}
}),new objj_method(sel_getUid("removeObject:inRange:"),function(_3d,_3e,_3f,_40){
with(_3d){
var _41;
while((_41=objj_msgSend(_3d,"indexOfObject:inRange:",_3f,_40))!=CPNotFound){
objj_msgSend(_3d,"removeObjectAtIndex:",_41);
_40=CPIntersectionRange(CPMakeRange(_41,length-_41),_40);
}
}
}),new objj_method(sel_getUid("removeObjectAtIndex:"),function(_42,_43,_44){
with(_42){
_CPRaiseInvalidAbstractInvocation(_42,_43);
}
}),new objj_method(sel_getUid("removeObjectsAtIndexes:"),function(_45,_46,_47){
with(_45){
var _48=objj_msgSend(_47,"lastIndex");
while(_48!==CPNotFound){
objj_msgSend(_45,"removeObjectAtIndex:",_48);
_48=objj_msgSend(_47,"indexLessThanIndex:",_48);
}
}
}),new objj_method(sel_getUid("removeObjectIdenticalTo:"),function(_49,_4a,_4b){
with(_49){
objj_msgSend(_49,"removeObjectIdenticalTo:inRange:",_4b,CPMakeRange(0,objj_msgSend(_49,"count")));
}
}),new objj_method(sel_getUid("removeObjectIdenticalTo:inRange:"),function(_4c,_4d,_4e,_4f){
with(_4c){
var _50,_51=objj_msgSend(_4c,"count");
while((_50=objj_msgSend(_4c,"indexOfObjectIdenticalTo:inRange:",_4e,_4f))!==CPNotFound){
objj_msgSend(_4c,"removeObjectAtIndex:",_50);
_4f=CPIntersectionRange(CPMakeRange(_50,(--_51)-_50),_4f);
}
}
}),new objj_method(sel_getUid("removeObjectsInArray:"),function(_52,_53,_54){
with(_52){
var _55=0,_56=objj_msgSend(_54,"count");
for(;_55<_56;++_55){
objj_msgSend(_52,"removeObject:",objj_msgSend(_54,"objectAtIndex:",_55));
}
}
}),new objj_method(sel_getUid("removeObjectsInRange:"),function(_57,_58,_59){
with(_57){
var _5a=_59.location,_5b=CPMaxRange(_59);
while(_5b-->_5a){
objj_msgSend(_57,"removeObjectAtIndex:",_5a);
}
}
}),new objj_method(sel_getUid("exchangeObjectAtIndex:withObjectAtIndex:"),function(_5c,_5d,_5e,_5f){
with(_5c){
if(_5e===_5f){
return;
}
var _60=objj_msgSend(_5c,"objectAtIndex:",_5e);
objj_msgSend(_5c,"replaceObjectAtIndex:withObject:",_5e,objj_msgSend(_5c,"objectAtIndex:",_5f));
objj_msgSend(_5c,"replaceObjectAtIndex:withObject:",_5f,_60);
}
}),new objj_method(sel_getUid("sortUsingDescriptors:"),function(_61,_62,_63){
with(_61){
var i=objj_msgSend(_63,"count"),_64=[];
while(i--){
var d=objj_msgSend(_63,"objectAtIndex:",i);
objj_msgSend(_64,"addObject:",{"k":objj_msgSend(d,"key"),"a":objj_msgSend(d,"ascending"),"s":objj_msgSend(d,"selector")});
}
_65(_61,_64);
}
}),new objj_method(sel_getUid("sortUsingFunction:context:"),function(_66,_67,_68,_69){
with(_66){
_6a(_66,_68,_69);
}
}),new objj_method(sel_getUid("sortUsingSelector:"),function(_6b,_6c,_6d){
with(_6b){
_6a(_6b,_6e,_6d);
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("arrayWithCapacity:"),function(_6f,_70,_71){
with(_6f){
return objj_msgSend(objj_msgSend(_6f,"alloc"),"initWithCapacity:",_71);
}
})]);
var _1=objj_getClass("CPArray");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"CPArray\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("mutableCopy"),function(_72,_73){
with(_72){
var r=objj_msgSend(CPMutableArray,"new");
objj_msgSend(r,"addObjectsFromArray:",_72);
return r;
}
})]);
var _6e=function(_74,_75,_76){
return objj_msgSend(_74,"performSelector:withObject:",_76,_75);
};
var _6a=function(_77,_78,_79){
var h,i,j,k,l,m,n=_77.length,o;
var A,B=[];
for(h=1;h<n;h+=h){
for(m=n-1-h;m>=0;m-=h+h){
l=m-h+1;
if(l<0){
l=0;
}
for(i=0,j=l;j<=m;i++,j++){
B[i]=_77[j];
}
for(i=0,k=l;k<j&&j<=m+h;k++){
A=_77[j];
o=_78(A,B[i],_79);
if(o>=0){
_77[k]=B[i++];
}else{
_77[k]=A;
j++;
}
}
while(k<j){
_77[k++]=B[i++];
}
}
}
};
var _65=function(a,d){
var h,i,j,k,l,m,n=a.length,dl=d.length-1,o,c={};
var A,B=[],C1,C2,cn,_7a,_7b,key,dd;
if(dl<0){
return;
}
for(h=1;h<n;h+=h){
for(m=n-1-h;m>=0;m-=h+h){
l=m-h+1;
if(l<0){
l=0;
}
for(i=0,j=l;j<=m;i++,j++){
B[i]=a[j];
}
for(i=0,k=l;k<j&&j<=m+h;k++){
A=a[j];
_7a=A._UID;
if(!_7a){
_7a=objj_msgSend(A,"UID");
}
C1=c[_7a];
if(!C1){
C1={};
cn=dl;
do{
key=d[cn].k;
C1[key]=objj_msgSend(A,"valueForKey:",key);
}while(cn--);
c[_7a]=C1;
}
_7b=B[i]._UID;
if(!_7b){
_7b=objj_msgSend(B[i],"UID");
}
C2=c[_7b];
if(!C2){
C2={};
cn=dl;
do{
key=d[cn].k;
C2[key]=objj_msgSend(B[i],"valueForKey:",key);
}while(cn--);
c[_7b]=C2;
}
cn=dl;
do{
dd=d[cn];
key=dd.k;
o=objj_msgSend(C1[key],dd.s,C2[key]);
if(o&&!dd.a){
o=-o;
}
}while(cn--&&o==CPOrderedSame);
if(o>=0){
a[k]=B[i++];
}else{
a[k]=A;
j++;
}
}
while(k<j){
a[k++]=B[i++];
}
}
}
};
p;12;CPIndexSet.jt;13609;@STATIC;1.0;i;9;CPArray.ji;10;CPObject.ji;9;CPRange.jt;13548;
objj_executeFile("CPArray.j",YES);
objj_executeFile("CPObject.j",YES);
objj_executeFile("CPRange.j",YES);
var _1=objj_allocateClassPair(CPObject,"CPIndexSet"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_count"),new objj_ivar("_ranges")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("init"),function(_3,_4){
with(_3){
return objj_msgSend(_3,"initWithIndexesInRange:",{location:(0),length:0});
}
}),new objj_method(sel_getUid("initWithIndex:"),function(_5,_6,_7){
with(_5){
return objj_msgSend(_5,"initWithIndexesInRange:",{location:(_7),length:1});
}
}),new objj_method(sel_getUid("initWithIndexesInRange:"),function(_8,_9,_a){
with(_8){
_8=objj_msgSendSuper({receiver:_8,super_class:objj_getClass("CPIndexSet").super_class},"init");
if(_8){
_count=MAX(0,_a.length);
if(_count>0){
_ranges=[_a];
}else{
_ranges=[];
}
}
return _8;
}
}),new objj_method(sel_getUid("initWithIndexSet:"),function(_b,_c,_d){
with(_b){
_b=objj_msgSendSuper({receiver:_b,super_class:objj_getClass("CPIndexSet").super_class},"init");
if(_b){
_count=objj_msgSend(_d,"count");
_ranges=[];
var _e=_d._ranges,_f=_e.length;
while(_f--){
_ranges[_f]={location:(_e[_f]).location,length:(_e[_f]).length};
}
}
return _b;
}
}),new objj_method(sel_getUid("isEqual:"),function(_10,_11,_12){
with(_10){
if(_10===_12){
return YES;
}
if(!_12||!objj_msgSend(_12,"isKindOfClass:",objj_msgSend(CPIndexSet,"class"))){
return NO;
}
return objj_msgSend(_10,"isEqualToIndexSet:",_12);
}
}),new objj_method(sel_getUid("isEqualToIndexSet:"),function(_13,_14,_15){
with(_13){
if(!_15){
return NO;
}
if(_13===_15){
return YES;
}
var _16=_ranges.length,_17=_15._ranges;
if(_16!==_17.length||_count!==_15._count){
return NO;
}
while(_16--){
if(!CPEqualRanges(_ranges[_16],_17[_16])){
return NO;
}
}
return YES;
}
}),new objj_method(sel_getUid("isEqual:"),function(_18,_19,_1a){
with(_18){
return _18===_1a||objj_msgSend(_1a,"isKindOfClass:",objj_msgSend(_18,"class"))&&objj_msgSend(_18,"isEqualToIndexSet:",_1a);
}
}),new objj_method(sel_getUid("containsIndex:"),function(_1b,_1c,_1d){
with(_1b){
return _1e(_ranges,_1d)!==CPNotFound;
}
}),new objj_method(sel_getUid("containsIndexesInRange:"),function(_1f,_20,_21){
with(_1f){
if(_21.length<=0){
return NO;
}
if(_count<_21.length){
return NO;
}
var _22=_1e(_ranges,_21.location);
if(_22===CPNotFound){
return NO;
}
var _23=_ranges[_22];
return CPIntersectionRange(_23,_21).length===_21.length;
}
}),new objj_method(sel_getUid("containsIndexes:"),function(_24,_25,_26){
with(_24){
var _27=_26._count;
if(_27<=0){
return YES;
}
if(_count<_27){
return NO;
}
var _28=_26._ranges,_29=_28.length;
while(_29--){
if(!objj_msgSend(_24,"containsIndexesInRange:",_28[_29])){
return NO;
}
}
return YES;
}
}),new objj_method(sel_getUid("intersectsIndexesInRange:"),function(_2a,_2b,_2c){
with(_2a){
if(_count<=0){
return NO;
}
var _2d=_2e(_ranges,_2c.location);
if(FLOOR(_2d)===_2d){
return YES;
}
var _2f=_2e(_ranges,((_2c).location+(_2c).length)-1);
if(FLOOR(_2f)===_2f){
return YES;
}
return _2d!==_2f;
}
}),new objj_method(sel_getUid("count"),function(_30,_31){
with(_30){
return _count;
}
}),new objj_method(sel_getUid("firstIndex"),function(_32,_33){
with(_32){
if(_count>0){
return _ranges[0].location;
}
return CPNotFound;
}
}),new objj_method(sel_getUid("lastIndex"),function(_34,_35){
with(_34){
if(_count>0){
return ((_ranges[_ranges.length-1]).location+(_ranges[_ranges.length-1]).length)-1;
}
return CPNotFound;
}
}),new objj_method(sel_getUid("indexGreaterThanIndex:"),function(_36,_37,_38){
with(_36){
++_38;
var _39=_2e(_ranges,_38);
if(_39===CPNotFound){
return CPNotFound;
}
_39=CEIL(_39);
if(_39>=_ranges.length){
return CPNotFound;
}
var _3a=_ranges[_39];
if(CPLocationInRange(_38,_3a)){
return _38;
}
return _3a.location;
}
}),new objj_method(sel_getUid("indexLessThanIndex:"),function(_3b,_3c,_3d){
with(_3b){
--_3d;
var _3e=_2e(_ranges,_3d);
if(_3e===CPNotFound){
return CPNotFound;
}
_3e=FLOOR(_3e);
if(_3e<0){
return CPNotFound;
}
var _3f=_ranges[_3e];
if(CPLocationInRange(_3d,_3f)){
return _3d;
}
return ((_3f).location+(_3f).length)-1;
}
}),new objj_method(sel_getUid("indexGreaterThanOrEqualToIndex:"),function(_40,_41,_42){
with(_40){
return objj_msgSend(_40,"indexGreaterThanIndex:",_42-1);
}
}),new objj_method(sel_getUid("indexLessThanOrEqualToIndex:"),function(_43,_44,_45){
with(_43){
return objj_msgSend(_43,"indexLessThanIndex:",_45+1);
}
}),new objj_method(sel_getUid("getIndexes:maxCount:inIndexRange:"),function(_46,_47,_48,_49,_4a){
with(_46){
if(!_count||_49===0||_4a&&!_4a.length){
if(_4a){
_4a.length=0;
}
return 0;
}
var _4b=0;
if(_4a){
var _4c=_4a.location,_4d=((_4a).location+(_4a).length)-1,_4e=CEIL(_2e(_ranges,_4c)),_4f=FLOOR(_2e(_ranges,_4d));
}else{
var _4c=objj_msgSend(_46,"firstIndex"),_4d=objj_msgSend(_46,"lastIndex"),_4e=0,_4f=_ranges.length-1;
}
while(_4e<=_4f){
var _50=_ranges[_4e],_51=MAX(_4c,_50.location),_52=MIN(_4d+1,((_50).location+(_50).length));
for(;_51<_52;++_51){
_48[_4b++]=_51;
if(_4b===_49){
if(_4a){
_4a.location=_51+1;
_4a.length=_4d+1-_51-1;
}
return _49;
}
}
++_4e;
}
if(_4a){
_4a.location=CPNotFound;
_4a.length=0;
}
return _4b;
}
}),new objj_method(sel_getUid("description"),function(_53,_54){
with(_53){
var _55=objj_msgSendSuper({receiver:_53,super_class:objj_getClass("CPIndexSet").super_class},"description");
if(_count){
var _56=0,_57=_ranges.length;
_55+="[number of indexes: "+_count+" (in "+_57;
if(_57===1){
_55+=" range), indexes: (";
}else{
_55+=" ranges), indexes: (";
}
for(;_56<_57;++_56){
var _58=_ranges[_56];
_55+=_58.location;
if(_58.length>1){
_55+="-"+(CPMaxRange(_58)-1);
}
if(_56+1<_57){
_55+=" ";
}
}
_55+=")]";
}else{
_55+="(no indexes)";
}
return _55;
}
}),new objj_method(sel_getUid("enumerateIndexesUsingBlock:"),function(_59,_5a,_5b){
with(_59){
objj_msgSend(_59,"enumerateIndexesWithOptions:usingBlock:",CPEnumerationNormal,_5b);
}
}),new objj_method(sel_getUid("enumerateIndexesWithOptions:usingBlock:"),function(_5c,_5d,_5e,_5f){
with(_5c){
if(!_count){
return;
}
objj_msgSend(_5c,"enumerateIndexesInRange:options:usingBlock:",CPMakeRange(0,((_ranges[_ranges.length-1]).location+(_ranges[_ranges.length-1]).length)),_5e,_5f);
}
}),new objj_method(sel_getUid("enumerateIndexesInRange:options:usingBlock:"),function(_60,_61,_62,_63,_64){
with(_60){
if(!_count||CPEmptyRange(_62)){
return;
}
var _65=NO,_66,_67,_68;
if(_63&CPEnumerationReverse){
_66=_ranges.length-1,_67=-1,_68=-1;
}else{
_66=0;
_67=_ranges.length;
_68=1;
}
for(;_66!==_67;_66+=_68){
var _69=_ranges[_66];
var _6a,_6b,_6c;
if(_63&CPEnumerationReverse){
_6a=((_69).location+(_69).length)-1;
_6b=_69.location-1;
_6c=-1;
}else{
_6a=_69.location;
_6b=((_69).location+(_69).length);
_6c=1;
}
for(;_6a!==_6b;_6a+=_6c){
if(CPLocationInRange(_6a,_62)){
_64(_6a,function(_6d){
if(arguments.length){
return _65=_6d;
}
return _65;
});
if(_65){
return;
}
}
}
}
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("indexSet"),function(_6e,_6f){
with(_6e){
return objj_msgSend(objj_msgSend(_6e,"alloc"),"init");
}
}),new objj_method(sel_getUid("indexSetWithIndex:"),function(_70,_71,_72){
with(_70){
return objj_msgSend(objj_msgSend(_70,"alloc"),"initWithIndex:",_72);
}
}),new objj_method(sel_getUid("indexSetWithIndexesInRange:"),function(_73,_74,_75){
with(_73){
return objj_msgSend(objj_msgSend(_73,"alloc"),"initWithIndexesInRange:",_75);
}
})]);
var _1=objj_getClass("CPIndexSet");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"CPIndexSet\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("addIndex:"),function(_76,_77,_78){
with(_76){
objj_msgSend(_76,"addIndexesInRange:",{location:(_78),length:1});
}
}),new objj_method(sel_getUid("addIndexes:"),function(_79,_7a,_7b){
with(_79){
var _7c=_7b._ranges,_7d=_7c.length;
while(_7d--){
objj_msgSend(_79,"addIndexesInRange:",_7c[_7d]);
}
}
}),new objj_method(sel_getUid("addIndexesInRange:"),function(_7e,_7f,_80){
with(_7e){
if(_80.length<=0){
return;
}
if(_count<=0){
_count=_80.length;
_ranges=[_80];
return;
}
var _81=_ranges.length,_82=_2e(_ranges,_80.location-1),_83=CEIL(_82);
if(_83===_82&&_83<_81){
_80=CPUnionRange(_80,_ranges[_83]);
}
var _84=_2e(_ranges,((_80).location+(_80).length)),_85=FLOOR(_84);
if(_85===_84&&_85>=0){
_80=CPUnionRange(_80,_ranges[_85]);
}
var _86=_85-_83+1;
if(_86===_ranges.length){
_ranges=[_80];
_count=_80.length;
}else{
if(_86===1){
if(_83<_ranges.length){
_count-=_ranges[_83].length;
}
_count+=_80.length;
_ranges[_83]=_80;
}else{
if(_86>0){
var _87=_83,_88=_83+_86-1;
for(;_87<=_88;++_87){
_count-=_ranges[_87].length;
}
objj_msgSend(_ranges,"removeObjectsInRange:",{location:(_83),length:_86});
}
objj_msgSend(_ranges,"insertObject:atIndex:",_80,_83);
_count+=_80.length;
}
}
}
}),new objj_method(sel_getUid("removeIndex:"),function(_89,_8a,_8b){
with(_89){
objj_msgSend(_89,"removeIndexesInRange:",{location:(_8b),length:1});
}
}),new objj_method(sel_getUid("removeIndexes:"),function(_8c,_8d,_8e){
with(_8c){
var _8f=_8e._ranges,_90=_8f.length;
while(_90--){
objj_msgSend(_8c,"removeIndexesInRange:",_8f[_90]);
}
}
}),new objj_method(sel_getUid("removeAllIndexes"),function(_91,_92){
with(_91){
_ranges=[];
_count=0;
}
}),new objj_method(sel_getUid("removeIndexesInRange:"),function(_93,_94,_95){
with(_93){
if(_95.length<=0){
return;
}
if(_count<=0){
return;
}
var _96=_ranges.length,_97=_2e(_ranges,_95.location),_98=CEIL(_97);
if(_97===_98&&_98<_96){
var _99=_ranges[_98];
if(_95.location!==_99.location){
var _9a=((_95).location+(_95).length),_9b=((_99).location+(_99).length);
_99.length=_95.location-_99.location;
if(_9a<_9b){
_count-=_95.length;
objj_msgSend(_ranges,"insertObject:atIndex:",{location:(_9a),length:_9b-_9a},_98+1);
return;
}else{
_count-=_9b-_95.location;
_98+=1;
}
}
}
var _9c=_2e(_ranges,((_95).location+(_95).length)-1),_9d=FLOOR(_9c);
if(_9c===_9d&&_9d>=0){
var _9a=((_95).location+(_95).length),_99=_ranges[_9d],_9b=((_99).location+(_99).length);
if(_9a!==_9b){
_count-=_9a-_99.location;
_9d-=1;
_99.location=_9a;
_99.length=_9b-_9a;
}
}
var _9e=_9d-_98+1;
if(_9e>0){
var _9f=_98,_a0=_98+_9e-1;
for(;_9f<=_a0;++_9f){
_count-=_ranges[_9f].length;
}
objj_msgSend(_ranges,"removeObjectsInRange:",{location:(_98),length:_9e});
}
}
}),new objj_method(sel_getUid("shiftIndexesStartingAtIndex:by:"),function(_a1,_a2,_a3,_a4){
with(_a1){
if(!_count||_a4==0){
return;
}
var i=_ranges.length-1,_a5=CPMakeRange(CPNotFound,0);
for(;i>=0;--i){
var _a6=_ranges[i],_a7=((_a6).location+(_a6).length);
if(_a3>=_a7){
break;
}
if(_a3>_a6.location){
_a5=CPMakeRange(_a3+_a4,_a7-_a3);
_a6.length=_a3-_a6.location;
if(_a4>0){
objj_msgSend(_ranges,"insertObject:atIndex:",_a5,i+1);
}else{
if(_a5.location<0){
_a5.length=((_a5).location+(_a5).length);
_a5.location=0;
}
}
break;
}
if((_a6.location+=_a4)<0){
_count-=_a6.length-((_a6).location+(_a6).length);
_a6.length=((_a6).location+(_a6).length);
_a6.location=0;
}
}
if(_a4<0){
var j=i+1,_a8=_ranges.length,_a9=[];
for(;j<_a8;++j){
objj_msgSend(_a9,"addObject:",_ranges[j]);
_count-=_ranges[j].length;
}
if((j=i+1)<_a8){
objj_msgSend(_ranges,"removeObjectsInRange:",{location:(j),length:_a8-j});
for(j=0,_a8=_a9.length;j<_a8;++j){
objj_msgSend(_a1,"addIndexesInRange:",_a9[j]);
}
}
if(_a5.location!=CPNotFound){
objj_msgSend(_a1,"addIndexesInRange:",_a5);
}
}
}
})]);
var _aa="CPIndexSetCountKey",_ab="CPIndexSetRangeStringsKey";
var _1=objj_getClass("CPIndexSet");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"CPIndexSet\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("initWithCoder:"),function(_ac,_ad,_ae){
with(_ac){
_ac=objj_msgSendSuper({receiver:_ac,super_class:objj_getClass("CPIndexSet").super_class},"init");
if(_ac){
_count=objj_msgSend(_ae,"decodeIntForKey:",_aa);
_ranges=[];
var _af=objj_msgSend(_ae,"decodeObjectForKey:",_ab),_b0=0,_b1=_af.length;
for(;_b0<_b1;++_b0){
_ranges.push(CPRangeFromString(_af[_b0]));
}
}
return _ac;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_b2,_b3,_b4){
with(_b2){
objj_msgSend(_b4,"encodeInt:forKey:",_count,_aa);
var _b5=0,_b6=_ranges.length,_b7=[];
for(;_b5<_b6;++_b5){
_b7[_b5]=CPStringFromRange(_ranges[_b5]);
}
objj_msgSend(_b4,"encodeObject:forKey:",_b7,_ab);
}
})]);
var _1=objj_getClass("CPIndexSet");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"CPIndexSet\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("copy"),function(_b8,_b9){
with(_b8){
return objj_msgSend(objj_msgSend(objj_msgSend(_b8,"class"),"alloc"),"initWithIndexSet:",_b8);
}
}),new objj_method(sel_getUid("mutableCopy"),function(_ba,_bb){
with(_ba){
return objj_msgSend(objj_msgSend(objj_msgSend(_ba,"class"),"alloc"),"initWithIndexSet:",_ba);
}
})]);
var _1=objj_allocateClassPair(CPIndexSet,"CPMutableIndexSet"),_2=_1.isa;
objj_registerClassPair(_1);
var _1e=function(_bc,_bd){
var low=0,_be=_bc.length-1;
while(low<=_be){
var _bf=FLOOR(low+(_be-low)/2),_c0=_bc[_bf];
if(_bd<_c0.location){
_be=_bf-1;
}else{
if(_bd>=((_c0).location+(_c0).length)){
low=_bf+1;
}else{
return _bf;
}
}
}
return CPNotFound;
};
var _2e=function(_c1,_c2){
var _c3=_c1.length;
if(_c3<=0){
return CPNotFound;
}
var low=0,_c4=_c3*2;
while(low<=_c4){
var _c5=FLOOR(low+(_c4-low)/2),_c6=_c5/2,_c7=FLOOR(_c6);
if(_c6===_c7){
if(_c7-1>=0&&_c2<((_c1[_c7-1]).location+(_c1[_c7-1]).length)){
_c4=_c5-1;
}else{
if(_c7<_c3&&_c2>=_c1[_c7].location){
low=_c5+1;
}else{
return _c7-0.5;
}
}
}else{
var _c8=_c1[_c7];
if(_c2<_c8.location){
_c4=_c5-1;
}else{
if(_c2>=((_c8).location+(_c8).length)){
low=_c5+1;
}else{
return _c7;
}
}
}
}
return CPNotFound;
};
p;8;CPNull.jt;731;@STATIC;1.0;i;10;CPObject.jt;698;
objj_executeFile("CPObject.j",YES);
var _1=nil;
var _2=objj_allocateClassPair(CPObject,"CPNull"),_3=_2.isa;
objj_registerClassPair(_2);
class_addMethods(_2,[new objj_method(sel_getUid("isEqual:"),function(_4,_5,_6){
with(_4){
if(_4===_6){
return YES;
}
return objj_msgSend(_6,"isKindOfClass:",objj_msgSend(CPNull,"class"));
}
}),new objj_method(sel_getUid("initWithCoder:"),function(_7,_8,_9){
with(_7){
return objj_msgSend(CPNull,"null");
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_a,_b,_c){
with(_a){
}
})]);
class_addMethods(_3,[new objj_method(sel_getUid("null"),function(_d,_e){
with(_d){
if(!_1){
_1=objj_msgSend(objj_msgSend(CPNull,"alloc"),"init");
}
return _1;
}
})]);
p;16;CPNotification.jt;1472;@STATIC;1.0;i;13;CPException.ji;10;CPObject.jt;1420;
objj_executeFile("CPException.j",YES);
objj_executeFile("CPObject.j",YES);
var _1=objj_allocateClassPair(CPObject,"CPNotification"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_name"),new objj_ivar("_object"),new objj_ivar("_userInfo")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("init"),function(_3,_4){
with(_3){
objj_msgSend(CPException,"raise:reason:",CPUnsupportedMethodException,"CPNotification's init method should not be used");
}
}),new objj_method(sel_getUid("initWithName:object:userInfo:"),function(_5,_6,_7,_8,_9){
with(_5){
_5=objj_msgSendSuper({receiver:_5,super_class:objj_getClass("CPNotification").super_class},"init");
if(_5){
_name=_7;
_object=_8;
_userInfo=_9;
}
return _5;
}
}),new objj_method(sel_getUid("name"),function(_a,_b){
with(_a){
return _name;
}
}),new objj_method(sel_getUid("object"),function(_c,_d){
with(_c){
return _object;
}
}),new objj_method(sel_getUid("userInfo"),function(_e,_f){
with(_e){
return _userInfo;
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("notificationWithName:object:userInfo:"),function(_10,_11,_12,_13,_14){
with(_10){
return objj_msgSend(objj_msgSend(_10,"alloc"),"initWithName:object:userInfo:",_12,_13,_14);
}
}),new objj_method(sel_getUid("notificationWithName:object:"),function(_15,_16,_17,_18){
with(_15){
return objj_msgSend(objj_msgSend(_15,"alloc"),"initWithName:object:userInfo:",_17,_18,nil);
}
})]);
p;22;CPNotificationCenter.jt;6589;@STATIC;1.0;i;9;CPArray.ji;14;CPDictionary.ji;13;CPException.ji;16;CPNotification.ji;8;CPNull.jt;6487;
objj_executeFile("CPArray.j",YES);
objj_executeFile("CPDictionary.j",YES);
objj_executeFile("CPException.j",YES);
objj_executeFile("CPNotification.j",YES);
objj_executeFile("CPNull.j",YES);
var _1=nil;
var _2=objj_allocateClassPair(CPObject,"CPNotificationCenter"),_3=_2.isa;
class_addIvars(_2,[new objj_ivar("_namedRegistries"),new objj_ivar("_unnamedRegistry")]);
objj_registerClassPair(_2);
class_addMethods(_2,[new objj_method(sel_getUid("init"),function(_4,_5){
with(_4){
_4=objj_msgSendSuper({receiver:_4,super_class:objj_getClass("CPNotificationCenter").super_class},"init");
if(_4){
_namedRegistries=objj_msgSend(CPDictionary,"dictionary");
_unnamedRegistry=objj_msgSend(objj_msgSend(_CPNotificationRegistry,"alloc"),"init");
}
return _4;
}
}),new objj_method(sel_getUid("addObserver:selector:name:object:"),function(_6,_7,_8,_9,_a,_b){
with(_6){
var _c,_d=objj_msgSend(objj_msgSend(_CPNotificationObserver,"alloc"),"initWithObserver:selector:",_8,_9);
if(_a==nil){
_c=_unnamedRegistry;
}else{
if(!(_c=objj_msgSend(_namedRegistries,"objectForKey:",_a))){
_c=objj_msgSend(objj_msgSend(_CPNotificationRegistry,"alloc"),"init");
objj_msgSend(_namedRegistries,"setObject:forKey:",_c,_a);
}
}
objj_msgSend(_c,"addObserver:object:",_d,_b);
}
}),new objj_method(sel_getUid("removeObserver:"),function(_e,_f,_10){
with(_e){
var _11=nil,_12=objj_msgSend(_namedRegistries,"keyEnumerator");
while((_11=objj_msgSend(_12,"nextObject"))!==nil){
objj_msgSend(objj_msgSend(_namedRegistries,"objectForKey:",_11),"removeObserver:object:",_10,nil);
}
objj_msgSend(_unnamedRegistry,"removeObserver:object:",_10,nil);
}
}),new objj_method(sel_getUid("removeObserver:name:object:"),function(_13,_14,_15,_16,_17){
with(_13){
if(_16==nil){
var _18=nil,_19=objj_msgSend(_namedRegistries,"keyEnumerator");
while((_18=objj_msgSend(_19,"nextObject"))!==nil){
objj_msgSend(objj_msgSend(_namedRegistries,"objectForKey:",_18),"removeObserver:object:",_15,_17);
}
objj_msgSend(_unnamedRegistry,"removeObserver:object:",_15,_17);
}else{
objj_msgSend(objj_msgSend(_namedRegistries,"objectForKey:",_16),"removeObserver:object:",_15,_17);
}
}
}),new objj_method(sel_getUid("postNotification:"),function(_1a,_1b,_1c){
with(_1a){
if(!_1c){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,"postNotification: does not except 'nil' notifications");
}
_1d(_1a,_1c);
}
}),new objj_method(sel_getUid("postNotificationName:object:userInfo:"),function(_1e,_1f,_20,_21,_22){
with(_1e){
_1d(_1e,objj_msgSend(objj_msgSend(CPNotification,"alloc"),"initWithName:object:userInfo:",_20,_21,_22));
}
}),new objj_method(sel_getUid("postNotificationName:object:"),function(_23,_24,_25,_26){
with(_23){
_1d(_23,objj_msgSend(objj_msgSend(CPNotification,"alloc"),"initWithName:object:userInfo:",_25,_26,nil));
}
})]);
class_addMethods(_3,[new objj_method(sel_getUid("defaultCenter"),function(_27,_28){
with(_27){
if(!_1){
_1=objj_msgSend(objj_msgSend(CPNotificationCenter,"alloc"),"init");
}
return _1;
}
})]);
var _1d=function(_29,_2a){
objj_msgSend(_29._unnamedRegistry,"postNotification:",_2a);
objj_msgSend(objj_msgSend(_29._namedRegistries,"objectForKey:",objj_msgSend(_2a,"name")),"postNotification:",_2a);
};
var _2=objj_allocateClassPair(CPObject,"_CPNotificationRegistry"),_3=_2.isa;
class_addIvars(_2,[new objj_ivar("_objectObservers")]);
objj_registerClassPair(_2);
class_addMethods(_2,[new objj_method(sel_getUid("init"),function(_2b,_2c){
with(_2b){
_2b=objj_msgSendSuper({receiver:_2b,super_class:objj_getClass("_CPNotificationRegistry").super_class},"init");
if(_2b){
_objectObservers=objj_msgSend(CPDictionary,"dictionary");
}
return _2b;
}
}),new objj_method(sel_getUid("addObserver:object:"),function(_2d,_2e,_2f,_30){
with(_2d){
if(!_30){
_30=objj_msgSend(CPNull,"null");
}
var _31=objj_msgSend(_objectObservers,"objectForKey:",objj_msgSend(_30,"UID"));
if(!_31){
_31=objj_msgSend(CPMutableSet,"set");
objj_msgSend(_objectObservers,"setObject:forKey:",_31,objj_msgSend(_30,"UID"));
}
objj_msgSend(_31,"addObject:",_2f);
}
}),new objj_method(sel_getUid("removeObserver:object:"),function(_32,_33,_34,_35){
with(_32){
var _36=[];
if(_35==nil){
var key=nil,_37=objj_msgSend(_objectObservers,"keyEnumerator");
while((key=objj_msgSend(_37,"nextObject"))!==nil){
var _38=objj_msgSend(_objectObservers,"objectForKey:",key),_39=nil,_3a=objj_msgSend(_38,"objectEnumerator");
while((_39=objj_msgSend(_3a,"nextObject"))!==nil){
if(objj_msgSend(_39,"observer")==_34){
objj_msgSend(_38,"removeObject:",_39);
}
}
if(!objj_msgSend(_38,"count")){
_36.push(key);
}
}
}else{
var key=objj_msgSend(_35,"UID"),_38=objj_msgSend(_objectObservers,"objectForKey:",key),_39=nil,_3a=objj_msgSend(_38,"objectEnumerator");
while((_39=objj_msgSend(_3a,"nextObject"))!==nil){
if(objj_msgSend(_39,"observer")==_34){
objj_msgSend(_38,"removeObject:",_39);
}
}
if(!objj_msgSend(_38,"count")){
_36.push(key);
}
}
var _3b=_36.length;
while(_3b--){
objj_msgSend(_objectObservers,"removeObjectForKey:",_36[_3b]);
}
}
}),new objj_method(sel_getUid("postNotification:"),function(_3c,_3d,_3e){
with(_3c){
var _3f=objj_msgSend(_3e,"object"),_40=nil;
if(_3f!=nil&&(_40=objj_msgSend(_objectObservers,"objectForKey:",objj_msgSend(_3f,"UID")))){
var _41=objj_msgSend(_40,"copy"),_42=nil,_43=objj_msgSend(_41,"objectEnumerator");
while((_42=objj_msgSend(_43,"nextObject"))!==nil){
if(objj_msgSend(_40,"containsObject:",_42)){
objj_msgSend(_42,"postNotification:",_3e);
}
}
}
_40=objj_msgSend(_objectObservers,"objectForKey:",objj_msgSend(objj_msgSend(CPNull,"null"),"UID"));
if(!_40){
return;
}
var _41=objj_msgSend(_40,"copy"),_43=objj_msgSend(_41,"objectEnumerator");
while((_42=objj_msgSend(_43,"nextObject"))!==nil){
if(objj_msgSend(_40,"containsObject:",_42)){
objj_msgSend(_42,"postNotification:",_3e);
}
}
}
}),new objj_method(sel_getUid("count"),function(_44,_45){
with(_44){
return objj_msgSend(_objectObservers,"count");
}
})]);
var _2=objj_allocateClassPair(CPObject,"_CPNotificationObserver"),_3=_2.isa;
class_addIvars(_2,[new objj_ivar("_observer"),new objj_ivar("_selector")]);
objj_registerClassPair(_2);
class_addMethods(_2,[new objj_method(sel_getUid("initWithObserver:selector:"),function(_46,_47,_48,_49){
with(_46){
if(_46){
_observer=_48;
_selector=_49;
}
return _46;
}
}),new objj_method(sel_getUid("observer"),function(_4a,_4b){
with(_4a){
return _observer;
}
}),new objj_method(sel_getUid("postNotification:"),function(_4c,_4d,_4e){
with(_4c){
objj_msgSend(_observer,"performSelector:withObject:",_selector,_4e);
}
})]);
p;14;CPMutableSet.jt;2517;@STATIC;1.0;i;7;CPSet.ji;23;_CPConcreteMutableSet.jt;2459;
objj_executeFile("CPSet.j",YES);
var _1=objj_allocateClassPair(CPSet,"CPMutableSet"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initWithCapacity:"),function(_3,_4,_5){
with(_3){
return objj_msgSend(_3,"init");
}
}),new objj_method(sel_getUid("filterUsingPredicate:"),function(_6,_7,_8){
with(_6){
var _9,_a=objj_msgSend(_6,"objectEnumerator");
while((_9=objj_msgSend(_a,"nextObject"))!==nil){
if(!objj_msgSend(_8,"evaluateWithObject:",_9)){
objj_msgSend(_6,"removeObject:",_9);
}
}
}
}),new objj_method(sel_getUid("removeObject:"),function(_b,_c,_d){
with(_b){
_CPRaiseInvalidAbstractInvocation(_b,_c);
}
}),new objj_method(sel_getUid("removeObjectsInArray:"),function(_e,_f,_10){
with(_e){
var _11=0,_12=objj_msgSend(_10,"count");
for(;_11<_12;++_11){
objj_msgSend(_e,"removeObject:",objj_msgSend(_10,"objectAtIndex:",_11));
}
}
}),new objj_method(sel_getUid("removeAllObjects"),function(_13,_14){
with(_13){
var _15,_16=objj_msgSend(_13,"objectEnumerator");
while((_15=objj_msgSend(_16,"nextObject"))!==nil){
objj_msgSend(_13,"removeObject:",_15);
}
}
}),new objj_method(sel_getUid("addObjectsFromArray:"),function(_17,_18,_19){
with(_17){
var _1a=objj_msgSend(_19,"count");
while(_1a--){
objj_msgSend(_17,"addObject:",_19[_1a]);
}
}
}),new objj_method(sel_getUid("unionSet:"),function(_1b,_1c,_1d){
with(_1b){
var _1e,_1f=objj_msgSend(_1d,"objectEnumerator");
while((_1e=objj_msgSend(_1f,"nextObject"))!==nil){
objj_msgSend(_1b,"addObject:",_1e);
}
}
}),new objj_method(sel_getUid("minusSet:"),function(_20,_21,_22){
with(_20){
var _23,_24=objj_msgSend(_22,"objectEnumerator");
while((_23=objj_msgSend(_24,"nextObject"))!==nil){
objj_msgSend(_20,"removeObject:",_23);
}
}
}),new objj_method(sel_getUid("intersectSet:"),function(_25,_26,_27){
with(_25){
var _28,_29=objj_msgSend(_25,"objectEnumerator"),_2a=[];
while((_28=objj_msgSend(_29,"nextObject"))!==nil){
if(!objj_msgSend(_27,"containsObject:",_28)){
_2a.push(_28);
}
}
var _2b=objj_msgSend(_2a,"count");
while(_2b--){
objj_msgSend(_25,"removeObject:",_2a[_2b]);
}
}
}),new objj_method(sel_getUid("setSet:"),function(_2c,_2d,_2e){
with(_2c){
objj_msgSend(_2c,"removeAllObjects");
objj_msgSend(_2c,"unionSet:",_2e);
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("setWithCapacity:"),function(_2f,_30,_31){
with(_2f){
return objj_msgSend(objj_msgSend(_2f,"alloc"),"initWithCapacity:",_31);
}
})]);
objj_executeFile("_CPConcreteMutableSet.j",YES);
p;7;CPSet.jt;9420;@STATIC;1.0;i;9;CPArray.ji;14;CPEnumerator.ji;10;CPNumber.ji;10;CPObject.ji;14;CPMutableSet.jt;9320;
objj_executeFile("CPArray.j",YES);
objj_executeFile("CPEnumerator.j",YES);
objj_executeFile("CPNumber.j",YES);
objj_executeFile("CPObject.j",YES);
var _1=objj_allocateClassPair(CPObject,"CPSet"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("setByAddingObject:"),function(_3,_4,_5){
with(_3){
return objj_msgSend(objj_msgSend(_3,"class"),"setWithArray:",objj_msgSend(objj_msgSend(_3,"allObjects"),"arrayByAddingObject:",_5));
}
}),new objj_method(sel_getUid("setByAddingObjectsFromSet:"),function(_6,_7,_8){
with(_6){
return objj_msgSend(_6,"setByAddingObjectsFromArray:",objj_msgSend(_8,"allObjects"));
}
}),new objj_method(sel_getUid("setByAddingObjectsFromArray:"),function(_9,_a,_b){
with(_9){
return objj_msgSend(objj_msgSend(_9,"class"),"setWithArray:",objj_msgSend(objj_msgSend(_9,"allObjects"),"arrayByAddingObjectsFromArray:",_b));
}
}),new objj_method(sel_getUid("init"),function(_c,_d){
with(_c){
return objj_msgSend(_c,"initWithObjects:count:",nil,0);
}
}),new objj_method(sel_getUid("initWithArray:"),function(_e,_f,_10){
with(_e){
return objj_msgSend(_e,"initWithObjects:count:",_10,objj_msgSend(_10,"count"));
}
}),new objj_method(sel_getUid("initWithObjects:"),function(_11,_12,_13){
with(_11){
var _14=2,_15=arguments.length;
for(;_14<_15;++_14){
if(arguments[_14]===nil){
break;
}
}
return objj_msgSend(_11,"initWithObjects:count:",Array.prototype.slice.call(arguments,2,_14),_14-2);
}
}),new objj_method(sel_getUid("initWithObjects:count:"),function(_16,_17,_18,_19){
with(_16){
if(_16===_1a){
return objj_msgSend(objj_msgSend(_CPConcreteMutableSet,"alloc"),"initWithObjects:count:",_18,_19);
}
return objj_msgSendSuper({receiver:_16,super_class:objj_getClass("CPSet").super_class},"init");
}
}),new objj_method(sel_getUid("initWithSet:"),function(_1b,_1c,_1d){
with(_1b){
return objj_msgSend(_1b,"initWithArray:",objj_msgSend(_1d,"allObjects"));
}
}),new objj_method(sel_getUid("initWithSet:copyItems:"),function(_1e,_1f,_20,_21){
with(_1e){
if(_21){
return objj_msgSend(_20,"valueForKey:","copy");
}
return objj_msgSend(_1e,"initWithSet:",_20);
}
}),new objj_method(sel_getUid("count"),function(_22,_23){
with(_22){
_CPRaiseInvalidAbstractInvocation(_22,_23);
}
}),new objj_method(sel_getUid("allObjects"),function(_24,_25){
with(_24){
var _26=[],_27,_28=objj_msgSend(_24,"objectEnumerator");
while((_27=objj_msgSend(_28,"nextObject"))!==nil){
_26.push(_27);
}
return _26;
}
}),new objj_method(sel_getUid("anyObject"),function(_29,_2a){
with(_29){
return objj_msgSend(objj_msgSend(_29,"objectEnumerator"),"nextObject");
}
}),new objj_method(sel_getUid("containsObject:"),function(_2b,_2c,_2d){
with(_2b){
return objj_msgSend(_2b,"member:",_2d)!==nil;
}
}),new objj_method(sel_getUid("filteredSetUsingPredicate:"),function(_2e,_2f,_30){
with(_2e){
var _31=[],_32,_33=objj_msgSend(_2e,"objectEnumerator");
while((_32=objj_msgSend(_33,"nextObject"))!==nil){
if(objj_msgSend(_30,"evaluateWithObject:",_32)){
_31.push(_32);
}
}
return objj_msgSend(objj_msgSend(objj_msgSend(_2e,"class"),"alloc"),"initWithArray:",_31);
}
}),new objj_method(sel_getUid("makeObjectsPerformSelector:"),function(_34,_35,_36){
with(_34){
objj_msgSend(_34,"makeObjectsPerformSelector:withObjects:",_36,nil);
}
}),new objj_method(sel_getUid("makeObjectsPerformSelector:withObject:"),function(_37,_38,_39,_3a){
with(_37){
objj_msgSend(_37,"makeObjectsPerformSelector:withObjects:",_39,[_3a]);
}
}),new objj_method(sel_getUid("makeObjectsPerformSelector:withObjects:"),function(_3b,_3c,_3d,_3e){
with(_3b){
var _3f,_40=objj_msgSend(_3b,"objectEnumerator"),_41=[nil,_3d].concat(_3e||[]);
while((_3f=objj_msgSend(_40,"nextObject"))!==nil){
_41[0]=_3f;
objj_msgSend.apply(this,_41);
}
}
}),new objj_method(sel_getUid("member:"),function(_42,_43,_44){
with(_42){
_CPRaiseInvalidAbstractInvocation(_42,_43);
}
}),new objj_method(sel_getUid("objectEnumerator"),function(_45,_46){
with(_45){
_CPRaiseInvalidAbstractInvocation(_45,_46);
}
}),new objj_method(sel_getUid("enumerateObjectsUsingBlock:"),function(_47,_48,_49){
with(_47){
var _4a,_4b=objj_msgSend(_47,"objectEnumerator");
while((_4a=objj_msgSend(_4b,"nextObject"))!==nil){
if(_49(_4a)){
break;
}
}
}
}),new objj_method(sel_getUid("objectsPassingTest:"),function(_4c,_4d,_4e){
with(_4c){
var _4f=[],_50=nil,_51=objj_msgSend(_4c,"objectEnumerator");
while((_50=objj_msgSend(_51,"nextObject"))!==nil){
if(_4e(_50)){
_4f.push(_50);
}
}
return objj_msgSend(objj_msgSend(objj_msgSend(_4c,"class"),"alloc"),"initWithArray:",_4f);
}
}),new objj_method(sel_getUid("isSubsetOfSet:"),function(_52,_53,_54){
with(_52){
var _55=nil,_56=objj_msgSend(_52,"objectEnumerator");
while((_55=objj_msgSend(_56,"nextObject"))!==nil){
if(!objj_msgSend(_54,"containsObject:",_55)){
return NO;
}
}
return YES;
}
}),new objj_method(sel_getUid("intersectsSet:"),function(_57,_58,_59){
with(_57){
if(_57===_59){
return objj_msgSend(_57,"count")>0;
}
var _5a=nil,_5b=objj_msgSend(_57,"objectEnumerator");
while((_5a=objj_msgSend(_5b,"nextObject"))!==nil){
if(objj_msgSend(_59,"containsObject:",_5a)){
return YES;
}
}
return NO;
}
}),new objj_method(sel_getUid("sortedArrayUsingDescriptors:"),function(_5c,_5d,_5e){
with(_5c){
return objj_msgSend(objj_msgSend(_5c,"allObjects"),"sortedArrayUsingDescriptors:",_5e);
}
}),new objj_method(sel_getUid("isEqualToSet:"),function(_5f,_60,_61){
with(_5f){
return objj_msgSend(_5f,"isEqual:",_61);
}
}),new objj_method(sel_getUid("isEqual:"),function(_62,_63,_64){
with(_62){
return _62===_64||objj_msgSend(_64,"isKindOfClass:",objj_msgSend(CPSet,"class"))&&(objj_msgSend(_62,"count")===objj_msgSend(_64,"count")&&objj_msgSend(_64,"isSubsetOfSet:",_62));
}
}),new objj_method(sel_getUid("description"),function(_65,_66){
with(_65){
var _67="{(\n",_68=objj_msgSend(_65,"allObjects"),_69=0,_6a=objj_msgSend(_68,"count");
for(;_69<_6a;++_69){
var _6b=_68[_69];
_67+="\t"+String(_6b).split("\n").join("\n\t")+"\n";
}
return _67+")}";
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("alloc"),function(_6c,_6d){
with(_6c){
if(_6c===objj_msgSend(CPSet,"class")||_6c===objj_msgSend(CPMutableSet,"class")){
return objj_msgSend(_CPPlaceholderSet,"alloc");
}
return objj_msgSendSuper({receiver:_6c,super_class:objj_getMetaClass("CPSet").super_class},"alloc");
}
}),new objj_method(sel_getUid("set"),function(_6e,_6f){
with(_6e){
return objj_msgSend(objj_msgSend(_6e,"alloc"),"init");
}
}),new objj_method(sel_getUid("setWithArray:"),function(_70,_71,_72){
with(_70){
return objj_msgSend(objj_msgSend(_70,"alloc"),"initWithArray:",_72);
}
}),new objj_method(sel_getUid("setWithObject:"),function(_73,_74,_75){
with(_73){
return objj_msgSend(objj_msgSend(_73,"alloc"),"initWithObjects:",_75);
}
}),new objj_method(sel_getUid("setWithObjects:count:"),function(_76,_77,_78,_79){
with(_76){
return objj_msgSend(objj_msgSend(_76,"alloc"),"initWithObjects:count:",_78,_79);
}
}),new objj_method(sel_getUid("setWithObjects:"),function(_7a,_7b,_7c){
with(_7a){
var _7d=Array.prototype.slice.apply(arguments);
_7d[0]=objj_msgSend(_7a,"alloc");
_7d[1]=sel_getUid("initWithObjects:");
return objj_msgSend.apply(this,_7d);
}
}),new objj_method(sel_getUid("setWithSet:"),function(_7e,_7f,set){
with(_7e){
return objj_msgSend(objj_msgSend(_7e,"alloc"),"initWithSet:",set);
}
})]);
var _1=objj_getClass("CPSet");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"CPSet\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("copy"),function(_80,_81){
with(_80){
return objj_msgSend(objj_msgSend(_80,"class"),"setWithSet:",_80);
}
}),new objj_method(sel_getUid("mutableCopy"),function(_82,_83){
with(_82){
return objj_msgSend(_82,"copy");
}
})]);
var _84="CPSetObjectsKey";
var _1=objj_getClass("CPSet");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"CPSet\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("initWithCoder:"),function(_85,_86,_87){
with(_85){
return objj_msgSend(_85,"initWithArray:",objj_msgSend(_87,"decodeObjectForKey:",_84));
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_88,_89,_8a){
with(_88){
objj_msgSend(_8a,"encodeObject:forKey:",objj_msgSend(_88,"allObjects"),_84);
}
})]);
var _1=objj_getClass("CPSet");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"CPSet\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("valueForKey:"),function(_8b,_8c,_8d){
with(_8b){
if(_8d==="@count"){
return objj_msgSend(_8b,"count");
}
var _8e=objj_msgSend(CPSet,"set"),_8f,_90=objj_msgSend(_8b,"objectEnumerator");
while((_8f=objj_msgSend(_90,"nextObject"))!==nil){
var _91=objj_msgSend(_8f,"valueForKey:",_8d);
objj_msgSend(_8e,"addObject:",_91);
}
return _8e;
}
}),new objj_method(sel_getUid("setValue:forKey:"),function(_92,_93,_94,_95){
with(_92){
var _96,_97=objj_msgSend(_92,"objectEnumerator");
while((_96=objj_msgSend(_97,"nextObject"))!==nil){
objj_msgSend(_96,"setValue:forKey:",_94,_95);
}
}
})]);
var _1a=nil;
var _1=objj_allocateClassPair(CPSet,"_CPPlaceholderSet"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_2,[new objj_method(sel_getUid("alloc"),function(_98,_99){
with(_98){
if(!_1a){
_1a=objj_msgSendSuper({receiver:_98,super_class:objj_getMetaClass("_CPPlaceholderSet").super_class},"alloc");
}
return _1a;
}
})]);
objj_executeFile("CPMutableSet.j",YES);
p;10;CPNumber.jt;6088;@STATIC;1.0;i;10;CPObject.ji;15;CPObjJRuntime.jt;6034;
objj_executeFile("CPObject.j",YES);
objj_executeFile("CPObjJRuntime.j",YES);
var _1=new CFMutableDictionary();
var _2=objj_allocateClassPair(CPObject,"CPNumber"),_3=_2.isa;
objj_registerClassPair(_2);
class_addMethods(_2,[new objj_method(sel_getUid("initWithBool:"),function(_4,_5,_6){
with(_4){
return _6;
}
}),new objj_method(sel_getUid("initWithChar:"),function(_7,_8,_9){
with(_7){
if(_9.charCodeAt){
return _9.charCodeAt(0);
}
return _9;
}
}),new objj_method(sel_getUid("initWithDouble:"),function(_a,_b,_c){
with(_a){
return _c;
}
}),new objj_method(sel_getUid("initWithFloat:"),function(_d,_e,_f){
with(_d){
return _f;
}
}),new objj_method(sel_getUid("initWithInt:"),function(_10,_11,_12){
with(_10){
return _12;
}
}),new objj_method(sel_getUid("initWithLong:"),function(_13,_14,_15){
with(_13){
return _15;
}
}),new objj_method(sel_getUid("initWithLongLong:"),function(_16,_17,_18){
with(_16){
return _18;
}
}),new objj_method(sel_getUid("initWithShort:"),function(_19,_1a,_1b){
with(_19){
return _1b;
}
}),new objj_method(sel_getUid("initWithUnsignedChar:"),function(_1c,_1d,_1e){
with(_1c){
if(_1e.charCodeAt){
return _1e.charCodeAt(0);
}
return _1e;
}
}),new objj_method(sel_getUid("initWithUnsignedInt:"),function(_1f,_20,_21){
with(_1f){
return _21;
}
}),new objj_method(sel_getUid("initWithUnsignedLong:"),function(_22,_23,_24){
with(_22){
return _24;
}
}),new objj_method(sel_getUid("initWithUnsignedShort:"),function(_25,_26,_27){
with(_25){
return _27;
}
}),new objj_method(sel_getUid("UID"),function(_28,_29){
with(_28){
var UID=_1.valueForKey(_28);
if(!UID){
UID=objj_generateObjectUID();
_1.setValueForKey(_28,UID);
}
return UID+"";
}
}),new objj_method(sel_getUid("boolValue"),function(_2a,_2b){
with(_2a){
return _2a?true:false;
}
}),new objj_method(sel_getUid("charValue"),function(_2c,_2d){
with(_2c){
return String.fromCharCode(_2c);
}
}),new objj_method(sel_getUid("decimalValue"),function(_2e,_2f){
with(_2e){
throw new Error("decimalValue: NOT YET IMPLEMENTED");
}
}),new objj_method(sel_getUid("descriptionWithLocale:"),function(_30,_31,_32){
with(_30){
if(!_32){
return toString();
}
throw new Error("descriptionWithLocale: NOT YET IMPLEMENTED");
}
}),new objj_method(sel_getUid("description"),function(_33,_34){
with(_33){
return objj_msgSend(_33,"descriptionWithLocale:",nil);
}
}),new objj_method(sel_getUid("doubleValue"),function(_35,_36){
with(_35){
if(typeof _35=="boolean"){
return _35?1:0;
}
return _35;
}
}),new objj_method(sel_getUid("floatValue"),function(_37,_38){
with(_37){
if(typeof _37=="boolean"){
return _37?1:0;
}
return _37;
}
}),new objj_method(sel_getUid("intValue"),function(_39,_3a){
with(_39){
if(typeof _39=="boolean"){
return _39?1:0;
}
return _39;
}
}),new objj_method(sel_getUid("longLongValue"),function(_3b,_3c){
with(_3b){
if(typeof _3b=="boolean"){
return _3b?1:0;
}
return _3b;
}
}),new objj_method(sel_getUid("longValue"),function(_3d,_3e){
with(_3d){
if(typeof _3d=="boolean"){
return _3d?1:0;
}
return _3d;
}
}),new objj_method(sel_getUid("shortValue"),function(_3f,_40){
with(_3f){
if(typeof _3f=="boolean"){
return _3f?1:0;
}
return _3f;
}
}),new objj_method(sel_getUid("stringValue"),function(_41,_42){
with(_41){
return toString();
}
}),new objj_method(sel_getUid("unsignedCharValue"),function(_43,_44){
with(_43){
return String.fromCharCode(_43);
}
}),new objj_method(sel_getUid("unsignedIntValue"),function(_45,_46){
with(_45){
if(typeof _45=="boolean"){
return _45?1:0;
}
return _45;
}
}),new objj_method(sel_getUid("unsignedLongValue"),function(_47,_48){
with(_47){
if(typeof _47=="boolean"){
return _47?1:0;
}
return _47;
}
}),new objj_method(sel_getUid("unsignedShortValue"),function(_49,_4a){
with(_49){
if(typeof _49=="boolean"){
return _49?1:0;
}
return _49;
}
}),new objj_method(sel_getUid("compare:"),function(_4b,_4c,_4d){
with(_4b){
if(_4b>_4d){
return CPOrderedDescending;
}else{
if(_4b<_4d){
return CPOrderedAscending;
}
}
return CPOrderedSame;
}
}),new objj_method(sel_getUid("isEqualToNumber:"),function(_4e,_4f,_50){
with(_4e){
return _4e==_50;
}
})]);
class_addMethods(_3,[new objj_method(sel_getUid("alloc"),function(_51,_52){
with(_51){
var _53=new Number();
_53.isa=objj_msgSend(_51,"class");
return _53;
}
}),new objj_method(sel_getUid("numberWithBool:"),function(_54,_55,_56){
with(_54){
return _56;
}
}),new objj_method(sel_getUid("numberWithChar:"),function(_57,_58,_59){
with(_57){
if(_59.charCodeAt){
return _59.charCodeAt(0);
}
return _59;
}
}),new objj_method(sel_getUid("numberWithDouble:"),function(_5a,_5b,_5c){
with(_5a){
return _5c;
}
}),new objj_method(sel_getUid("numberWithFloat:"),function(_5d,_5e,_5f){
with(_5d){
return _5f;
}
}),new objj_method(sel_getUid("numberWithInt:"),function(_60,_61,_62){
with(_60){
return _62;
}
}),new objj_method(sel_getUid("numberWithLong:"),function(_63,_64,_65){
with(_63){
return _65;
}
}),new objj_method(sel_getUid("numberWithLongLong:"),function(_66,_67,_68){
with(_66){
return _68;
}
}),new objj_method(sel_getUid("numberWithShort:"),function(_69,_6a,_6b){
with(_69){
return _6b;
}
}),new objj_method(sel_getUid("numberWithUnsignedChar:"),function(_6c,_6d,_6e){
with(_6c){
if(_6e.charCodeAt){
return _6e.charCodeAt(0);
}
return _6e;
}
}),new objj_method(sel_getUid("numberWithUnsignedInt:"),function(_6f,_70,_71){
with(_6f){
return _71;
}
}),new objj_method(sel_getUid("numberWithUnsignedLong:"),function(_72,_73,_74){
with(_72){
return _74;
}
}),new objj_method(sel_getUid("numberWithUnsignedShort:"),function(_75,_76,_77){
with(_75){
return _77;
}
})]);
var _2=objj_getClass("CPNumber");
if(!_2){
throw new SyntaxError("*** Could not find definition for class \"CPNumber\"");
}
var _3=_2.isa;
class_addMethods(_2,[new objj_method(sel_getUid("initWithCoder:"),function(_78,_79,_7a){
with(_78){
return objj_msgSend(_7a,"decodeNumber");
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_7b,_7c,_7d){
with(_7b){
objj_msgSend(_7d,"encodeNumber:forKey:",_7b,"self");
}
})]);
Number.prototype.isa=CPNumber;
Boolean.prototype.isa=CPNumber;
objj_msgSend(CPNumber,"initialize");
p;23;_CPConcreteMutableSet.jt;2097;@STATIC;1.0;i;14;CPMutableSet.jt;2059;
objj_executeFile("CPMutableSet.j",YES);
var _1=Object.prototype.hasOwnProperty;
var _2=objj_allocateClassPair(CPMutableSet,"_CPConcreteMutableSet"),_3=_2.isa;
class_addIvars(_2,[new objj_ivar("_contents"),new objj_ivar("_count")]);
objj_registerClassPair(_2);
class_addMethods(_2,[new objj_method(sel_getUid("initWithObjects:count:"),function(_4,_5,_6,_7){
with(_4){
_4=objj_msgSendSuper({receiver:_4,super_class:objj_getClass("_CPConcreteMutableSet").super_class},"initWithObjects:count:",_6,_7);
if(_4){
_count=0;
_contents={};
var _8=0,_9=MIN(objj_msgSend(_6,"count"),_7);
for(;_8<_9;++_8){
objj_msgSend(_4,"addObject:",_6[_8]);
}
}
return _4;
}
}),new objj_method(sel_getUid("count"),function(_a,_b){
with(_a){
return _count;
}
}),new objj_method(sel_getUid("member:"),function(_c,_d,_e){
with(_c){
var _f=objj_msgSend(_e,"UID");
if(!_1.call(_contents,_f)){
return nil;
}
var _10=_contents[_f];
if(_10===_e||objj_msgSend(_10,"isEqual:",_e)){
return _10;
}
return nil;
}
}),new objj_method(sel_getUid("allObjects"),function(_11,_12){
with(_11){
var _13=[],_14;
for(_14 in _contents){
if(_1.call(_contents,_14)){
_13.push(_contents[_14]);
}
}
return _13;
}
}),new objj_method(sel_getUid("objectEnumerator"),function(_15,_16){
with(_15){
return objj_msgSend(objj_msgSend(_15,"allObjects"),"objectEnumerator");
}
}),new objj_method(sel_getUid("addObject:"),function(_17,_18,_19){
with(_17){
if(_19===nil||_19===undefined){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,"attempt to insert nil or undefined");
}
if(objj_msgSend(_17,"containsObject:",_19)){
return;
}
_contents[objj_msgSend(_19,"UID")]=_19;
_count++;
}
}),new objj_method(sel_getUid("removeObject:"),function(_1a,_1b,_1c){
with(_1a){
if(!objj_msgSend(_1a,"containsObject:",_1c)){
return;
}
delete _contents[objj_msgSend(_1c,"UID")];
_count--;
}
}),new objj_method(sel_getUid("removeAllObjects"),function(_1d,_1e){
with(_1d){
_contents={};
_count=0;
}
}),new objj_method(sel_getUid("classForCoder"),function(_1f,_20){
with(_1f){
return objj_msgSend(CPSet,"class");
}
})]);
p;29;CPPropertyListSerialization.jt;1554;@STATIC;1.0;i;13;CPException.ji;10;CPObject.jt;1502;
objj_executeFile("CPException.j",YES);
objj_executeFile("CPObject.j",YES);
CPPropertyListUnknownFormat=0;
CPPropertyListOpenStepFormat=kCFPropertyListOpenStepFormat;
CPPropertyListXMLFormat_v1_0=kCFPropertyListXMLFormat_v1_0;
CPPropertyListBinaryFormat_v1_0=kCFPropertyListBinaryFormat_v1_0;
CPPropertyList280NorthFormat_v1_0=kCFPropertyList280NorthFormat_v1_0;
var _1=objj_allocateClassPair(CPObject,"CPPropertyListSerialization"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_2,[new objj_method(sel_getUid("dataFromPropertyList:format:"),function(_3,_4,_5,_6){
with(_3){
return CPPropertyListCreateData(_5,_6);
}
}),new objj_method(sel_getUid("propertyListFromData:format:"),function(_7,_8,_9,_a){
with(_7){
return CPPropertyListCreateFromData(_9,_a);
}
})]);
var _1=objj_getClass("CPPropertyListSerialization");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"CPPropertyListSerialization\"");
}
var _2=_1.isa;
class_addMethods(_2,[new objj_method(sel_getUid("dataFromPropertyList:format:errorDescription:"),function(_b,_c,_d,_e,_f){
with(_b){
_CPReportLenientDeprecation(_b,_c,sel_getUid("dataFromPropertyList:format:"));
return objj_msgSend(_b,"dataFromPropertyList:format:",_d,_e);
}
}),new objj_method(sel_getUid("propertyListFromData:format:errorDescription:"),function(_10,_11,_12,_13,_14){
with(_10){
_CPReportLenientDeprecation(_10,_11,sel_getUid("propertyListFromData:format:"));
return objj_msgSend(_10,"propertyListFromData:format:",_12,_13);
}
})]);
p;8;CPData.jt;4872;@STATIC;1.0;i;10;CPObject.ji;10;CPString.jt;4823;
objj_executeFile("CPObject.j",YES);
objj_executeFile("CPString.j",YES);
var _1=objj_allocateClassPair(CPObject,"CPData"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initWithRawString:"),function(_3,_4,_5){
with(_3){
_3=objj_msgSendSuper({receiver:_3,super_class:objj_getClass("CPData").super_class},"init");
if(_3){
objj_msgSend(_3,"setRawString:",_5);
}
return _3;
}
}),new objj_method(sel_getUid("initWithPlistObject:"),function(_6,_7,_8){
with(_6){
_6=objj_msgSendSuper({receiver:_6,super_class:objj_getClass("CPData").super_class},"init");
if(_6){
objj_msgSend(_6,"setPlistObject:",_8);
}
return _6;
}
}),new objj_method(sel_getUid("initWithPlistObject:format:"),function(_9,_a,_b,_c){
with(_9){
_9=objj_msgSendSuper({receiver:_9,super_class:objj_getClass("CPData").super_class},"init");
if(_9){
objj_msgSend(_9,"setPlistObject:format:",_b,_c);
}
return _9;
}
}),new objj_method(sel_getUid("initWithJSONObject:"),function(_d,_e,_f){
with(_d){
_d=objj_msgSendSuper({receiver:_d,super_class:objj_getClass("CPData").super_class},"init");
if(_d){
objj_msgSend(_d,"setJSONObject:",_f);
}
return _d;
}
}),new objj_method(sel_getUid("rawString"),function(_10,_11){
with(_10){
return _10.rawString();
}
}),new objj_method(sel_getUid("plistObject"),function(_12,_13){
with(_12){
return _12.propertyList();
}
}),new objj_method(sel_getUid("JSONObject"),function(_14,_15){
with(_14){
return _14.JSONObject();
}
}),new objj_method(sel_getUid("bytes"),function(_16,_17){
with(_16){
return _16.bytes();
}
}),new objj_method(sel_getUid("base64"),function(_18,_19){
with(_18){
return _18.base64();
}
}),new objj_method(sel_getUid("length"),function(_1a,_1b){
with(_1a){
return objj_msgSend(objj_msgSend(_1a,"rawString"),"length");
}
}),new objj_method(sel_getUid("description"),function(_1c,_1d){
with(_1c){
return _1c.toString();
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("alloc"),function(_1e,_1f){
with(_1e){
var _20=new CFMutableData();
_20.isa=objj_msgSend(_1e,"class");
return _20;
}
}),new objj_method(sel_getUid("data"),function(_21,_22){
with(_21){
return objj_msgSend(objj_msgSend(_21,"alloc"),"init");
}
}),new objj_method(sel_getUid("dataWithRawString:"),function(_23,_24,_25){
with(_23){
return objj_msgSend(objj_msgSend(_23,"alloc"),"initWithRawString:",_25);
}
}),new objj_method(sel_getUid("dataWithPlistObject:"),function(_26,_27,_28){
with(_26){
return objj_msgSend(objj_msgSend(_26,"alloc"),"initWithPlistObject:",_28);
}
}),new objj_method(sel_getUid("dataWithPlistObject:format:"),function(_29,_2a,_2b,_2c){
with(_29){
return objj_msgSend(objj_msgSend(_29,"alloc"),"initWithPlistObject:format:",_2b,_2c);
}
}),new objj_method(sel_getUid("dataWithJSONObject:"),function(_2d,_2e,_2f){
with(_2d){
return objj_msgSend(objj_msgSend(_2d,"alloc"),"initWithJSONObject:",_2f);
}
}),new objj_method(sel_getUid("dataWithBytes:"),function(_30,_31,_32){
with(_30){
var _33=objj_msgSend(objj_msgSend(_30,"alloc"),"init");
_33.setBytes(_32);
return _33;
}
}),new objj_method(sel_getUid("dataWithBase64:"),function(_34,_35,_36){
with(_34){
var _37=objj_msgSend(objj_msgSend(_34,"alloc"),"init");
_37.setBase64String(_36);
return _37;
}
})]);
var _1=objj_getClass("CPData");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"CPData\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("setRawString:"),function(_38,_39,_3a){
with(_38){
_38.setRawString(_3a);
}
}),new objj_method(sel_getUid("setPlistObject:"),function(_3b,_3c,_3d){
with(_3b){
_3b.setPropertyList(_3d);
}
}),new objj_method(sel_getUid("setPlistObject:format:"),function(_3e,_3f,_40,_41){
with(_3e){
_3e.setPropertyList(_40,_41);
}
}),new objj_method(sel_getUid("setJSONObject:"),function(_42,_43,_44){
with(_42){
_42.setJSONObject(_44);
}
})]);
var _1=objj_getClass("CPData");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"CPData\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("initWithString:"),function(_45,_46,_47){
with(_45){
_CPReportLenientDeprecation(_45,_46,sel_getUid("initWithRawString:"));
return objj_msgSend(_45,"initWithRawString:",_47);
}
}),new objj_method(sel_getUid("setString:"),function(_48,_49,_4a){
with(_48){
_CPReportLenientDeprecation(_48,_49,sel_getUid("setRawString:"));
objj_msgSend(_48,"setRawString:",_4a);
}
}),new objj_method(sel_getUid("string"),function(_4b,_4c){
with(_4b){
_CPReportLenientDeprecation(_4b,_4c,sel_getUid("rawString"));
return objj_msgSend(_4b,"rawString");
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("dataWithString:"),function(_4d,_4e,_4f){
with(_4d){
_CPReportLenientDeprecation(_4d,_4e,sel_getUid("dataWithRawString:"));
return objj_msgSend(_4d,"dataWithRawString:",_4f);
}
})]);
CFData.prototype.isa=CPData;
CFMutableData.prototype.isa=CPData;
p;14;CPCountedSet.jt;1347;@STATIC;1.0;i;10;CPObject.ji;7;CPSet.jt;1302;
objj_executeFile("CPObject.j",YES);
objj_executeFile("CPSet.j",YES);
var _1=objj_allocateClassPair(_CPConcreteMutableSet,"CPCountedSet"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_counts")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("addObject:"),function(_3,_4,_5){
with(_3){
if(!_counts){
_counts={};
}
objj_msgSendSuper({receiver:_3,super_class:objj_getClass("CPCountedSet").super_class},"addObject:",_5);
var _6=objj_msgSend(_5,"UID");
if(_counts[_6]===undefined){
_counts[_6]=1;
}else{
++_counts[_6];
}
}
}),new objj_method(sel_getUid("removeObject:"),function(_7,_8,_9){
with(_7){
if(!_counts){
return;
}
var _a=objj_msgSend(_9,"UID");
if(_counts[_a]===undefined){
return;
}else{
--_counts[_a];
if(_counts[_a]===0){
delete _counts[_a];
objj_msgSendSuper({receiver:_7,super_class:objj_getClass("CPCountedSet").super_class},"removeObject:",_9);
}
}
}
}),new objj_method(sel_getUid("removeAllObjects"),function(_b,_c){
with(_b){
objj_msgSendSuper({receiver:_b,super_class:objj_getClass("CPCountedSet").super_class},"removeAllObjects");
_counts={};
}
}),new objj_method(sel_getUid("countForObject:"),function(_d,_e,_f){
with(_d){
if(!_counts){
_counts={};
}
var UID=objj_msgSend(_f,"UID");
if(_counts[UID]===undefined){
return 0;
}
return _counts[UID];
}
})]);
p;15;CPUndoManager.jt;17658;@STATIC;1.0;i;9;CPArray.ji;13;CPException.ji;14;CPInvocation.ji;22;CPNotificationCenter.ji;10;CPObject.ji;9;CPProxy.ji;21;CPKeyValueObserving.ji;11;CPRunLoop.jt;17491;
objj_executeFile("CPArray.j",YES);
objj_executeFile("CPException.j",YES);
objj_executeFile("CPInvocation.j",YES);
objj_executeFile("CPNotificationCenter.j",YES);
objj_executeFile("CPObject.j",YES);
objj_executeFile("CPProxy.j",YES);
objj_executeFile("CPKeyValueObserving.j",YES);
objj_executeFile("CPRunLoop.j",YES);
var _1=0,_2=1,_3=2;
CPUndoManagerCheckpointNotification="CPUndoManagerCheckpointNotification";
CPUndoManagerDidOpenUndoGroupNotification="CPUndoManagerDidOpenUndoGroupNotification";
CPUndoManagerDidRedoChangeNotification="CPUndoManagerDidRedoChangeNotification";
CPUndoManagerDidUndoChangeNotification="CPUndoManagerDidUndoChangeNotification";
CPUndoManagerWillCloseUndoGroupNotification="CPUndoManagerWillCloseUndoGroupNotification";
CPUndoManagerWillRedoChangeNotification="CPUndoManagerWillRedoChangeNotification";
CPUndoManagerWillUndoChangeNotification="CPUndoManagerWillUndoChangeNotification";
CPUndoCloseGroupingRunLoopOrdering=350000;
var _4=[],_5=5;
var _6=objj_allocateClassPair(CPObject,"_CPUndoGrouping"),_7=_6.isa;
class_addIvars(_6,[new objj_ivar("_parent"),new objj_ivar("_invocations"),new objj_ivar("_actionName")]);
objj_registerClassPair(_6);
class_addMethods(_6,[new objj_method(sel_getUid("initWithParent:"),function(_8,_9,_a){
with(_8){
_8=objj_msgSendSuper({receiver:_8,super_class:objj_getClass("_CPUndoGrouping").super_class},"init");
if(_8){
_parent=_a;
_invocations=[];
_actionName="";
}
return _8;
}
}),new objj_method(sel_getUid("parent"),function(_b,_c){
with(_b){
return _parent;
}
}),new objj_method(sel_getUid("addInvocation:"),function(_d,_e,_f){
with(_d){
_invocations.push(_f);
}
}),new objj_method(sel_getUid("addInvocationsFromArray:"),function(_10,_11,_12){
with(_10){
objj_msgSend(_invocations,"addObjectsFromArray:",_12);
}
}),new objj_method(sel_getUid("removeInvocationsWithTarget:"),function(_13,_14,_15){
with(_13){
var _16=_invocations.length;
while(_16--){
if(objj_msgSend(_invocations[_16],"target")==_15){
_invocations.splice(_16,1);
}
}
}
}),new objj_method(sel_getUid("invocations"),function(_17,_18){
with(_17){
return _invocations;
}
}),new objj_method(sel_getUid("invoke"),function(_19,_1a){
with(_19){
var _1b=_invocations.length;
while(_1b--){
objj_msgSend(_invocations[_1b],"invoke");
}
}
}),new objj_method(sel_getUid("setActionName:"),function(_1c,_1d,_1e){
with(_1c){
_actionName=_1e;
}
}),new objj_method(sel_getUid("actionName"),function(_1f,_20){
with(_1f){
return _actionName;
}
})]);
class_addMethods(_7,[new objj_method(sel_getUid("_poolUndoGrouping:"),function(_21,_22,_23){
with(_21){
if(!_23||_4.length>=_5){
return;
}
_4.push(_23);
}
}),new objj_method(sel_getUid("undoGroupingWithParent:"),function(_24,_25,_26){
with(_24){
if(_4.length){
var _27=_4.pop();
_27._parent=_26;
if(_27._invocations.length){
_27._invocations=[];
}
return _27;
}
return objj_msgSend(objj_msgSend(_24,"alloc"),"initWithParent:",_26);
}
})]);
var _28="_CPUndoGroupingParentKey",_29="_CPUndoGroupingInvocationsKey",_2a="_CPUndoGroupingActionNameKey";
var _6=objj_getClass("_CPUndoGrouping");
if(!_6){
throw new SyntaxError("*** Could not find definition for class \"_CPUndoGrouping\"");
}
var _7=_6.isa;
class_addMethods(_6,[new objj_method(sel_getUid("initWithCoder:"),function(_2b,_2c,_2d){
with(_2b){
_2b=objj_msgSendSuper({receiver:_2b,super_class:objj_getClass("_CPUndoGrouping").super_class},"init");
if(_2b){
_parent=objj_msgSend(_2d,"decodeObjectForKey:",_28);
_invocations=objj_msgSend(_2d,"decodeObjectForKey:",_29);
_actionName=objj_msgSend(_2d,"decodeObjectForKey:",_2a);
}
return _2b;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_2e,_2f,_30){
with(_2e){
objj_msgSend(_30,"encodeObject:forKey:",_parent,_28);
objj_msgSend(_30,"encodeObject:forKey:",_invocations,_29);
objj_msgSend(_30,"encodeObject:forKey:",_actionName,_2a);
}
})]);
var _6=objj_allocateClassPair(CPObject,"CPUndoManager"),_7=_6.isa;
class_addIvars(_6,[new objj_ivar("_redoStack"),new objj_ivar("_undoStack"),new objj_ivar("_groupsByEvent"),new objj_ivar("_disableCount"),new objj_ivar("_levelsOfUndo"),new objj_ivar("_currentGrouping"),new objj_ivar("_state"),new objj_ivar("_preparedTarget"),new objj_ivar("_undoManagerProxy"),new objj_ivar("_runLoopModes"),new objj_ivar("_registeredWithRunLoop")]);
objj_registerClassPair(_6);
class_addMethods(_6,[new objj_method(sel_getUid("init"),function(_31,_32){
with(_31){
_31=objj_msgSendSuper({receiver:_31,super_class:objj_getClass("CPUndoManager").super_class},"init");
if(_31){
_redoStack=[];
_undoStack=[];
_state=_1;
objj_msgSend(_31,"setRunLoopModes:",[CPDefaultRunLoopMode]);
objj_msgSend(_31,"setGroupsByEvent:",YES);
_undoManagerProxy=objj_msgSend(_CPUndoManagerProxy,"alloc");
_undoManagerProxy._undoManager=_31;
}
return _31;
}
}),new objj_method(sel_getUid("_addUndoInvocation:"),function(_33,_34,_35){
with(_33){
if(!_currentGrouping){
if(objj_msgSend(_33,"groupsByEvent")){
objj_msgSend(_33,"_beginUndoGroupingForEvent");
}else{
objj_msgSend(CPException,"raise:reason:",CPInternalInconsistencyException,"No undo group is currently open");
}
}
objj_msgSend(_currentGrouping,"addInvocation:",_35);
if(_state===_1){
objj_msgSend(_redoStack,"removeAllObjects");
}
}
}),new objj_method(sel_getUid("registerUndoWithTarget:selector:object:"),function(_36,_37,_38,_39,_3a){
with(_36){
if(_disableCount>0){
return;
}
var _3b=objj_msgSend(CPInvocation,"invocationWithMethodSignature:",nil);
objj_msgSend(_3b,"setTarget:",_38);
objj_msgSend(_3b,"setSelector:",_39);
objj_msgSend(_3b,"setArgument:atIndex:",_3a,2);
objj_msgSend(_36,"_addUndoInvocation:",_3b);
}
}),new objj_method(sel_getUid("prepareWithInvocationTarget:"),function(_3c,_3d,_3e){
with(_3c){
_preparedTarget=_3e;
return _undoManagerProxy;
}
}),new objj_method(sel_getUid("_methodSignatureOfPreparedTargetForSelector:"),function(_3f,_40,_41){
with(_3f){
if(objj_msgSend(_preparedTarget,"respondsToSelector:",_41)){
return 1;
}
return nil;
}
}),new objj_method(sel_getUid("_forwardInvocationToPreparedTarget:"),function(_42,_43,_44){
with(_42){
if(_disableCount>0){
return;
}
objj_msgSend(_44,"setTarget:",_preparedTarget);
objj_msgSend(_42,"_addUndoInvocation:",_44);
_preparedTarget=nil;
}
}),new objj_method(sel_getUid("canRedo"),function(_45,_46){
with(_45){
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:",CPUndoManagerCheckpointNotification,_45);
return objj_msgSend(_redoStack,"count")>0;
}
}),new objj_method(sel_getUid("canUndo"),function(_47,_48){
with(_47){
if(_undoStack.length>0){
return YES;
}
return objj_msgSend(objj_msgSend(_currentGrouping,"invocations"),"count")>0;
}
}),new objj_method(sel_getUid("undo"),function(_49,_4a){
with(_49){
if(objj_msgSend(_49,"groupingLevel")===1){
objj_msgSend(_49,"endUndoGrouping");
}
objj_msgSend(_49,"undoNestedGroup");
}
}),new objj_method(sel_getUid("undoNestedGroup"),function(_4b,_4c){
with(_4b){
if(objj_msgSend(_undoStack,"count")<=0){
return;
}
var _4d=objj_msgSend(CPNotificationCenter,"defaultCenter");
objj_msgSend(_4d,"postNotificationName:object:",CPUndoManagerCheckpointNotification,_4b);
objj_msgSend(_4d,"postNotificationName:object:",CPUndoManagerWillUndoChangeNotification,_4b);
var _4e=_undoStack.pop(),_4f=objj_msgSend(_4e,"actionName");
_state=_2;
objj_msgSend(_4b,"_beginUndoGrouping");
objj_msgSend(_4e,"invoke");
objj_msgSend(_4b,"endUndoGrouping");
objj_msgSend(_CPUndoGrouping,"_poolUndoGrouping:",_4e);
_state=_1;
objj_msgSend(objj_msgSend(_redoStack,"lastObject"),"setActionName:",_4f);
objj_msgSend(_4d,"postNotificationName:object:",CPUndoManagerDidUndoChangeNotification,_4b);
}
}),new objj_method(sel_getUid("redo"),function(_50,_51){
with(_50){
if(objj_msgSend(_redoStack,"count")<=0){
return;
}
var _52=objj_msgSend(CPNotificationCenter,"defaultCenter");
objj_msgSend(_52,"postNotificationName:object:",CPUndoManagerCheckpointNotification,_50);
objj_msgSend(_52,"postNotificationName:object:",CPUndoManagerWillRedoChangeNotification,_50);
var _53=_currentGrouping,_54=_redoStack.pop(),_55=objj_msgSend(_54,"actionName");
_currentGrouping=nil;
_state=_3;
objj_msgSend(_50,"_beginUndoGrouping");
objj_msgSend(_54,"invoke");
objj_msgSend(_50,"endUndoGrouping");
objj_msgSend(_CPUndoGrouping,"_poolUndoGrouping:",_54);
_currentGrouping=_53;
_state=_1;
objj_msgSend(objj_msgSend(_undoStack,"lastObject"),"setActionName:",_55);
objj_msgSend(_52,"postNotificationName:object:",CPUndoManagerDidRedoChangeNotification,_50);
}
}),new objj_method(sel_getUid("beginUndoGrouping"),function(_56,_57){
with(_56){
if(!_currentGrouping&&objj_msgSend(_56,"groupsByEvent")){
objj_msgSend(_56,"_beginUndoGroupingForEvent");
}
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:",CPUndoManagerCheckpointNotification,_56);
objj_msgSend(_56,"_beginUndoGrouping");
}
}),new objj_method(sel_getUid("_beginUndoGroupingForEvent"),function(_58,_59){
with(_58){
objj_msgSend(_58,"_beginUndoGrouping");
objj_msgSend(_58,"_registerWithRunLoop");
}
}),new objj_method(sel_getUid("_beginUndoGrouping"),function(_5a,_5b){
with(_5a){
_currentGrouping=objj_msgSend(_CPUndoGrouping,"undoGroupingWithParent:",_currentGrouping);
}
}),new objj_method(sel_getUid("endUndoGrouping"),function(_5c,_5d){
with(_5c){
if(!_currentGrouping){
objj_msgSend(CPException,"raise:reason:",CPInternalInconsistencyException,"endUndoGrouping. No undo group is currently open.");
}
var _5e=objj_msgSend(CPNotificationCenter,"defaultCenter");
objj_msgSend(_5e,"postNotificationName:object:",CPUndoManagerCheckpointNotification,_5c);
var _5f=objj_msgSend(_currentGrouping,"parent");
if(!_5f&&objj_msgSend(_currentGrouping,"invocations").length>0){
objj_msgSend(_5e,"postNotificationName:object:",CPUndoManagerWillCloseUndoGroupNotification,_5c);
var _60=_state===_2?_redoStack:_undoStack;
_60.push(_currentGrouping);
if(_levelsOfUndo>0&&_60.length>_levelsOfUndo){
_60.splice(0,1);
}
}else{
objj_msgSend(_5f,"addInvocationsFromArray:",objj_msgSend(_currentGrouping,"invocations"));
objj_msgSend(_CPUndoGrouping,"_poolUndoGrouping:",_currentGrouping);
}
_currentGrouping=_5f;
}
}),new objj_method(sel_getUid("enableUndoRegistration"),function(_61,_62){
with(_61){
if(_disableCount<=0){
objj_msgSend(CPException,"raise:reason:",CPInternalInconsistencyException,"enableUndoRegistration. There are no disable messages in effect right now.");
}
_disableCount--;
}
}),new objj_method(sel_getUid("groupsByEvent"),function(_63,_64){
with(_63){
return _groupsByEvent;
}
}),new objj_method(sel_getUid("setGroupsByEvent:"),function(_65,_66,_67){
with(_65){
_67=!!_67;
if(_groupsByEvent===_67){
return;
}
_groupsByEvent=_67;
if(!objj_msgSend(_65,"groupsByEvent")){
objj_msgSend(_65,"_unregisterWithRunLoop");
}
}
}),new objj_method(sel_getUid("groupingLevel"),function(_68,_69){
with(_68){
var _6a=_currentGrouping,_6b=_currentGrouping?1:0;
while(_6a=objj_msgSend(_6a,"parent")){
++_6b;
}
return _6b;
}
}),new objj_method(sel_getUid("disableUndoRegistration"),function(_6c,_6d){
with(_6c){
++_disableCount;
}
}),new objj_method(sel_getUid("isUndoRegistrationEnabled"),function(_6e,_6f){
with(_6e){
return _disableCount==0;
}
}),new objj_method(sel_getUid("isUndoing"),function(_70,_71){
with(_70){
return _state===_2;
}
}),new objj_method(sel_getUid("isRedoing"),function(_72,_73){
with(_72){
return _state===_3;
}
}),new objj_method(sel_getUid("removeAllActions"),function(_74,_75){
with(_74){
while(_currentGrouping){
objj_msgSend(_74,"endUndoGrouping");
}
objj_msgSend(_74,"_unregisterWithRunLoop");
_state=_1;
_redoStack=[];
_undoStack=[];
_disableCount=0;
}
}),new objj_method(sel_getUid("removeAllActionsWithTarget:"),function(_76,_77,_78){
with(_76){
objj_msgSend(_currentGrouping,"removeInvocationsWithTarget:",_78);
var _79=_redoStack.length;
while(_79--){
var _7a=_redoStack[_79];
objj_msgSend(_7a,"removeInvocationsWithTarget:",_78);
if(!objj_msgSend(_7a,"invocations").length){
_redoStack.splice(_79,1);
}
}
_79=_undoStack.length;
while(_79--){
var _7a=_undoStack[_79];
objj_msgSend(_7a,"removeInvocationsWithTarget:",_78);
if(!objj_msgSend(_7a,"invocations").length){
_undoStack.splice(_79,1);
}
}
}
}),new objj_method(sel_getUid("setActionName:"),function(_7b,_7c,_7d){
with(_7b){
if(_7d!==nil&&_currentGrouping){
objj_msgSend(_currentGrouping,"setActionName:",_7d);
}
}
}),new objj_method(sel_getUid("redoActionName"),function(_7e,_7f){
with(_7e){
if(!objj_msgSend(_7e,"canRedo")){
return nil;
}
return objj_msgSend(objj_msgSend(_redoStack,"lastObject"),"actionName");
}
}),new objj_method(sel_getUid("redoMenuItemTitle"),function(_80,_81){
with(_80){
return objj_msgSend(_80,"redoMenuTitleForUndoActionName:",objj_msgSend(_80,"redoActionName"));
}
}),new objj_method(sel_getUid("redoMenuTitleForUndoActionName:"),function(_82,_83,_84){
with(_82){
if(_84||_84===0){
return "Redo "+_84;
}
return "Redo";
}
}),new objj_method(sel_getUid("undoActionName"),function(_85,_86){
with(_85){
if(!objj_msgSend(_85,"canUndo")){
return nil;
}
return objj_msgSend(objj_msgSend(_undoStack,"lastObject"),"actionName");
}
}),new objj_method(sel_getUid("undoMenuItemTitle"),function(_87,_88){
with(_87){
return objj_msgSend(_87,"undoMenuTitleForUndoActionName:",objj_msgSend(_87,"undoActionName"));
}
}),new objj_method(sel_getUid("undoMenuTitleForUndoActionName:"),function(_89,_8a,_8b){
with(_89){
if(_8b||_8b===0){
return "Undo "+_8b;
}
return "Undo";
}
}),new objj_method(sel_getUid("runLoopModes"),function(_8c,_8d){
with(_8c){
return _runLoopModes;
}
}),new objj_method(sel_getUid("setRunLoopModes:"),function(_8e,_8f,_90){
with(_8e){
_runLoopModes=objj_msgSend(_90,"copy");
if(_registeredWithRunLoop){
objj_msgSend(_8e,"_unregisterWithRunLoop");
objj_msgSend(_8e,"_registerWithRunLoop");
}
}
}),new objj_method(sel_getUid("_runLoopEndUndoGrouping"),function(_91,_92){
with(_91){
objj_msgSend(_91,"endUndoGrouping");
_registeredWithRunLoop=NO;
}
}),new objj_method(sel_getUid("_registerWithRunLoop"),function(_93,_94){
with(_93){
if(_registeredWithRunLoop){
return;
}
_registeredWithRunLoop=YES;
objj_msgSend(objj_msgSend(CPRunLoop,"currentRunLoop"),"performSelector:target:argument:order:modes:",sel_getUid("_runLoopEndUndoGrouping"),_93,nil,CPUndoCloseGroupingRunLoopOrdering,_runLoopModes);
}
}),new objj_method(sel_getUid("_unregisterWithRunLoop"),function(_95,_96){
with(_95){
if(!_registeredWithRunLoop){
return;
}
_registeredWithRunLoop=NO;
objj_msgSend(objj_msgSend(CPRunLoop,"currentRunLoop"),"cancelPerformSelector:target:argument:",sel_getUid("_runLoopEndUndoGrouping"),_95,nil);
}
}),new objj_method(sel_getUid("observeChangesForKeyPath:ofObject:"),function(_97,_98,_99,_9a){
with(_97){
objj_msgSend(_9a,"addObserver:forKeyPath:options:context:",_97,_99,CPKeyValueObservingOptionOld|CPKeyValueObservingOptionNew,NULL);
}
}),new objj_method(sel_getUid("stopObservingChangesForKeyPath:ofObject:"),function(_9b,_9c,_9d,_9e){
with(_9b){
objj_msgSend(_9e,"removeObserver:forKeyPath:",_9b,_9d);
}
}),new objj_method(sel_getUid("observeValueForKeyPath:ofObject:change:context:"),function(_9f,_a0,_a1,_a2,_a3,_a4){
with(_9f){
var _a5=objj_msgSend(_a3,"valueForKey:",CPKeyValueChangeOldKey),_a6=objj_msgSend(_a3,"valueForKey:",CPKeyValueChangeNewKey);
if(_a5===_a6||(_a5!==nil&&_a5.isa&&(_a6===nil||_a6.isa)&&objj_msgSend(_a5,"isEqual:",_a6))){
return;
}
objj_msgSend(objj_msgSend(_9f,"prepareWithInvocationTarget:",_a2),"applyChange:toKeyPath:",objj_msgSend(_a3,"inverseChangeDictionary"),_a1);
}
})]);
var _a7="CPUndoManagerRedoStackKey",_a8="CPUndoManagerUndoStackKey",_a9="CPUndoManagerLevelsOfUndoKey",_aa="CPUndoManagerActionNameKey",_ab="CPUndoManagerCurrentGroupingKey",_ac="CPUndoManagerRunLoopModesKey",_ad="CPUndoManagerGroupsByEventKey";
var _6=objj_getClass("CPUndoManager");
if(!_6){
throw new SyntaxError("*** Could not find definition for class \"CPUndoManager\"");
}
var _7=_6.isa;
class_addMethods(_6,[new objj_method(sel_getUid("initWithCoder:"),function(_ae,_af,_b0){
with(_ae){
_ae=objj_msgSendSuper({receiver:_ae,super_class:objj_getClass("CPUndoManager").super_class},"init");
if(_ae){
_redoStack=objj_msgSend(_b0,"decodeObjectForKey:",_a7);
_undoStack=objj_msgSend(_b0,"decodeObjectForKey:",_a8);
_levelsOfUndo=objj_msgSend(_b0,"decodeObjectForKey:",_a9);
_actionName=objj_msgSend(_b0,"decodeObjectForKey:",_aa);
_currentGrouping=objj_msgSend(_b0,"decodeObjectForKey:",_ab);
_state=_1;
objj_msgSend(_ae,"setRunLoopModes:",objj_msgSend(_b0,"decodeObjectForKey:",_ac));
objj_msgSend(_ae,"setGroupsByEvent:",objj_msgSend(_b0,"decodeBoolForKey:",_ad));
}
return _ae;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_b1,_b2,_b3){
with(_b1){
objj_msgSend(_b3,"encodeObject:forKey:",_redoStack,_a7);
objj_msgSend(_b3,"encodeObject:forKey:",_undoStack,_a8);
objj_msgSend(_b3,"encodeInt:forKey:",_levelsOfUndo,_a9);
objj_msgSend(_b3,"encodeObject:forKey:",_actionName,_aa);
objj_msgSend(_b3,"encodeObject:forKey:",_currentGrouping,_ab);
objj_msgSend(_b3,"encodeObject:forKey:",_runLoopModes,_ac);
objj_msgSend(_b3,"encodeBool:forKey:",_groupsByEvent,_ad);
}
})]);
var _6=objj_allocateClassPair(CPProxy,"_CPUndoManagerProxy"),_7=_6.isa;
class_addIvars(_6,[new objj_ivar("_undoManager")]);
objj_registerClassPair(_6);
class_addMethods(_6,[new objj_method(sel_getUid("methodSignatureForSelector:"),function(_b4,_b5,_b6){
with(_b4){
return objj_msgSend(_undoManager,"_methodSignatureOfPreparedTargetForSelector:",_b6);
}
}),new objj_method(sel_getUid("forwardInvocation:"),function(_b7,_b8,_b9){
with(_b7){
objj_msgSend(_undoManager,"_forwardInvocationToPreparedTarget:",_b9);
}
})]);
p;14;CPInvocation.jt;2602;@STATIC;1.0;i;10;CPObject.jt;2568;
objj_executeFile("CPObject.j",YES);
var _1=objj_allocateClassPair(CPObject,"CPInvocation"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_returnValue"),new objj_ivar("_arguments"),new objj_ivar("_methodSignature")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initWithMethodSignature:"),function(_3,_4,_5){
with(_3){
_3=objj_msgSendSuper({receiver:_3,super_class:objj_getClass("CPInvocation").super_class},"init");
if(_3){
_arguments=[];
_methodSignature=_5;
}
return _3;
}
}),new objj_method(sel_getUid("setSelector:"),function(_6,_7,_8){
with(_6){
_arguments[1]=_8;
}
}),new objj_method(sel_getUid("selector"),function(_9,_a){
with(_9){
return _arguments[1];
}
}),new objj_method(sel_getUid("setTarget:"),function(_b,_c,_d){
with(_b){
_arguments[0]=_d;
}
}),new objj_method(sel_getUid("target"),function(_e,_f){
with(_e){
return _arguments[0];
}
}),new objj_method(sel_getUid("setArgument:atIndex:"),function(_10,_11,_12,_13){
with(_10){
_arguments[_13]=_12;
}
}),new objj_method(sel_getUid("argumentAtIndex:"),function(_14,_15,_16){
with(_14){
return _arguments[_16];
}
}),new objj_method(sel_getUid("setReturnValue:"),function(_17,_18,_19){
with(_17){
_returnValue=_19;
}
}),new objj_method(sel_getUid("returnValue"),function(_1a,_1b){
with(_1a){
return _returnValue;
}
}),new objj_method(sel_getUid("invoke"),function(_1c,_1d){
with(_1c){
_returnValue=objj_msgSend.apply(objj_msgSend,_arguments);
}
}),new objj_method(sel_getUid("invokeWithTarget:"),function(_1e,_1f,_20){
with(_1e){
_arguments[0]=_20;
_returnValue=objj_msgSend.apply(objj_msgSend,_arguments);
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("invocationWithMethodSignature:"),function(_21,_22,_23){
with(_21){
return objj_msgSend(objj_msgSend(_21,"alloc"),"initWithMethodSignature:",_23);
}
})]);
var _24="CPInvocationArguments",_25="CPInvocationReturnValue";
var _1=objj_getClass("CPInvocation");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"CPInvocation\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("initWithCoder:"),function(_26,_27,_28){
with(_26){
_26=objj_msgSendSuper({receiver:_26,super_class:objj_getClass("CPInvocation").super_class},"init");
if(_26){
_returnValue=objj_msgSend(_28,"decodeObjectForKey:",_25);
_arguments=objj_msgSend(_28,"decodeObjectForKey:",_24);
}
return _26;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_29,_2a,_2b){
with(_29){
objj_msgSend(_2b,"encodeObject:forKey:",_returnValue,_25);
objj_msgSend(_2b,"encodeObject:forKey:",_arguments,_24);
}
})]);
p;9;CPProxy.jt;3618;@STATIC;1.0;i;13;CPException.ji;14;CPInvocation.ji;10;CPObject.ji;10;CPString.jt;3532;
objj_executeFile("CPException.j",YES);
objj_executeFile("CPInvocation.j",YES);
objj_executeFile("CPObject.j",YES);
objj_executeFile("CPString.j",YES);
var _1=objj_allocateClassPair(Nil,"CPProxy"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("methodSignatureForSelector:"),function(_3,_4,_5){
with(_3){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,"-methodSignatureForSelector: called on abstract CPProxy class.");
}
}),new objj_method(sel_getUid("forwardInvocation:"),function(_6,_7,_8){
with(_6){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,"-forwardInvocation: called on abstract CPProxy class.");
}
}),new objj_method(sel_getUid("forward::"),function(_9,_a,_b,_c){
with(_9){
return objj_msgSend(CPObject,"methodForSelector:",_a)(_9,_a,_b,_c);
}
}),new objj_method(sel_getUid("hash"),function(_d,_e){
with(_d){
return objj_msgSend(_d,"UID");
}
}),new objj_method(sel_getUid("UID"),function(_f,_10){
with(_f){
if(typeof _f._UID==="undefined"){
_f._UID=objj_generateObjectUID();
}
return _UID;
}
}),new objj_method(sel_getUid("isEqual:"),function(_11,_12,_13){
with(_11){
return _11===object;
}
}),new objj_method(sel_getUid("self"),function(_14,_15){
with(_14){
return _14;
}
}),new objj_method(sel_getUid("class"),function(_16,_17){
with(_16){
return isa;
}
}),new objj_method(sel_getUid("superclass"),function(_18,_19){
with(_18){
return class_getSuperclass(isa);
}
}),new objj_method(sel_getUid("performSelector:"),function(_1a,_1b,_1c){
with(_1a){
return objj_msgSend(_1a,_1c);
}
}),new objj_method(sel_getUid("performSelector:withObject:"),function(_1d,_1e,_1f,_20){
with(_1d){
return objj_msgSend(_1d,_1f,_20);
}
}),new objj_method(sel_getUid("performSelector:withObject:withObject:"),function(_21,_22,_23,_24,_25){
with(_21){
return objj_msgSend(_21,_23,_24,_25);
}
}),new objj_method(sel_getUid("isProxy"),function(_26,_27){
with(_26){
return YES;
}
}),new objj_method(sel_getUid("isKindOfClass:"),function(_28,_29,_2a){
with(_28){
var _2b=objj_msgSend(_28,"methodSignatureForSelector:",_29),_2c=objj_msgSend(CPInvocation,"invocationWithMethodSignature:",_2b);
objj_msgSend(_28,"forwardInvocation:",_2c);
return objj_msgSend(_2c,"returnValue");
}
}),new objj_method(sel_getUid("isMemberOfClass:"),function(_2d,_2e,_2f){
with(_2d){
var _30=objj_msgSend(_2d,"methodSignatureForSelector:",_2e),_31=objj_msgSend(CPInvocation,"invocationWithMethodSignature:",_30);
objj_msgSend(_2d,"forwardInvocation:",_31);
return objj_msgSend(_31,"returnValue");
}
}),new objj_method(sel_getUid("respondsToSelector:"),function(_32,_33,_34){
with(_32){
var _35=objj_msgSend(_32,"methodSignatureForSelector:",_33),_36=objj_msgSend(CPInvocation,"invocationWithMethodSignature:",_35);
objj_msgSend(_32,"forwardInvocation:",_36);
return objj_msgSend(_36,"returnValue");
}
}),new objj_method(sel_getUid("description"),function(_37,_38){
with(_37){
return "<"+class_getName(isa)+" 0x"+objj_msgSend(CPString,"stringWithHash:",objj_msgSend(_37,"UID"))+">";
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("load"),function(_39,_3a){
with(_39){
}
}),new objj_method(sel_getUid("initialize"),function(_3b,_3c){
with(_3b){
}
}),new objj_method(sel_getUid("class"),function(_3d,_3e){
with(_3d){
return _3d;
}
}),new objj_method(sel_getUid("alloc"),function(_3f,_40){
with(_3f){
return class_createInstance(_3f);
}
}),new objj_method(sel_getUid("respondsToSelector:"),function(_41,_42,_43){
with(_41){
return !!class_getInstanceMethod(isa,aSelector);
}
})]);
p;21;CPKeyValueObserving.jt;27564;@STATIC;1.0;i;9;CPArray.ji;14;CPDictionary.ji;13;CPException.ji;8;CPNull.ji;10;CPObject.ji;7;CPSet.ji;13;CPArray+KVO.ji;11;CPSet+KVO.jt;27422;
objj_executeFile("CPArray.j",YES);
objj_executeFile("CPDictionary.j",YES);
objj_executeFile("CPException.j",YES);
objj_executeFile("CPNull.j",YES);
objj_executeFile("CPObject.j",YES);
objj_executeFile("CPSet.j",YES);
var _1=objj_getClass("CPObject");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"CPObject\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("willChangeValueForKey:"),function(_3,_4,_5){
with(_3){
}
}),new objj_method(sel_getUid("didChangeValueForKey:"),function(_6,_7,_8){
with(_6){
}
}),new objj_method(sel_getUid("willChange:valuesAtIndexes:forKey:"),function(_9,_a,_b,_c,_d){
with(_9){
}
}),new objj_method(sel_getUid("didChange:valuesAtIndexes:forKey:"),function(_e,_f,_10,_11,_12){
with(_e){
}
}),new objj_method(sel_getUid("willChangeValueForKey:withSetMutation:usingObjects:"),function(_13,_14,_15,_16,_17){
with(_13){
}
}),new objj_method(sel_getUid("didChangeValueForKey:withSetMutation:usingObjects:"),function(_18,_19,_1a,_1b,_1c){
with(_18){
}
}),new objj_method(sel_getUid("addObserver:forKeyPath:options:context:"),function(_1d,_1e,_1f,_20,_21,_22){
with(_1d){
if(!_1f||!_20){
return;
}
objj_msgSend(objj_msgSend(_CPKVOProxy,"proxyForObject:",_1d),"_addObserver:forKeyPath:options:context:",_1f,_20,_21,_22);
}
}),new objj_method(sel_getUid("removeObserver:forKeyPath:"),function(_23,_24,_25,_26){
with(_23){
if(!_25||!_26){
return;
}
objj_msgSend(_23[_27],"_removeObserver:forKeyPath:",_25,_26);
}
}),new objj_method(sel_getUid("applyChange:toKeyPath:"),function(_28,_29,_2a,_2b){
with(_28){
var _2c=objj_msgSend(_2a,"objectForKey:",CPKeyValueChangeKindKey),_2d=objj_msgSend(_2a,"objectForKey:",CPKeyValueChangeOldKey),_2e=objj_msgSend(_2a,"objectForKey:",CPKeyValueChangeNewKey);
if(_2e===objj_msgSend(CPNull,"null")){
_2e=nil;
}
if(_2c===CPKeyValueChangeSetting){
return objj_msgSend(_28,"setValue:forKeyPath:",_2e,_2b);
}
var _2f=objj_msgSend(_2a,"objectForKey:",CPKeyValueChangeIndexesKey);
if(_2f){
if(_2c===CPKeyValueChangeInsertion){
objj_msgSend(objj_msgSend(_28,"mutableArrayValueForKeyPath:",_2b),"insertObjects:atIndexes:",_2e,_2f);
}else{
if(_2c===CPKeyValueChangeRemoval){
objj_msgSend(objj_msgSend(_28,"mutableArrayValueForKeyPath:",_2b),"removeObjectsAtIndexes:",_2f);
}else{
if(_2c===CPKeyValueChangeReplacement){
objj_msgSend(objj_msgSend(_28,"mutableArrayValueForKeyPath:",_2b),"replaceObjectAtIndexes:withObjects:",_2f,_2e);
}
}
}
}else{
if(_2c===CPKeyValueChangeInsertion){
objj_msgSend(objj_msgSend(_28,"mutableSetValueForKeyPath:",_2b),"unionSet:",_2e);
}else{
if(_2c===CPKeyValueChangeRemoval){
objj_msgSend(objj_msgSend(_28,"mutableSetValueForKeyPath:",_2b),"minusSet:",_2d);
}else{
if(_2c===CPKeyValueChangeReplacement){
objj_msgSend(objj_msgSend(_28,"mutableSetValueForKeyPath:",_2b),"setSet:",_2e);
}
}
}
}
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("automaticallyNotifiesObserversForKey:"),function(_30,_31,_32){
with(_30){
var _33=_32.charAt(0).toUpperCase()+_32.substring(1),_34="automaticallyNotifiesObserversOf"+_33;
if(objj_msgSend(objj_msgSend(_30,"class"),"respondsToSelector:",_34)){
return objj_msgSend(objj_msgSend(_30,"class"),_34);
}
return YES;
}
}),new objj_method(sel_getUid("keyPathsForValuesAffectingValueForKey:"),function(_35,_36,_37){
with(_35){
var _38=_37.charAt(0).toUpperCase()+_37.substring(1),_39="keyPathsForValuesAffecting"+_38;
if(objj_msgSend(objj_msgSend(_35,"class"),"respondsToSelector:",_39)){
return objj_msgSend(objj_msgSend(_35,"class"),_39);
}
return objj_msgSend(CPSet,"set");
}
})]);
var _1=objj_getClass("CPDictionary");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"CPDictionary\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("inverseChangeDictionary"),function(_3a,_3b){
with(_3a){
var _3c=objj_msgSend(_3a,"mutableCopy"),_3d=objj_msgSend(_3a,"objectForKey:",CPKeyValueChangeKindKey);
if(_3d===CPKeyValueChangeSetting||_3d===CPKeyValueChangeReplacement){
objj_msgSend(_3c,"setObject:forKey:",objj_msgSend(_3a,"objectForKey:",CPKeyValueChangeOldKey),CPKeyValueChangeNewKey);
objj_msgSend(_3c,"setObject:forKey:",objj_msgSend(_3a,"objectForKey:",CPKeyValueChangeNewKey),CPKeyValueChangeOldKey);
}else{
if(_3d===CPKeyValueChangeInsertion){
objj_msgSend(_3c,"setObject:forKey:",CPKeyValueChangeRemoval,CPKeyValueChangeKindKey);
objj_msgSend(_3c,"setObject:forKey:",objj_msgSend(_3a,"objectForKey:",CPKeyValueChangeNewKey),CPKeyValueChangeOldKey);
objj_msgSend(_3c,"removeObjectForKey:",CPKeyValueChangeNewKey);
}else{
if(_3d===CPKeyValueChangeRemoval){
objj_msgSend(_3c,"setObject:forKey:",CPKeyValueChangeInsertion,CPKeyValueChangeKindKey);
objj_msgSend(_3c,"setObject:forKey:",objj_msgSend(_3a,"objectForKey:",CPKeyValueChangeOldKey),CPKeyValueChangeNewKey);
objj_msgSend(_3c,"removeObjectForKey:",CPKeyValueChangeOldKey);
}
}
}
return _3c;
}
})]);
CPKeyValueObservingOptionNew=1<<0;
CPKeyValueObservingOptionOld=1<<1;
CPKeyValueObservingOptionInitial=1<<2;
CPKeyValueObservingOptionPrior=1<<3;
CPKeyValueChangeKindKey="CPKeyValueChangeKindKey";
CPKeyValueChangeNewKey="CPKeyValueChangeNewKey";
CPKeyValueChangeOldKey="CPKeyValueChangeOldKey";
CPKeyValueChangeIndexesKey="CPKeyValueChangeIndexesKey";
CPKeyValueChangeNotificationIsPriorKey="CPKeyValueChangeNotificationIsPriorKey";
CPKeyValueChangeSetting=1;
CPKeyValueChangeInsertion=2;
CPKeyValueChangeRemoval=3;
CPKeyValueChangeReplacement=4;
CPKeyValueUnionSetMutation=1;
CPKeyValueMinusSetMutation=2;
CPKeyValueIntersectSetMutation=3;
CPKeyValueSetSetMutation=4;
_CPKeyValueChangeSetMutationObjectsKey="_CPKeyValueChangeSetMutationObjectsKey";
_CPKeyValueChangeSetMutationKindKey="_CPKeyValueChangeSetMutationKindKey";
_CPKeyValueChangeSetMutationNewValueKey="_CPKeyValueChangeSetMutationNewValueKey";
var _3e=function(_3f){
switch(_3f){
case CPKeyValueUnionSetMutation:
return CPKeyValueChangeInsertion;
case CPKeyValueMinusSetMutation:
return CPKeyValueChangeRemoval;
case CPKeyValueIntersectSetMutation:
return CPKeyValueChangeRemoval;
case CPKeyValueSetSetMutation:
return CPKeyValueChangeReplacement;
}
};
var _40=CPKeyValueObservingOptionNew|CPKeyValueObservingOptionOld,_41="$KVODEPENDENT",_27="$KVOPROXY";
var _1=objj_allocateClassPair(CPObject,"_CPKVOProxy"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_targetObject"),new objj_ivar("_nativeClass"),new objj_ivar("_changesForKey"),new objj_ivar("_nestingForKey"),new objj_ivar("_observersForKey"),new objj_ivar("_observersForKeyLength"),new objj_ivar("_replacedKeys")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initWithTarget:"),function(_42,_43,_44){
with(_42){
if(_42=objj_msgSendSuper({receiver:_42,super_class:objj_getClass("_CPKVOProxy").super_class},"init")){
_targetObject=_44;
_nativeClass=objj_msgSend(_44,"class");
_observersForKey={};
_changesForKey={};
_nestingForKey={};
_observersForKeyLength=0;
objj_msgSend(_42,"_replaceClass");
_44[_27]=_42;
}
return _42;
}
}),new objj_method(sel_getUid("_replaceClass"),function(_45,_46){
with(_45){
var _47=_nativeClass,_48="$KVO_"+class_getName(_nativeClass),_49=objj_lookUpClass(_48);
if(_49){
_targetObject.isa=_49;
_replacedKeys=_49._replacedKeys;
return;
}
var _4a=objj_allocateClassPair(_47,_48);
objj_registerClassPair(_4a);
_replacedKeys=objj_msgSend(CPSet,"set");
_4a._replacedKeys=_replacedKeys;
var _4b=class_copyMethodList(_CPKVOModelSubclass);
if(objj_msgSend(_targetObject,"isKindOfClass:",objj_msgSend(CPDictionary,"class"))){
_4b=_4b.concat(class_copyMethodList(_CPKVOModelDictionarySubclass));
}
class_addMethods(_4a,_4b);
_targetObject.isa=_4a;
}
}),new objj_method(sel_getUid("_replaceModifiersForKey:"),function(_4c,_4d,_4e){
with(_4c){
if(objj_msgSend(_replacedKeys,"containsObject:",_4e)||!objj_msgSend(_nativeClass,"automaticallyNotifiesObserversForKey:",_4e)){
return;
}
objj_msgSend(_replacedKeys,"addObject:",_4e);
var _4f=_nativeClass,_50=_targetObject.isa,_51=_4e.charAt(0).toUpperCase()+_4e.substring(1);
var _52=sel_getUid("set"+_51+":"),_53=class_getInstanceMethod(_4f,_52);
if(_53){
var _54=_53.method_imp;
class_addMethod(_50,_52,function(_55,_56,_57){
objj_msgSend(_55,"willChangeValueForKey:",_4e);
_54(_55,_56,_57);
objj_msgSend(_55,"didChangeValueForKey:",_4e);
},"");
}
var _58=sel_getUid("_set"+_51+":"),_59=class_getInstanceMethod(_4f,_58);
if(_59){
var _5a=_59.method_imp;
class_addMethod(_50,_58,function(_5b,_5c,_5d){
objj_msgSend(_5b,"willChangeValueForKey:",_4e);
_5a(_5b,_5c,_5d);
objj_msgSend(_5b,"didChangeValueForKey:",_4e);
},"");
}
var _5e=sel_getUid("insertObject:in"+_51+"AtIndex:"),_5f=class_getInstanceMethod(_4f,_5e),_60=sel_getUid("insert"+_51+":atIndexes:"),_61=class_getInstanceMethod(_4f,_60),_62=sel_getUid("removeObjectFrom"+_51+"AtIndex:"),_63=class_getInstanceMethod(_4f,_62),_64=sel_getUid("remove"+_51+"AtIndexes:"),_65=class_getInstanceMethod(_4f,_64);
if((_5f||_61)&&(_63||_65)){
if(_5f){
var _66=_5f.method_imp;
class_addMethod(_50,_5e,function(_67,_68,_69,_6a){
objj_msgSend(_67,"willChange:valuesAtIndexes:forKey:",CPKeyValueChangeInsertion,objj_msgSend(CPIndexSet,"indexSetWithIndex:",_6a),_4e);
_66(_67,_68,_69,_6a);
objj_msgSend(_67,"didChange:valuesAtIndexes:forKey:",CPKeyValueChangeInsertion,objj_msgSend(CPIndexSet,"indexSetWithIndex:",_6a),_4e);
},"");
}
if(_61){
var _6b=_61.method_imp;
class_addMethod(_50,_60,function(_6c,_6d,_6e,_6f){
objj_msgSend(_6c,"willChange:valuesAtIndexes:forKey:",CPKeyValueChangeInsertion,objj_msgSend(_6f,"copy"),_4e);
_6b(_6c,_6d,_6e,_6f);
objj_msgSend(_6c,"didChange:valuesAtIndexes:forKey:",CPKeyValueChangeInsertion,objj_msgSend(_6f,"copy"),_4e);
},"");
}
if(_63){
var _70=_63.method_imp;
class_addMethod(_50,_62,function(_71,_72,_73){
objj_msgSend(_71,"willChange:valuesAtIndexes:forKey:",CPKeyValueChangeRemoval,objj_msgSend(CPIndexSet,"indexSetWithIndex:",_73),_4e);
_70(_71,_72,_73);
objj_msgSend(_71,"didChange:valuesAtIndexes:forKey:",CPKeyValueChangeRemoval,objj_msgSend(CPIndexSet,"indexSetWithIndex:",_73),_4e);
},"");
}
if(_65){
var _74=_65.method_imp;
class_addMethod(_50,_64,function(_75,_76,_77){
objj_msgSend(_75,"willChange:valuesAtIndexes:forKey:",CPKeyValueChangeRemoval,objj_msgSend(_77,"copy"),_4e);
_74(_75,_76,_77);
objj_msgSend(_75,"didChange:valuesAtIndexes:forKey:",CPKeyValueChangeRemoval,objj_msgSend(_77,"copy"),_4e);
},"");
}
var _78=sel_getUid("replaceObjectIn"+_51+"AtIndex:withObject:"),_79=class_getInstanceMethod(_4f,_78);
if(_79){
var _7a=_79.method_imp;
class_addMethod(_50,_78,function(_7b,_7c,_7d,_7e){
objj_msgSend(_7b,"willChange:valuesAtIndexes:forKey:",CPKeyValueChangeReplacement,objj_msgSend(CPIndexSet,"indexSetWithIndex:",_7d),_4e);
_7a(_7b,_7c,_7d,_7e);
objj_msgSend(_7b,"didChange:valuesAtIndexes:forKey:",CPKeyValueChangeReplacement,objj_msgSend(CPIndexSet,"indexSetWithIndex:",_7d),_4e);
},"");
}
var _7f=sel_getUid("replace"+_51+"AtIndexes:with"+_51+":"),_80=class_getInstanceMethod(_4f,_7f);
if(_80){
var _81=_80.method_imp;
class_addMethod(_50,_7f,function(_82,_83,_84,_85){
objj_msgSend(_82,"willChange:valuesAtIndexes:forKey:",CPKeyValueChangeReplacement,objj_msgSend(_84,"copy"),_4e);
_7a(_82,_83,_84,_85);
objj_msgSend(_82,"didChange:valuesAtIndexes:forKey:",CPKeyValueChangeReplacement,objj_msgSend(_84,"copy"),_4e);
},"");
}
}
var _86=sel_getUid("add"+_51+"Object:"),_87=class_getInstanceMethod(_4f,_86),_88=sel_getUid("add"+_51+":"),_89=class_getInstanceMethod(_4f,_88),_8a=sel_getUid("remove"+_51+"Object:"),_8b=class_getInstanceMethod(_4f,_8a),_8c=sel_getUid("remove"+_51+":"),_8d=class_getInstanceMethod(_4f,_8c);
if((_87||_89)&&(_8b||_8d)){
if(_87){
var _8e=_87.method_imp;
class_addMethod(_50,_86,function(_8f,_90,_91){
objj_msgSend(_8f,"willChangeValueForKey:withSetMutation:usingObjects:",_4e,CPKeyValueUnionSetMutation,objj_msgSend(CPSet,"setWithObject:",_91));
_8e(_8f,_90,_91);
objj_msgSend(_8f,"didChangeValueForKey:withSetMutation:usingObjects:",_4e,CPKeyValueUnionSetMutation,objj_msgSend(CPSet,"setWithObject:",_91));
},"");
}
if(_89){
var _92=_89.method_imp;
class_addMethod(_50,_88,function(_93,_94,_95){
objj_msgSend(_93,"willChangeValueForKey:withSetMutation:usingObjects:",_4e,CPKeyValueUnionSetMutation,objj_msgSend(_95,"copy"));
_92(_93,_94,_95);
objj_msgSend(_93,"didChangeValueForKey:withSetMutation:usingObjects:",_4e,CPKeyValueUnionSetMutation,objj_msgSend(_95,"copy"));
},"");
}
if(_8b){
var _96=_8b.method_imp;
class_addMethod(_50,_8a,function(_97,_98,_99){
objj_msgSend(_97,"willChangeValueForKey:withSetMutation:usingObjects:",_4e,CPKeyValueMinusSetMutation,objj_msgSend(CPSet,"setWithObject:",_99));
_96(_97,_98,_99);
objj_msgSend(_97,"didChangeValueForKey:withSetMutation:usingObjects:",_4e,CPKeyValueMinusSetMutation,objj_msgSend(CPSet,"setWithObject:",_99));
},"");
}
if(_8d){
var _9a=_8d.method_imp;
class_addMethod(_50,_8c,function(_9b,_9c,_9d){
objj_msgSend(_9b,"willChangeValueForKey:withSetMutation:usingObjects:",_4e,CPKeyValueMinusSetMutation,objj_msgSend(_9d,"copy"));
_9a(_9b,_9c,_9d);
objj_msgSend(_9b,"didChangeValueForKey:withSetMutation:usingObjects:",_4e,CPKeyValueMinusSetMutation,objj_msgSend(_9d,"copy"));
},"");
}
var _9e=sel_getUid("intersect"+_51+":"),_9f=class_getInstanceMethod(_4f,_9e);
if(_9f){
var _a0=_9f.method_imp;
class_addMethod(_50,_9e,function(_a1,_a2,_a3){
objj_msgSend(_a1,"willChangeValueForKey:withSetMutation:usingObjects:",_4e,CPKeyValueIntersectSetMutation,objj_msgSend(_a3,"copy"));
_a0(_a1,_a2,_a3);
objj_msgSend(_a1,"didChangeValueForKey:withSetMutation:usingObjects:",_4e,CPKeyValueIntersectSetMutation,objj_msgSend(_a3,"copy"));
},"");
}
}
var _a4=objj_msgSend(objj_msgSend(_nativeClass,"keyPathsForValuesAffectingValueForKey:",_4e),"allObjects"),_a5=_a4?_a4.length:0;
if(!_a5){
return;
}
var _a6=_nativeClass[_41];
if(!_a6){
_a6={};
_nativeClass[_41]=_a6;
}
while(_a5--){
var _a7=_a4[_a5],_a8=_a6[_a7];
if(!_a8){
_a8=objj_msgSend(CPSet,"new");
_a6[_a7]=_a8;
}
objj_msgSend(_a8,"addObject:",_4e);
if(_a7.indexOf(".")!==-1){
objj_msgSend(_targetObject,"addObserver:forKeyPath:options:context:",_4c,_a7,CPKeyValueObservingOptionPrior|_40,nil);
}else{
objj_msgSend(_4c,"_replaceModifiersForKey:",_a7);
}
}
}
}),new objj_method(sel_getUid("observeValueForKeyPath:ofObject:change:context:"),function(_a9,_aa,_ab,_ac,_ad,_ae){
with(_a9){
var _af=_nativeClass[_41],_b0=objj_msgSend(_af[_ab],"allObjects");
var _b1=!!objj_msgSend(_ad,"objectForKey:",CPKeyValueChangeNotificationIsPriorKey);
for(var i=0;i<objj_msgSend(_b0,"count");i++){
var _b2=objj_msgSend(_b0,"objectAtIndex:",i);
objj_msgSend(_a9,"_sendNotificationsForKey:changeOptions:isBefore:",_b2,_ad,_b1);
}
}
}),new objj_method(sel_getUid("_addObserver:forKeyPath:options:context:"),function(_b3,_b4,_b5,_b6,_b7,_b8){
with(_b3){
if(!_b5){
return;
}
var _b9=nil;
if(_b6.indexOf(".")!==CPNotFound&&_b6.charAt(0)!=="@"){
_b9=objj_msgSend(objj_msgSend(_CPKVOForwardingObserver,"alloc"),"initWithKeyPath:object:observer:options:context:",_b6,_targetObject,_b5,_b7,_b8);
}else{
objj_msgSend(_b3,"_replaceModifiersForKey:",_b6);
}
var _ba=_observersForKey[_b6];
if(!_ba){
_ba=objj_msgSend(CPDictionary,"dictionary");
_observersForKey[_b6]=_ba;
_observersForKeyLength++;
}
objj_msgSend(_ba,"setObject:forKey:",_bb(_b5,_b7,_b8,_b9),objj_msgSend(_b5,"UID"));
if(_b7&CPKeyValueObservingOptionInitial){
var _bc=objj_msgSend(_targetObject,"valueForKeyPath:",_b6);
if(_bc===nil||_bc===undefined){
_bc=objj_msgSend(CPNull,"null");
}
var _bd=objj_msgSend(CPDictionary,"dictionaryWithObject:forKey:",_bc,CPKeyValueChangeNewKey);
objj_msgSend(_b5,"observeValueForKeyPath:ofObject:change:context:",_b6,_targetObject,_bd,_b8);
}
}
}),new objj_method(sel_getUid("_removeObserver:forKeyPath:"),function(_be,_bf,_c0,_c1){
with(_be){
var _c2=_observersForKey[_c1];
if(!_c2){
CPLog.warn("Cannot remove an observer %@ for the key path \"%@\" from %@ because it is not registered as an observer.",_targetObject,_c1,_c0);
return;
}
if(_c1.indexOf(".")!=CPNotFound){
var _c3=objj_msgSend(_c2,"objectForKey:",objj_msgSend(_c0,"UID")).forwarder;
objj_msgSend(_c3,"finalize");
}
objj_msgSend(_c2,"removeObjectForKey:",objj_msgSend(_c0,"UID"));
if(!objj_msgSend(_c2,"count")){
_observersForKeyLength--;
delete _observersForKey[_c1];
}
if(!_observersForKeyLength){
_targetObject.isa=_nativeClass;
delete _targetObject[_27];
}
}
}),new objj_method(sel_getUid("_sendNotificationsForKey:changeOptions:isBefore:"),function(_c4,_c5,_c6,_c7,_c8){
with(_c4){
var _c9=_changesForKey[_c6];
if(_c8){
if(_c9){
var _ca=_nestingForKey[_c6];
if(!_ca){
objj_msgSend(CPException,"raise:reason:",CPInternalInconsistencyException,"_changesForKey without _nestingForKey");
}
_nestingForKey[_c6]=_ca+1;
return;
}
_nestingForKey[_c6]=1;
_c9=_c7;
var _cb=objj_msgSend(_c9,"objectForKey:",CPKeyValueChangeIndexesKey),_cc=_c9[_CPKeyValueChangeSetMutationKindKey];
if(_cc){
var _cd=objj_msgSend(_c9[_CPKeyValueChangeSetMutationObjectsKey],"copy"),_ce=objj_msgSend(objj_msgSend(_targetObject,"valueForKey:",_c6),"copy");
if(_cc==CPKeyValueMinusSetMutation){
objj_msgSend(_ce,"intersectSet:",_cd);
objj_msgSend(_c9,"setValue:forKey:",_ce,CPKeyValueChangeOldKey);
}else{
if(_cc===CPKeyValueIntersectSetMutation||_cc===CPKeyValueSetSetMutation){
objj_msgSend(_ce,"minusSet:",_cd);
objj_msgSend(_c9,"setValue:forKey:",_ce,CPKeyValueChangeOldKey);
}
}
if(_cc===CPKeyValueUnionSetMutation||_cc===CPKeyValueSetSetMutation){
objj_msgSend(_cd,"minusSet:",_ce);
_c9[_CPKeyValueChangeSetMutationNewValueKey]=_cd;
}
}else{
if(_cb){
var _cf=objj_msgSend(_c9,"objectForKey:",CPKeyValueChangeKindKey);
if(_cf===CPKeyValueChangeReplacement||_cf===CPKeyValueChangeRemoval){
var _d0=objj_msgSend(objj_msgSend(_targetObject,"mutableArrayValueForKeyPath:",_c6),"objectsAtIndexes:",_cb);
objj_msgSend(_c9,"setValue:forKey:",_d0,CPKeyValueChangeOldKey);
}
}else{
var _d1=objj_msgSend(_targetObject,"valueForKey:",_c6);
if(_d1===nil||_d1===undefined){
_d1=objj_msgSend(CPNull,"null");
}
objj_msgSend(_c9,"setObject:forKey:",_d1,CPKeyValueChangeOldKey);
}
}
objj_msgSend(_c9,"setObject:forKey:",1,CPKeyValueChangeNotificationIsPriorKey);
_changesForKey[_c6]=_c9;
}else{
var _ca=_nestingForKey[_c6];
if(!_c9||!_ca){
objj_msgSend(CPException,"raise:reason:","CPKeyValueObservingException","'didChange...' message called without prior call of 'willChange...'");
}
_nestingForKey[_c6]=_ca-1;
if(_ca-1>0){
return;
}
delete _nestingForKey[_c6];
objj_msgSend(_c9,"removeObjectForKey:",CPKeyValueChangeNotificationIsPriorKey);
var _cb=objj_msgSend(_c9,"objectForKey:",CPKeyValueChangeIndexesKey),_cc=_c9[_CPKeyValueChangeSetMutationKindKey];
if(_cc){
var _d2=_c9[_CPKeyValueChangeSetMutationNewValueKey];
objj_msgSend(_c9,"setValue:forKey:",_d2,CPKeyValueChangeNewKey);
delete _c9[_CPKeyValueChangeSetMutationNewValueKey];
delete _c9[_CPKeyValueChangeSetMutationObjectsKey];
delete _c9[_CPKeyValueChangeSetMutationKindKey];
}else{
if(_cb){
var _cf=objj_msgSend(_c9,"objectForKey:",CPKeyValueChangeKindKey);
if(_cf==CPKeyValueChangeReplacement||_cf==CPKeyValueChangeInsertion){
var _d0=objj_msgSend(objj_msgSend(_targetObject,"mutableArrayValueForKeyPath:",_c6),"objectsAtIndexes:",_cb);
objj_msgSend(_c9,"setValue:forKey:",_d0,CPKeyValueChangeNewKey);
}
}else{
var _d2=objj_msgSend(_targetObject,"valueForKey:",_c6);
if(_d2===nil||_d2===undefined){
_d2=objj_msgSend(CPNull,"null");
}
objj_msgSend(_c9,"setObject:forKey:",_d2,CPKeyValueChangeNewKey);
}
}
delete _changesForKey[_c6];
}
var _d3=objj_msgSend(_observersForKey[_c6],"allValues"),_d4=_d3?_d3.length:0;
while(_d4--){
var _d5=_d3[_d4];
if(!_c8||(_d5.options&CPKeyValueObservingOptionPrior)){
objj_msgSend(_d5.observer,"observeValueForKeyPath:ofObject:change:context:",_c6,_targetObject,_c9,_d5.context);
}
}
var _d6=_nativeClass[_41];
if(!_d6){
return;
}
var _d7=objj_msgSend(_d6[_c6],"allObjects");
if(!_d7){
return;
}
var _d8=0,_d4=objj_msgSend(_d7,"count");
for(;_d8<_d4;++_d8){
var _d9=_d7[_d8];
objj_msgSend(_c4,"_sendNotificationsForKey:changeOptions:isBefore:",_d9,_c8?objj_msgSend(_c7,"copy"):_changesForKey[_d9],_c8);
}
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("proxyForObject:"),function(_da,_db,_dc){
with(_da){
var _dd=_dc[_27];
if(_dd){
return _dd;
}
return objj_msgSend(objj_msgSend(_da,"alloc"),"initWithTarget:",_dc);
}
})]);
var _1=objj_allocateClassPair(Nil,"_CPKVOModelSubclass"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("willChangeValueForKey:"),function(_de,_df,_e0){
with(_de){
var _e1=objj_msgSend(_de,"class"),_e2=sel_getUid("willChangeValueForKey:"),_e3=class_getMethodImplementation(_e1,_e2);
_e3(_de,_e2,_e0);
if(!_e0){
return;
}
var _e4=objj_msgSend(CPDictionary,"dictionaryWithObject:forKey:",CPKeyValueChangeSetting,CPKeyValueChangeKindKey);
objj_msgSend(objj_msgSend(_CPKVOProxy,"proxyForObject:",_de),"_sendNotificationsForKey:changeOptions:isBefore:",_e0,_e4,YES);
}
}),new objj_method(sel_getUid("didChangeValueForKey:"),function(_e5,_e6,_e7){
with(_e5){
var _e8=objj_msgSend(_e5,"class"),_e9=sel_getUid("didChangeValueForKey:"),_ea=class_getMethodImplementation(_e8,_e9);
_ea(_e5,_e9,_e7);
if(!_e7){
return;
}
objj_msgSend(objj_msgSend(_CPKVOProxy,"proxyForObject:",_e5),"_sendNotificationsForKey:changeOptions:isBefore:",_e7,nil,NO);
}
}),new objj_method(sel_getUid("willChange:valuesAtIndexes:forKey:"),function(_eb,_ec,_ed,_ee,_ef){
with(_eb){
var _f0=objj_msgSend(_eb,"class"),_f1=sel_getUid("willChange:valuesAtIndexes:forKey:"),_f2=class_getMethodImplementation(_f0,_f1);
_f2(_eb,_f1,_ed,_ee,_ef);
if(!_ef){
return;
}
var _f3=objj_msgSend(CPDictionary,"dictionaryWithObjects:forKeys:",[_ed,_ee],[CPKeyValueChangeKindKey,CPKeyValueChangeIndexesKey]);
objj_msgSend(objj_msgSend(_CPKVOProxy,"proxyForObject:",_eb),"_sendNotificationsForKey:changeOptions:isBefore:",_ef,_f3,YES);
}
}),new objj_method(sel_getUid("didChange:valuesAtIndexes:forKey:"),function(_f4,_f5,_f6,_f7,_f8){
with(_f4){
var _f9=objj_msgSend(_f4,"class"),_fa=sel_getUid("didChange:valuesAtIndexes:forKey:"),_fb=class_getMethodImplementation(_f9,_fa);
_fb(_f4,_fa,_f6,_f7,_f8);
if(!_f8){
return;
}
objj_msgSend(objj_msgSend(_CPKVOProxy,"proxyForObject:",_f4),"_sendNotificationsForKey:changeOptions:isBefore:",_f8,nil,NO);
}
}),new objj_method(sel_getUid("willChangeValueForKey:withSetMutation:usingObjects:"),function(_fc,_fd,_fe,_ff,_100){
with(_fc){
var _101=objj_msgSend(_fc,"class"),_102=sel_getUid("willChangeValueForKey:withSetMutation:usingObjects:"),_103=class_getMethodImplementation(_101,_102);
_103(_fc,_102,_fe,_ff,_100);
if(!_fe){
return;
}
var _104=_3e(_ff),_105=objj_msgSend(CPDictionary,"dictionaryWithObject:forKey:",_104,CPKeyValueChangeKindKey);
_105[_CPKeyValueChangeSetMutationObjectsKey]=_100;
_105[_CPKeyValueChangeSetMutationKindKey]=_ff;
objj_msgSend(objj_msgSend(_CPKVOProxy,"proxyForObject:",_fc),"_sendNotificationsForKey:changeOptions:isBefore:",_fe,_105,YES);
}
}),new objj_method(sel_getUid("didChangeValueForKey:withSetMutation:usingObjects:"),function(self,_106,aKey,_107,_108){
with(self){
var _109=objj_msgSend(self,"class"),_10a=sel_getUid("didChangeValueForKey:withSetMutation:usingObjects:"),_10b=class_getMethodImplementation(_109,_10a);
_10b(self,_10a,aKey,_107,_108);
if(!aKey){
return;
}
objj_msgSend(objj_msgSend(_CPKVOProxy,"proxyForObject:",self),"_sendNotificationsForKey:changeOptions:isBefore:",aKey,nil,NO);
}
}),new objj_method(sel_getUid("class"),function(self,_10c){
with(self){
return self[_27]._nativeClass;
}
}),new objj_method(sel_getUid("superclass"),function(self,_10d){
with(self){
return objj_msgSend(objj_msgSend(self,"class"),"superclass");
}
}),new objj_method(sel_getUid("isKindOfClass:"),function(self,_10e,_10f){
with(self){
return objj_msgSend(objj_msgSend(self,"class"),"isSubclassOfClass:",_10f);
}
}),new objj_method(sel_getUid("isMemberOfClass:"),function(self,_110,_111){
with(self){
return objj_msgSend(self,"class")==_111;
}
}),new objj_method(sel_getUid("className"),function(self,_112){
with(self){
return objj_msgSend(self,"class").name;
}
})]);
var _1=objj_allocateClassPair(Nil,"_CPKVOModelDictionarySubclass"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("removeAllObjects"),function(self,_113){
with(self){
var keys=objj_msgSend(self,"allKeys"),_114=objj_msgSend(keys,"count"),i=0;
for(;i<_114;i++){
objj_msgSend(self,"willChangeValueForKey:",keys[i]);
}
var _115=objj_msgSend(self,"class"),_116=sel_getUid("removeAllObjects"),_117=class_getMethodImplementation(_115,_116);
_117(self,_116);
for(i=0;i<_114;i++){
objj_msgSend(self,"didChangeValueForKey:",keys[i]);
}
}
}),new objj_method(sel_getUid("removeObjectForKey:"),function(self,_118,aKey){
with(self){
objj_msgSend(self,"willChangeValueForKey:",aKey);
var _119=objj_msgSend(self,"class"),_11a=sel_getUid("removeObjectForKey:"),_11b=class_getMethodImplementation(_119,_11a);
_11b(self,_11a,aKey);
objj_msgSend(self,"didChangeValueForKey:",aKey);
}
}),new objj_method(sel_getUid("setObject:forKey:"),function(self,_11c,_11d,aKey){
with(self){
objj_msgSend(self,"willChangeValueForKey:",aKey);
var _11e=objj_msgSend(self,"class"),_11f=sel_getUid("setObject:forKey:"),_120=class_getMethodImplementation(_11e,_11f);
_120(self,_11f,_11d,aKey);
objj_msgSend(self,"didChangeValueForKey:",aKey);
}
})]);
var _1=objj_allocateClassPair(CPObject,"_CPKVOForwardingObserver"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_object"),new objj_ivar("_observer"),new objj_ivar("_context"),new objj_ivar("_options"),new objj_ivar("_firstPart"),new objj_ivar("_secondPart"),new objj_ivar("_value")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initWithKeyPath:object:observer:options:context:"),function(self,_121,_122,_123,_124,_125,_126){
with(self){
self=objj_msgSendSuper({receiver:self,super_class:objj_getClass("_CPKVOForwardingObserver").super_class},"init");
_context=_126;
_observer=_124;
_object=_123;
_options=_125;
var _127=_122.indexOf(".");
if(_127===CPNotFound){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,"Created _CPKVOForwardingObserver without compound key path: "+_122);
}
_firstPart=_122.substring(0,_127);
_secondPart=_122.substring(_127+1);
objj_msgSend(_object,"addObserver:forKeyPath:options:context:",self,_firstPart,_options,nil);
_value=objj_msgSend(_object,"valueForKey:",_firstPart);
if(_value){
objj_msgSend(_value,"addObserver:forKeyPath:options:context:",self,_secondPart,_options,nil);
}
return self;
}
}),new objj_method(sel_getUid("observeValueForKeyPath:ofObject:change:context:"),function(self,_128,_129,_12a,_12b,_12c){
with(self){
if(_129===_firstPart){
objj_msgSend(_observer,"observeValueForKeyPath:ofObject:change:context:",_firstPart,_object,_12b,_context);
if(_value){
objj_msgSend(_value,"removeObserver:forKeyPath:",self,_secondPart);
}
_value=objj_msgSend(_object,"valueForKey:",_firstPart);
if(_value){
objj_msgSend(_value,"addObserver:forKeyPath:options:context:",self,_secondPart,_options,nil);
}
}else{
objj_msgSend(_observer,"observeValueForKeyPath:ofObject:change:context:",_firstPart+"."+_129,_object,_12b,_context);
}
}
}),new objj_method(sel_getUid("finalize"),function(self,_12d){
with(self){
if(_value){
objj_msgSend(_value,"removeObserver:forKeyPath:",self,_secondPart);
}
objj_msgSend(_object,"removeObserver:forKeyPath:",self,_firstPart);
_object=nil;
_observer=nil;
_context=nil;
_value=nil;
}
})]);
var _bb=_bb=function(_12e,_12f,_130,_131){
return {observer:_12e,options:_12f,context:_130,forwarder:_131};
};
objj_executeFile("CPArray+KVO.j",YES);
objj_executeFile("CPSet+KVO.j",YES);
p;13;CPArray+KVO.jt;13978;@STATIC;1.0;i;9;CPArray.ji;8;CPNull.ji;27;_CPCollectionKVCOperators.jt;13901;
objj_executeFile("CPArray.j",YES);
objj_executeFile("CPNull.j",YES);
objj_executeFile("_CPCollectionKVCOperators.j",YES);
var _1=objj_getClass("CPObject");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"CPObject\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("mutableArrayValueForKey:"),function(_3,_4,_5){
with(_3){
return objj_msgSend(objj_msgSend(_CPKVCArray,"alloc"),"initWithKey:forProxyObject:",_5,_3);
}
}),new objj_method(sel_getUid("mutableArrayValueForKeyPath:"),function(_6,_7,_8){
with(_6){
var _9=_8.indexOf(".");
if(_9<0){
return objj_msgSend(_6,"mutableArrayValueForKey:",_8);
}
var _a=_8.substring(0,_9),_b=_8.substring(_9+1);
return objj_msgSend(objj_msgSend(_6,"valueForKeyPath:",_a),"mutableArrayValueForKeyPath:",_b);
}
})]);
var _1=objj_allocateClassPair(CPMutableArray,"_CPKVCArray"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_proxyObject"),new objj_ivar("_key"),new objj_ivar("_insertSEL"),new objj_ivar("_insert"),new objj_ivar("_removeSEL"),new objj_ivar("_remove"),new objj_ivar("_replaceSEL"),new objj_ivar("_replace"),new objj_ivar("_insertManySEL"),new objj_ivar("_insertMany"),new objj_ivar("_removeManySEL"),new objj_ivar("_removeMany"),new objj_ivar("_replaceManySEL"),new objj_ivar("_replaceMany"),new objj_ivar("_objectAtIndexSEL"),new objj_ivar("_objectAtIndex"),new objj_ivar("_objectsAtIndexesSEL"),new objj_ivar("_objectsAtIndexes"),new objj_ivar("_countSEL"),new objj_ivar("_count"),new objj_ivar("_accessSEL"),new objj_ivar("_access"),new objj_ivar("_setSEL"),new objj_ivar("_set")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initWithKey:forProxyObject:"),function(_c,_d,_e,_f){
with(_c){
_c=objj_msgSendSuper({receiver:_c,super_class:objj_getClass("_CPKVCArray").super_class},"init");
_key=_e;
_proxyObject=_f;
var _10=_key.charAt(0).toUpperCase()+_key.substring(1);
_insertSEL=sel_getName("insertObject:in"+_10+"AtIndex:");
if(objj_msgSend(_proxyObject,"respondsToSelector:",_insertSEL)){
_insert=objj_msgSend(_proxyObject,"methodForSelector:",_insertSEL);
}
_removeSEL=sel_getName("removeObjectFrom"+_10+"AtIndex:");
if(objj_msgSend(_proxyObject,"respondsToSelector:",_removeSEL)){
_remove=objj_msgSend(_proxyObject,"methodForSelector:",_removeSEL);
}
_replaceSEL=sel_getName("replaceObjectIn"+_10+"AtIndex:withObject:");
if(objj_msgSend(_proxyObject,"respondsToSelector:",_replaceSEL)){
_replace=objj_msgSend(_proxyObject,"methodForSelector:",_replaceSEL);
}
_insertManySEL=sel_getName("insert"+_10+":atIndexes:");
if(objj_msgSend(_proxyObject,"respondsToSelector:",_insertManySEL)){
_insertMany=objj_msgSend(_proxyObject,"methodForSelector:",_insertManySEL);
}
_removeManySEL=sel_getName("remove"+_10+"AtIndexes:");
if(objj_msgSend(_proxyObject,"respondsToSelector:",_removeManySEL)){
_removeMany=objj_msgSend(_proxyObject,"methodForSelector:",_removeManySEL);
}
_replaceManySEL=sel_getName("replace"+_10+"AtIndexes:with"+_10+":");
if(objj_msgSend(_proxyObject,"respondsToSelector:",_replaceManySEL)){
_replaceMany=objj_msgSend(_proxyObject,"methodForSelector:",_replaceManySEL);
}
_objectAtIndexSEL=sel_getName("objectIn"+_10+"AtIndex:");
if(objj_msgSend(_proxyObject,"respondsToSelector:",_objectAtIndexSEL)){
_objectAtIndex=objj_msgSend(_proxyObject,"methodForSelector:",_objectAtIndexSEL);
}
_objectsAtIndexesSEL=sel_getName(_key+"AtIndexes:");
if(objj_msgSend(_proxyObject,"respondsToSelector:",_objectsAtIndexesSEL)){
_objectsAtIndexes=objj_msgSend(_proxyObject,"methodForSelector:",_objectsAtIndexesSEL);
}
_countSEL=sel_getName("countOf"+_10);
if(objj_msgSend(_proxyObject,"respondsToSelector:",_countSEL)){
_count=objj_msgSend(_proxyObject,"methodForSelector:",_countSEL);
}
_accessSEL=sel_getName(_key);
if(objj_msgSend(_proxyObject,"respondsToSelector:",_accessSEL)){
_access=objj_msgSend(_proxyObject,"methodForSelector:",_accessSEL);
}
_setSEL=sel_getName("set"+_10+":");
if(objj_msgSend(_proxyObject,"respondsToSelector:",_setSEL)){
_set=objj_msgSend(_proxyObject,"methodForSelector:",_setSEL);
}
return _c;
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
if(_access){
return _access(_proxyObject,_accessSEL);
}
return objj_msgSend(_proxyObject,"valueForKey:",_key);
}
}),new objj_method(sel_getUid("_setRepresentedObject:"),function(_17,_18,_19){
with(_17){
if(_set){
return _set(_proxyObject,_setSEL,_19);
}
objj_msgSend(_proxyObject,"setValue:forKey:",_19,_key);
}
}),new objj_method(sel_getUid("count"),function(_1a,_1b){
with(_1a){
if(_count){
return _count(_proxyObject,_countSEL);
}
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
if(_objectsAtIndexes){
return _objectsAtIndexes(_proxyObject,_objectsAtIndexesSEL,_35);
}
if(_objectAtIndex){
var _36=CPNotFound,_37=[];
while((_36=objj_msgSend(_35,"indexGreaterThanIndex:",_36))!==CPNotFound){
_37.push(_objectAtIndex(_proxyObject,_objectAtIndexSEL,_36));
}
return _37;
}
return objj_msgSend(objj_msgSend(_33,"_representedObject"),"objectsAtIndexes:",_35);
}
}),new objj_method(sel_getUid("addObject:"),function(_38,_39,_3a){
with(_38){
objj_msgSend(_38,"insertObject:atIndex:",_3a,objj_msgSend(_38,"count"));
}
}),new objj_method(sel_getUid("addObjectsFromArray:"),function(_3b,_3c,_3d){
with(_3b){
var _3e=0,_3f=objj_msgSend(_3d,"count");
objj_msgSend(_3b,"insertObjects:atIndexes:",_3d,objj_msgSend(CPIndexSet,"indexSetWithIndexesInRange:",CPMakeRange(objj_msgSend(_3b,"count"),_3f)));
}
}),new objj_method(sel_getUid("insertObject:atIndex:"),function(_40,_41,_42,_43){
with(_40){
objj_msgSend(_40,"insertObjects:atIndexes:",[_42],objj_msgSend(CPIndexSet,"indexSetWithIndex:",_43));
}
}),new objj_method(sel_getUid("insertObjects:atIndexes:"),function(_44,_45,_46,_47){
with(_44){
if(_insertMany){
_insertMany(_proxyObject,_insertManySEL,_46,_47);
}else{
if(_insert){
var _48=[];
objj_msgSend(_47,"getIndexes:maxCount:inIndexRange:",_48,-1,nil);
for(var _49=0;_49<objj_msgSend(_48,"count");_49++){
var _4a=objj_msgSend(_48,"objectAtIndex:",_49),_4b=objj_msgSend(_46,"objectAtIndex:",_49);
_insert(_proxyObject,_insertSEL,_4b,_4a);
}
}else{
var _4c=objj_msgSend(objj_msgSend(_44,"_representedObject"),"copy");
objj_msgSend(_4c,"insertObjects:atIndexes:",_46,_47);
objj_msgSend(_44,"_setRepresentedObject:",_4c);
}
}
}
}),new objj_method(sel_getUid("removeObject:"),function(_4d,_4e,_4f){
with(_4d){
objj_msgSend(_4d,"removeObject:inRange:",_4f,CPMakeRange(0,objj_msgSend(_4d,"count")));
}
}),new objj_method(sel_getUid("removeObjectsInArray:"),function(_50,_51,_52){
with(_50){
if(_removeMany){
var _53=objj_msgSend(CPIndexSet,"indexSet"),_54=objj_msgSend(_52,"count");
while(_54--){
objj_msgSend(_53,"addIndex:",objj_msgSend(_50,"indexOfObject:",objj_msgSend(_52,"objectAtIndex:",_54)));
}
_removeMany(_proxyObject,_removeManySEL,_53);
}else{
if(_remove){
var _54=objj_msgSend(_52,"count");
while(_54--){
_remove(_proxyObject,_removeSEL,objj_msgSend(_50,"indexOfObject:",objj_msgSend(_52,"objectAtIndex:",_54)));
}
}else{
var _55=objj_msgSend(objj_msgSend(_50,"_representedObject"),"copy");
objj_msgSend(_55,"removeObjectsInArray:",_52);
objj_msgSend(_50,"_setRepresentedObject:",_55);
}
}
}
}),new objj_method(sel_getUid("removeObject:inRange:"),function(_56,_57,_58,_59){
with(_56){
if(_remove){
_remove(_proxyObject,_removeSEL,objj_msgSend(_56,"indexOfObject:inRange:",_58,_59));
}else{
if(_removeMany){
var _5a=objj_msgSend(_56,"indexOfObject:inRange:",_58,_59);
_removeMany(_proxyObject,_removeManySEL,objj_msgSend(CPIndexSet,"indexSetWithIndex:",_5a));
}else{
var _5a;
while((_5a=objj_msgSend(_56,"indexOfObject:inRange:",_58,_59))!==CPNotFound){
objj_msgSend(_56,"removeObjectAtIndex:",_5a);
_59=CPIntersectionRange(CPMakeRange(_5a,length-_5a),_59);
}
}
}
}
}),new objj_method(sel_getUid("removeLastObject"),function(_5b,_5c){
with(_5b){
objj_msgSend(_5b,"removeObjectsAtIndexes:",objj_msgSend(CPIndexSet,"indexSetWithIndex:",objj_msgSend(_5b,"count")-1));
}
}),new objj_method(sel_getUid("removeObjectAtIndex:"),function(_5d,_5e,_5f){
with(_5d){
objj_msgSend(_5d,"removeObjectsAtIndexes:",objj_msgSend(CPIndexSet,"indexSetWithIndex:",_5f));
}
}),new objj_method(sel_getUid("removeObjectsAtIndexes:"),function(_60,_61,_62){
with(_60){
if(_removeMany){
_removeMany(_proxyObject,_removeManySEL,_62);
}else{
if(_remove){
var _63=objj_msgSend(_62,"lastIndex");
while(_63!==CPNotFound){
_remove(_proxyObject,_removeSEL,_63);
_63=objj_msgSend(_62,"indexLessThanIndex:",_63);
}
}else{
var _64=objj_msgSend(objj_msgSend(_60,"_representedObject"),"copy");
objj_msgSend(_64,"removeObjectsAtIndexes:",_62);
objj_msgSend(_60,"_setRepresentedObject:",_64);
}
}
}
}),new objj_method(sel_getUid("replaceObjectAtIndex:withObject:"),function(_65,_66,_67,_68){
with(_65){
objj_msgSend(_65,"replaceObjectsAtIndexes:withObjects:",objj_msgSend(CPIndexSet,"indexSetWithIndex:",_67),[_68]);
}
}),new objj_method(sel_getUid("replaceObjectsAtIndexes:withObjects:"),function(_69,_6a,_6b,_6c){
with(_69){
if(_replaceMany){
return _replaceMany(_proxyObject,_replaceManySEL,_6b,_6c);
}else{
if(_replace){
var i=0,_6d=objj_msgSend(_6b,"firstIndex");
while(_6d!==CPNotFound){
_replace(_proxyObject,_replaceSEL,_6d,objj_msgSend(_6c,"objectAtIndex:",i++));
_6d=objj_msgSend(_6b,"indexGreaterThanIndex:",_6d);
}
}else{
var _6e=objj_msgSend(objj_msgSend(_69,"_representedObject"),"copy");
objj_msgSend(_6e,"replaceObjectsAtIndexes:withObjects:",_6b,_6c);
objj_msgSend(_69,"_setRepresentedObject:",_6e);
}
}
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("alloc"),function(_6f,_70){
with(_6f){
var _71=[];
_71.isa=_6f;
var _72=class_copyIvarList(_6f),_73=_72.length;
while(_73--){
_71[ivar_getName(_72[_73])]=nil;
}
return _71;
}
})]);
var _1=objj_getClass("CPArray");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"CPArray\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("valueForKey:"),function(_74,_75,_76){
with(_74){
if(_76.indexOf("@")===0){
if(_76.indexOf(".")!==-1){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,"called valueForKey: on an array with a complex key ("+_76+"). use valueForKeyPath:");
}
if(_76==="@count"){
return length;
}
return objj_msgSend(_74,"valueForUndefinedKey:",_76);
}else{
var _77=[],_78=objj_msgSend(_74,"objectEnumerator"),_79;
while((_79=objj_msgSend(_78,"nextObject"))!==nil){
var _7a=objj_msgSend(_79,"valueForKey:",_76);
if(_7a===nil||_7a===undefined){
_7a=objj_msgSend(CPNull,"null");
}
_77.push(_7a);
}
return _77;
}
}
}),new objj_method(sel_getUid("valueForKeyPath:"),function(_7b,_7c,_7d){
with(_7b){
if(!_7d){
objj_msgSend(_7b,"valueForUndefinedKey:","<empty path>");
}
if(_7d.charAt(0)==="@"){
var _7e=_7d.indexOf("."),_7f,_80;
if(_7e!==-1){
_7f=_7d.substring(1,_7e);
_80=_7d.substring(_7e+1);
}else{
_7f=_7d.substring(1);
}
return objj_msgSend(_CPCollectionKVCOperator,"performOperation:withCollection:propertyPath:",_7f,_7b,_80);
}else{
var _81=[],_82=objj_msgSend(_7b,"objectEnumerator"),_83;
while((_83=objj_msgSend(_82,"nextObject"))!==nil){
var _84=objj_msgSend(_83,"valueForKeyPath:",_7d);
if(_84===nil||_84===undefined){
_84=objj_msgSend(CPNull,"null");
}
_81.push(_84);
}
return _81;
}
}
}),new objj_method(sel_getUid("setValue:forKey:"),function(_85,_86,_87,_88){
with(_85){
var _89=objj_msgSend(_85,"objectEnumerator"),_8a;
while((_8a=objj_msgSend(_89,"nextObject"))!==nil){
objj_msgSend(_8a,"setValue:forKey:",_87,_88);
}
}
}),new objj_method(sel_getUid("setValue:forKeyPath:"),function(_8b,_8c,_8d,_8e){
with(_8b){
var _8f=objj_msgSend(_8b,"objectEnumerator"),_90;
while((_90=objj_msgSend(_8f,"nextObject"))!==nil){
objj_msgSend(_90,"setValue:forKeyPath:",_8d,_8e);
}
}
})]);
var _1=objj_getClass("CPArray");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"CPArray\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("addObserver:toObjectsAtIndexes:forKeyPath:options:context:"),function(_91,_92,_93,_94,_95,_96,_97){
with(_91){
var _98=objj_msgSend(_94,"firstIndex");
while(_98>=0){
objj_msgSend(_91[_98],"addObserver:forKeyPath:options:context:",_93,_95,_96,_97);
_98=objj_msgSend(_94,"indexGreaterThanIndex:",_98);
}
}
}),new objj_method(sel_getUid("removeObserver:fromObjectsAtIndexes:forKeyPath:"),function(_99,_9a,_9b,_9c,_9d){
with(_99){
var _9e=objj_msgSend(_9c,"firstIndex");
while(_9e>=0){
objj_msgSend(_99[_9e],"removeObserver:forKeyPath:",_9b,_9d);
_9e=objj_msgSend(_9c,"indexGreaterThanIndex:",_9e);
}
}
})]);
p;27;_CPCollectionKVCOperators.jt;2360;@STATIC;1.0;t;2341;
var _1=objj_allocateClassPair(CPObject,"_CPCollectionKVCOperator"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_2,[new objj_method(sel_getUid("performOperation:withCollection:propertyPath:"),function(_3,_4,_5,_6,_7){
with(_3){
var _8=CPSelectorFromString(_5+"ForCollection:propertyPath:");
if(!objj_msgSend(_3,"respondsToSelector:",_8)){
return objj_msgSend(_6,"valueForUndefinedKey:","@"+_5);
}
return objj_msgSend(_3,"performSelector:withObject:withObject:",_8,_6,_7);
}
}),new objj_method(sel_getUid("avgForCollection:propertyPath:"),function(_9,_a,_b,_c){
with(_9){
if(!_c){
return objj_msgSend(_b,"valueForUndefinedKey:","@avg");
}
var _d=objj_msgSend(_b,"valueForKeyPath:",_c),_e=0,_f=objj_msgSend(_d,"objectEnumerator"),_10;
while((_10=objj_msgSend(_f,"nextObject"))!==nil){
_e+=objj_msgSend(_10,"doubleValue");
}
return _e/objj_msgSend(_d,"count");
}
}),new objj_method(sel_getUid("minForCollection:propertyPath:"),function(_11,_12,_13,_14){
with(_11){
if(!_14){
return objj_msgSend(_13,"valueForUndefinedKey:","@min");
}
var _15=objj_msgSend(_13,"valueForKeyPath:",_14);
if(objj_msgSend(_15,"count")===0){
return nil;
}
var _16=objj_msgSend(_15,"objectEnumerator"),min=objj_msgSend(_16,"nextObject"),_17;
while((_17=objj_msgSend(_16,"nextObject"))!==nil){
if(objj_msgSend(min,"compare:",_17)>0){
min=_17;
}
}
return min;
}
}),new objj_method(sel_getUid("maxForCollection:propertyPath:"),function(_18,_19,_1a,_1b){
with(_18){
if(!_1b){
return objj_msgSend(_1a,"valueForUndefinedKey:","@max");
}
var _1c=objj_msgSend(_1a,"valueForKeyPath:",_1b);
if(objj_msgSend(_1c,"count")===0){
return nil;
}
var _1d=objj_msgSend(_1c,"objectEnumerator"),max=objj_msgSend(_1d,"nextObject"),_1e;
while((_1e=objj_msgSend(_1d,"nextObject"))!==nil){
if(objj_msgSend(max,"compare:",_1e)<0){
max=_1e;
}
}
return max;
}
}),new objj_method(sel_getUid("sumForCollection:propertyPath:"),function(_1f,_20,_21,_22){
with(_1f){
if(!_22){
return objj_msgSend(_21,"valueForUndefinedKey:","@sum");
}
var _23=objj_msgSend(_21,"valueForKeyPath:",_22),sum=0,_24=objj_msgSend(_23,"objectEnumerator"),_25;
while((_25=objj_msgSend(_24,"nextObject"))!==nil){
sum+=objj_msgSend(_25,"doubleValue");
}
return sum;
}
}),new objj_method(sel_getUid("countForCollection:propertyPath:"),function(_26,_27,_28,_29){
with(_26){
return objj_msgSend(_28,"count");
}
})]);
p;11;CPSet+KVO.jt;10888;@STATIC;1.0;i;13;CPException.ji;10;CPObject.ji;7;CPSet.ji;27;_CPCollectionKVCOperators.jt;10792;
objj_executeFile("CPException.j",YES);
objj_executeFile("CPObject.j",YES);
objj_executeFile("CPSet.j",YES);
objj_executeFile("_CPCollectionKVCOperators.j",YES);
var _1=objj_getClass("CPObject");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"CPObject\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("mutableSetValueForKey:"),function(_3,_4,_5){
with(_3){
return objj_msgSend(objj_msgSend(_CPKVCSet,"alloc"),"initWithKey:forProxyObject:",_5,_3);
}
}),new objj_method(sel_getUid("mutableSetValueForKeyPath:"),function(_6,_7,_8){
with(_6){
var _9=_8.indexOf(".");
if(_9<0){
return objj_msgSend(_6,"mutableSetValueForKey:",_8);
}
var _a=_8.substring(0,_9),_b=_8.substring(_9+1);
return objj_msgSend(objj_msgSend(_6,"valueForKeyPath:",_a),"mutableSetValueForKeyPath:",_b);
}
})]);
var _1=objj_allocateClassPair(CPMutableSet,"_CPKVCSet"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_proxyObject"),new objj_ivar("_key"),new objj_ivar("_accessSEL"),new objj_ivar("_access"),new objj_ivar("_setSEL"),new objj_ivar("_set"),new objj_ivar("_countSEL"),new objj_ivar("_count"),new objj_ivar("_enumeratorSEL"),new objj_ivar("_enumerator"),new objj_ivar("_memberSEL"),new objj_ivar("_member"),new objj_ivar("_addSEL"),new objj_ivar("_add"),new objj_ivar("_addManySEL"),new objj_ivar("_addMany"),new objj_ivar("_removeSEL"),new objj_ivar("_remove"),new objj_ivar("_removeManySEL"),new objj_ivar("_removeMany"),new objj_ivar("_intersectSEL"),new objj_ivar("_intersect")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initWithKey:forProxyObject:"),function(_c,_d,_e,_f){
with(_c){
_c=objj_msgSendSuper({receiver:_c,super_class:objj_getClass("_CPKVCSet").super_class},"init");
_key=_e;
_proxyObject=_f;
var _10=_key.charAt(0).toUpperCase()+_key.substring(1);
_accessSEL=sel_getName(_key);
if(objj_msgSend(_proxyObject,"respondsToSelector:",_accessSEL)){
_access=objj_msgSend(_proxyObject,"methodForSelector:",_accessSEL);
}
_setSEL=sel_getName("set"+_10+":");
if(objj_msgSend(_proxyObject,"respondsToSelector:",_setSEL)){
_set=objj_msgSend(_proxyObject,"methodForSelector:",_setSEL);
}
_countSEL=sel_getName("countOf"+_10);
if(objj_msgSend(_proxyObject,"respondsToSelector:",_countSEL)){
_count=objj_msgSend(_proxyObject,"methodForSelector:",_countSEL);
}
_enumeratorSEL=sel_getName("enumeratorOf"+_10);
if(objj_msgSend(_proxyObject,"respondsToSelector:",_enumeratorSEL)){
_enumerator=objj_msgSend(_proxyObject,"methodForSelector:",_enumeratorSEL);
}
_memberSEL=sel_getName("memberOf"+_10+":");
if(objj_msgSend(_proxyObject,"respondsToSelector:",_memberSEL)){
_member=objj_msgSend(_proxyObject,"methodForSelector:",_memberSEL);
}
_addSEL=sel_getName("add"+_10+"Object:");
if(objj_msgSend(_proxyObject,"respondsToSelector:",_addSEL)){
_add=objj_msgSend(_proxyObject,"methodForSelector:",_addSEL);
}
_addManySEL=sel_getName("add"+_10+":");
if(objj_msgSend(_proxyObject,"respondsToSelector:",_addManySEL)){
_addMany=objj_msgSend(_proxyObject,"methodForSelector:",_addManySEL);
}
_removeSEL=sel_getName("remove"+_10+"Object:");
if(objj_msgSend(_proxyObject,"respondsToSelector:",_removeSEL)){
_remove=objj_msgSend(_proxyObject,"methodForSelector:",_removeSEL);
}
_removeManySEL=sel_getName("remove"+_10+":");
if(objj_msgSend(_proxyObject,"respondsToSelector:",_removeManySEL)){
_removeMany=objj_msgSend(_proxyObject,"methodForSelector:",_removeManySEL);
}
_intersectSEL=sel_getName("intersect"+_10+":");
if(objj_msgSend(_proxyObject,"respondsToSelector:",_intersectSEL)){
_intersect=objj_msgSend(_proxyObject,"methodForSelector:",_intersectSEL);
}
return _c;
}
}),new objj_method(sel_getUid("_representedObject"),function(_11,_12){
with(_11){
if(_access){
return _access(_proxyObject,_accessSEL);
}
return objj_msgSend(_proxyObject,"valueForKey:",_key);
}
}),new objj_method(sel_getUid("_setRepresentedObject:"),function(_13,_14,_15){
with(_13){
if(_set){
return _set(_proxyObject,_setSEL,_15);
}
objj_msgSend(_proxyObject,"setValue:forKey:",_15,_key);
}
}),new objj_method(sel_getUid("count"),function(_16,_17){
with(_16){
if(_count){
return _count(_proxyObject,_countSEL);
}
return objj_msgSend(objj_msgSend(_16,"_representedObject"),"count");
}
}),new objj_method(sel_getUid("objectEnumerator"),function(_18,_19){
with(_18){
if(_enumerator){
return _enumerator(_proxyObject,_enumeratorSEL);
}
return objj_msgSend(objj_msgSend(_18,"_representedObject"),"objectEnumerator");
}
}),new objj_method(sel_getUid("member:"),function(_1a,_1b,_1c){
with(_1a){
if(_member){
return _member(_proxyObject,_memberSEL,_1c);
}
return objj_msgSend(objj_msgSend(_1a,"_representedObject"),"member:",_1c);
}
}),new objj_method(sel_getUid("addObject:"),function(_1d,_1e,_1f){
with(_1d){
if(_add){
_add(_proxyObject,_addSEL,_1f);
}else{
if(_addMany){
var _20=objj_msgSend(CPSet,"setWithObject:",_1f);
_addMany(_proxyObject,_addManySEL,_20);
}else{
var _21=objj_msgSend(objj_msgSend(_1d,"_representedObject"),"copy");
objj_msgSend(_21,"addObject:",_1f);
objj_msgSend(_1d,"_setRepresentedObject:",_21);
}
}
}
}),new objj_method(sel_getUid("addObjectsFromArray:"),function(_22,_23,_24){
with(_22){
if(_addMany){
var _25=objj_msgSend(CPSet,"setWithArray:",_24);
_addMany(_proxyObject,_addManySEL,_25);
}else{
if(_add){
var _26,_27=objj_msgSend(_24,"objectEnumerator");
while((_26=objj_msgSend(_27,"nextObject"))!==nil){
_add(_proxyObject,_addSEL,_26);
}
}else{
var _28=objj_msgSend(objj_msgSend(_22,"_representedObject"),"copy");
objj_msgSend(_28,"addObjectsFromArray:",_24);
objj_msgSend(_22,"_setRepresentedObject:",_28);
}
}
}
}),new objj_method(sel_getUid("unionSet:"),function(_29,_2a,_2b){
with(_29){
if(_addMany){
_addMany(_proxyObject,_addManySEL,_2b);
}else{
if(_add){
var _2c,_2d=objj_msgSend(_2b,"objectEnumerator");
while((_2c=objj_msgSend(_2d,"nextObject"))!==nil){
_add(_proxyObject,_addSEL,_2c);
}
}else{
var _2e=objj_msgSend(objj_msgSend(_29,"_representedObject"),"copy");
objj_msgSend(_2e,"unionSet:",_2b);
objj_msgSend(_29,"_setRepresentedObject:",_2e);
}
}
}
}),new objj_method(sel_getUid("removeObject:"),function(_2f,_30,_31){
with(_2f){
if(_remove){
_remove(_proxyObject,_removeSEL,_31);
}else{
if(_removeMany){
var _32=objj_msgSend(CPSet,"setWithObject:",_31);
_removeMany(_proxyObject,_removeManySEL,_32);
}else{
var _33=objj_msgSend(objj_msgSend(_2f,"_representedObject"),"copy");
objj_msgSend(_33,"removeObject:",_31);
objj_msgSend(_2f,"_setRepresentedObject:",_33);
}
}
}
}),new objj_method(sel_getUid("minusSet:"),function(_34,_35,_36){
with(_34){
if(_removeMany){
_removeMany(_proxyObject,_removeManySEL,_36);
}else{
if(_remove){
var _37,_38=objj_msgSend(_36,"objectEnumerator");
while((_37=objj_msgSend(_38,"nextObject"))!==nil){
_remove(_proxyObject,_removeSEL,_37);
}
}else{
var _39=objj_msgSend(objj_msgSend(_34,"_representedObject"),"copy");
objj_msgSend(_39,"minusSet:",_36);
objj_msgSend(_34,"_setRepresentedObject:",_39);
}
}
}
}),new objj_method(sel_getUid("removeObjectsInArray:"),function(_3a,_3b,_3c){
with(_3a){
if(_removeMany){
var _3d=objj_msgSend(CPSet,"setWithArray:",_3c);
_removeMany(_proxyObject,_removeManySEL,_3d);
}else{
if(_remove){
var _3e,_3f=objj_msgSend(_3c,"objectEnumerator");
while((_3e=objj_msgSend(_3f,"nextObject"))!==nil){
_remove(_proxyObject,_removeSEL,_3e);
}
}else{
var _40=objj_msgSend(objj_msgSend(_3a,"_representedObject"),"copy");
objj_msgSend(_40,"removeObjectsInArray:",_3c);
objj_msgSend(_3a,"_setRepresentedObject:",_40);
}
}
}
}),new objj_method(sel_getUid("removeAllObjects"),function(_41,_42){
with(_41){
if(_removeMany){
var _43=objj_msgSend(objj_msgSend(_41,"_representedObject"),"copy");
_removeMany(_proxyObject,_removeManySEL,_43);
}else{
if(_remove){
var _44,_45=objj_msgSend(objj_msgSend(objj_msgSend(_41,"_representedObject"),"copy"),"objectEnumerator");
while((_44=objj_msgSend(_45,"nextObject"))!==nil){
_remove(_proxyObject,_removeSEL,_44);
}
}else{
var _46=objj_msgSend(objj_msgSend(_41,"_representedObject"),"copy");
objj_msgSend(_46,"removeAllObjects");
objj_msgSend(_41,"_setRepresentedObject:",_46);
}
}
}
}),new objj_method(sel_getUid("intersectSet:"),function(_47,_48,_49){
with(_47){
if(_intersect){
_intersect(_proxyObject,_intersectSEL,_49);
}else{
var _4a=objj_msgSend(objj_msgSend(_47,"_representedObject"),"copy");
objj_msgSend(_4a,"intersectSet:",_49);
objj_msgSend(_47,"_setRepresentedObject:",_4a);
}
}
}),new objj_method(sel_getUid("setSet:"),function(_4b,_4c,set){
with(_4b){
objj_msgSend(_4b,"_setRepresentedObject:",set);
}
}),new objj_method(sel_getUid("allObjects"),function(_4d,_4e){
with(_4d){
return objj_msgSend(objj_msgSend(_4d,"_representedObject"),"allObjects");
}
}),new objj_method(sel_getUid("anyObject"),function(_4f,_50){
with(_4f){
return objj_msgSend(objj_msgSend(_4f,"_representedObject"),"anyObject");
}
}),new objj_method(sel_getUid("containsObject:"),function(_51,_52,_53){
with(_51){
return objj_msgSend(objj_msgSend(_51,"_representedObject"),"containsObject:",_53);
}
}),new objj_method(sel_getUid("intersectsSet:"),function(_54,_55,_56){
with(_54){
return objj_msgSend(objj_msgSend(_54,"_representedObject"),"intersectsSet:",_56);
}
}),new objj_method(sel_getUid("isEqualToSet:"),function(_57,_58,_59){
with(_57){
return objj_msgSend(objj_msgSend(_57,"_representedObject"),"isEqualToSet:",_59);
}
}),new objj_method(sel_getUid("copy"),function(_5a,_5b){
with(_5a){
return objj_msgSend(objj_msgSend(_5a,"_representedObject"),"copy");
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("alloc"),function(_5c,_5d){
with(_5c){
var set=objj_msgSend(CPMutableSet,"set");
set.isa=_5c;
var _5e=class_copyIvarList(_5c),_5f=_5e.length;
while(_5f--){
set[ivar_getName(_5e[_5f])]=nil;
}
return set;
}
})]);
var _1=objj_getClass("CPSet");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"CPSet\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("valueForKeyPath:"),function(_60,_61,_62){
with(_60){
if(!_62){
objj_msgSend(_60,"valueForUndefinedKey:","<empty path>");
}
if(_62.charAt(0)==="@"){
var _63=_62.indexOf("."),_64,_65;
if(_63!==-1){
_64=_62.substring(1,_63);
_65=_62.substring(_63+1);
}else{
_64=_62.substring(1);
}
return objj_msgSend(_CPCollectionKVCOperator,"performOperation:withCollection:propertyPath:",_64,_60,_65);
}else{
var _66=objj_msgSend(CPSet,"set"),_67,_68,_69=objj_msgSend(_60,"objectEnumerator");
while((_67=objj_msgSend(_69,"nextObject"))!==nil){
_68=objj_msgSend(_67,"valueForKeyPath:",_62);
if(_68===nil||_68===undefined){
_68=objj_msgSend(CPNull,"null");
}
objj_msgSend(_66,"addObject:",_68);
}
return _66;
}
}
}),new objj_method(sel_getUid("setValue:forKey:"),function(_6a,_6b,_6c,_6d){
with(_6a){
var _6e,_6f=objj_msgSend(_6a,"objectEnumerator");
while((_6e=objj_msgSend(_6f,"nextObject"))!==nil){
objj_msgSend(_6e,"setValue:forKey:",_6c,_6d);
}
}
})]);
p;11;CPRunLoop.jt;6981;@STATIC;1.0;i;9;CPArray.ji;8;CPDate.ji;10;CPObject.ji;10;CPString.jt;6907;
objj_executeFile("CPArray.j",YES);
objj_executeFile("CPDate.j",YES);
objj_executeFile("CPObject.j",YES);
objj_executeFile("CPString.j",YES);
CPDefaultRunLoopMode="CPDefaultRunLoopMode";
_CPRunLoopPerformCompare=function(_1,_2){
return objj_msgSend(_2,"order")-objj_msgSend(_1,"order");
};
var _3=[],_4=5;
var _5=objj_allocateClassPair(CPObject,"_CPRunLoopPerform"),_6=_5.isa;
class_addIvars(_5,[new objj_ivar("_target"),new objj_ivar("_selector"),new objj_ivar("_argument"),new objj_ivar("_order"),new objj_ivar("_runLoopModes"),new objj_ivar("_isValid")]);
objj_registerClassPair(_5);
class_addMethods(_5,[new objj_method(sel_getUid("initWithSelector:target:argument:order:modes:"),function(_7,_8,_9,_a,_b,_c,_d){
with(_7){
_7=objj_msgSendSuper({receiver:_7,super_class:objj_getClass("_CPRunLoopPerform").super_class},"init");
if(_7){
_selector=_9;
_target=_a;
_argument=_b;
_order=_c;
_runLoopModes=_d;
_isValid=YES;
}
return _7;
}
}),new objj_method(sel_getUid("selector"),function(_e,_f){
with(_e){
return _selector;
}
}),new objj_method(sel_getUid("target"),function(_10,_11){
with(_10){
return _target;
}
}),new objj_method(sel_getUid("argument"),function(_12,_13){
with(_12){
return _argument;
}
}),new objj_method(sel_getUid("order"),function(_14,_15){
with(_14){
return _order;
}
}),new objj_method(sel_getUid("fireInMode:"),function(_16,_17,_18){
with(_16){
if(!_isValid){
return YES;
}
if(objj_msgSend(_runLoopModes,"containsObject:",_18)){
objj_msgSend(_target,"performSelector:withObject:",_selector,_argument);
return YES;
}
return NO;
}
}),new objj_method(sel_getUid("invalidate"),function(_19,_1a){
with(_19){
_isValid=NO;
}
})]);
class_addMethods(_6,[new objj_method(sel_getUid("_poolPerform:"),function(_1b,_1c,_1d){
with(_1b){
if(!_1d||_3.length>=_4){
return;
}
_3.push(_1d);
}
}),new objj_method(sel_getUid("performWithSelector:target:argument:order:modes:"),function(_1e,_1f,_20,_21,_22,_23,_24){
with(_1e){
if(_3.length){
var _25=_3.pop();
_25._target=_21;
_25._selector=_20;
_25._argument=_22;
_25._order=_23;
_25._runLoopModes=_24;
_25._isValid=YES;
return _25;
}
return objj_msgSend(objj_msgSend(_1e,"alloc"),"initWithSelector:target:argument:order:modes:",_20,_21,_22,_23,_24);
}
})]);
var _26=0;
var _5=objj_allocateClassPair(CPObject,"CPRunLoop"),_6=_5.isa;
class_addIvars(_5,[new objj_ivar("_runLoopLock"),new objj_ivar("_timersForModes"),new objj_ivar("_nativeTimersForModes"),new objj_ivar("_nextTimerFireDatesForModes"),new objj_ivar("_didAddTimer"),new objj_ivar("_effectiveDate"),new objj_ivar("_orderedPerforms"),new objj_ivar("_runLoopInsuranceTimer")]);
objj_registerClassPair(_5);
class_addMethods(_5,[new objj_method(sel_getUid("init"),function(_27,_28){
with(_27){
_27=objj_msgSendSuper({receiver:_27,super_class:objj_getClass("CPRunLoop").super_class},"init");
if(_27){
_orderedPerforms=[];
_timersForModes={};
_nativeTimersForModes={};
_nextTimerFireDatesForModes={};
}
return _27;
}
}),new objj_method(sel_getUid("performSelector:target:argument:order:modes:"),function(_29,_2a,_2b,_2c,_2d,_2e,_2f){
with(_29){
var _30=objj_msgSend(_CPRunLoopPerform,"performWithSelector:target:argument:order:modes:",_2b,_2c,_2d,_2e,_2f),_31=_orderedPerforms.length;
while(_31--){
if(_2e<objj_msgSend(_orderedPerforms[_31],"order")){
break;
}
}
_orderedPerforms.splice(_31+1,0,_30);
}
}),new objj_method(sel_getUid("cancelPerformSelector:target:argument:"),function(_32,_33,_34,_35,_36){
with(_32){
var _37=_orderedPerforms.length;
while(_37--){
var _38=_orderedPerforms[_37];
if(objj_msgSend(_38,"selector")===_34&&objj_msgSend(_38,"target")==_35&&objj_msgSend(_38,"argument")==_36){
objj_msgSend(_orderedPerforms[_37],"invalidate");
}
}
}
}),new objj_method(sel_getUid("performSelectors"),function(_39,_3a){
with(_39){
objj_msgSend(_39,"limitDateForMode:",CPDefaultRunLoopMode);
}
}),new objj_method(sel_getUid("addTimer:forMode:"),function(_3b,_3c,_3d,_3e){
with(_3b){
if(_timersForModes[_3e]){
_timersForModes[_3e].push(_3d);
}else{
_timersForModes[_3e]=[_3d];
}
_didAddTimer=YES;
if(!_3d._lastNativeRunLoopsForModes){
_3d._lastNativeRunLoopsForModes={};
}
_3d._lastNativeRunLoopsForModes[_3e]=_26;
if(objj_msgSend(CFBundle.environments(),"indexOfObject:",("Browser"))!==CPNotFound){
if(!_runLoopInsuranceTimer){
_runLoopInsuranceTimer=window.setNativeTimeout(function(){
objj_msgSend(_3b,"limitDateForMode:",CPDefaultRunLoopMode);
},0);
}
}
}
}),new objj_method(sel_getUid("limitDateForMode:"),function(_3f,_40,_41){
with(_3f){
if(_runLoopLock){
return;
}
_runLoopLock=YES;
if(objj_msgSend(CFBundle.environments(),"indexOfObject:",("Browser"))!==CPNotFound){
if(_runLoopInsuranceTimer){
window.clearNativeTimeout(_runLoopInsuranceTimer);
_runLoopInsuranceTimer=nil;
}
}
var now=_effectiveDate?objj_msgSend(_effectiveDate,"laterDate:",objj_msgSend(CPDate,"date")):objj_msgSend(CPDate,"date"),_42=nil,_43=_nextTimerFireDatesForModes[_41];
if(_didAddTimer||_43&&_43<=now){
_didAddTimer=NO;
if(_nativeTimersForModes[_41]!==nil){
window.clearNativeTimeout(_nativeTimersForModes[_41]);
_nativeTimersForModes[_41]=nil;
}
var _44=_timersForModes[_41],_45=_44.length;
_timersForModes[_41]=nil;
while(_45--){
var _46=_44[_45];
if(_46._lastNativeRunLoopsForModes[_41]<_26&&_46._isValid&&_46._fireDate<=now){
objj_msgSend(_46,"fire");
}
if(_46._isValid){
_42=(_42===nil)?_46._fireDate:objj_msgSend(_42,"earlierDate:",_46._fireDate);
}else{
_46._lastNativeRunLoopsForModes[_41]=0;
_44.splice(_45,1);
}
}
var _47=_timersForModes[_41];
if(_47&&_47.length){
_45=_47.length;
while(_45--){
var _46=_47[_45];
if(objj_msgSend(_46,"isValid")){
_42=(_42===nil)?_46._fireDate:objj_msgSend(_42,"earlierDate:",_46._fireDate);
}else{
_47.splice(_45,1);
}
}
_timersForModes[_41]=_47.concat(_44);
}else{
_timersForModes[_41]=_44;
}
_nextTimerFireDatesForModes[_41]=_42;
if(_nextTimerFireDatesForModes[_41]!==nil){
_nativeTimersForModes[_41]=window.setNativeTimeout(function(){
_effectiveDate=_42;
_nativeTimersForModes[_41]=nil;
++_26;
objj_msgSend(_3f,"limitDateForMode:",_41);
_effectiveDate=nil;
},MAX(0,objj_msgSend(_42,"timeIntervalSinceNow")*1000));
}
}
var _48=_orderedPerforms,_45=_48.length;
_orderedPerforms=[];
while(_45--){
var _49=_48[_45];
if(objj_msgSend(_49,"fireInMode:",CPDefaultRunLoopMode)){
objj_msgSend(_CPRunLoopPerform,"_poolPerform:",_49);
_48.splice(_45,1);
}
}
if(_orderedPerforms.length){
_orderedPerforms=_orderedPerforms.concat(_48);
_orderedPerforms.sort(_CPRunLoopPerformCompare);
}else{
_orderedPerforms=_48;
}
_runLoopLock=NO;
return _42;
}
})]);
class_addMethods(_6,[new objj_method(sel_getUid("initialize"),function(_4a,_4b){
with(_4a){
if(_4a!=objj_msgSend(CPRunLoop,"class")){
return;
}
CPMainRunLoop=objj_msgSend(objj_msgSend(CPRunLoop,"alloc"),"init");
}
}),new objj_method(sel_getUid("currentRunLoop"),function(_4c,_4d){
with(_4c){
return CPMainRunLoop;
}
}),new objj_method(sel_getUid("mainRunLoop"),function(_4e,_4f){
with(_4e){
return CPMainRunLoop;
}
})]);
p;8;CPDate.jt;5957;@STATIC;1.0;i;10;CPObject.ji;10;CPString.ji;13;CPException.jt;5890;
objj_executeFile("CPObject.j",YES);
objj_executeFile("CPString.j",YES);
objj_executeFile("CPException.j",YES);
var _1=new Date(Date.UTC(2001,0,1,0,0,0,0));
var _2=objj_allocateClassPair(CPObject,"CPDate"),_3=_2.isa;
objj_registerClassPair(_2);
class_addMethods(_2,[new objj_method(sel_getUid("initWithTimeIntervalSinceNow:"),function(_4,_5,_6){
with(_4){
_4=new Date((new Date()).getTime()+_6*1000);
return _4;
}
}),new objj_method(sel_getUid("initWithTimeIntervalSince1970:"),function(_7,_8,_9){
with(_7){
_7=new Date(_9*1000);
return _7;
}
}),new objj_method(sel_getUid("initWithTimeIntervalSinceReferenceDate:"),function(_a,_b,_c){
with(_a){
_a=objj_msgSend(_a,"initWithTimeInterval:sinceDate:",_c,_1);
return _a;
}
}),new objj_method(sel_getUid("initWithTimeInterval:sinceDate:"),function(_d,_e,_f,_10){
with(_d){
_d=new Date(_10.getTime()+_f*1000);
return _d;
}
}),new objj_method(sel_getUid("initWithString:"),function(_11,_12,_13){
with(_11){
var _14=/(\d{4})-(\d{2})-(\d{2}) (\d{2}):(\d{2}):(\d{2}) ([-+])(\d{2})(\d{2})/,d=_13.match(new RegExp(_14));
if(!d||d.length!=10){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,"initWithString: the string must be in YYYY-MM-DD HH:MM:SS ±HHMM format");
}
var _15=new Date(d[1],d[2]-1,d[3]),_16=(Number(d[8])*60+Number(d[9]))*(d[7]==="-"?1:-1);
_15.setHours(d[4]);
_15.setMinutes(d[5]);
_15.setSeconds(d[6]);
_11=new Date(_15.getTime()+(_16-_15.getTimezoneOffset())*60*1000);
return _11;
}
}),new objj_method(sel_getUid("timeIntervalSinceDate:"),function(_17,_18,_19){
with(_17){
return (_17.getTime()-_19.getTime())/1000;
}
}),new objj_method(sel_getUid("timeIntervalSinceNow"),function(_1a,_1b){
with(_1a){
return objj_msgSend(_1a,"timeIntervalSinceDate:",objj_msgSend(CPDate,"date"));
}
}),new objj_method(sel_getUid("timeIntervalSince1970"),function(_1c,_1d){
with(_1c){
return _1c.getTime()/1000;
}
}),new objj_method(sel_getUid("timeIntervalSinceReferenceDate"),function(_1e,_1f){
with(_1e){
return (_1e.getTime()-_1.getTime())/1000;
}
}),new objj_method(sel_getUid("isEqual:"),function(_20,_21,_22){
with(_20){
if(_20===_22){
return YES;
}
if(!_22||!objj_msgSend(_22,"isKindOfClass:",objj_msgSend(CPDate,"class"))){
return NO;
}
return objj_msgSend(_20,"isEqualToDate:",_22);
}
}),new objj_method(sel_getUid("isEqualToDate:"),function(_23,_24,_25){
with(_23){
if(!_25){
return NO;
}
return !(_23<_25||_23>_25);
}
}),new objj_method(sel_getUid("compare:"),function(_26,_27,_28){
with(_26){
return (_26>_28)?CPOrderedDescending:((_26<_28)?CPOrderedAscending:CPOrderedSame);
}
}),new objj_method(sel_getUid("earlierDate:"),function(_29,_2a,_2b){
with(_29){
return (_29<_2b)?_29:_2b;
}
}),new objj_method(sel_getUid("laterDate:"),function(_2c,_2d,_2e){
with(_2c){
return (_2c>_2e)?_2c:_2e;
}
}),new objj_method(sel_getUid("description"),function(_2f,_30){
with(_2f){
return objj_msgSend(CPString,"stringWithFormat:","%04d-%02d-%02d %02d:%02d:%02d %s",_2f.getFullYear(),_2f.getMonth()+1,_2f.getDate(),_2f.getHours(),_2f.getMinutes(),_2f.getSeconds(),objj_msgSend(CPDate,"timezoneOffsetString:",_2f.getTimezoneOffset()));
}
}),new objj_method(sel_getUid("copy"),function(_31,_32){
with(_31){
return new Date(_31.getTime());
}
})]);
class_addMethods(_3,[new objj_method(sel_getUid("alloc"),function(_33,_34){
with(_33){
var _35=new Date;
_35.isa=objj_msgSend(_33,"class");
return _35;
}
}),new objj_method(sel_getUid("date"),function(_36,_37){
with(_36){
return objj_msgSend(objj_msgSend(_36,"alloc"),"init");
}
}),new objj_method(sel_getUid("dateWithTimeIntervalSinceNow:"),function(_38,_39,_3a){
with(_38){
return objj_msgSend(objj_msgSend(CPDate,"alloc"),"initWithTimeIntervalSinceNow:",_3a);
}
}),new objj_method(sel_getUid("dateWithTimeIntervalSince1970:"),function(_3b,_3c,_3d){
with(_3b){
return objj_msgSend(objj_msgSend(CPDate,"alloc"),"initWithTimeIntervalSince1970:",_3d);
}
}),new objj_method(sel_getUid("dateWithTimeIntervalSinceReferenceDate:"),function(_3e,_3f,_40){
with(_3e){
return objj_msgSend(objj_msgSend(CPDate,"alloc"),"initWithTimeIntervalSinceReferenceDate:",_40);
}
}),new objj_method(sel_getUid("distantPast"),function(_41,_42){
with(_41){
return objj_msgSend(CPDate,"dateWithTimeIntervalSinceReferenceDate:",-63113817600);
}
}),new objj_method(sel_getUid("distantFuture"),function(_43,_44){
with(_43){
return objj_msgSend(CPDate,"dateWithTimeIntervalSinceReferenceDate:",63113990400);
}
}),new objj_method(sel_getUid("timeIntervalSinceReferenceDate"),function(_45,_46){
with(_45){
return objj_msgSend(objj_msgSend(CPDate,"date"),"timeIntervalSinceReferenceDate");
}
}),new objj_method(sel_getUid("timezoneOffsetString:"),function(_47,_48,_49){
with(_47){
var _4a=-_49,_4b=_4a>=0,_4c=_4b?FLOOR(_4a/60):CEIL(_4a/60),_4d=_4a-_4c*60;
return objj_msgSend(CPString,"stringWithFormat:","%s%02d%02d",_4b?"+":"-",ABS(_4c),ABS(_4d));
}
})]);
var _4e="CPDateTimeKey";
var _2=objj_getClass("CPDate");
if(!_2){
throw new SyntaxError("*** Could not find definition for class \"CPDate\"");
}
var _3=_2.isa;
class_addMethods(_2,[new objj_method(sel_getUid("initWithCoder:"),function(_4f,_50,_51){
with(_4f){
if(_4f){
_4f.setTime(objj_msgSend(_51,"decodeIntForKey:",_4e));
}
return _4f;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_52,_53,_54){
with(_52){
objj_msgSend(_54,"encodeInt:forKey:",_52.getTime(),_4e);
}
})]);
var _55=[1,4,5,6,7,10,11];
Date.parseISO8601=function(_56){
var _57,_58,_59=0;
_57=Date.parse(_56);
if(isNaN(_57)&&(_58=/^(\d{4}|[+\-]\d{6})(?:-(\d{2})(?:-(\d{2}))?)?(?:T(\d{2}):(\d{2})(?::(\d{2})(?:\.(\d{3}))?)?(?:(Z)|([+\-])(\d{2})(?::(\d{2}))?)?)?$/.exec(_56))){
for(var i=0,k;(k=_55[i]);++i){
_58[k]=+_58[k]||0;
}
_58[2]=(+_58[2]||1)-1;
_58[3]=+_58[3]||1;
if(_58[8]!=="Z"&&_58[9]!==undefined){
_59=_58[10]*60+_58[11];
if(_58[9]==="+"){
_59=0-_59;
}
}
return Date.UTC(_58[1],_58[2],_58[3],_58[4],_58[5]+_59,_58[6],_58[7]);
}
return _57;
};
Date.prototype.isa=CPDate;
p;9;CPTimer.jt;5564;@STATIC;1.0;i;8;CPDate.ji;14;CPInvocation.ji;10;CPObject.ji;11;CPRunLoop.jt;5483;
objj_executeFile("CPDate.j",YES);
objj_executeFile("CPInvocation.j",YES);
objj_executeFile("CPObject.j",YES);
objj_executeFile("CPRunLoop.j",YES);
var _1=objj_allocateClassPair(CPObject,"CPTimer"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_timeInterval"),new objj_ivar("_invocation"),new objj_ivar("_callback"),new objj_ivar("_repeats"),new objj_ivar("_isValid"),new objj_ivar("_fireDate"),new objj_ivar("_userInfo")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initWithFireDate:interval:invocation:repeats:"),function(_3,_4,_5,_6,_7,_8){
with(_3){
_3=objj_msgSendSuper({receiver:_3,super_class:objj_getClass("CPTimer").super_class},"init");
if(_3){
_timeInterval=_6;
_invocation=_7;
_repeats=_8;
_isValid=YES;
_fireDate=_5;
}
return _3;
}
}),new objj_method(sel_getUid("initWithFireDate:interval:target:selector:userInfo:repeats:"),function(_9,_a,_b,_c,_d,_e,_f,_10){
with(_9){
var _11=objj_msgSend(CPInvocation,"invocationWithMethodSignature:",1);
objj_msgSend(_11,"setTarget:",_d);
objj_msgSend(_11,"setSelector:",_e);
objj_msgSend(_11,"setArgument:atIndex:",_9,2);
_9=objj_msgSend(_9,"initWithFireDate:interval:invocation:repeats:",_b,_c,_11,_10);
if(_9){
_userInfo=_f;
}
return _9;
}
}),new objj_method(sel_getUid("initWithFireDate:interval:callback:repeats:"),function(_12,_13,_14,_15,_16,_17){
with(_12){
_12=objj_msgSendSuper({receiver:_12,super_class:objj_getClass("CPTimer").super_class},"init");
if(_12){
_timeInterval=_15;
_callback=_16;
_repeats=_17;
_isValid=YES;
_fireDate=_14;
}
return _12;
}
}),new objj_method(sel_getUid("timeInterval"),function(_18,_19){
with(_18){
return _timeInterval;
}
}),new objj_method(sel_getUid("fireDate"),function(_1a,_1b){
with(_1a){
return _fireDate;
}
}),new objj_method(sel_getUid("setFireDate:"),function(_1c,_1d,_1e){
with(_1c){
_fireDate=_1e;
}
}),new objj_method(sel_getUid("fire"),function(_1f,_20){
with(_1f){
if(!_isValid){
return;
}
if(_callback){
_callback();
}else{
objj_msgSend(_invocation,"invoke");
}
if(!_isValid){
return;
}
if(_repeats){
_fireDate=objj_msgSend(CPDate,"dateWithTimeIntervalSinceNow:",_timeInterval);
}else{
objj_msgSend(_1f,"invalidate");
}
}
}),new objj_method(sel_getUid("isValid"),function(_21,_22){
with(_21){
return _isValid;
}
}),new objj_method(sel_getUid("invalidate"),function(_23,_24){
with(_23){
_isValid=NO;
_userInfo=nil;
_invocation=nil;
_callback=nil;
}
}),new objj_method(sel_getUid("userInfo"),function(_25,_26){
with(_25){
return _userInfo;
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("scheduledTimerWithTimeInterval:invocation:repeats:"),function(_27,_28,_29,_2a,_2b){
with(_27){
var _2c=objj_msgSend(objj_msgSend(_27,"alloc"),"initWithFireDate:interval:invocation:repeats:",objj_msgSend(CPDate,"dateWithTimeIntervalSinceNow:",_29),_29,_2a,_2b);
objj_msgSend(objj_msgSend(CPRunLoop,"currentRunLoop"),"addTimer:forMode:",_2c,CPDefaultRunLoopMode);
return _2c;
}
}),new objj_method(sel_getUid("scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:"),function(_2d,_2e,_2f,_30,_31,_32,_33){
with(_2d){
var _34=objj_msgSend(objj_msgSend(_2d,"alloc"),"initWithFireDate:interval:target:selector:userInfo:repeats:",objj_msgSend(CPDate,"dateWithTimeIntervalSinceNow:",_2f),_2f,_30,_31,_32,_33);
objj_msgSend(objj_msgSend(CPRunLoop,"currentRunLoop"),"addTimer:forMode:",_34,CPDefaultRunLoopMode);
return _34;
}
}),new objj_method(sel_getUid("scheduledTimerWithTimeInterval:callback:repeats:"),function(_35,_36,_37,_38,_39){
with(_35){
var _3a=objj_msgSend(objj_msgSend(_35,"alloc"),"initWithFireDate:interval:callback:repeats:",objj_msgSend(CPDate,"dateWithTimeIntervalSinceNow:",_37),_37,_38,_39);
objj_msgSend(objj_msgSend(CPRunLoop,"currentRunLoop"),"addTimer:forMode:",_3a,CPDefaultRunLoopMode);
return _3a;
}
}),new objj_method(sel_getUid("timerWithTimeInterval:invocation:repeats:"),function(_3b,_3c,_3d,_3e,_3f){
with(_3b){
return objj_msgSend(objj_msgSend(_3b,"alloc"),"initWithFireDate:interval:invocation:repeats:",objj_msgSend(CPDate,"dateWithTimeIntervalSinceNow:",_3d),_3d,_3e,_3f);
}
}),new objj_method(sel_getUid("timerWithTimeInterval:target:selector:userInfo:repeats:"),function(_40,_41,_42,_43,_44,_45,_46){
with(_40){
return objj_msgSend(objj_msgSend(_40,"alloc"),"initWithFireDate:interval:target:selector:userInfo:repeats:",objj_msgSend(CPDate,"dateWithTimeIntervalSinceNow:",_42),_42,_43,_44,_45,_46);
}
}),new objj_method(sel_getUid("timerWithTimeInterval:callback:repeats:"),function(_47,_48,_49,_4a,_4b){
with(_47){
return objj_msgSend(objj_msgSend(_47,"alloc"),"initWithFireDate:interval:callback:repeats:",objj_msgSend(CPDate,"dateWithTimeIntervalSinceNow:",_49),_49,_4a,_4b);
}
})]);
var _4c=1000,_4d={};
var _4e=function(_4f,_50,_51,_52){
var _53=_4c++,_54=nil;
if(typeof _4f==="string"){
_54=function(){
new Function(_4f)();
if(!_51){
_4d[_53]=nil;
}
};
}else{
if(!_52){
_52=[];
}
_54=function(){
_4f.apply(window,_52);
if(!_51){
_4d[_53]=nil;
}
};
}
_4d[_53]=objj_msgSend(CPTimer,"scheduledTimerWithTimeInterval:callback:repeats:",_50/1000,_54,_51);
return _53;
};
if(typeof (window)!=="undefined"){
window.setTimeout=function(_55,_56){
return _4e(_55,_56,NO,Array.prototype.slice.apply(arguments,[2]));
};
window.clearTimeout=function(_57){
var _58=_4d[_57];
if(_58){
objj_msgSend(_58,"invalidate");
}
_4d[_57]=nil;
};
window.setInterval=function(_59,_5a,_5b){
return _4e(_59,_5a,YES,Array.prototype.slice.apply(arguments,[2]));
};
window.clearInterval=function(_5c){
window.clearTimeout(_5c);
};
}
p;19;CPKeyedUnarchiver.jt;8619;@STATIC;1.0;i;9;CPArray.ji;9;CPCoder.ji;8;CPData.ji;14;CPDictionary.ji;13;CPException.ji;17;CPKeyedArchiver.ji;8;CPNull.ji;10;CPNumber.ji;10;CPString.jt;8461;
objj_executeFile("CPArray.j",YES);
objj_executeFile("CPCoder.j",YES);
objj_executeFile("CPData.j",YES);
objj_executeFile("CPDictionary.j",YES);
objj_executeFile("CPException.j",YES);
objj_executeFile("CPKeyedArchiver.j",YES);
objj_executeFile("CPNull.j",YES);
objj_executeFile("CPNumber.j",YES);
objj_executeFile("CPString.j",YES);
CPInvalidUnarchiveOperationException="CPInvalidUnarchiveOperationException";
var _1=1<<0,_2=1<<1,_3=1<<2,_4=1<<3,_5=1<<4,_6=1<<5;
var _7="$null",_8="CP$UID",_9="$top",_a="$objects",_b="$archiver",_c="$version",_d="$classname",_e="$classes",_f="$class";
var _10=Nil,_11=Nil,_12=Nil,_13=Nil,_14=Nil,_15=Nil,_16=Nil,_17=Nil;
var _18=objj_allocateClassPair(CPCoder,"CPKeyedUnarchiver"),_19=_18.isa;
class_addIvars(_18,[new objj_ivar("_delegate"),new objj_ivar("_delegateSelectors"),new objj_ivar("_data"),new objj_ivar("_replacementClasses"),new objj_ivar("_objects"),new objj_ivar("_archive"),new objj_ivar("_plistObject"),new objj_ivar("_plistObjects")]);
objj_registerClassPair(_18);
class_addMethods(_18,[new objj_method(sel_getUid("initForReadingWithData:"),function(_1a,_1b,_1c){
with(_1a){
_1a=objj_msgSendSuper({receiver:_1a,super_class:objj_getClass("CPKeyedUnarchiver").super_class},"init");
if(_1a){
_archive=objj_msgSend(_1c,"plistObject");
_objects=[objj_msgSend(CPNull,"null")];
_plistObject=objj_msgSend(_archive,"objectForKey:",_9);
_plistObjects=objj_msgSend(_archive,"objectForKey:",_a);
_replacementClasses=new CFMutableDictionary();
}
return _1a;
}
}),new objj_method(sel_getUid("containsValueForKey:"),function(_1d,_1e,_1f){
with(_1d){
return _plistObject.valueForKey(_1f)!=nil;
}
}),new objj_method(sel_getUid("_decodeDictionaryOfObjectsForKey:"),function(_20,_21,_22){
with(_20){
var _23=_plistObject.valueForKey(_22),_24=(_23!=nil)&&_23.isa;
if(_24===_13||_24===_14){
var _25=_23.keys(),_26=0,_27=_25.length,_28=new CFMutableDictionary();
for(;_26<_27;++_26){
var key=_25[_26];
_28.setValueForKey(key,_29(_20,_23.valueForKey(key).valueForKey(_8)));
}
return _28;
}
return nil;
}
}),new objj_method(sel_getUid("decodeBoolForKey:"),function(_2a,_2b,_2c){
with(_2a){
return !!objj_msgSend(_2a,"decodeObjectForKey:",_2c);
}
}),new objj_method(sel_getUid("decodeFloatForKey:"),function(_2d,_2e,_2f){
with(_2d){
var f=objj_msgSend(_2d,"decodeObjectForKey:",_2f);
return f===nil?0:f;
}
}),new objj_method(sel_getUid("decodeDoubleForKey:"),function(_30,_31,_32){
with(_30){
var d=objj_msgSend(_30,"decodeObjectForKey:",_32);
return d===nil?0:d;
}
}),new objj_method(sel_getUid("decodeIntForKey:"),function(_33,_34,_35){
with(_33){
var i=objj_msgSend(_33,"decodeObjectForKey:",_35);
return i===nil?0:i;
}
}),new objj_method(sel_getUid("decodePointForKey:"),function(_36,_37,_38){
with(_36){
var _39=objj_msgSend(_36,"decodeObjectForKey:",_38);
if(_39){
return CGPointFromString(_39);
}else{
return CGPointMakeZero();
}
}
}),new objj_method(sel_getUid("decodeRectForKey:"),function(_3a,_3b,_3c){
with(_3a){
var _3d=objj_msgSend(_3a,"decodeObjectForKey:",_3c);
if(_3d){
return CGRectFromString(_3d);
}else{
return CGRectMakeZero();
}
}
}),new objj_method(sel_getUid("decodeSizeForKey:"),function(_3e,_3f,_40){
with(_3e){
var _41=objj_msgSend(_3e,"decodeObjectForKey:",_40);
if(_41){
return CGSizeFromString(_41);
}else{
return CGSizeMakeZero();
}
}
}),new objj_method(sel_getUid("decodeObjectForKey:"),function(_42,_43,_44){
with(_42){
var _45=_plistObject.valueForKey(_44),_46=(_45!=nil)&&_45.isa;
if(_46===_13||_46===_14){
return _29(_42,_45.valueForKey(_8));
}else{
if(_46===_15||_46===_16||_46===_12){
return _45;
}else{
if(_46===_CPJavaScriptArray){
var _47=0,_48=_45.length,_49=[];
for(;_47<_48;++_47){
_49[_47]=_29(_42,_45[_47].valueForKey(_8));
}
return _49;
}
}
}
return nil;
}
}),new objj_method(sel_getUid("decodeBytesForKey:"),function(_4a,_4b,_4c){
with(_4a){
var _4d=objj_msgSend(_4a,"decodeObjectForKey:",_4c);
if(!_4d){
return nil;
}
var _4e=_4d.isa;
if(_4e===_16){
return _4d.bytes();
}
return nil;
}
}),new objj_method(sel_getUid("finishDecoding"),function(_4f,_50){
with(_4f){
if(_delegateSelectors&_4){
objj_msgSend(_delegate,"unarchiverWillFinish:",_4f);
}
if(_delegateSelectors&_5){
objj_msgSend(_delegate,"unarchiverDidFinish:",_4f);
}
}
}),new objj_method(sel_getUid("delegate"),function(_51,_52){
with(_51){
return _delegate;
}
}),new objj_method(sel_getUid("setDelegate:"),function(_53,_54,_55){
with(_53){
_delegate=_55;
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("unarchiver:cannotDecodeObjectOfClassName:originalClasses:"))){
_delegateSelectors|=_1;
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("unarchiver:didDecodeObject:"))){
_delegateSelectors|=_2;
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("unarchiver:willReplaceObject:withObject:"))){
_delegateSelectors|=_3;
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("unarchiverWillFinish:"))){
_delegateSelectors|=_CPKeyedUnarchiverWilFinishSelector;
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("unarchiverDidFinish:"))){
_delegateSelectors|=_5;
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("unarchiver:cannotDecodeObjectOfClassName:originalClasses:"))){
_delegateSelectors|=_6;
}
}
}),new objj_method(sel_getUid("setClass:forClassName:"),function(_56,_57,_58,_59){
with(_56){
_replacementClasses.setValueForKey(_59,_58);
}
}),new objj_method(sel_getUid("classForClassName:"),function(_5a,_5b,_5c){
with(_5a){
return _replacementClasses.valueForKey(_5c);
}
}),new objj_method(sel_getUid("allowsKeyedCoding"),function(_5d,_5e){
with(_5d){
return YES;
}
})]);
class_addMethods(_19,[new objj_method(sel_getUid("initialize"),function(_5f,_60){
with(_5f){
if(_5f!==objj_msgSend(CPKeyedUnarchiver,"class")){
return;
}
_10=objj_msgSend(CPArray,"class");
_11=objj_msgSend(CPMutableArray,"class");
_12=objj_msgSend(CPString,"class");
_13=objj_msgSend(CPDictionary,"class");
_14=objj_msgSend(CPMutableDictionary,"class");
_15=objj_msgSend(CPNumber,"class");
_16=objj_msgSend(CPData,"class");
_17=objj_msgSend(_CPKeyedArchiverValue,"class");
}
}),new objj_method(sel_getUid("unarchiveObjectWithData:"),function(_61,_62,_63){
with(_61){
if(!_63){
CPLog.error("Null data passed to -[CPKeyedUnarchiver unarchiveObjectWithData:].");
return nil;
}
var _64=objj_msgSend(objj_msgSend(_61,"alloc"),"initForReadingWithData:",_63),_65=objj_msgSend(_64,"decodeObjectForKey:","root");
objj_msgSend(_64,"finishDecoding");
return _65;
}
}),new objj_method(sel_getUid("unarchiveObjectWithFile:"),function(_66,_67,_68){
with(_66){
}
}),new objj_method(sel_getUid("unarchiveObjectWithFile:asynchronously:"),function(_69,_6a,_6b,_6c){
with(_69){
}
})]);
var _29=function(_6d,_6e){
var _6f=_6d._objects[_6e];
if(_6f){
if(_6f===_6d._objects[0]){
return nil;
}
}else{
var _70=_6d._plistObjects[_6e],_71=_70.isa;
if(_71===_13||_71===_14){
var _72=_6d._plistObjects[_70.valueForKey(_f).valueForKey(_8)],_73=_72.valueForKey(_d),_74=_72.valueForKey(_e),_75=objj_msgSend(_6d,"classForClassName:",_73);
if(!_75){
_75=CPClassFromString(_73);
}
if(!_75&&(_6d._delegateSelectors&_6)){
_75=objj_msgSend(_delegate,"unarchiver:cannotDecodeObjectOfClassName:originalClasses:",_6d,_73,_74);
}
if(!_75){
objj_msgSend(CPException,"raise:reason:",CPInvalidUnarchiveOperationException,"-[CPKeyedUnarchiver decodeObjectForKey:]: cannot decode object of class ("+_73+")");
}
var _76=_6d._plistObject;
_6d._plistObject=_70;
_6f=objj_msgSend(_75,"allocWithCoder:",_6d);
_6d._objects[_6e]=_6f;
var _77=objj_msgSend(_6f,"initWithCoder:",_6d);
_6d._plistObject=_76;
if(_77!==_6f){
if(_6d._delegateSelectors&_3){
objj_msgSend(_6d._delegate,"unarchiver:willReplaceObject:withObject:",_6d,_6f,_77);
}
_6f=_77;
_6d._objects[_6e]=_77;
}
_77=objj_msgSend(_6f,"awakeAfterUsingCoder:",_6d);
if(_77!==_6f){
if(_6d._delegateSelectors&_3){
objj_msgSend(_6d._delegate,"unarchiver:willReplaceObject:withObject:",_6d,_6f,_77);
}
_6f=_77;
_6d._objects[_6e]=_77;
}
if(_6d._delegate){
if(_6d._delegateSelectors&_2){
_77=objj_msgSend(_6d._delegate,"unarchiver:didDecodeObject:",_6d,_6f);
}
if(_77&&_77!=_6f){
if(_6d._delegateSelectors&_3){
objj_msgSend(_6d._delegate,"unarchiver:willReplaceObject:withObject:",_6d,_6f,_77);
}
_6f=_77;
_6d._objects[_6e]=_77;
}
}
}else{
_6d._objects[_6e]=_6f=_70;
if(objj_msgSend(_6f,"class")===_12){
if(_6f===_7){
_6d._objects[_6e]=_6d._objects[0];
return nil;
}else{
_6d._objects[_6e]=_6f=_70;
}
}
}
}
if((_6f!=nil)&&(_6f.isa===_17)){
_6f=objj_msgSend(_6f,"JSObject");
}
return _6f;
};
p;17;CPKeyedArchiver.jt;10270;@STATIC;1.0;i;9;CPArray.ji;9;CPCoder.ji;8;CPData.ji;14;CPDictionary.ji;10;CPNumber.ji;10;CPString.ji;9;CPValue.jt;10150;
objj_executeFile("CPArray.j",YES);
objj_executeFile("CPCoder.j",YES);
objj_executeFile("CPData.j",YES);
objj_executeFile("CPDictionary.j",YES);
objj_executeFile("CPNumber.j",YES);
objj_executeFile("CPString.j",YES);
objj_executeFile("CPValue.j",YES);
var _1=nil;
var _2=1,_3=2,_4=4,_5=8,_6=16;
var _7="$null",_8=nil,_9="CP$UID",_a="$top",_b="$objects",_c="$archiver",_d="$version",_e="$classname",_f="$classes",_10="$class";
var _11=Nil,_12=Nil;
var _13=objj_allocateClassPair(CPValue,"_CPKeyedArchiverValue"),_14=_13.isa;
objj_registerClassPair(_13);
var _13=objj_allocateClassPair(CPCoder,"CPKeyedArchiver"),_14=_13.isa;
class_addIvars(_13,[new objj_ivar("_delegate"),new objj_ivar("_delegateSelectors"),new objj_ivar("_data"),new objj_ivar("_objects"),new objj_ivar("_UIDs"),new objj_ivar("_conditionalUIDs"),new objj_ivar("_replacementObjects"),new objj_ivar("_replacementClassNames"),new objj_ivar("_plistObject"),new objj_ivar("_plistObjects"),new objj_ivar("_outputFormat")]);
objj_registerClassPair(_13);
class_addMethods(_13,[new objj_method(sel_getUid("initForWritingWithMutableData:"),function(_15,_16,_17){
with(_15){
_15=objj_msgSendSuper({receiver:_15,super_class:objj_getClass("CPKeyedArchiver").super_class},"init");
if(_15){
_data=_17;
_objects=[];
_UIDs=objj_msgSend(CPDictionary,"dictionary");
_conditionalUIDs=objj_msgSend(CPDictionary,"dictionary");
_replacementObjects=objj_msgSend(CPDictionary,"dictionary");
_data=_17;
_plistObject=objj_msgSend(CPDictionary,"dictionary");
_plistObjects=objj_msgSend(CPArray,"arrayWithObject:",_7);
}
return _15;
}
}),new objj_method(sel_getUid("finishEncoding"),function(_18,_19){
with(_18){
if(_delegate&&_delegateSelectors&_6){
objj_msgSend(_delegate,"archiverWillFinish:",_18);
}
var i=0,_1a=_plistObject,_1b=[];
for(;i<_objects.length;++i){
var _1c=_objects[i];
_plistObject=_plistObjects[objj_msgSend(_UIDs,"objectForKey:",objj_msgSend(_1c,"UID"))];
objj_msgSend(_1c,"encodeWithCoder:",_18);
if(_delegate&&_delegateSelectors&_2){
objj_msgSend(_delegate,"archiver:didEncodeObject:",_18,_1c);
}
}
_plistObject=objj_msgSend(CPDictionary,"dictionary");
objj_msgSend(_plistObject,"setObject:forKey:",_1a,_a);
objj_msgSend(_plistObject,"setObject:forKey:",_plistObjects,_b);
objj_msgSend(_plistObject,"setObject:forKey:",objj_msgSend(_18,"className"),_c);
objj_msgSend(_plistObject,"setObject:forKey:","100000",_d);
objj_msgSend(_data,"setPlistObject:",_plistObject);
if(_delegate&&_delegateSelectors&_5){
objj_msgSend(_delegate,"archiverDidFinish:",_18);
}
}
}),new objj_method(sel_getUid("outputFormat"),function(_1d,_1e){
with(_1d){
return _outputFormat;
}
}),new objj_method(sel_getUid("setOutputFormat:"),function(_1f,_20,_21){
with(_1f){
_outputFormat=_21;
}
}),new objj_method(sel_getUid("encodeBool:forKey:"),function(_22,_23,_24,_25){
with(_22){
objj_msgSend(_plistObject,"setObject:forKey:",_26(_22,_24,NO),_25);
}
}),new objj_method(sel_getUid("encodeDouble:forKey:"),function(_27,_28,_29,_2a){
with(_27){
objj_msgSend(_plistObject,"setObject:forKey:",_26(_27,_29,NO),_2a);
}
}),new objj_method(sel_getUid("encodeFloat:forKey:"),function(_2b,_2c,_2d,_2e){
with(_2b){
objj_msgSend(_plistObject,"setObject:forKey:",_26(_2b,_2d,NO),_2e);
}
}),new objj_method(sel_getUid("encodeInt:forKey:"),function(_2f,_30,_31,_32){
with(_2f){
objj_msgSend(_plistObject,"setObject:forKey:",_26(_2f,_31,NO),_32);
}
}),new objj_method(sel_getUid("setDelegate:"),function(_33,_34,_35){
with(_33){
_delegate=_35;
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("archiver:didEncodeObject:"))){
_delegateSelectors|=_2;
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("archiver:willEncodeObject:"))){
_delegateSelectors|=_3;
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("archiver:willReplaceObject:withObject:"))){
_delegateSelectors|=_4;
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("archiver:didFinishEncoding:"))){
_delegateSelectors|=_CPKeyedArchiverDidFinishEncodingSelector;
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("archiver:willFinishEncoding:"))){
_delegateSelectors|=_CPKeyedArchiverWillFinishEncodingSelector;
}
}
}),new objj_method(sel_getUid("delegate"),function(_36,_37){
with(_36){
return _delegate;
}
}),new objj_method(sel_getUid("encodePoint:forKey:"),function(_38,_39,_3a,_3b){
with(_38){
objj_msgSend(_plistObject,"setObject:forKey:",_26(_38,CPStringFromPoint(_3a),NO),_3b);
}
}),new objj_method(sel_getUid("encodeRect:forKey:"),function(_3c,_3d,_3e,_3f){
with(_3c){
objj_msgSend(_plistObject,"setObject:forKey:",_26(_3c,CPStringFromRect(_3e),NO),_3f);
}
}),new objj_method(sel_getUid("encodeSize:forKey:"),function(_40,_41,_42,_43){
with(_40){
objj_msgSend(_plistObject,"setObject:forKey:",_26(_40,CPStringFromSize(_42),NO),_43);
}
}),new objj_method(sel_getUid("encodeConditionalObject:forKey:"),function(_44,_45,_46,_47){
with(_44){
objj_msgSend(_plistObject,"setObject:forKey:",_26(_44,_46,YES),_47);
}
}),new objj_method(sel_getUid("encodeNumber:forKey:"),function(_48,_49,_4a,_4b){
with(_48){
objj_msgSend(_plistObject,"setObject:forKey:",_26(_48,_4a,NO),_4b);
}
}),new objj_method(sel_getUid("encodeObject:forKey:"),function(_4c,_4d,_4e,_4f){
with(_4c){
objj_msgSend(_plistObject,"setObject:forKey:",_26(_4c,_4e,NO),_4f);
}
}),new objj_method(sel_getUid("_encodeArrayOfObjects:forKey:"),function(_50,_51,_52,_53){
with(_50){
var i=0,_54=_52.length,_55=[];
for(;i<_54;++i){
objj_msgSend(_55,"addObject:",_26(_50,_52[i],NO));
}
objj_msgSend(_plistObject,"setObject:forKey:",_55,_53);
}
}),new objj_method(sel_getUid("_encodeDictionaryOfObjects:forKey:"),function(_56,_57,_58,_59){
with(_56){
var key,_5a=objj_msgSend(_58,"keyEnumerator"),_5b=objj_msgSend(CPDictionary,"dictionary");
while((key=objj_msgSend(_5a,"nextObject"))!==nil){
objj_msgSend(_5b,"setObject:forKey:",_26(_56,objj_msgSend(_58,"objectForKey:",key),NO),key);
}
objj_msgSend(_plistObject,"setObject:forKey:",_5b,_59);
}
}),new objj_method(sel_getUid("setClassName:forClass:"),function(_5c,_5d,_5e,_5f){
with(_5c){
if(!_replacementClassNames){
_replacementClassNames=objj_msgSend(CPDictionary,"dictionary");
}
objj_msgSend(_replacementClassNames,"setObject:forKey:",_5e,CPStringFromClass(_5f));
}
}),new objj_method(sel_getUid("classNameForClass:"),function(_60,_61,_62){
with(_60){
if(!_replacementClassNames){
return _62.name;
}
var _63=objj_msgSend(_replacementClassNames,"objectForKey:",CPStringFromClass(aClassName));
return _63?_63:_62.name;
}
})]);
class_addMethods(_14,[new objj_method(sel_getUid("initialize"),function(_64,_65){
with(_64){
if(_64!=objj_msgSend(CPKeyedArchiver,"class")){
return;
}
_11=objj_msgSend(CPString,"class");
_12=objj_msgSend(CPNumber,"class");
_8=objj_msgSend(CPDictionary,"dictionaryWithObject:forKey:",0,_9);
}
}),new objj_method(sel_getUid("allowsKeyedCoding"),function(_66,_67){
with(_66){
return YES;
}
}),new objj_method(sel_getUid("archivedDataWithRootObject:"),function(_68,_69,_6a){
with(_68){
var _6b=objj_msgSend(CPData,"dataWithPlistObject:",nil),_6c=objj_msgSend(objj_msgSend(_68,"alloc"),"initForWritingWithMutableData:",_6b);
objj_msgSend(_6c,"encodeObject:forKey:",_6a,"root");
objj_msgSend(_6c,"finishEncoding");
return _6b;
}
}),new objj_method(sel_getUid("setClassName:forClass:"),function(_6d,_6e,_6f,_70){
with(_6d){
if(!_1){
_1=objj_msgSend(CPDictionary,"dictionary");
}
objj_msgSend(_1,"setObject:forKey:",_6f,CPStringFromClass(_70));
}
}),new objj_method(sel_getUid("classNameForClass:"),function(_71,_72,_73){
with(_71){
if(!_1){
return _73.name;
}
var _74=objj_msgSend(_1,"objectForKey:",CPStringFromClass(_73));
return _74?_74:_73.name;
}
})]);
var _26=function(_75,_76,_77){
if(_76!==nil&&_76!==undefined&&!_76.isa){
_76=objj_msgSend(_CPKeyedArchiverValue,"valueWithJSObject:",_76);
}
var _78=objj_msgSend(_76,"UID"),_79=objj_msgSend(_75._replacementObjects,"objectForKey:",_78);
if(_79===nil){
_79=objj_msgSend(_76,"replacementObjectForKeyedArchiver:",_75);
if(_75._delegate){
if(_79!==_76&&_75._delegateSelectors&_4){
objj_msgSend(_75._delegate,"archiver:willReplaceObject:withObject:",_75,_76,_79);
}
if(_75._delegateSelectors&_3){
_76=objj_msgSend(_75._delegate,"archiver:willEncodeObject:",_75,_79);
if(_76!==_79&&_75._delegateSelectors&_4){
objj_msgSend(_75._delegate,"archiver:willReplaceObject:withObject:",_75,_79,_76);
}
_79=_76;
}
}
objj_msgSend(_75._replacementObjects,"setObject:forKey:",_79,_78);
}
if(_79===nil){
return _8;
}
var UID=objj_msgSend(_75._UIDs,"objectForKey:",_78=objj_msgSend(_79,"UID"));
if(UID===nil){
if(_77){
if((UID=objj_msgSend(_75._conditionalUIDs,"objectForKey:",_78))===nil){
objj_msgSend(_75._conditionalUIDs,"setObject:forKey:",UID=objj_msgSend(_75._plistObjects,"count"),_78);
objj_msgSend(_75._plistObjects,"addObject:",_7);
}
}else{
var _7a=objj_msgSend(_79,"classForKeyedArchiver"),_7b=nil;
if((_7a===_11)||(_7a===_12)){
_7b=_79;
}else{
_7b=objj_msgSend(CPDictionary,"dictionary");
objj_msgSend(_75._objects,"addObject:",_79);
var _7c=objj_msgSend(_75,"classNameForClass:",_7a);
if(!_7c){
_7c=objj_msgSend(objj_msgSend(_75,"class"),"classNameForClass:",_7a);
}
if(!_7c){
_7c=_7a.name;
}else{
_7a=CPClassFromString(_7c);
}
var _7d=objj_msgSend(_75._UIDs,"objectForKey:",_7c);
if(!_7d){
var _7e=objj_msgSend(CPDictionary,"dictionary"),_7f=[];
objj_msgSend(_7e,"setObject:forKey:",_7c,_e);
do{
objj_msgSend(_7f,"addObject:",CPStringFromClass(_7a));
}while(_7a=objj_msgSend(_7a,"superclass"));
objj_msgSend(_7e,"setObject:forKey:",_7f,_f);
_7d=objj_msgSend(_75._plistObjects,"count");
objj_msgSend(_75._plistObjects,"addObject:",_7e);
objj_msgSend(_75._UIDs,"setObject:forKey:",_7d,_7c);
}
objj_msgSend(_7b,"setObject:forKey:",objj_msgSend(CPDictionary,"dictionaryWithObject:forKey:",_7d,_9),_10);
}
UID=objj_msgSend(_75._conditionalUIDs,"objectForKey:",_78);
if(UID!==nil){
objj_msgSend(_75._UIDs,"setObject:forKey:",UID,_78);
objj_msgSend(_75._plistObjects,"replaceObjectAtIndex:withObject:",UID,_7b);
}else{
objj_msgSend(_75._UIDs,"setObject:forKey:",UID=objj_msgSend(_75._plistObjects,"count"),_78);
objj_msgSend(_75._plistObjects,"addObject:",_7b);
}
}
}
return objj_msgSend(CPDictionary,"dictionaryWithObject:forKey:",UID,_9);
};
p;20;CPValueTransformer.jt;5085;@STATIC;1.0;i;8;CPData.ji;14;CPDictionary.ji;13;CPException.ji;17;CPKeyedArchiver.ji;19;CPKeyedUnarchiver.ji;10;CPNumber.ji;10;CPObject.jt;4941;
objj_executeFile("CPData.j",YES);
objj_executeFile("CPDictionary.j",YES);
objj_executeFile("CPException.j",YES);
objj_executeFile("CPKeyedArchiver.j",YES);
objj_executeFile("CPKeyedUnarchiver.j",YES);
objj_executeFile("CPNumber.j",YES);
objj_executeFile("CPObject.j",YES);
var _1=objj_msgSend(CPDictionary,"dictionary");
var _2=objj_allocateClassPair(CPObject,"CPValueTransformer"),_3=_2.isa;
objj_registerClassPair(_2);
class_addMethods(_2,[new objj_method(sel_getUid("reverseTransformedValue:"),function(_4,_5,_6){
with(_4){
if(!objj_msgSend(objj_msgSend(_4,"class"),"allowsReverseTransformation")){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,(_4+" is not reversible."));
}
return objj_msgSend(_4,"transformedValue:",_6);
}
}),new objj_method(sel_getUid("transformedValue:"),function(_7,_8,_9){
with(_7){
return nil;
}
})]);
class_addMethods(_3,[new objj_method(sel_getUid("initialize"),function(_a,_b){
with(_a){
if(_a!==objj_msgSend(CPValueTransformer,"class")){
return;
}
objj_msgSend(CPValueTransformer,"setValueTransformer:forName:",objj_msgSend(objj_msgSend(CPNegateBooleanTransformer,"alloc"),"init"),CPNegateBooleanTransformerName);
objj_msgSend(CPValueTransformer,"setValueTransformer:forName:",objj_msgSend(objj_msgSend(CPIsNilTransformer,"alloc"),"init"),CPIsNilTransformerName);
objj_msgSend(CPValueTransformer,"setValueTransformer:forName:",objj_msgSend(objj_msgSend(CPIsNotNilTransformer,"alloc"),"init"),CPIsNotNilTransformerName);
objj_msgSend(CPValueTransformer,"setValueTransformer:forName:",objj_msgSend(objj_msgSend(CPUnarchiveFromDataTransformer,"alloc"),"init"),CPUnarchiveFromDataTransformerName);
}
}),new objj_method(sel_getUid("setValueTransformer:forName:"),function(_c,_d,_e,_f){
with(_c){
objj_msgSend(_1,"setObject:forKey:",_e,_f);
}
}),new objj_method(sel_getUid("valueTransformerForName:"),function(_10,_11,_12){
with(_10){
return objj_msgSend(_1,"objectForKey:",_12);
}
}),new objj_method(sel_getUid("valueTransformerNames"),function(_13,_14){
with(_13){
return objj_msgSend(_1,"allKeys");
}
}),new objj_method(sel_getUid("allowsReverseTransformation"),function(_15,_16){
with(_15){
return NO;
}
}),new objj_method(sel_getUid("transformedValueClass"),function(_17,_18){
with(_17){
return objj_msgSend(CPObject,"class");
}
})]);
var _2=objj_allocateClassPair(CPValueTransformer,"CPNegateBooleanTransformer"),_3=_2.isa;
objj_registerClassPair(_2);
class_addMethods(_2,[new objj_method(sel_getUid("reverseTransformedValue:"),function(_19,_1a,_1b){
with(_19){
return !objj_msgSend(_1b,"boolValue");
}
}),new objj_method(sel_getUid("transformedValue:"),function(_1c,_1d,_1e){
with(_1c){
return !objj_msgSend(_1e,"boolValue");
}
})]);
class_addMethods(_3,[new objj_method(sel_getUid("allowsReverseTransformation"),function(_1f,_20){
with(_1f){
return YES;
}
}),new objj_method(sel_getUid("transformedValueClass"),function(_21,_22){
with(_21){
return objj_msgSend(CPNumber,"class");
}
})]);
var _2=objj_allocateClassPair(CPValueTransformer,"CPIsNilTransformer"),_3=_2.isa;
objj_registerClassPair(_2);
class_addMethods(_2,[new objj_method(sel_getUid("transformedValue:"),function(_23,_24,_25){
with(_23){
return _25===nil||_25===undefined;
}
})]);
class_addMethods(_3,[new objj_method(sel_getUid("allowsReverseTransformation"),function(_26,_27){
with(_26){
return NO;
}
}),new objj_method(sel_getUid("transformedValueClass"),function(_28,_29){
with(_28){
return objj_msgSend(CPNumber,"class");
}
})]);
var _2=objj_allocateClassPair(CPValueTransformer,"CPIsNotNilTransformer"),_3=_2.isa;
objj_registerClassPair(_2);
class_addMethods(_2,[new objj_method(sel_getUid("transformedValue:"),function(_2a,_2b,_2c){
with(_2a){
return _2c!==nil&&_2c!==undefined;
}
})]);
class_addMethods(_3,[new objj_method(sel_getUid("allowsReverseTransformation"),function(_2d,_2e){
with(_2d){
return NO;
}
}),new objj_method(sel_getUid("transformedValueClass"),function(_2f,_30){
with(_2f){
return objj_msgSend(CPNumber,"class");
}
})]);
var _2=objj_allocateClassPair(CPValueTransformer,"CPUnarchiveFromDataTransformer"),_3=_2.isa;
objj_registerClassPair(_2);
class_addMethods(_2,[new objj_method(sel_getUid("reverseTransformedValue:"),function(_31,_32,_33){
with(_31){
return objj_msgSend(CPKeyedArchiver,"archivedDataWithRootObject:",_33);
}
}),new objj_method(sel_getUid("transformedValue:"),function(_34,_35,_36){
with(_34){
return objj_msgSend(CPKeyedUnarchiver,"unarchiveObjectWithData:",_36);
}
})]);
class_addMethods(_3,[new objj_method(sel_getUid("allowsReverseTransformation"),function(_37,_38){
with(_37){
return YES;
}
}),new objj_method(sel_getUid("transformedValueClass"),function(_39,_3a){
with(_39){
return objj_msgSend(CPData,"class");
}
})]);
CPNegateBooleanTransformerName="CPNegateBoolean";
CPIsNilTransformerName="CPIsNil";
CPIsNotNilTransformerName="CPIsNotNil";
CPUnarchiveFromDataTransformerName="CPUnarchiveFromData";
CPKeyedUnarchiveFromDataTransformerName="CPKeyedUnarchiveFromData";
p;17;CPURLConnection.jt;5476;@STATIC;1.0;i;8;CPData.ji;10;CPObject.ji;11;CPRunLoop.ji;14;CPURLRequest.ji;15;CPURLResponse.jt;5375;
objj_executeFile("CPData.j",YES);
objj_executeFile("CPObject.j",YES);
objj_executeFile("CPRunLoop.j",YES);
objj_executeFile("CPURLRequest.j",YES);
objj_executeFile("CPURLResponse.j",YES);
var _1=nil;
var _2=objj_allocateClassPair(CPObject,"CPURLConnection"),_3=_2.isa;
class_addIvars(_2,[new objj_ivar("_request"),new objj_ivar("_delegate"),new objj_ivar("_isCanceled"),new objj_ivar("_isLocalFileConnection"),new objj_ivar("_HTTPRequest")]);
objj_registerClassPair(_2);
class_addMethods(_2,[new objj_method(sel_getUid("initWithRequest:delegate:startImmediately:"),function(_4,_5,_6,_7,_8){
with(_4){
_4=objj_msgSendSuper({receiver:_4,super_class:objj_getClass("CPURLConnection").super_class},"init");
if(_4){
_request=_6;
_delegate=_7;
_isCanceled=NO;
var _9=objj_msgSend(_request,"URL"),_a=objj_msgSend(_9,"scheme");
_isLocalFileConnection=_a==="file"||((_a==="http"||_a==="https:")&&window.location&&(window.location.protocol==="file:"||window.location.protocol==="app:"));
_HTTPRequest=new CFHTTPRequest();
if(_8){
objj_msgSend(_4,"start");
}
}
return _4;
}
}),new objj_method(sel_getUid("initWithRequest:delegate:"),function(_b,_c,_d,_e){
with(_b){
return objj_msgSend(_b,"initWithRequest:delegate:startImmediately:",_d,_e,YES);
}
}),new objj_method(sel_getUid("delegate"),function(_f,_10){
with(_f){
return _delegate;
}
}),new objj_method(sel_getUid("start"),function(_11,_12){
with(_11){
_isCanceled=NO;
try{
_HTTPRequest.open(objj_msgSend(_request,"HTTPMethod"),objj_msgSend(objj_msgSend(_request,"URL"),"absoluteString"),YES);
_HTTPRequest.onreadystatechange=function(){
objj_msgSend(_11,"_readyStateDidChange");
};
var _13=objj_msgSend(_request,"allHTTPHeaderFields"),key=nil,_14=objj_msgSend(_13,"keyEnumerator");
while((key=objj_msgSend(_14,"nextObject"))!==nil){
_HTTPRequest.setRequestHeader(key,objj_msgSend(_13,"objectForKey:",key));
}
_HTTPRequest.send(objj_msgSend(_request,"HTTPBody"));
}
catch(anException){
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("connection:didFailWithError:"))){
objj_msgSend(_delegate,"connection:didFailWithError:",_11,anException);
}
}
}
}),new objj_method(sel_getUid("cancel"),function(_15,_16){
with(_15){
_isCanceled=YES;
try{
_HTTPRequest.abort();
}
catch(anException){
}
}
}),new objj_method(sel_getUid("isLocalFileConnection"),function(_17,_18){
with(_17){
return _isLocalFileConnection;
}
}),new objj_method(sel_getUid("_readyStateDidChange"),function(_19,_1a){
with(_19){
if(_HTTPRequest.readyState()===CFHTTPRequest.CompleteState){
var _1b=_HTTPRequest.status(),URL=objj_msgSend(_request,"URL");
if(_1b===401&&objj_msgSend(_1,"respondsToSelector:",sel_getUid("connectionDidReceiveAuthenticationChallenge:"))){
objj_msgSend(_1,"connectionDidReceiveAuthenticationChallenge:",_19);
}else{
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("connection:didReceiveResponse:"))){
if(_isLocalFileConnection){
objj_msgSend(_delegate,"connection:didReceiveResponse:",_19,objj_msgSend(objj_msgSend(CPURLResponse,"alloc"),"initWithURL:",URL));
}else{
var _1c=objj_msgSend(objj_msgSend(CPHTTPURLResponse,"alloc"),"initWithURL:",URL);
objj_msgSend(_1c,"_setStatusCode:",_1b);
objj_msgSend(_delegate,"connection:didReceiveResponse:",_19,_1c);
}
}
if(!_isCanceled){
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("connection:didReceiveData:"))){
objj_msgSend(_delegate,"connection:didReceiveData:",_19,_HTTPRequest.responseText());
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("connectionDidFinishLoading:"))){
objj_msgSend(_delegate,"connectionDidFinishLoading:",_19);
}
}
}
}
objj_msgSend(objj_msgSend(CPRunLoop,"currentRunLoop"),"limitDateForMode:",CPDefaultRunLoopMode);
}
}),new objj_method(sel_getUid("_HTTPRequest"),function(_1d,_1e){
with(_1d){
return _HTTPRequest;
}
})]);
class_addMethods(_3,[new objj_method(sel_getUid("setClassDelegate:"),function(_1f,_20,_21){
with(_1f){
_1=_21;
}
}),new objj_method(sel_getUid("sendSynchronousRequest:returningResponse:"),function(_22,_23,_24,_25){
with(_22){
try{
var _26=new CFHTTPRequest();
_26.open(objj_msgSend(_24,"HTTPMethod"),objj_msgSend(objj_msgSend(_24,"URL"),"absoluteString"),NO);
var _27=objj_msgSend(_24,"allHTTPHeaderFields"),key=nil,_28=objj_msgSend(_27,"keyEnumerator");
while((key=objj_msgSend(_28,"nextObject"))!==nil){
_26.setRequestHeader(key,objj_msgSend(_27,"objectForKey:",key));
}
_26.send(objj_msgSend(_24,"HTTPBody"));
return objj_msgSend(CPData,"dataWithRawString:",_26.responseText());
}
catch(anException){
}
return nil;
}
}),new objj_method(sel_getUid("connectionWithRequest:delegate:"),function(_29,_2a,_2b,_2c){
with(_29){
return objj_msgSend(objj_msgSend(_29,"alloc"),"initWithRequest:delegate:",_2b,_2c);
}
})]);
var _2=objj_getClass("CPURLConnection");
if(!_2){
throw new SyntaxError("*** Could not find definition for class \"CPURLConnection\"");
}
var _3=_2.isa;
class_addMethods(_2,[new objj_method(sel_getUid("_XMLHTTPRequest"),function(_2d,_2e){
with(_2d){
_CPReportLenientDeprecation(_2d,_2e,sel_getUid("_HTTPRequest"));
return objj_msgSend(_2d,"_HTTPRequest");
}
})]);
class_addMethods(_3,[new objj_method(sel_getUid("sendSynchronousRequest:returningResponse:error:"),function(_2f,_30,_31,_32,_33){
with(_2f){
_CPReportLenientDeprecation(_2f,_30,sel_getUid("sendSynchronousRequest:returningResponse:"));
return objj_msgSend(_2f,"sendSynchronousRequest:returningResponse:",_31,_32);
}
})]);
p;14;CPURLRequest.jt;2337;@STATIC;1.0;i;14;CPDictionary.ji;10;CPObject.ji;10;CPString.ji;7;CPURL.jt;2258;
objj_executeFile("CPDictionary.j",YES);
objj_executeFile("CPObject.j",YES);
objj_executeFile("CPString.j",YES);
objj_executeFile("CPURL.j",YES);
var _1=objj_allocateClassPair(CPObject,"CPURLRequest"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_URL"),new objj_ivar("_HTTPBody"),new objj_ivar("_HTTPMethod"),new objj_ivar("_HTTPHeaderFields")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("init"),function(_3,_4){
with(_3){
return objj_msgSend(_3,"initWithURL:",nil);
}
}),new objj_method(sel_getUid("initWithURL:"),function(_5,_6,_7){
with(_5){
_5=objj_msgSendSuper({receiver:_5,super_class:objj_getClass("CPURLRequest").super_class},"init");
if(_5){
objj_msgSend(_5,"setURL:",_7);
_HTTPBody="";
_HTTPMethod="GET";
_HTTPHeaderFields=objj_msgSend(CPDictionary,"dictionary");
objj_msgSend(_5,"setValue:forHTTPHeaderField:","Thu, 01 Jan 1970 00:00:00 GMT","If-Modified-Since");
objj_msgSend(_5,"setValue:forHTTPHeaderField:","no-cache","Cache-Control");
objj_msgSend(_5,"setValue:forHTTPHeaderField:","XMLHttpRequest","X-Requested-With");
}
return _5;
}
}),new objj_method(sel_getUid("URL"),function(_8,_9){
with(_8){
return _URL;
}
}),new objj_method(sel_getUid("setURL:"),function(_a,_b,_c){
with(_a){
_URL=new CFURL(_c);
}
}),new objj_method(sel_getUid("setHTTPBody:"),function(_d,_e,_f){
with(_d){
_HTTPBody=_f;
}
}),new objj_method(sel_getUid("HTTPBody"),function(_10,_11){
with(_10){
return _HTTPBody;
}
}),new objj_method(sel_getUid("setHTTPMethod:"),function(_12,_13,_14){
with(_12){
_HTTPMethod=_14;
}
}),new objj_method(sel_getUid("HTTPMethod"),function(_15,_16){
with(_15){
return _HTTPMethod;
}
}),new objj_method(sel_getUid("allHTTPHeaderFields"),function(_17,_18){
with(_17){
return _HTTPHeaderFields;
}
}),new objj_method(sel_getUid("valueForHTTPHeaderField:"),function(_19,_1a,_1b){
with(_19){
return objj_msgSend(_HTTPHeaderFields,"objectForKey:",_1b);
}
}),new objj_method(sel_getUid("setValue:forHTTPHeaderField:"),function(_1c,_1d,_1e,_1f){
with(_1c){
objj_msgSend(_HTTPHeaderFields,"setObject:forKey:",_1e,_1f);
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("requestWithURL:"),function(_20,_21,_22){
with(_20){
return objj_msgSend(objj_msgSend(CPURLRequest,"alloc"),"initWithURL:",_22);
}
})]);
p;15;CPURLResponse.jt;932;@STATIC;1.0;i;10;CPObject.ji;7;CPURL.jt;888;
objj_executeFile("CPObject.j",YES);
objj_executeFile("CPURL.j",YES);
var _1=objj_allocateClassPair(CPObject,"CPURLResponse"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_URL")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initWithURL:"),function(_3,_4,_5){
with(_3){
_3=objj_msgSendSuper({receiver:_3,super_class:objj_getClass("CPURLResponse").super_class},"init");
if(_3){
_URL=_5;
}
return _3;
}
}),new objj_method(sel_getUid("URL"),function(_6,_7){
with(_6){
return _URL;
}
})]);
var _1=objj_allocateClassPair(CPURLResponse,"CPHTTPURLResponse"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_statusCode")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("_setStatusCode:"),function(_8,_9,_a){
with(_8){
_statusCode=_a;
}
}),new objj_method(sel_getUid("statusCode"),function(_b,_c){
with(_b){
return _statusCode;
}
})]);
p;16;CPUserDefaults.jt;14141;@STATIC;1.0;i;10;CPBundle.ji;8;CPData.ji;14;CPDictionary.ji;13;CPException.ji;17;CPKeyedArchiver.ji;19;CPKeyedUnarchiver.ji;22;CPNotificationCenter.ji;10;CPObject.ji;11;CPRunLoop.ji;10;CPString.ji;7;CPURL.ji;17;CPURLConnection.ji;14;CPURLRequest.jt;13886;
objj_executeFile("CPBundle.j",YES);
objj_executeFile("CPData.j",YES);
objj_executeFile("CPDictionary.j",YES);
objj_executeFile("CPException.j",YES);
objj_executeFile("CPKeyedArchiver.j",YES);
objj_executeFile("CPKeyedUnarchiver.j",YES);
objj_executeFile("CPNotificationCenter.j",YES);
objj_executeFile("CPObject.j",YES);
objj_executeFile("CPRunLoop.j",YES);
objj_executeFile("CPString.j",YES);
objj_executeFile("CPURL.j",YES);
objj_executeFile("CPURLConnection.j",YES);
objj_executeFile("CPURLRequest.j",YES);
CPArgumentDomain="CPArgumentDomain";
CPApplicationDomain=objj_msgSend(objj_msgSend(objj_msgSend(CPBundle,"mainBundle"),"infoDictionary"),"objectForKey:","CPBundleIdentifier")||"CPApplicationDomain";
CPGlobalDomain="CPGlobalDomain";
CPLocaleDomain="CPLocaleDomain";
CPRegistrationDomain="CPRegistrationDomain";
CPUserDefaultsDidChangeNotification="CPUserDefaultsDidChangeNotification";
var _1;
var _2=objj_allocateClassPair(CPObject,"CPUserDefaults"),_3=_2.isa;
class_addIvars(_2,[new objj_ivar("_domains"),new objj_ivar("_stores"),new objj_ivar("_searchList"),new objj_ivar("_searchListNeedsReload")]);
objj_registerClassPair(_2);
class_addMethods(_2,[new objj_method(sel_getUid("init"),function(_4,_5){
with(_4){
_4=objj_msgSendSuper({receiver:_4,super_class:objj_getClass("CPUserDefaults").super_class},"init");
if(_4){
_domains=objj_msgSend(CPDictionary,"dictionary");
objj_msgSend(_4,"_setupArgumentsDomain");
var _6=objj_msgSend(CPUserDefaultsLocalStore,"supportsLocalStorage")?CPUserDefaultsLocalStore:CPUserDefaultsCookieStore;
_stores=objj_msgSend(CPDictionary,"dictionary");
objj_msgSend(_4,"setPersistentStoreClass:forDomain:reloadData:",_6,CPGlobalDomain,YES);
objj_msgSend(_4,"setPersistentStoreClass:forDomain:reloadData:",_6,CPApplicationDomain,YES);
}
return _4;
}
}),new objj_method(sel_getUid("_setupArgumentsDomain"),function(_7,_8){
with(_7){
var _9=objj_msgSend(CPApp,"namedArguments"),_a=objj_msgSend(_9,"allKeys"),_b=objj_msgSend(_a,"count"),i=0;
for(;i<_b;i++){
var _c=_a[i];
objj_msgSend(_7,"setObject:forKey:inDomain:",objj_msgSend(_9,"objectForKey:",_c),_c,CPArgumentDomain);
}
}
}),new objj_method(sel_getUid("objectForKey:"),function(_d,_e,_f){
with(_d){
if(_searchListNeedsReload){
objj_msgSend(_d,"_reloadSearchList");
}
return objj_msgSend(_searchList,"objectForKey:",_f);
}
}),new objj_method(sel_getUid("setObject:forKey:"),function(_10,_11,_12,_13){
with(_10){
objj_msgSend(_10,"setObject:forKey:inDomain:",_12,_13,CPApplicationDomain);
}
}),new objj_method(sel_getUid("objectForKey:inDomain:"),function(_14,_15,_16,_17){
with(_14){
var _18=objj_msgSend(_domains,"objectForKey:",_17);
if(!_18){
return nil;
}
return objj_msgSend(_18,"objectForKey:",_16);
}
}),new objj_method(sel_getUid("setObject:forKey:inDomain:"),function(_19,_1a,_1b,_1c,_1d){
with(_19){
if(!_1c||!_1d){
return;
}
var _1e=objj_msgSend(_domains,"objectForKey:",_1d);
if(!_1e){
_1e=objj_msgSend(CPDictionary,"dictionary");
objj_msgSend(_domains,"setObject:forKey:",_1e,_1d);
}
objj_msgSend(_1e,"setObject:forKey:",_1b,_1c);
_searchListNeedsReload=YES;
objj_msgSend(_19,"domainDidChange:",_1d);
}
}),new objj_method(sel_getUid("removeObjectForKey:"),function(_1f,_20,_21){
with(_1f){
objj_msgSend(_1f,"removeObjectForKey:inDomain:",_21,CPApplicationDomain);
}
}),new objj_method(sel_getUid("removeObjectForKey:inDomain:"),function(_22,_23,_24,_25){
with(_22){
if(!_24||!_25){
return;
}
var _26=objj_msgSend(_domains,"objectForKey:",_25);
if(!_26){
return;
}
objj_msgSend(_26,"removeObjectForKey:",_24);
_searchListNeedsReload=YES;
objj_msgSend(_22,"domainDidChange:",_25);
}
}),new objj_method(sel_getUid("registerDefaults:"),function(_27,_28,_29){
with(_27){
var _2a=objj_msgSend(_29,"allKeys"),_2b=objj_msgSend(_2a,"count"),i=0;
for(;i<_2b;i++){
var key=_2a[i];
objj_msgSend(_27,"setObject:forKey:inDomain:",objj_msgSend(_29,"objectForKey:",key),key,CPRegistrationDomain);
}
}
}),new objj_method(sel_getUid("registerDefaultsFromContentsOfFile:"),function(_2c,_2d,_2e){
with(_2c){
var _2f=objj_msgSend(CPURLConnection,"sendSynchronousRequest:returningResponse:",objj_msgSend(CPURLRequest,"requestWithURL:",_2e),nil),_30=objj_msgSend(CPData,"dataWithRawString:",objj_msgSend(_2f,"rawString")),_31=objj_msgSend(_30,"plistObject");
objj_msgSend(_2c,"registerDefaults:",_31);
}
}),new objj_method(sel_getUid("_reloadSearchList"),function(_32,_33){
with(_32){
_searchListNeedsReload=NO;
var _34=[CPRegistrationDomain,CPGlobalDomain,CPApplicationDomain,CPArgumentDomain],_35=objj_msgSend(_34,"count"),i=0;
_searchList=objj_msgSend(CPDictionary,"dictionary");
for(;i<_35;i++){
var _36=objj_msgSend(_domains,"objectForKey:",_34[i]);
if(!_36){
continue;
}
var _37=objj_msgSend(_36,"allKeys"),_38=objj_msgSend(_37,"count"),j=0;
for(;j<_38;j++){
var key=_37[j];
objj_msgSend(_searchList,"setObject:forKey:",objj_msgSend(_36,"objectForKey:",key),key);
}
}
}
}),new objj_method(sel_getUid("volatileDomainNames"),function(_39,_3a){
with(_39){
return [CPArgumentDomain,CPLocaleDomain,CPRegistrationDomain];
}
}),new objj_method(sel_getUid("persistentDomainNames"),function(_3b,_3c){
with(_3b){
return [CPGlobalDomain,CPApplicationDomain];
}
}),new objj_method(sel_getUid("persistentStoreForDomain:"),function(_3d,_3e,_3f){
with(_3d){
return objj_msgSend(_stores,"objectForKey:",_3f);
}
}),new objj_method(sel_getUid("setPersistentStoreClass:forDomain:reloadData:"),function(_40,_41,_42,_43,_44){
with(_40){
var _45=objj_msgSend(_stores,"objectForKey:",_43);
if(_45&&objj_msgSend(_45,"class")===_42){
return _45;
}
var _46=objj_msgSend(objj_msgSend(_42,"alloc"),"init");
objj_msgSend(_46,"setDomain:",_43);
objj_msgSend(_stores,"setObject:forKey:",_46,_43);
if(_44){
objj_msgSend(_40,"reloadDataFromStoreForDomain:",_43);
}
return _46;
}
}),new objj_method(sel_getUid("reloadDataFromStoreForDomain:"),function(_47,_48,_49){
with(_47){
var _4a=objj_msgSend(objj_msgSend(_47,"persistentStoreForDomain:",_49),"data"),_4b=_4a?objj_msgSend(CPKeyedUnarchiver,"unarchiveObjectWithData:",_4a):nil;
objj_msgSend(_domains,"setObject:forKey:",_4b,_49);
_searchListNeedsReload=YES;
}
}),new objj_method(sel_getUid("domainDidChange:"),function(_4c,_4d,_4e){
with(_4c){
if(_4e===CPGlobalDomain||_4e===CPApplicationDomain){
objj_msgSend(objj_msgSend(CPRunLoop,"currentRunLoop"),"performSelector:target:argument:order:modes:",sel_getUid("synchronize"),_4c,nil,0,[CPDefaultRunLoopMode]);
}
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:",CPUserDefaultsDidChangeNotification,_4c);
}
}),new objj_method(sel_getUid("synchronize"),function(_4f,_50){
with(_4f){
var _51=objj_msgSend(_domains,"objectForKey:",CPGlobalDomain);
if(_51){
var _52=objj_msgSend(CPKeyedArchiver,"archivedDataWithRootObject:",_51);
objj_msgSend(objj_msgSend(_4f,"persistentStoreForDomain:",CPGlobalDomain),"setData:",_52);
}
var _53=objj_msgSend(_domains,"objectForKey:",CPApplicationDomain);
if(_53){
var _52=objj_msgSend(CPKeyedArchiver,"archivedDataWithRootObject:",_53);
objj_msgSend(objj_msgSend(_4f,"persistentStoreForDomain:",CPApplicationDomain),"setData:",_52);
}
}
}),new objj_method(sel_getUid("arrayForKey:"),function(_54,_55,_56){
with(_54){
var _57=objj_msgSend(_54,"objectForKey:",_56);
if(objj_msgSend(_57,"isKindOfClass:",CPArray)){
return _57;
}
return nil;
}
}),new objj_method(sel_getUid("boolForKey:"),function(_58,_59,_5a){
with(_58){
var _5b=objj_msgSend(_58,"objectForKey:",_5a);
if(objj_msgSend(_5b,"respondsToSelector:",sel_getUid("boolValue"))){
return objj_msgSend(_5b,"boolValue");
}
return NO;
}
}),new objj_method(sel_getUid("dataForKey:"),function(_5c,_5d,_5e){
with(_5c){
var _5f=objj_msgSend(_5c,"objectForKey:",_5e);
if(objj_msgSend(_5f,"isKindOfClass:",CPData)){
return _5f;
}
return nil;
}
}),new objj_method(sel_getUid("dictionaryForKey:"),function(_60,_61,_62){
with(_60){
var _63=objj_msgSend(_60,"objectForKey:",_62);
if(objj_msgSend(_63,"isKindOfClass:",CPDictionary)){
return _63;
}
return nil;
}
}),new objj_method(sel_getUid("floatForKey:"),function(_64,_65,_66){
with(_64){
var _67=objj_msgSend(_64,"objectForKey:",_66);
if(_67===nil){
return 0;
}
if(objj_msgSend(_67,"respondsToSelector:",sel_getUid("floatValue"))){
_67=objj_msgSend(_67,"floatValue");
}
return parseFloat(_67);
}
}),new objj_method(sel_getUid("integerForKey:"),function(_68,_69,_6a){
with(_68){
var _6b=objj_msgSend(_68,"objectForKey:",_6a);
if(_6b===nil){
return 0;
}
if(objj_msgSend(_6b,"respondsToSelector:",sel_getUid("intValue"))){
_6b=objj_msgSend(_6b,"intValue");
}
return parseInt(_6b);
}
}),new objj_method(sel_getUid("doubleForKey:"),function(_6c,_6d,_6e){
with(_6c){
return objj_msgSend(_6c,"floatForKey:",_6e);
}
}),new objj_method(sel_getUid("stringForKey:"),function(_6f,_70,_71){
with(_6f){
var _72=objj_msgSend(_6f,"objectForKey:",_71);
if(objj_msgSend(_72,"isKindOfClass:",CPString)){
return _72;
}else{
if(objj_msgSend(_72,"respondsToSelector:",sel_getUid("stringValue"))){
return objj_msgSend(_72,"stringValue");
}
}
return nil;
}
}),new objj_method(sel_getUid("stringArrayForKey:"),function(_73,_74,_75){
with(_73){
var _76=objj_msgSend(_73,"objectForKey:",_75);
if(!objj_msgSend(_76,"isKindOfClass:",CPArray)){
return nil;
}
for(var i=0,_77=objj_msgSend(_76,"count");i<_77;i++){
if(!objj_msgSend(_76[i],"isKindOfClass:",CPString)){
return nil;
}
}
return _76;
}
}),new objj_method(sel_getUid("URLForKey:"),function(_78,_79,_7a){
with(_78){
var _7b=objj_msgSend(_78,"objectForKey:",_7a);
if(objj_msgSend(_7b,"isKindOfClass:",CPURL)){
return _7b;
}
if(objj_msgSend(_7b,"isKindOfClass:",CPString)){
return objj_msgSend(CPURL,"URLWithString:",_7b);
}
return nil;
}
}),new objj_method(sel_getUid("setBool:forKey:"),function(_7c,_7d,_7e,_7f){
with(_7c){
if(objj_msgSend(_7e,"respondsToSelector:",sel_getUid("boolValue"))){
objj_msgSend(_7c,"setObject:forKey:",objj_msgSend(_7e,"boolValue"),_7f);
}
}
}),new objj_method(sel_getUid("setFloat:forKey:"),function(_80,_81,_82,_83){
with(_80){
if(objj_msgSend(_82,"respondsToSelector:",sel_getUid("aValue"))){
_82=objj_msgSend(_82,"floatValue");
}
objj_msgSend(_80,"setObject:forKey:",parseFloat(_82),_83);
}
}),new objj_method(sel_getUid("setDouble:forKey:"),function(_84,_85,_86,_87){
with(_84){
objj_msgSend(_84,"setFloat:forKey:",_86,_87);
}
}),new objj_method(sel_getUid("setInteger:forKey:"),function(_88,_89,_8a,_8b){
with(_88){
if(objj_msgSend(_8a,"respondsToSelector:",sel_getUid("intValue"))){
_8a=objj_msgSend(_8a,"intValue");
}
objj_msgSend(_88,"setObject:forKey:",parseInt(_8a),_8b);
}
}),new objj_method(sel_getUid("setURL:forKey:"),function(_8c,_8d,_8e,_8f){
with(_8c){
if(objj_msgSend(_8e,"isKindOfClass:",CPString)){
_8e=objj_msgSend(CPURL,"URLWithString:",_8e);
}
objj_msgSend(_8c,"setObject:forKey:",_8e,_8f);
}
})]);
class_addMethods(_3,[new objj_method(sel_getUid("standardUserDefaults"),function(_90,_91){
with(_90){
if(!_1){
_1=objj_msgSend(objj_msgSend(CPUserDefaults,"alloc"),"init");
}
return _1;
}
}),new objj_method(sel_getUid("resetStandardUserDefaults"),function(_92,_93){
with(_92){
if(_1){
objj_msgSend(_1,"synchronize");
}
_1=nil;
}
})]);
var _2=objj_allocateClassPair(CPObject,"CPUserDefaultsStore"),_3=_2.isa;
class_addIvars(_2,[new objj_ivar("_domain")]);
objj_registerClassPair(_2);
class_addMethods(_2,[new objj_method(sel_getUid("domain"),function(_94,_95){
with(_94){
return _domain;
}
}),new objj_method(sel_getUid("setDomain:"),function(_96,_97,_98){
with(_96){
_domain=_98;
}
}),new objj_method(sel_getUid("data"),function(_99,_9a){
with(_99){
_CPRaiseInvalidAbstractInvocation(_99,_9a);
return nil;
}
}),new objj_method(sel_getUid("setData:"),function(_9b,_9c,_9d){
with(_9b){
_CPRaiseInvalidAbstractInvocation(_9b,_9c);
}
})]);
var _2=objj_allocateClassPair(CPUserDefaultsStore,"CPUserDefaultsCookieStore"),_3=_2.isa;
class_addIvars(_2,[new objj_ivar("_cookie")]);
objj_registerClassPair(_2);
class_addMethods(_2,[new objj_method(sel_getUid("setDomain:"),function(_9e,_9f,_a0){
with(_9e){
if(_domain===_a0){
return;
}
_domain=_a0;
_cookie=objj_msgSend(objj_msgSend(CPCookie,"alloc"),"initWithName:",_domain);
}
}),new objj_method(sel_getUid("data"),function(_a1,_a2){
with(_a1){
var _a3=objj_msgSend(_cookie,"value");
if(!_a3||objj_msgSend(_a3,"length")<1){
return nil;
}
return objj_msgSend(CPData,"dataWithRawString:",decodeURIComponent(_a3));
}
}),new objj_method(sel_getUid("setData:"),function(_a4,_a5,_a6){
with(_a4){
objj_msgSend(_cookie,"setValue:expires:domain:",encodeURIComponent(objj_msgSend(_a6,"rawString")),objj_msgSend(CPDate,"distantFuture"),window.location.href.hostname);
}
})]);
var _a7="9961800812587769-Cappuccino-Storage-Test";
var _2=objj_allocateClassPair(CPUserDefaultsStore,"CPUserDefaultsLocalStore"),_3=_2.isa;
objj_registerClassPair(_2);
class_addMethods(_2,[new objj_method(sel_getUid("init"),function(_a8,_a9){
with(_a8){
if(!objj_msgSend(objj_msgSend(_a8,"class"),"supportsLocalStorage")){
objj_msgSend(CPException,"raise:reason:","UnsupportedFeature","Browser does not support localStorage for CPUserDefaultsLocalStore");
return _a8=nil;
}
return _a8=objj_msgSendSuper({receiver:_a8,super_class:objj_getClass("CPUserDefaultsLocalStore").super_class},"init");
}
}),new objj_method(sel_getUid("data"),function(_aa,_ab){
with(_aa){
var _ac=localStorage.getItem(_domain);
if(!_ac||objj_msgSend(_ac,"length")<1){
return nil;
}
return objj_msgSend(CPData,"dataWithRawString:",decodeURIComponent(_ac));
}
}),new objj_method(sel_getUid("setData:"),function(_ad,_ae,_af){
with(_ad){
try{
localStorage.setItem(_domain,encodeURIComponent(objj_msgSend(_af,"rawString")));
}
catch(e){
CPLog.warn("Unable to write to local storage: "+e);
}
}
})]);
class_addMethods(_3,[new objj_method(sel_getUid("supportsLocalStorage"),function(_b0,_b1){
with(_b0){
if(!window.localStorage){
return NO;
}
try{
localStorage.setItem(_a7,"1");
if(localStorage.getItem(_a7)!="1"){
return NO;
}
localStorage.removeItem(_a7);
}
catch(e){
return NO;
}
return YES;
}
})]);
p;18;CPKeyValueCoding.jt;10687;@STATIC;1.0;i;9;CPArray.ji;14;CPDictionary.ji;13;CPException.ji;12;CPIndexSet.ji;8;CPNull.ji;10;CPObject.ji;7;CPSet.ji;21;CPKeyValueObserving.jt;10536;
objj_executeFile("CPArray.j",YES);
objj_executeFile("CPDictionary.j",YES);
objj_executeFile("CPException.j",YES);
objj_executeFile("CPIndexSet.j",YES);
objj_executeFile("CPNull.j",YES);
objj_executeFile("CPObject.j",YES);
objj_executeFile("CPSet.j",YES);
CPUndefinedKeyException="CPUndefinedKeyException";
CPTargetObjectUserInfoKey="CPTargetObjectUserInfoKey";
CPUnknownUserInfoKey="CPUnknownUserInfoKey";
var _1="$CPObjectAccessorsForClassKey",_2="$CPObjectModifiersForClassKey";
var _3=objj_getClass("CPObject");
if(!_3){
throw new SyntaxError("*** Could not find definition for class \"CPObject\"");
}
var _4=_3.isa;
class_addMethods(_3,[new objj_method(sel_getUid("valueForKey:"),function(_5,_6,_7){
with(_5){
var _8=objj_msgSend(_5,"class"),_9=nil,_a=_8[_1];
if(!_a){
_a=_8[_1]={};
}
if(_a.hasOwnProperty(_7)){
_9=_a[_7];
}else{
var _b=nil,_c=_7.charAt(0).toUpperCase()+_7.substr(1),_d=nil,_e=nil;
if(objj_msgSend(_8,"instancesRespondToSelector:",_b=sel_getUid("get"+_c))||objj_msgSend(_8,"instancesRespondToSelector:",_b=sel_getUid(_7))||objj_msgSend(_8,"instancesRespondToSelector:",_b=sel_getUid((_e="is"+_c)))||objj_msgSend(_8,"instancesRespondToSelector:",_b=sel_getUid("_get"+_c))||objj_msgSend(_8,"instancesRespondToSelector:",_b=sel_getUid((_d="_"+_7)))||objj_msgSend(_8,"instancesRespondToSelector:",_b=sel_getUid("_"+_e))){
_9=_a[_7]=[0,_b];
}else{
if(objj_msgSend(_8,"instancesRespondToSelector:",sel_getUid("countOf"+_c))){
if(objj_msgSend(_8,"instancesRespondToSelector:",sel_getUid("objectIn"+_c+"AtIndex:"))||objj_msgSend(_8,"instancesRespondToSelector:",sel_getUid(_7+"AtIndexes:"))){
_9=_a[_7]=[1];
}else{
if(objj_msgSend(_8,"instancesRespondToSelector:",sel_getUid("enumeratorOf"+_c))&&objj_msgSend(_8,"instancesRespondToSelector:",sel_getUid("memberOf"+_c+":"))){
_9=_a[_7]=[2];
}
}
}
}
if(!_9){
if(class_getInstanceVariable(_8,_b=_d)||class_getInstanceVariable(_8,_b="_"+_e)||class_getInstanceVariable(_8,_b=_7)||class_getInstanceVariable(_8,_b=_e)){
_9=_a[_7]=[3,_b];
}else{
_9=_a[_7]=[];
}
}
}
switch(_9[0]){
case 0:
return objj_msgSend(_5,_9[1]);
case 1:
return objj_msgSend(objj_msgSend(_CPKeyValueCodingArray,"alloc"),"initWithTarget:key:",_5,_7);
case 2:
return objj_msgSend(objj_msgSend(_CPKeyValueCodingSet,"alloc"),"initWithTarget:key:",_5,_7);
case 3:
if(objj_msgSend(_8,"accessInstanceVariablesDirectly")){
return _5[_9[1]];
}
}
return objj_msgSend(_5,"valueForUndefinedKey:",_7);
}
}),new objj_method(sel_getUid("valueForKeyPath:"),function(_f,_10,_11){
with(_f){
var _12=_11.indexOf(".");
if(_12===CPNotFound){
return objj_msgSend(_f,"valueForKey:",_11);
}
var _13=_11.substring(0,_12),_14=_11.substring(_12+1),_15=objj_msgSend(_f,"valueForKey:",_13);
return objj_msgSend(_15,"valueForKeyPath:",_14);
}
}),new objj_method(sel_getUid("dictionaryWithValuesForKeys:"),function(_16,_17,_18){
with(_16){
var _19=0,_1a=_18.length,_1b=objj_msgSend(CPDictionary,"dictionary");
for(;_19<_1a;++_19){
var key=_18[_19],_1c=objj_msgSend(_16,"valueForKey:",key);
if(_1c===nil){
objj_msgSend(_1b,"setObject:forKey:",objj_msgSend(CPNull,"null"),key);
}else{
objj_msgSend(_1b,"setObject:forKey:",_1c,key);
}
}
return _1b;
}
}),new objj_method(sel_getUid("valueForUndefinedKey:"),function(_1d,_1e,_1f){
with(_1d){
objj_msgSend(objj_msgSend(CPException,"exceptionWithName:reason:userInfo:",CPUndefinedKeyException,objj_msgSend(_1d,"_objectDescription")+" is not key value coding-compliant for the key "+_1f,objj_msgSend(CPDictionary,"dictionaryWithObjects:forKeys:",[_1d,_1f],[CPTargetObjectUserInfoKey,CPUnknownUserInfoKey])),"raise");
}
}),new objj_method(sel_getUid("setValue:forKeyPath:"),function(_20,_21,_22,_23){
with(_20){
if(!_23){
_23="self";
}
var _24=_23.indexOf(".");
if(_24===CPNotFound){
return objj_msgSend(_20,"setValue:forKey:",_22,_23);
}
var _25=_23.substring(0,_24),_26=_23.substring(_24+1),_27=objj_msgSend(_20,"valueForKey:",_25);
return objj_msgSend(_27,"setValue:forKeyPath:",_22,_26);
}
}),new objj_method(sel_getUid("setValue:forKey:"),function(_28,_29,_2a,_2b){
with(_28){
var _2c=objj_msgSend(_28,"class"),_2d=nil,_2e=_2c[_2];
if(!_2e){
_2e=_2c[_2]={};
}
if(_2e.hasOwnProperty(_2b)){
_2d=_2e[_2b];
}else{
var _2f=nil,_30=_2b.charAt(0).toUpperCase()+_2b.substr(1),_31=nil;
if(objj_msgSend(_2c,"instancesRespondToSelector:",_2f=sel_getUid("set"+_30+":"))||objj_msgSend(_2c,"instancesRespondToSelector:",_2f=sel_getUid("_set"+_30+":"))){
_2d=_2e[_2b]=[0,_2f];
}else{
if(class_getInstanceVariable(_2c,_2f="_"+_2b)||class_getInstanceVariable(_2c,_2f="_"+(_31="is"+_30))||class_getInstanceVariable(_2c,_2f=_2b)||class_getInstanceVariable(_2c,_2f=_31)){
_2d=_2e[_2b]=[1,_2f];
}else{
_2d=_2e[_2b]=[];
}
}
}
switch(_2d[0]){
case 0:
return objj_msgSend(_28,_2d[1],_2a);
case 1:
if(objj_msgSend(_2c,"accessInstanceVariablesDirectly")){
objj_msgSend(_28,"willChangeValueForKey:",_2b);
_28[_2d[1]]=_2a;
return objj_msgSend(_28,"didChangeValueForKey:",_2b);
}
}
return objj_msgSend(_28,"setValue:forUndefinedKey:",_2a,_2b);
}
}),new objj_method(sel_getUid("setValuesForKeysWithDictionary:"),function(_32,_33,_34){
with(_32){
var _35,key,_36=objj_msgSend(_34,"keyEnumerator");
while((key=objj_msgSend(_36,"nextObject"))!==nil){
_35=objj_msgSend(_34,"objectForKey:",key);
if(_35===objj_msgSend(CPNull,"null")){
objj_msgSend(_32,"setValue:forKey:",nil,key);
}else{
objj_msgSend(_32,"setValue:forKey:",_35,key);
}
}
}
}),new objj_method(sel_getUid("setValue:forUndefinedKey:"),function(_37,_38,_39,_3a){
with(_37){
objj_msgSend(objj_msgSend(CPException,"exceptionWithName:reason:userInfo:",CPUndefinedKeyException,objj_msgSend(_37,"_objectDescription")+" is not key value coding-compliant for the key "+_3a,objj_msgSend(CPDictionary,"dictionaryWithObjects:forKeys:",[_37,_3a],[CPTargetObjectUserInfoKey,CPUnknownUserInfoKey])),"raise");
}
}),new objj_method(sel_getUid("_objectDescription"),function(_3b,_3c){
with(_3b){
return "<"+objj_msgSend(_3b,"className")+" 0x"+objj_msgSend(CPString,"stringWithHash:",objj_msgSend(_3b,"UID"))+">";
}
})]);
class_addMethods(_4,[new objj_method(sel_getUid("accessInstanceVariablesDirectly"),function(_3d,_3e){
with(_3d){
return YES;
}
})]);
var _3=objj_getClass("CPDictionary");
if(!_3){
throw new SyntaxError("*** Could not find definition for class \"CPDictionary\"");
}
var _4=_3.isa;
class_addMethods(_3,[new objj_method(sel_getUid("valueForKey:"),function(_3f,_40,_41){
with(_3f){
if(objj_msgSend(_41,"hasPrefix:","@")){
return objj_msgSendSuper({receiver:_3f,super_class:objj_getClass("CPDictionary").super_class},"valueForKey:",_41.substr(1));
}
return objj_msgSend(_3f,"objectForKey:",_41);
}
}),new objj_method(sel_getUid("setValue:forKey:"),function(_42,_43,_44,_45){
with(_42){
if(_44!==nil){
objj_msgSend(_42,"setObject:forKey:",_44,_45);
}else{
objj_msgSend(_42,"removeObjectForKey:",_45);
}
}
})]);
var _3=objj_getClass("CPNull");
if(!_3){
throw new SyntaxError("*** Could not find definition for class \"CPNull\"");
}
var _4=_3.isa;
class_addMethods(_3,[new objj_method(sel_getUid("valueForKey:"),function(_46,_47,_48){
with(_46){
return _46;
}
})]);
var _3=objj_allocateClassPair(CPArray,"_CPKeyValueCodingArray"),_4=_3.isa;
class_addIvars(_3,[new objj_ivar("_target"),new objj_ivar("_countOfSelector"),new objj_ivar("_objectInAtIndexSelector"),new objj_ivar("_atIndexesSelector")]);
objj_registerClassPair(_3);
class_addMethods(_3,[new objj_method(sel_getUid("initWithTarget:key:"),function(_49,_4a,_4b,_4c){
with(_49){
_49=objj_msgSendSuper({receiver:_49,super_class:objj_getClass("_CPKeyValueCodingArray").super_class},"init");
if(_49){
var _4d=_4c.charAt(0).toUpperCase()+_4c.substr(1);
_target=_4b;
_countOfSelector=CPSelectorFromString("countOf"+_4d);
_objectInAtIndexSelector=CPSelectorFromString("objectIn"+_4d+"AtIndex:");
if(!objj_msgSend(_target,"respondsToSelector:",_objectInAtIndexSelector)){
_objectInAtIndexSelector=nil;
}
_atIndexesSelector=CPSelectorFromString(_4c+"AtIndexes:");
if(!objj_msgSend(_target,"respondsToSelector:",_atIndexesSelector)){
_atIndexesSelector=nil;
}
}
return _49;
}
}),new objj_method(sel_getUid("count"),function(_4e,_4f){
with(_4e){
return objj_msgSend(_target,_countOfSelector);
}
}),new objj_method(sel_getUid("objectAtIndex:"),function(_50,_51,_52){
with(_50){
if(_objectInAtIndexSelector){
return objj_msgSend(_target,_objectInAtIndexSelector,_52);
}
return objj_msgSend(_target,_atIndexesSelector,objj_msgSend(CPIndexSet,"indexSetWithIndex:",_52))[0];
}
}),new objj_method(sel_getUid("objectsAtIndexes:"),function(_53,_54,_55){
with(_53){
if(_atIndexesSelector){
return objj_msgSend(_target,_atIndexesSelector,_55);
}
return objj_msgSendSuper({receiver:_53,super_class:objj_getClass("_CPKeyValueCodingArray").super_class},"objectsAtIndexes:",_55);
}
}),new objj_method(sel_getUid("classForCoder"),function(_56,_57){
with(_56){
return objj_msgSend(CPArray,"class");
}
}),new objj_method(sel_getUid("copy"),function(_58,_59){
with(_58){
return objj_msgSend(CPArray,"arrayWithArray:",_58);
}
})]);
var _3=objj_allocateClassPair(CPSet,"_CPKeyValueCodingSet"),_4=_3.isa;
class_addIvars(_3,[new objj_ivar("_target"),new objj_ivar("_countOfSelector"),new objj_ivar("_enumeratorOfSelector"),new objj_ivar("_memberOfSelector")]);
objj_registerClassPair(_3);
class_addMethods(_3,[new objj_method(sel_getUid("initWithObjects:count:"),function(_5a,_5b,_5c,_5d){
with(_5a){
return objj_msgSend(objj_msgSend(CPSet,"alloc"),"initWithObjects:count:",_5c,_5d);
}
}),new objj_method(sel_getUid("initWithTarget:key:"),function(_5e,_5f,_60,_61){
with(_5e){
_5e=objj_msgSendSuper({receiver:_5e,super_class:objj_getClass("_CPKeyValueCodingSet").super_class},"initWithObjects:count:",nil,0);
if(_5e){
var _62=_61.charAt(0).toUpperCase()+_61.substr(1);
_target=_60;
_countOfSelector=CPSelectorFromString("countOf"+_62);
_enumeratorOfSelector=CPSelectorFromString("enumeratorOf"+_62);
_memberOfSelector=CPSelectorFromString("memberOf"+_62+":");
}
return _5e;
}
}),new objj_method(sel_getUid("count"),function(_63,_64){
with(_63){
return objj_msgSend(_target,_countOfSelector);
}
}),new objj_method(sel_getUid("objectEnumerator"),function(_65,_66){
with(_65){
return objj_msgSend(_target,_enumeratorOfSelector);
}
}),new objj_method(sel_getUid("member:"),function(_67,_68,_69){
with(_67){
return objj_msgSend(_target,_memberOfSelector,_69);
}
}),new objj_method(sel_getUid("classForCoder"),function(_6a,_6b){
with(_6a){
return objj_msgSend(CPSet,"class");
}
}),new objj_method(sel_getUid("copy"),function(_6c,_6d){
with(_6c){
return objj_msgSend(CPSet,"setWithSet:",_6c);
}
})]);
objj_executeFile("CPKeyValueObserving.j",YES);
p;13;CPPredicate.jt;24350;@STATIC;1.0;i;9;CPArray.ji;13;CPException.ji;8;CPNull.ji;10;CPObject.ji;11;CPScanner.ji;7;CPSet.ji;9;CPValue.ji;16;CPCharacterSet.ji;21;CPCompoundPredicate.ji;23;CPComparisonPredicate.ji;14;CPExpression.jt;24138;
objj_executeFile("CPArray.j",YES);
objj_executeFile("CPException.j",YES);
objj_executeFile("CPNull.j",YES);
objj_executeFile("CPObject.j",YES);
objj_executeFile("CPScanner.j",YES);
objj_executeFile("CPSet.j",YES);
objj_executeFile("CPValue.j",YES);
objj_executeFile("CPCharacterSet.j",YES);
var _1=objj_allocateClassPair(CPObject,"CPPredicate"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("predicateWithSubstitutionVariables:"),function(_3,_4,_5){
with(_3){
}
}),new objj_method(sel_getUid("evaluateWithObject:"),function(_6,_7,_8){
with(_6){
}
}),new objj_method(sel_getUid("evaluateWithObject:substitutionVariables:"),function(_9,_a,_b,_c){
with(_9){
}
}),new objj_method(sel_getUid("predicateFormat"),function(_d,_e){
with(_d){
}
}),new objj_method(sel_getUid("description"),function(_f,_10){
with(_f){
return objj_msgSend(_f,"predicateFormat");
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("predicateWithFormat:"),function(_11,_12,_13){
with(_11){
if(!_13){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,_12+" the format can't be 'nil'");
}
var _14=Array.prototype.slice.call(arguments,3);
return objj_msgSend(_11,"predicateWithFormat:argumentArray:",arguments[2],_14);
}
}),new objj_method(sel_getUid("predicateWithFormat:argumentArray:"),function(_15,_16,_17,_18){
with(_15){
if(!_17){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,_16+" the format can't be 'nil'");
}
var s=objj_msgSend(objj_msgSend(CPPredicateScanner,"alloc"),"initWithString:args:",_17,_18),p=objj_msgSend(s,"parse");
return p;
}
}),new objj_method(sel_getUid("predicateWithFormat:arguments:"),function(_19,_1a,_1b,_1c){
with(_19){
return nil;
}
}),new objj_method(sel_getUid("predicateWithValue:"),function(_1d,_1e,_1f){
with(_1d){
return objj_msgSend(objj_msgSend(CPPredicate_BOOL,"alloc"),"initWithBool:",_1f);
}
})]);
var _1=objj_allocateClassPair(CPPredicate,"CPPredicate_BOOL"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_value")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initWithBool:"),function(_20,_21,_22){
with(_20){
_value=_22;
return _20;
}
}),new objj_method(sel_getUid("isEqual:"),function(_23,_24,_25){
with(_23){
if(_23===_25){
return YES;
}
if(_23.isa!==_25.isa||_value!==objj_msgSend(_25,"evaluateObject:",nil)){
return NO;
}
return YES;
}
}),new objj_method(sel_getUid("evaluateObject:"),function(_26,_27,_28){
with(_26){
return _value;
}
}),new objj_method(sel_getUid("predicateFormat"),function(_29,_2a){
with(_29){
return (_value)?"TRUEPREDICATE":"FALSEPREDICATE";
}
})]);
var _1=objj_getClass("CPArray");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"CPArray\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("filteredArrayUsingPredicate:"),function(_2b,_2c,_2d){
with(_2b){
var _2e=objj_msgSend(_2b,"count"),_2f=objj_msgSend(CPArray,"array"),i=0;
for(;i<_2e;i++){
var _30=objj_msgSend(_2b,"objectAtIndex:",i);
if(objj_msgSend(_2d,"evaluateWithObject:",_30)){
_2f.push(_30);
}
}
return _2f;
}
}),new objj_method(sel_getUid("filterUsingPredicate:"),function(_31,_32,_33){
with(_31){
var _34=objj_msgSend(_31,"count");
while(_34--){
if(!objj_msgSend(_33,"evaluateWithObject:",objj_msgSend(_31,"objectAtIndex:",_34))){
splice(_34,1);
}
}
}
})]);
var _1=objj_getClass("CPSet");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"CPSet\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("filteredSetUsingPredicate:"),function(_35,_36,_37){
with(_35){
var _38=objj_msgSend(_35,"count"),_39=objj_msgSend(CPSet,"set"),i=0;
for(;i<_38;i++){
var _3a=objj_msgSend(_35,"objectAtIndex:",i);
if(objj_msgSend(_37,"evaluateWithObject:",_3a)){
objj_msgSend(_39,"addObject:",_3a);
}
}
return _39;
}
}),new objj_method(sel_getUid("filterUsingPredicate:"),function(_3b,_3c,_3d){
with(_3b){
var _3e=objj_msgSend(_3b,"count");
while(--_3e>=0){
var _3f=objj_msgSend(_3b,"objectAtIndex:",_3e);
if(!objj_msgSend(_3d,"evaluateWithObject:",_3f)){
objj_msgSend(_3b,"removeObjectAtIndex:",_3e);
}
}
}
})]);
var _1=objj_allocateClassPair(CPScanner,"CPPredicateScanner"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_args"),new objj_ivar("_retrieved")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initWithString:args:"),function(_40,_41,_42,_43){
with(_40){
_40=objj_msgSendSuper({receiver:_40,super_class:objj_getClass("CPPredicateScanner").super_class},"initWithString:",_42);
if(_40){
_args=objj_msgSend(_43,"objectEnumerator");
}
return _40;
}
}),new objj_method(sel_getUid("nextArg"),function(_44,_45){
with(_44){
return objj_msgSend(_args,"nextObject");
}
}),new objj_method(sel_getUid("scanPredicateKeyword:"),function(_46,_47,key){
with(_46){
var loc=objj_msgSend(_46,"scanLocation");
objj_msgSend(_46,"setCaseSensitive:",NO);
if(!objj_msgSend(_46,"scanString:intoString:",key,NULL)){
return NO;
}
if(objj_msgSend(_46,"isAtEnd")){
return YES;
}
var c=objj_msgSend(objj_msgSend(_46,"string"),"characterAtIndex:",objj_msgSend(_46,"scanLocation"));
if(!objj_msgSend(objj_msgSend(CPCharacterSet,"alphanumericCharacterSet"),"characterIsMember:",c)){
return YES;
}
objj_msgSend(_46,"setScanLocation:",loc);
return NO;
}
}),new objj_method(sel_getUid("parse"),function(_48,_49){
with(_48){
var r=nil;
try{
objj_msgSend(_48,"setCharactersToBeSkipped:",objj_msgSend(CPCharacterSet,"whitespaceCharacterSet"));
r=objj_msgSend(_48,"parsePredicate");
}
catch(error){
CPLogConsole("Unable to parse predicate '"+objj_msgSend(_48,"string")+"' with "+error);
}
finally{
if(!objj_msgSend(_48,"isAtEnd")){
var _4a=objj_msgSend(_48,"string"),loc=objj_msgSend(_48,"scanLocation");
CPLogConsole("Format string contains extra characters: '"+objj_msgSend(_4a,"substringToIndex:",loc)+"**"+objj_msgSend(_4a,"substringFromIndex:",loc)+"**'");
}
}
return r;
}
}),new objj_method(sel_getUid("parsePredicate"),function(_4b,_4c){
with(_4b){
return objj_msgSend(_4b,"parseAnd");
}
}),new objj_method(sel_getUid("parseAnd"),function(_4d,_4e){
with(_4d){
var l=objj_msgSend(_4d,"parseOr");
while(objj_msgSend(_4d,"scanPredicateKeyword:","AND")||objj_msgSend(_4d,"scanPredicateKeyword:","&&")){
var r=objj_msgSend(_4d,"parseOr");
if(objj_msgSend(r,"isKindOfClass:",objj_msgSend(CPCompoundPredicate,"class"))&&objj_msgSend(r,"compoundPredicateType")==CPAndPredicateType){
if(objj_msgSend(l,"isKindOfClass:",objj_msgSend(CPCompoundPredicate,"class"))&&objj_msgSend(l,"compoundPredicateType")==CPAndPredicateType){
objj_msgSend(objj_msgSend(l,"subpredicates"),"addObjectsFromArray:",objj_msgSend(r,"subpredicates"));
}else{
objj_msgSend(objj_msgSend(r,"subpredicates"),"insertObject:atIndex:",l,0);
l=r;
}
}else{
if(objj_msgSend(l,"isKindOfClass:",objj_msgSend(CPCompoundPredicate,"class"))&&objj_msgSend(l,"compoundPredicateType")==CPAndPredicateType){
objj_msgSend(objj_msgSend(l,"subpredicates"),"addObject:",r);
}else{
l=objj_msgSend(CPCompoundPredicate,"andPredicateWithSubpredicates:",objj_msgSend(CPArray,"arrayWithObjects:",l,r));
}
}
}
return l;
}
}),new objj_method(sel_getUid("parseNot"),function(_4f,_50){
with(_4f){
if(objj_msgSend(_4f,"scanString:intoString:","(",NULL)){
var r=objj_msgSend(_4f,"parsePredicate");
if(!objj_msgSend(_4f,"scanString:intoString:",")",NULL)){
_51(_4f,"predicate");
}
return r;
}
if(objj_msgSend(_4f,"scanPredicateKeyword:","NOT")||objj_msgSend(_4f,"scanPredicateKeyword:","!")){
return objj_msgSend(CPCompoundPredicate,"notPredicateWithSubpredicate:",objj_msgSend(_4f,"parseNot"));
}
if(objj_msgSend(_4f,"scanPredicateKeyword:","TRUEPREDICATE")){
return objj_msgSend(CPPredicate,"predicateWithValue:",YES);
}
if(objj_msgSend(_4f,"scanPredicateKeyword:","FALSEPREDICATE")){
return objj_msgSend(CPPredicate,"predicateWithValue:",NO);
}
return objj_msgSend(_4f,"parseComparison");
}
}),new objj_method(sel_getUid("parseOr"),function(_52,_53){
with(_52){
var l=objj_msgSend(_52,"parseNot");
while(objj_msgSend(_52,"scanPredicateKeyword:","OR")||objj_msgSend(_52,"scanPredicateKeyword:","||")){
var r=objj_msgSend(_52,"parseNot");
if(objj_msgSend(r,"isKindOfClass:",objj_msgSend(CPCompoundPredicate,"class"))&&objj_msgSend(r,"compoundPredicateType")==CPOrPredicateType){
if(objj_msgSend(l,"isKindOfClass:",objj_msgSend(CPCompoundPredicate,"class"))&&objj_msgSend(l,"compoundPredicateType")==CPOrPredicateType){
objj_msgSend(objj_msgSend(l,"subpredicates"),"addObjectsFromArray:",objj_msgSend(r,"subpredicates"));
}else{
objj_msgSend(objj_msgSend(r,"subpredicates"),"insertObject:atIndex:",l,0);
l=r;
}
}else{
if(objj_msgSend(l,"isKindOfClass:",objj_msgSend(CPCompoundPredicate,"class"))&&objj_msgSend(l,"compoundPredicateType")==CPOrPredicateType){
objj_msgSend(objj_msgSend(l,"subpredicates"),"addObject:",r);
}else{
l=objj_msgSend(CPCompoundPredicate,"orPredicateWithSubpredicates:",objj_msgSend(CPArray,"arrayWithObjects:",l,r));
}
}
}
return l;
}
}),new objj_method(sel_getUid("parseComparison"),function(_54,_55){
with(_54){
var _56=CPDirectPredicateModifier,_57=0,_58=0,_59,_5a,p,_5b=NO;
if(objj_msgSend(_54,"scanPredicateKeyword:","ANY")){
_56=CPAnyPredicateModifier;
}else{
if(objj_msgSend(_54,"scanPredicateKeyword:","ALL")){
_56=CPAllPredicateModifier;
}else{
if(objj_msgSend(_54,"scanPredicateKeyword:","NONE")){
_56=CPAnyPredicateModifier;
_5b=YES;
}else{
if(objj_msgSend(_54,"scanPredicateKeyword:","SOME")){
_56=CPAllPredicateModifier;
_5b=YES;
}
}
}
}
_59=objj_msgSend(_54,"parseExpression");
if(objj_msgSend(_54,"scanString:intoString:","!=",NULL)||objj_msgSend(_54,"scanString:intoString:","<>",NULL)){
_57=CPNotEqualToPredicateOperatorType;
}else{
if(objj_msgSend(_54,"scanString:intoString:","<=",NULL)||objj_msgSend(_54,"scanString:intoString:","=<",NULL)){
_57=CPLessThanOrEqualToPredicateOperatorType;
}else{
if(objj_msgSend(_54,"scanString:intoString:",">=",NULL)||objj_msgSend(_54,"scanString:intoString:","=>",NULL)){
_57=CPGreaterThanOrEqualToPredicateOperatorType;
}else{
if(objj_msgSend(_54,"scanString:intoString:","<",NULL)){
_57=CPLessThanPredicateOperatorType;
}else{
if(objj_msgSend(_54,"scanString:intoString:",">",NULL)){
_57=CPGreaterThanPredicateOperatorType;
}else{
if(objj_msgSend(_54,"scanString:intoString:","==",NULL)||objj_msgSend(_54,"scanString:intoString:","=",NULL)){
_57=CPEqualToPredicateOperatorType;
}else{
if(objj_msgSend(_54,"scanPredicateKeyword:","MATCHES")){
_57=CPMatchesPredicateOperatorType;
}else{
if(objj_msgSend(_54,"scanPredicateKeyword:","LIKE")){
_57=CPLikePredicateOperatorType;
}else{
if(objj_msgSend(_54,"scanPredicateKeyword:","BEGINSWITH")){
_57=CPBeginsWithPredicateOperatorType;
}else{
if(objj_msgSend(_54,"scanPredicateKeyword:","ENDSWITH")){
_57=CPEndsWithPredicateOperatorType;
}else{
if(objj_msgSend(_54,"scanPredicateKeyword:","IN")){
_57=CPInPredicateOperatorType;
}else{
if(objj_msgSend(_54,"scanPredicateKeyword:","CONTAINS")){
_57=CPContainsPredicateOperatorType;
}else{
if(objj_msgSend(_54,"scanPredicateKeyword:","BETWEEN")){
_57=CPBetweenPredicateOperatorType;
}else{
_51(_54,"comparison predicate");
}
}
}
}
}
}
}
}
}
}
}
}
}
if(objj_msgSend(_54,"scanString:intoString:","[cd]",NULL)){
_58=CPCaseInsensitivePredicateOption|CPDiacriticInsensitivePredicateOption;
}else{
if(objj_msgSend(_54,"scanString:intoString:","[c]",NULL)){
_58=CPCaseInsensitivePredicateOption;
}else{
if(objj_msgSend(_54,"scanString:intoString:","[d]",NULL)){
_58=CPDiacriticInsensitivePredicateOption;
}
}
}
_5a=objj_msgSend(_54,"parseExpression");
p=objj_msgSend(CPComparisonPredicate,"predicateWithLeftExpression:rightExpression:modifier:type:options:",_59,_5a,_56,_57,_58);
return _5b?objj_msgSend(CPCompoundPredicate,"notPredicateWithSubpredicate:",p):p;
}
}),new objj_method(sel_getUid("parseExpression"),function(_5c,_5d){
with(_5c){
return objj_msgSend(_5c,"parseBinaryExpression");
}
}),new objj_method(sel_getUid("parseSimpleExpression"),function(_5e,_5f){
with(_5e){
var _60,_61,_62,dbl;
if(objj_msgSend(_5e,"scanDouble:",function(_63){
var _64=dbl;
if(typeof _63!="undefined"){
dbl=_63;
}
return _64;
})){
return objj_msgSend(CPExpression,"expressionForConstantValue:",dbl);
}
if(objj_msgSend(_5e,"scanString:intoString:","-",NULL)){
return objj_msgSend(CPExpression,"expressionForFunction:arguments:","chs:",objj_msgSend(CPArray,"arrayWithObject:",objj_msgSend(_5e,"parseExpression")));
}
if(objj_msgSend(_5e,"scanString:intoString:","(",NULL)){
var arg=objj_msgSend(_5e,"parseExpression");
if(!objj_msgSend(_5e,"scanString:intoString:",")",NULL)){
_51(_5e,"expression");
}
return arg;
}
if(objj_msgSend(_5e,"scanString:intoString:","{",NULL)){
if(objj_msgSend(_5e,"scanString:intoString:","}",NULL)){
return objj_msgSend(CPExpression,"expressionForConstantValue:",a);
}
var a=[];
objj_msgSend(a,"addObject:",objj_msgSend(_5e,"parseExpression"));
while(objj_msgSend(_5e,"scanString:intoString:",",",NULL)){
objj_msgSend(a,"addObject:",objj_msgSend(_5e,"parseExpression"));
}
if(!objj_msgSend(_5e,"scanString:intoString:","}",NULL)){
_51(_5e,"expression");
}
return objj_msgSend(CPExpression,"expressionForAggregate:",a);
}
if(objj_msgSend(_5e,"scanPredicateKeyword:","NULL")||objj_msgSend(_5e,"scanPredicateKeyword:","NIL")){
return objj_msgSend(CPExpression,"expressionForConstantValue:",objj_msgSend(CPNull,"null"));
}
if(objj_msgSend(_5e,"scanPredicateKeyword:","TRUE")||objj_msgSend(_5e,"scanPredicateKeyword:","YES")){
return objj_msgSend(CPExpression,"expressionForConstantValue:",objj_msgSend(CPNumber,"numberWithBool:",YES));
}
if(objj_msgSend(_5e,"scanPredicateKeyword:","FALSE")||objj_msgSend(_5e,"scanPredicateKeyword:","NO")){
return objj_msgSend(CPExpression,"expressionForConstantValue:",objj_msgSend(CPNumber,"numberWithBool:",NO));
}
if(objj_msgSend(_5e,"scanPredicateKeyword:","SELF")){
return objj_msgSend(CPExpression,"expressionForEvaluatedObject");
}
if(objj_msgSend(_5e,"scanString:intoString:","$",NULL)){
var _65=objj_msgSend(_5e,"parseSimpleExpression");
if(!objj_msgSend(_65,"keyPath")){
_51(_5e,"expression");
}
return objj_msgSend(CPExpression,"expressionForVariable:",_65);
}
_61=objj_msgSend(_5e,"scanLocation");
if(objj_msgSend(_5e,"scanString:intoString:","%",NULL)){
if(objj_msgSend(_5e,"isAtEnd")==NO){
var c=objj_msgSend(objj_msgSend(_5e,"string"),"characterAtIndex:",objj_msgSend(_5e,"scanLocation"));
switch(c){
case "%":
_61=objj_msgSend(_5e,"scanLocation");
break;
case "K":
objj_msgSend(_5e,"setScanLocation:",objj_msgSend(_5e,"scanLocation")+1);
return objj_msgSend(CPExpression,"expressionForKeyPath:",objj_msgSend(_5e,"nextArg"));
case "@":
case "c":
case "C":
case "d":
case "D":
case "i":
case "o":
case "O":
case "u":
case "U":
case "x":
case "X":
case "e":
case "E":
case "f":
case "g":
case "G":
objj_msgSend(_5e,"setScanLocation:",objj_msgSend(_5e,"scanLocation")+1);
return objj_msgSend(CPExpression,"expressionForConstantValue:",objj_msgSend(_5e,"nextArg"));
case "h":
objj_msgSend(_5e,"scanString:intoString:","h",NULL);
if(objj_msgSend(_5e,"isAtEnd")==NO){
c=objj_msgSend(objj_msgSend(_5e,"string"),"characterAtIndex:",objj_msgSend(_5e,"scanLocation"));
if(c=="i"||c=="u"){
objj_msgSend(_5e,"setScanLocation:",objj_msgSend(_5e,"scanLocation")+1);
return objj_msgSend(CPExpression,"expressionForConstantValue:",objj_msgSend(_5e,"nextArg"));
}
}
break;
case "q":
objj_msgSend(_5e,"scanString:intoString:","q",NULL);
if(objj_msgSend(_5e,"isAtEnd")==NO){
c=objj_msgSend(objj_msgSend(_5e,"string"),"characterAtIndex:",objj_msgSend(_5e,"scanLocation"));
if(c=="i"||c=="u"||c=="x"||c=="X"){
objj_msgSend(_5e,"setScanLocation:",objj_msgSend(_5e,"scanLocation")+1);
return objj_msgSend(CPExpression,"expressionForConstantValue:",objj_msgSend(_5e,"nextArg"));
}
}
break;
}
}
objj_msgSend(_5e,"setScanLocation:",_61);
}
if(objj_msgSend(_5e,"scanString:intoString:","\"",NULL)){
var _66=objj_msgSend(_5e,"charactersToBeSkipped"),str="";
objj_msgSend(_5e,"setCharactersToBeSkipped:",nil);
objj_msgSend(_5e,"scanUpToString:intoString:","\"",function(_67){
var _68=str;
if(typeof _67!="undefined"){
str=_67;
}
return _68;
});
if(objj_msgSend(_5e,"scanString:intoString:","\"",NULL)==NO){
_51(_5e,"expression");
}
objj_msgSend(_5e,"setCharactersToBeSkipped:",_66);
return objj_msgSend(CPExpression,"expressionForConstantValue:",str);
}
if(objj_msgSend(_5e,"scanString:intoString:","'",NULL)){
var _66=objj_msgSend(_5e,"charactersToBeSkipped"),str="";
objj_msgSend(_5e,"setCharactersToBeSkipped:",nil);
objj_msgSend(_5e,"scanUpToString:intoString:","'",function(_69){
var _6a=str;
if(typeof _69!="undefined"){
str=_69;
}
return _6a;
});
if(objj_msgSend(_5e,"scanString:intoString:","'",NULL)==NO){
_51(_5e,"expression");
}
objj_msgSend(_5e,"setCharactersToBeSkipped:",_66);
return objj_msgSend(CPExpression,"expressionForConstantValue:",str);
}
if(objj_msgSend(_5e,"scanString:intoString:","@",NULL)){
var e=objj_msgSend(_5e,"parseExpression");
if(!objj_msgSend(e,"keyPath")){
_51(_5e,"expression");
}
return objj_msgSend(CPExpression,"expressionForKeyPath:",objj_msgSend(e,"keyPath")+"@");
}
if(objj_msgSend(_5e,"scanString:intoString:","SUBQUERY",NULL)){
if(!objj_msgSend(_5e,"scanString:intoString:","(",NULL)){
_51(_5e,"expression");
}
var _6b=objj_msgSend(_5e,"parseExpression"),_6c,_6d;
if(!objj_msgSend(_5e,"scanString:intoString:",",",NULL)){
_51(_5e,"expression");
}
_6c=objj_msgSend(_5e,"parseExpression");
if(!objj_msgSend(_5e,"scanString:intoString:",",",NULL)){
_51(_5e,"expression");
}
_6d=objj_msgSend(_5e,"parsePredicate");
if(!objj_msgSend(_5e,"scanString:intoString:",")",NULL)){
_51(_5e,"expression");
}
return objj_msgSend(objj_msgSend(_CPSubqueryExpression,"alloc"),"initWithExpression:usingIteratorExpression:predicate:",_6b,_6c,_6d);
}
if(objj_msgSend(_5e,"scanString:intoString:","FUNCTION",NULL)){
if(!objj_msgSend(_5e,"scanString:intoString:","(",NULL)){
_51(_5e,"expression");
}
var _6e=objj_msgSend(CPArray,"arrayWithObject:",objj_msgSend(_5e,"parseExpression"));
while(objj_msgSend(_5e,"scanString:intoString:",",",NULL)){
objj_msgSend(_6e,"addObject:",objj_msgSend(_5e,"parseExpression"));
}
if(!objj_msgSend(_5e,"scanString:intoString:",")",NULL)||objj_msgSend(_6e,"count")<2||objj_msgSend(_6e[1],"expressionType")!=CPConstantValueExpressionType){
_51(_5e,"expression");
}
return objj_msgSend(CPExpression,"expressionForFunction:selectorName:arguments:",_6e[0],objj_msgSend(_6e[1],"constantValue"),_6e.slice(2));
}
objj_msgSend(_5e,"scanString:intoString:","#",NULL);
if(!_60){
_60=objj_msgSend(CPCharacterSet,"characterSetWithCharactersInString:","_$abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789");
}
if(!objj_msgSend(_5e,"scanCharactersFromSet:intoString:",_60,function(_6f){
var _70=_62;
if(typeof _6f!="undefined"){
_62=_6f;
}
return _70;
})){
_51(_5e,"expression");
}
return objj_msgSend(CPExpression,"expressionForKeyPath:",_62);
}
}),new objj_method(sel_getUid("parseFunctionalExpression"),function(_71,_72){
with(_71){
var _73=objj_msgSend(_71,"parseSimpleExpression");
while(YES){
if(objj_msgSend(_71,"scanString:intoString:",".",NULL)){
var _74=objj_msgSend(_71,"parseSimpleExpression"),_75=objj_msgSend(_74,"expressionType");
if(_75==CPKeyPathExpressionType){
_73=objj_msgSend(objj_msgSend(_CPKeyPathExpression,"alloc"),"initWithOperand:andKeyPath:",_73,objj_msgSend(_74,"keyPath"));
}else{
if(_75==CPVariableExpressionType){
_73=objj_msgSend(CPExpression,"expressionForFunction:selectorName:arguments:",_73,"valueForKey:",[_74]);
}else{
_51(_71,"expression");
}
}
}else{
if(objj_msgSend(_71,"scanString:intoString:","[",NULL)){
if(objj_msgSend(_71,"scanPredicateKeyword:","FIRST")){
_73=objj_msgSend(CPExpression,"expressionForFunction:arguments:","first:",objj_msgSend(CPArray,"arrayWithObject:",_73));
}else{
if(objj_msgSend(_71,"scanPredicateKeyword:","LAST")){
_73=objj_msgSend(CPExpression,"expressionForFunction:arguments:","last:",objj_msgSend(CPArray,"arrayWithObject:",_73));
}else{
if(objj_msgSend(_71,"scanPredicateKeyword:","SIZE")){
_73=objj_msgSend(CPExpression,"expressionForFunction:arguments:","count:",objj_msgSend(CPArray,"arrayWithObject:",_73));
}else{
var _76=objj_msgSend(_71,"parseExpression");
_73=objj_msgSend(CPExpression,"expressionForFunction:arguments:","fromObject:index:",objj_msgSend(CPArray,"arrayWithObjects:",_73,_76));
}
}
}
if(!objj_msgSend(_71,"scanString:intoString:","]",NULL)){
_51(_71,"expression");
}
}else{
if(objj_msgSend(_71,"scanString:intoString:",":",NULL)){
if(!objj_msgSend(_73,"keyPath")){
_51(_71,"expression");
}
var _77=objj_msgSend(_73,"keyPath")+":",_78=[];
if(!objj_msgSend(_71,"scanString:intoString:","(",NULL)){
var str;
objj_msgSend(_71,"scanCharactersFromSet:intoString:",objj_msgSend(CPCharacterSet,"lowercaseLetterCharacterSet"),function(_79){
var _7a=str;
if(typeof _79!="undefined"){
str=_79;
}
return _7a;
});
if(!objj_msgSend(_71,"scanString:intoString:",":(",NULL)){
_51(_71,"expression");
}
_77+=str+":";
}
if(!objj_msgSend(_71,"scanString:intoString:",")",NULL)){
objj_msgSend(_78,"addObject:",objj_msgSend(_71,"parseExpression"));
while(objj_msgSend(_71,"scanString:intoString:",",",NULL)){
objj_msgSend(_78,"addObject:",objj_msgSend(_71,"parseExpression"));
}
if(!objj_msgSend(_71,"scanString:intoString:",")",NULL)){
_51(_71,"expression");
}
}
_73=objj_msgSend(CPExpression,"expressionForFunction:arguments:",_77,_78);
}else{
if(objj_msgSend(_71,"scanString:intoString:","UNION",NULL)){
_73=objj_msgSend(CPExpression,"expressionForUnionSet:with:",_73,objj_msgSend(_71,"parseExpression"));
}else{
if(objj_msgSend(_71,"scanString:intoString:","INTERSECT",NULL)){
_73=objj_msgSend(CPExpression,"expressionForIntersectSet:with:",_73,objj_msgSend(_71,"parseExpression"));
}else{
if(objj_msgSend(_71,"scanString:intoString:","MINUS",NULL)){
_73=objj_msgSend(CPExpression,"expressionForMinusSet:with:",_73,objj_msgSend(_71,"parseExpression"));
}else{
return _73;
}
}
}
}
}
}
}
}
}),new objj_method(sel_getUid("parsePowerExpression"),function(_7b,_7c){
with(_7b){
var _7d=objj_msgSend(_7b,"parseFunctionalExpression");
while(YES){
var _7e;
if(objj_msgSend(_7b,"scanString:intoString:","**",NULL)){
_7e=objj_msgSend(_7b,"parseFunctionalExpression");
_7d=objj_msgSend(CPExpression,"expressionForFunction:arguments:","raise:to:",objj_msgSend(CPArray,"arrayWithObjects:",_7d,_7e));
}else{
return _7d;
}
}
}
}),new objj_method(sel_getUid("parseMultiplicationExpression"),function(_7f,_80){
with(_7f){
var _81=objj_msgSend(_7f,"parsePowerExpression");
while(YES){
var _82;
if(objj_msgSend(_7f,"scanString:intoString:","*",NULL)){
_82=objj_msgSend(_7f,"parsePowerExpression");
_81=objj_msgSend(CPExpression,"expressionForFunction:arguments:","multiply:by:",objj_msgSend(CPArray,"arrayWithObjects:",_81,_82));
}else{
if(objj_msgSend(_7f,"scanString:intoString:","/",NULL)){
_82=objj_msgSend(_7f,"parsePowerExpression");
_81=objj_msgSend(CPExpression,"expressionForFunction:arguments:","divide:by:",objj_msgSend(CPArray,"arrayWithObjects:",_81,_82));
}else{
return _81;
}
}
}
}
}),new objj_method(sel_getUid("parseAdditionExpression"),function(_83,_84){
with(_83){
var _85=objj_msgSend(_83,"parseMultiplicationExpression");
while(YES){
var _86;
if(objj_msgSend(_83,"scanString:intoString:","+",NULL)){
_86=objj_msgSend(_83,"parseMultiplicationExpression");
_85=objj_msgSend(CPExpression,"expressionForFunction:arguments:","add:to:",objj_msgSend(CPArray,"arrayWithObjects:",_85,_86));
}else{
if(objj_msgSend(_83,"scanString:intoString:","-",NULL)){
_86=objj_msgSend(_83,"parseMultiplicationExpression");
_85=objj_msgSend(CPExpression,"expressionForFunction:arguments:","from:substract:",objj_msgSend(CPArray,"arrayWithObjects:",_85,_86));
}else{
return _85;
}
}
}
}
}),new objj_method(sel_getUid("parseBinaryExpression"),function(_87,_88){
with(_87){
var _89=objj_msgSend(_87,"parseAdditionExpression");
while(YES){
var _8a;
if(objj_msgSend(_87,"scanString:intoString:",":=",NULL)){
_8a=objj_msgSend(_87,"parseAdditionExpression");
}else{
return _89;
}
}
}
})]);
var _51=_51=function(_8b,_8c){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,"unable to parse "+_8c+" at index "+objj_msgSend(_8b,"scanLocation"));
};
objj_executeFile("CPCompoundPredicate.j",YES);
objj_executeFile("CPComparisonPredicate.j",YES);
objj_executeFile("CPExpression.j",YES);
p;11;CPScanner.jt;7494;@STATIC;1.0;i;16;CPCharacterSet.ji;14;CPDictionary.ji;10;CPString.jt;7420;
objj_executeFile("CPCharacterSet.j",YES);
objj_executeFile("CPDictionary.j",YES);
objj_executeFile("CPString.j",YES);
var _1=objj_allocateClassPair(CPObject,"CPScanner"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_string"),new objj_ivar("_locale"),new objj_ivar("_scanLocation"),new objj_ivar("_caseSensitive"),new objj_ivar("_charactersToBeSkipped")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initWithString:"),function(_3,_4,_5){
with(_3){
if(_3=objj_msgSendSuper({receiver:_3,super_class:objj_getClass("CPScanner").super_class},"init")){
_string=objj_msgSend(_5,"copy");
_scanLocation=0;
_charactersToBeSkipped=objj_msgSend(CPCharacterSet,"whitespaceCharacterSet");
_caseSensitive=NO;
}
return _3;
}
}),new objj_method(sel_getUid("copy"),function(_6,_7){
with(_6){
var _8=objj_msgSend(objj_msgSend(CPScanner,"alloc"),"initWithString:",objj_msgSend(_6,"string"));
objj_msgSend(_8,"setCharactersToBeSkipped:",objj_msgSend(_6,"charactersToBeSkipped"));
objj_msgSend(_8,"setCaseSensitive:",objj_msgSend(_6,"caseSensitive"));
objj_msgSend(_8,"setLocale:",objj_msgSend(_6,"locale"));
objj_msgSend(_8,"setScanLocation:",objj_msgSend(_6,"scanLocation"));
return _8;
}
}),new objj_method(sel_getUid("locale"),function(_9,_a){
with(_9){
return _locale;
}
}),new objj_method(sel_getUid("setLocale:"),function(_b,_c,_d){
with(_b){
_locale=_d;
}
}),new objj_method(sel_getUid("setCaseSensitive:"),function(_e,_f,_10){
with(_e){
_caseSensitive=_10;
}
}),new objj_method(sel_getUid("caseSensitive"),function(_11,_12){
with(_11){
return _caseSensitive;
}
}),new objj_method(sel_getUid("string"),function(_13,_14){
with(_13){
return _string;
}
}),new objj_method(sel_getUid("charactersToBeSkipped"),function(_15,_16){
with(_15){
return _charactersToBeSkipped;
}
}),new objj_method(sel_getUid("setCharactersToBeSkipped:"),function(_17,_18,c){
with(_17){
_charactersToBeSkipped=c;
}
}),new objj_method(sel_getUid("isAtEnd"),function(_19,_1a){
with(_19){
return _scanLocation==_string.length;
}
}),new objj_method(sel_getUid("scanLocation"),function(_1b,_1c){
with(_1b){
return _scanLocation;
}
}),new objj_method(sel_getUid("setScanLocation:"),function(_1d,_1e,_1f){
with(_1d){
if(_1f>_string.length){
_1f=_string.length;
}else{
if(_1f<0){
_1f=0;
}
}
_scanLocation=_1f;
}
}),new objj_method(sel_getUid("_performScanWithSelector:withObject:into:"),function(_20,_21,s,arg,ref){
with(_20){
var ret=objj_msgSend(_20,"performSelector:withObject:",s,arg);
if(ret==nil){
return NO;
}
if(ref!=nil){
ref(ret);
}
return YES;
}
}),new objj_method(sel_getUid("scanCharactersFromSet:intoString:"),function(_22,_23,_24,ref){
with(_22){
return objj_msgSend(_22,"_performScanWithSelector:withObject:into:",sel_getUid("scanCharactersFromSet:"),_24,ref);
}
}),new objj_method(sel_getUid("scanCharactersFromSet:"),function(_25,_26,_27){
with(_25){
return objj_msgSend(_25,"_scanWithSet:breakFlag:",_27,NO);
}
}),new objj_method(sel_getUid("scanUpToCharactersFromSet:intoString:"),function(_28,_29,_2a,ref){
with(_28){
return objj_msgSend(_28,"_performScanWithSelector:withObject:into:",sel_getUid("scanUpToCharactersFromSet:"),_2a,ref);
}
}),new objj_method(sel_getUid("scanUpToCharactersFromSet:"),function(_2b,_2c,_2d){
with(_2b){
return objj_msgSend(_2b,"_scanWithSet:breakFlag:",_2d,YES);
}
}),new objj_method(sel_getUid("_scanWithSet:breakFlag:"),function(_2e,_2f,_30,_31){
with(_2e){
if(objj_msgSend(_2e,"isAtEnd")){
return nil;
}
var _32=objj_msgSend(_2e,"scanLocation"),str=nil;
while(_32<_string.length){
var c=(_string.charAt(_32));
if(objj_msgSend(_30,"characterIsMember:",c)==_31){
break;
}
if(!objj_msgSend(_charactersToBeSkipped,"characterIsMember:",c)){
if(!str){
str="";
}
str+=c;
}
_32++;
}
if(str){
objj_msgSend(_2e,"setScanLocation:",_32);
}
return str;
}
}),new objj_method(sel_getUid("_movePastCharactersToBeSkipped"),function(_33,_34){
with(_33){
var _35=objj_msgSend(_33,"scanLocation"),_36=objj_msgSend(_33,"string"),_37=objj_msgSend(_33,"charactersToBeSkipped");
while(_35<_36.length){
if(!objj_msgSend(_37,"characterIsMember:",_36.charAt(_35))){
break;
}
_35++;
}
objj_msgSend(_33,"setScanLocation:",_35);
}
}),new objj_method(sel_getUid("scanString:intoString:"),function(_38,_39,_3a,ref){
with(_38){
return objj_msgSend(_38,"_performScanWithSelector:withObject:into:",sel_getUid("scanString:"),_3a,ref);
}
}),new objj_method(sel_getUid("scanString:"),function(_3b,_3c,s){
with(_3b){
objj_msgSend(_3b,"_movePastCharactersToBeSkipped");
if(objj_msgSend(_3b,"isAtEnd")){
return nil;
}
var _3d=objj_msgSend(_3b,"string").substr(objj_msgSend(_3b,"scanLocation"),s.length);
if((_caseSensitive&&_3d!=s)||(!_caseSensitive&&(_3d.toLowerCase()!=s.toLowerCase()))){
return nil;
}else{
objj_msgSend(_3b,"setScanLocation:",objj_msgSend(_3b,"scanLocation")+s.length);
return s;
}
}
}),new objj_method(sel_getUid("scanUpToString:intoString:"),function(_3e,_3f,_40,ref){
with(_3e){
return objj_msgSend(_3e,"_performScanWithSelector:withObject:into:",sel_getUid("scanUpToString:"),_40,ref);
}
}),new objj_method(sel_getUid("scanUpToString:"),function(_41,_42,s){
with(_41){
var _43=objj_msgSend(_41,"scanLocation"),str=objj_msgSend(_41,"string"),_44=nil;
while(_43<str.length){
var _45=str.substr(_43,s.length);
if(_45==s||(!_caseSensitive&&_45.toLowerCase()==s.toLowerCase())){
break;
}
if(!_44){
_44="";
}
_44+=str.charAt(_43);
_43++;
}
if(_44){
objj_msgSend(_41,"setScanLocation:",_43);
}
if(objj_msgSend(_41,"charactersToBeSkipped")){
_44=objj_msgSend(_44,"_stringByTrimmingCharactersInSet:options:",objj_msgSend(_41,"charactersToBeSkipped"),_CPCharacterSetTrimAtBeginning);
}
return _44;
}
}),new objj_method(sel_getUid("scanWithParseFunction:"),function(_46,_47,_48){
with(_46){
objj_msgSend(_46,"_movePastCharactersToBeSkipped");
var str=objj_msgSend(_46,"string"),loc=objj_msgSend(_46,"scanLocation");
if(objj_msgSend(_46,"isAtEnd")){
return 0;
}
var s=str.substring(loc,str.length),f=_48(s);
if(isNaN(f)){
return nil;
}
loc+=(""+f).length;
var i=0;
while(!isNaN(parseFloat(str.substring(loc+i,str.length)))){
i++;
}
objj_msgSend(_46,"setScanLocation:",loc+i);
return f;
}
}),new objj_method(sel_getUid("scanFloat"),function(_49,_4a){
with(_49){
return objj_msgSend(_49,"scanWithParseFunction:",parseFloat);
}
}),new objj_method(sel_getUid("scanInt"),function(_4b,_4c){
with(_4b){
return objj_msgSend(_4b,"scanWithParseFunction:",parseInt);
}
}),new objj_method(sel_getUid("scanInt:"),function(_4d,_4e,_4f){
with(_4d){
return objj_msgSend(_4d,"_performScanWithSelector:withObject:into:",sel_getUid("scanInt"),nil,_4f);
}
}),new objj_method(sel_getUid("scanFloat:"),function(_50,_51,_52){
with(_50){
return objj_msgSend(_50,"_performScanWithSelector:withObject:into:",sel_getUid("scanFloat"),nil,_52);
}
}),new objj_method(sel_getUid("scanDouble:"),function(_53,_54,_55){
with(_53){
return objj_msgSend(_53,"scanFloat:",_55);
}
}),new objj_method(sel_getUid("description"),function(_56,_57){
with(_56){
return objj_msgSendSuper({receiver:_56,super_class:objj_getClass("CPScanner").super_class},"description")+" {"+CPStringFromClass(objj_msgSend(_56,"class"))+", state = '"+(objj_msgSend(_56,"string").substr(0,_scanLocation)+"{{ SCAN LOCATION ->}}"+objj_msgSend(_56,"string").substr(_scanLocation))+"'; }";
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("scannerWithString:"),function(_58,_59,_5a){
with(_58){
return objj_msgSend(objj_msgSend(_58,"alloc"),"initWithString:",_5a);
}
})]);
p;16;CPCharacterSet.jt;29426;@STATIC;1.0;i;9;CPArray.ji;13;CPException.ji;10;CPObject.ji;10;CPString.ji;7;CPURL.jt;29334;
objj_executeFile("CPArray.j",YES);
objj_executeFile("CPException.j",YES);
objj_executeFile("CPObject.j",YES);
objj_executeFile("CPString.j",YES);
objj_executeFile("CPURL.j",YES);
var _1={};
var _2=objj_allocateClassPair(CPObject,"CPCharacterSet"),_3=_2.isa;
class_addIvars(_2,[new objj_ivar("_inverted")]);
objj_registerClassPair(_2);
class_addMethods(_2,[new objj_method(sel_getUid("init"),function(_4,_5){
with(_4){
_4=objj_msgSendSuper({receiver:_4,super_class:objj_getClass("CPCharacterSet").super_class},"init");
if(_4){
_inverted=NO;
}
return _4;
}
}),new objj_method(sel_getUid("invert"),function(_6,_7){
with(_6){
_inverted=!_inverted;
}
}),new objj_method(sel_getUid("characterIsMember:"),function(_8,_9,_a){
with(_8){
}
}),new objj_method(sel_getUid("hasMemberInPlane:"),function(_b,_c,_d){
with(_b){
}
}),new objj_method(sel_getUid("_setInverted:"),function(_e,_f,_10){
with(_e){
_inverted=_10;
}
})]);
class_addMethods(_3,[new objj_method(sel_getUid("characterSetWithCharactersInString:"),function(_11,_12,_13){
with(_11){
return objj_msgSend(objj_msgSend(_CPStringContentCharacterSet,"alloc"),"initWithString:",_13);
}
}),new objj_method(sel_getUid("characterSetWithRange:"),function(_14,_15,_16){
with(_14){
return objj_msgSend(objj_msgSend(_CPRangeCharacterSet,"alloc"),"initWithRange:",_16);
}
}),new objj_method(sel_getUid("alphanumericCharacterSet"),function(_17,_18){
with(_17){
return objj_msgSend(CPCharacterSet,"_sharedCharacterSetWithName:",_18);
}
}),new objj_method(sel_getUid("controlCharacterSet"),function(_19,_1a){
with(_19){
return objj_msgSend(CPCharacterSet,"_sharedCharacterSetWithName:",_1a);
}
}),new objj_method(sel_getUid("decimalDigitCharacterSet"),function(_1b,_1c){
with(_1b){
return objj_msgSend(CPCharacterSet,"_sharedCharacterSetWithName:",_1c);
}
}),new objj_method(sel_getUid("decomposableCharacterSet"),function(_1d,_1e){
with(_1d){
return objj_msgSend(CPCharacterSet,"_sharedCharacterSetWithName:",_1e);
}
}),new objj_method(sel_getUid("illegalCharacterSet"),function(_1f,_20){
with(_1f){
return objj_msgSend(CPCharacterSet,"_sharedCharacterSetWithName:",_20);
}
}),new objj_method(sel_getUid("letterCharacterSet"),function(_21,_22){
with(_21){
return objj_msgSend(CPCharacterSet,"_sharedCharacterSetWithName:",_22);
}
}),new objj_method(sel_getUid("lowercaseLetterCharacterSet"),function(_23,_24){
with(_23){
return objj_msgSend(CPCharacterSet,"_sharedCharacterSetWithName:",_24);
}
}),new objj_method(sel_getUid("nonBaseCharacterSet"),function(_25,_26){
with(_25){
return objj_msgSend(CPCharacterSet,"_sharedCharacterSetWithName:",_26);
}
}),new objj_method(sel_getUid("punctuationCharacterSet"),function(_27,_28){
with(_27){
return objj_msgSend(CPCharacterSet,"_sharedCharacterSetWithName:",_28);
}
}),new objj_method(sel_getUid("uppercaseLetterCharacterSet"),function(_29,_2a){
with(_29){
return objj_msgSend(CPCharacterSet,"_sharedCharacterSetWithName:",_2a);
}
}),new objj_method(sel_getUid("whitespaceAndNewlineCharacterSet"),function(_2b,_2c){
with(_2b){
return objj_msgSend(CPCharacterSet,"_sharedCharacterSetWithName:",_2c);
}
}),new objj_method(sel_getUid("whitespaceCharacterSet"),function(_2d,_2e){
with(_2d){
return objj_msgSend(CPCharacterSet,"_sharedCharacterSetWithName:",_2e);
}
}),new objj_method(sel_getUid("_sharedCharacterSetWithName:"),function(_2f,_30,_31){
with(_2f){
var cs=_1[_31];
if(cs==nil){
var i=0,_32=objj_msgSend(CPArray,"array"),_33=eval(_31);
for(;i<_33.length;i+=2){
var loc=_33[i],_34=_33[i+1],_35=CPMakeRange(loc,_34);
objj_msgSend(_32,"addObject:",_35);
}
cs=objj_msgSend(objj_msgSend(_CPRangeCharacterSet,"alloc"),"initWithRanges:",_32);
_1[_31]=cs;
}
return cs;
}
})]);
var _36="CPCharacterSetInvertedKey";
var _2=objj_getClass("CPCharacterSet");
if(!_2){
throw new SyntaxError("*** Could not find definition for class \"CPCharacterSet\"");
}
var _3=_2.isa;
class_addMethods(_2,[new objj_method(sel_getUid("initWithCoder:"),function(_37,_38,_39){
with(_37){
if(_37=objj_msgSendSuper({receiver:_37,super_class:objj_getClass("CPCharacterSet").super_class},"init")){
_inverted=objj_msgSend(_39,"decodeBoolForKey:",_36);
}
return _37;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_3a,_3b,_3c){
with(_3a){
objj_msgSend(_3c,"encodeBool:forKey:",_inverted,_36);
}
})]);
var _2=objj_allocateClassPair(CPCharacterSet,"_CPRangeCharacterSet"),_3=_2.isa;
class_addIvars(_2,[new objj_ivar("_ranges")]);
objj_registerClassPair(_2);
class_addMethods(_2,[new objj_method(sel_getUid("initWithRange:"),function(_3d,_3e,r){
with(_3d){
return objj_msgSend(_3d,"initWithRanges:",objj_msgSend(CPArray,"arrayWithObject:",r));
}
}),new objj_method(sel_getUid("initWithRanges:"),function(_3f,_40,_41){
with(_3f){
_3f=objj_msgSendSuper({receiver:_3f,super_class:objj_getClass("_CPRangeCharacterSet").super_class},"init");
if(_3f){
_ranges=_41;
}
return _3f;
}
}),new objj_method(sel_getUid("copy"),function(_42,_43){
with(_42){
var set=objj_msgSend(objj_msgSend(_CPRangeCharacterSet,"alloc"),"initWithRanges:",_ranges);
objj_msgSend(set,"_setInverted:",_inverted);
return set;
}
}),new objj_method(sel_getUid("invertedSet"),function(_44,_45){
with(_44){
var set=objj_msgSend(objj_msgSend(_CPRangeCharacterSet,"alloc"),"initWithRanges:",_ranges);
objj_msgSend(set,"invert");
return set;
}
}),new objj_method(sel_getUid("characterIsMember:"),function(_46,_47,_48){
with(_46){
c=_48.charCodeAt(0);
var enu=objj_msgSend(_ranges,"objectEnumerator"),_49;
while((_49=objj_msgSend(enu,"nextObject"))!==nil){
if(CPLocationInRange(c,_49)){
return !_inverted;
}
}
return _inverted;
}
}),new objj_method(sel_getUid("hasMemberInPlane:"),function(_4a,_4b,_4c){
with(_4a){
var _4d=FLOOR((range.start+range.length-1)/65536);
return (_4c<=_4d);
}
}),new objj_method(sel_getUid("addCharactersInRange:"),function(_4e,_4f,_50){
with(_4e){
objj_msgSend(_ranges,"addObject:",_50);
}
}),new objj_method(sel_getUid("addCharactersInString:"),function(_51,_52,_53){
with(_51){
var i=0;
for(;i<_53.length;i++){
var _54=_53.charCodeAt(i),_55=CPMakeRange(_54,1);
objj_msgSend(_ranges,"addObject:",_55);
}
}
})]);
var _2=objj_allocateClassPair(CPCharacterSet,"_CPStringContentCharacterSet"),_3=_2.isa;
class_addIvars(_2,[new objj_ivar("_string")]);
objj_registerClassPair(_2);
class_addMethods(_2,[new objj_method(sel_getUid("initWithString:"),function(_56,_57,s){
with(_56){
_56=objj_msgSendSuper({receiver:_56,super_class:objj_getClass("_CPStringContentCharacterSet").super_class},"init");
if(_56){
_string=s;
}
return _56;
}
}),new objj_method(sel_getUid("copy"),function(_58,_59){
with(_58){
var set=objj_msgSend(objj_msgSend(_CPStringContentCharacterSet,"alloc"),"initWithString:",_string);
objj_msgSend(set,"_setInverted:",_inverted);
return set;
}
}),new objj_method(sel_getUid("invertedSet"),function(_5a,_5b){
with(_5a){
var set=objj_msgSend(objj_msgSend(_CPStringContentCharacterSet,"alloc"),"initWithString:",_string);
objj_msgSend(set,"invert");
return set;
}
}),new objj_method(sel_getUid("characterIsMember:"),function(_5c,_5d,c){
with(_5c){
return (_string.indexOf(c.charAt(0))!=-1)==!_inverted;
}
}),new objj_method(sel_getUid("description"),function(_5e,_5f){
with(_5e){
return objj_msgSendSuper({receiver:_5e,super_class:objj_getClass("_CPStringContentCharacterSet").super_class},"description")+" { string = '"+_string+"'}";
}
}),new objj_method(sel_getUid("hasMemberInPlane:"),function(_60,_61,_62){
with(_60){
return _62==0;
}
}),new objj_method(sel_getUid("addCharactersInRange:"),function(_63,_64,_65){
with(_63){
var i=_65.location,_66=_65.location+_65.length;
for(;i<_66;i++){
var s=String.fromCharCode(i);
if(!objj_msgSend(_63,"characterIsMember:",s)){
_string=objj_msgSend(_string,"stringByAppendingString:",s);
}
}
}
}),new objj_method(sel_getUid("addCharactersInString:"),function(_67,_68,_69){
with(_67){
var i=0;
for(;i<_69.length;i++){
var s=_69.charAt(i);
if(!objj_msgSend(_67,"characterIsMember:",s)){
_string=objj_msgSend(_string,"stringByAppendingString:",s);
}
}
}
}),new objj_method(sel_getUid("isEqual:"),function(_6a,_6b,_6c){
with(_6a){
if(_6a===_6c){
return YES;
}
if(!_6c||!objj_msgSend(_6c,"isKindOfClass:",objj_msgSend(_6a,"class"))){
return NO;
}
return objj_msgSend(_6a,"_isEqualToStringContentCharacterSet:",_6c);
}
}),new objj_method(sel_getUid("_isEqualToStringContentCharacterSet:"),function(_6d,_6e,_6f){
with(_6d){
if(!_6f){
return NO;
}
return _string==_6f._string&&_inverted==_6f._inverted;
}
})]);
var _70="_CPStringContentCharacterSetStringKey";
var _2=objj_getClass("_CPStringContentCharacterSet");
if(!_2){
throw new SyntaxError("*** Could not find definition for class \"_CPStringContentCharacterSet\"");
}
var _3=_2.isa;
class_addMethods(_2,[new objj_method(sel_getUid("initWithCoder:"),function(_71,_72,_73){
with(_71){
if(_71=objj_msgSendSuper({receiver:_71,super_class:objj_getClass("_CPStringContentCharacterSet").super_class},"initWithCoder:",_73)){
_string=objj_msgSend(_73,"decodeObjectForKey:",_70);
}
return _71;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_74,_75,_76){
with(_74){
objj_msgSendSuper({receiver:_74,super_class:objj_getClass("_CPStringContentCharacterSet").super_class},"encodeWithCoder:",_76);
objj_msgSend(_76,"encodeObject:forKey:",_string,_70);
}
})]);
_CPCharacterSetTrimAtBeginning=1<<1;
_CPCharacterSetTrimAtEnd=1<<2;
var _2=objj_getClass("CPString");
if(!_2){
throw new SyntaxError("*** Could not find definition for class \"CPString\"");
}
var _3=_2.isa;
class_addMethods(_2,[new objj_method(sel_getUid("componentsSeparatedByCharactersInSet:"),function(_77,_78,_79){
with(_77){
if(!_79){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,"componentsSeparatedByCharactersInSet: the separator can't be 'nil'");
}
var _7a=objj_msgSend(CPMutableArray,"array"),_7b=CPMakeRange(0,0),i=0;
for(;i<_77.length;i++){
if(objj_msgSend(_79,"characterIsMember:",_77.charAt(i))){
_7b.length=i-_7b.location;
objj_msgSend(_7a,"addObject:",objj_msgSend(_77,"substringWithRange:",_7b));
_7b.location+=_7b.length+1;
}
}
_7b.length=_77.length-_7b.location;
objj_msgSend(_7a,"addObject:",objj_msgSend(_77,"substringWithRange:",_7b));
return _7a;
}
}),new objj_method(sel_getUid("stringByTrimmingCharactersInSet:"),function(_7c,_7d,set){
with(_7c){
return objj_msgSend(_7c,"_stringByTrimmingCharactersInSet:options:",set,_CPCharacterSetTrimAtBeginning|_CPCharacterSetTrimAtEnd);
}
}),new objj_method(sel_getUid("_stringByTrimmingCharactersInSet:options:"),function(_7e,_7f,set,_80){
with(_7e){
var str=_7e;
if(_80&_CPCharacterSetTrimAtBeginning){
var _81=0;
while(_81<_7e.length&&objj_msgSend(set,"characterIsMember:",_7e.charAt(_81))){
_81++;
}
str=str.substr(_81);
}
if(_80&_CPCharacterSetTrimAtEnd){
var _82=str.length;
while(_82>0&&objj_msgSend(set,"characterIsMember:",_7e.charAt(_82))){
_82--;
}
str=str.substr(0,_82+1);
}
return str;
}
})]);
alphanumericCharacterSet=[48,10,65,26,97,26,170,1,178,2,181,1,185,2,188,3,192,23,216,31,248,458,710,12,736,5,750,1,768,112,890,4,902,1,904,3,908,1,910,20,931,44,976,38,1015,139,1155,4,1160,140,1329,38,1369,1,1377,39,1425,45,1471,1,1473,2,1476,2,1479,1,1488,27,1520,3,1552,6,1569,26,1600,31,1632,10,1646,102,1749,8,1758,11,1770,19,1791,1,1808,59,1869,33,1920,50,1984,54,2042,1,2305,57,2364,18,2384,5,2392,12,2406,10,2427,5,2433,3,2437,8,2447,2,2451,22,2474,7,2482,1,2486,4,2492,9,2503,2,2507,4,2519,1,2524,2,2527,5,2534,12,2548,6,2561,3,2565,6,2575,2,2579,22,2602,7,2610,2,2613,2,2616,2,2620,1,2622,5,2631,2,2635,3,2649,4,2654,1,2662,15,2689,3,2693,9,2703,3,2707,22,2730,7,2738,2,2741,5,2748,10,2759,3,2763,3,2768,1,2784,4,2790,10,2817,3,2821,8,2831,2,2835,22,2858,7,2866,2,2869,5,2876,8,2887,2,2891,3,2902,2,2908,2,2911,3,2918,10,2929,1,2946,2,2949,6,2958,3,2962,4,2969,2,2972,1,2974,2,2979,2,2984,3,2990,12,3006,5,3014,3,3018,4,3031,1,3046,13,3073,3,3077,8,3086,3,3090,23,3114,10,3125,5,3134,7,3142,3,3146,4,3157,2,3168,2,3174,10,3202,2,3205,8,3214,3,3218,23,3242,10,3253,5,3260,9,3270,3,3274,4,3285,2,3294,1,3296,4,3302,10,3330,2,3333,8,3342,3,3346,23,3370,16,3390,6,3398,3,3402,4,3415,1,3424,2,3430,10,3458,2,3461,18,3482,24,3507,9,3517,1,3520,7,3530,1,3535,6,3542,1,3544,8,3570,2,3585,58,3648,15,3664,10,3713,2,3716,1,3719,2,3722,1,3725,1,3732,4,3737,7,3745,3,3749,1,3751,1,3754,2,3757,13,3771,3,3776,5,3782,1,3784,6,3792,10,3804,2,3840,1,3864,2,3872,20,3893,1,3895,1,3897,1,3902,10,3913,34,3953,20,3974,6,3984,8,3993,36,4038,1,4096,34,4131,5,4137,2,4140,7,4150,4,4160,10,4176,10,4256,38,4304,43,4348,1,4352,90,4447,68,4520,82,4608,73,4682,4,4688,7,4696,1,4698,4,4704,41,4746,4,4752,33,4786,4,4792,7,4800,1,4802,4,4808,15,4824,57,4882,4,4888,67,4959,1,4969,20,4992,16,5024,85,5121,620,5743,8,5761,26,5792,75,5870,3,5888,13,5902,7,5920,21,5952,20,5984,13,5998,3,6002,2,6016,52,6070,30,6103,1,6108,2,6112,10,6128,10,6155,3,6160,10,6176,88,6272,42,6400,29,6432,12,6448,12,6470,40,6512,5,6528,42,6576,26,6608,10,6656,28,6912,76,6992,10,7019,9,7424,203,7678,158,7840,90,7936,22,7960,6,7968,38,8008,6,8016,8,8025,1,8027,1,8029,1,8031,31,8064,53,8118,7,8126,1,8130,3,8134,7,8144,4,8150,6,8160,13,8178,3,8182,7,8304,2,8308,6,8319,11,8336,5,8400,32,8450,1,8455,1,8458,10,8469,1,8473,5,8484,1,8486,1,8488,1,8490,4,8495,11,8508,4,8517,5,8526,1,8531,50,9312,60,9450,22,10102,30,11264,47,11312,47,11360,13,11380,4,11392,101,11517,1,11520,38,11568,54,11631,1,11648,23,11680,7,11688,7,11696,7,11704,7,11712,7,11720,7,11728,7,11736,7,12293,3,12321,15,12337,5,12344,5,12353,86,12441,2,12445,3,12449,90,12540,4,12549,40,12593,94,12690,4,12704,24,12784,16,12832,10,12881,15,12928,10,12977,15,13312,6582,19968,20924,40960,1165,42775,4,43008,40,43072,52,44032,11172,63744,302,64048,59,64112,106,64256,7,64275,5,64285,12,64298,13,64312,5,64318,1,64320,2,64323,2,64326,108,64467,363,64848,64,64914,54,65008,12,65024,16,65056,4,65136,5,65142,135,65296,10,65313,26,65345,26,65382,89,65474,6,65482,6,65490,6];
controlCharacterSet=[0,32,127,33,173,1,1536,4,1757,1,1807,1,6068,2,8203,5,8234,5,8288,4,8298,6,65279,1];
decimalDigitCharacterSet=[48,10,1632,10,1776,10,1984,10,2406,10,2534,10,2662,10,2790,10,2918,10,3046,10,3174,10,3302,10,3430,10,3664,10,3792,10,3872,10,4160,10,6112,10,6160,10,6470,10,6608,10,6992,10];
decomposableCharacterSet=[192,6,199,9,209,6,217,5,224,6,231,9,241,6,249,5,255,17,274,20,296,9,308,4,313,6,323,6,332,6,340,18,360,23,416,2,431,2,461,16,478,6,486,11,500,2,504,36,542,2,550,14,832,2,835,2,884,1,894,1,901,6,908,1,910,3,938,7,970,5,979,2,1024,2,1027,1,1031,1,1036,3,1049,1,1081,1,1104,2,1107,1,1111,1,1116,3,1142,2,1217,2,1232,4,1238,2,1242,6,1250,6,1258,12,1272,2,1570,5,1728,1,1730,1,1747,1,2345,1,2353,1,2356,1,2392,8,2507,2,2524,2,2527,1,2611,1,2614,1,2649,3,2654,1,2888,1,2891,2,2908,2,2964,1,3018,3,3144,1,3264,1,3271,2,3274,2,3402,3,3546,1,3548,3,3907,1,3917,1,3922,1,3927,1,3932,1,3945,1,3955,1,3957,2,3960,1,3969,1,3987,1,3997,1,4002,1,4007,1,4012,1,4025,1,4134,1,6918,1,6920,1,6922,1,6924,1,6926,1,6930,1,6971,1,6973,1,6976,2,6979,1,7680,154,7835,1,7840,90,7936,22,7960,6,7968,38,8008,6,8016,8,8025,1,8027,1,8029,1,8031,31,8064,53,8118,7,8126,1,8129,4,8134,14,8150,6,8157,19,8178,3,8182,8,8192,2,8486,1,8490,2,8602,2,8622,1,8653,3,8708,1,8713,1,8716,1,8740,1,8742,1,8769,1,8772,1,8775,1,8777,1,8800,1,8802,1,8813,5,8820,2,8824,2,8832,2,8836,2,8840,2,8876,4,8928,4,8938,4,9001,2,10972,1,12364,1,12366,1,12368,1,12370,1,12372,1,12374,1,12376,1,12378,1,12380,1,12382,1,12384,1,12386,1,12389,1,12391,1,12393,1,12400,2,12403,2,12406,2,12409,2,12412,2,12436,1,12446,1,12460,1,12462,1,12464,1,12466,1,12468,1,12470,1,12472,1,12474,1,12476,1,12478,1,12480,1,12482,1,12485,1,12487,1,12489,1,12496,2,12499,2,12502,2,12505,2,12508,2,12532,1,12535,4,12542,1,44032,11172,63744,270,64016,1,64018,1,64021,10,64032,1,64034,1,64037,2,64042,4,64048,59,64112,106,64285,1,64287,1,64298,13,64312,5,64318,1,64320,2,64323,2];
illegalCharacterSet=[880,4,886,4,895,5,907,1,909,1,930,1,975,1,1159,1,1300,29,1367,2,1376,1,1416,1,1419,6,1480,8,1515,5,1525,11,1540,7,1558,5,1564,2,1568,1,1595,5,1631,1,1806,1,1867,2,1902,18,1970,14,2043,262,2362,2,2382,2,2389,3,2417,10,2432,1,2436,1,2445,2,2449,2,2473,1,2481,1,2483,3,2490,2,2501,2,2505,2,2511,8,2520,4,2526,1,2532,2,2555,6,2564,1,2571,4,2577,2,2601,1,2609,1,2612,1,2615,1,2618,2,2621,1,2627,4,2633,2,2638,11,2653,1,2655,7,2677,12,2692,1,2702,1,2706,1,2729,1,2737,1,2740,1,2746,2,2758,1,2762,1,2766,2,2769,15,2788,2,2800,1,2802,15,2820,1,2829,2,2833,2,2857,1,2865,1,2868,1,2874,2,2884,3,2889,2,2894,8,2904,4,2910,1,2914,4,2930,16,2948,1,2955,3,2961,1,2966,3,2971,1,2973,1,2976,3,2981,3,2987,3,3002,4,3011,3,3017,1,3022,9,3032,14,3067,6,3076,1,3085,1,3089,1,3113,1,3124,1,3130,4,3141,1,3145,1,3150,7,3159,9,3170,4,3184,18,3204,1,3213,1,3217,1,3241,1,3252,1,3258,2,3269,1,3273,1,3278,7,3287,7,3295,1,3300,2,3312,1,3315,15,3332,1,3341,1,3345,1,3369,1,3386,4,3396,2,3401,1,3406,9,3416,8,3426,4,3440,18,3460,1,3479,3,3506,1,3516,1,3518,2,3527,3,3531,4,3541,1,3543,1,3552,18,3573,12,3643,4,3676,37,3715,1,3717,2,3721,1,3723,2,3726,6,3736,1,3744,1,3748,1,3750,1,3752,2,3756,1,3770,1,3774,2,3781,1,3783,1,3790,2,3802,2,3806,34,3912,1,3947,6,3980,4,3992,1,4029,1,4045,2,4050,46,4130,1,4136,1,4139,1,4147,3,4154,6,4186,70,4294,10,4349,3,4442,5,4515,5,4602,6,4681,1,4686,2,4695,1,4697,1,4702,2,4745,1,4750,2,4785,1,4790,2,4799,1,4801,1,4806,2,4823,1,4881,1,4886,2,4955,4,4989,3,5018,6,5109,12,5751,9,5789,3,5873,15,5901,1,5909,11,5943,9,5972,12,5997,1,6001,1,6004,12,6110,2,6122,6,6138,6,6159,1,6170,6,6264,8,6314,86,6429,3,6444,4,6460,4,6465,3,6510,2,6517,11,6570,6,6602,6,6618,4,6684,2,6688,224,6988,4,7037,387,7627,51,7836,4,7930,6,7958,2,7966,2,8006,2,8014,2,8024,1,8026,1,8028,1,8030,1,8062,2,8117,1,8133,1,8148,2,8156,1,8176,2,8181,1,8191,1,8292,6,8306,2,8335,1,8341,11,8374,26,8432,16,8527,4,8581,11,9192,24,9255,25,9291,21,9885,3,9907,78,9989,1,9994,2,10024,1,10060,1,10062,1,10067,3,10071,1,10079,2,10133,3,10160,1,10175,1,10187,5,10220,4,11035,5,11044,220,11311,1,11359,1,11373,7,11384,8,11499,14,11558,10,11622,9,11632,16,11671,9,11687,1,11695,1,11703,1,11711,1,11719,1,11727,1,11735,1,11743,33,11800,4,11806,98,11930,1,12020,12,12246,26,12284,4,12352,1,12439,2,12544,5,12589,4,12687,1,12728,8,12752,32,12831,1,12868,12,13055,1,19894,10,40892,68,42125,3,42183,569,42779,5,42786,222,43052,20,43128,904,55204,92,64046,2,64107,5,64218,38,64263,12,64280,5,64311,1,64317,1,64319,1,64322,1,64325,1,64434,33,64832,16,64912,2,64968,40,65022,2,65050,6,65060,12,65107,1,65127,1,65132,4,65141,1,65277,2,65280,1,65471,3,65480,2,65488,2,65496,2,65501,3,65511,1,65519,10];
letterCharacterSet=[65,26,97,26,170,1,181,1,186,1,192,23,216,31,248,458,710,12,736,5,750,1,768,112,890,4,902,1,904,3,908,1,910,20,931,44,976,38,1015,139,1155,4,1160,140,1329,38,1369,1,1377,39,1425,45,1471,1,1473,2,1476,2,1479,1,1488,27,1520,3,1552,6,1569,26,1600,31,1646,102,1749,8,1758,11,1770,6,1786,3,1791,1,1808,59,1869,33,1920,50,1994,44,2042,1,2305,57,2364,18,2384,5,2392,12,2427,5,2433,3,2437,8,2447,2,2451,22,2474,7,2482,1,2486,4,2492,9,2503,2,2507,4,2519,1,2524,2,2527,5,2544,2,2561,3,2565,6,2575,2,2579,22,2602,7,2610,2,2613,2,2616,2,2620,1,2622,5,2631,2,2635,3,2649,4,2654,1,2672,5,2689,3,2693,9,2703,3,2707,22,2730,7,2738,2,2741,5,2748,10,2759,3,2763,3,2768,1,2784,4,2817,3,2821,8,2831,2,2835,22,2858,7,2866,2,2869,5,2876,8,2887,2,2891,3,2902,2,2908,2,2911,3,2929,1,2946,2,2949,6,2958,3,2962,4,2969,2,2972,1,2974,2,2979,2,2984,3,2990,12,3006,5,3014,3,3018,4,3031,1,3073,3,3077,8,3086,3,3090,23,3114,10,3125,5,3134,7,3142,3,3146,4,3157,2,3168,2,3202,2,3205,8,3214,3,3218,23,3242,10,3253,5,3260,9,3270,3,3274,4,3285,2,3294,1,3296,4,3330,2,3333,8,3342,3,3346,23,3370,16,3390,6,3398,3,3402,4,3415,1,3424,2,3458,2,3461,18,3482,24,3507,9,3517,1,3520,7,3530,1,3535,6,3542,1,3544,8,3570,2,3585,58,3648,15,3713,2,3716,1,3719,2,3722,1,3725,1,3732,4,3737,7,3745,3,3749,1,3751,1,3754,2,3757,13,3771,3,3776,5,3782,1,3784,6,3804,2,3840,1,3864,2,3893,1,3895,1,3897,1,3902,10,3913,34,3953,20,3974,6,3984,8,3993,36,4038,1,4096,34,4131,5,4137,2,4140,7,4150,4,4176,10,4256,38,4304,43,4348,1,4352,90,4447,68,4520,82,4608,73,4682,4,4688,7,4696,1,4698,4,4704,41,4746,4,4752,33,4786,4,4792,7,4800,1,4802,4,4808,15,4824,57,4882,4,4888,67,4959,1,4992,16,5024,85,5121,620,5743,8,5761,26,5792,75,5888,13,5902,7,5920,21,5952,20,5984,13,5998,3,6002,2,6016,52,6070,30,6103,1,6108,2,6155,3,6176,88,6272,42,6400,29,6432,12,6448,12,6480,30,6512,5,6528,42,6576,26,6656,28,6912,76,7019,9,7424,203,7678,158,7840,90,7936,22,7960,6,7968,38,8008,6,8016,8,8025,1,8027,1,8029,1,8031,31,8064,53,8118,7,8126,1,8130,3,8134,7,8144,4,8150,6,8160,13,8178,3,8182,7,8305,1,8319,1,8336,5,8400,32,8450,1,8455,1,8458,10,8469,1,8473,5,8484,1,8486,1,8488,1,8490,4,8495,11,8508,4,8517,5,8526,1,8579,2,11264,47,11312,47,11360,13,11380,4,11392,101,11520,38,11568,54,11631,1,11648,23,11680,7,11688,7,11696,7,11704,7,11712,7,11720,7,11728,7,11736,7,12293,2,12330,6,12337,5,12347,2,12353,86,12441,2,12445,3,12449,90,12540,4,12549,40,12593,94,12704,24,12784,16,13312,6582,19968,20924,40960,1165,42775,4,43008,40,43072,52,44032,11172,63744,302,64048,59,64112,106,64256,7,64275,5,64285,12,64298,13,64312,5,64318,1,64320,2,64323,2,64326,108,64467,363,64848,64,64914,54,65008,12,65024,16,65056,4,65136,5,65142,135,65313,26,65345,26,65382,89,65474,6,65482,6,65490,6];
lowercaseLetterCharacterSet=[97,26,170,1,181,1,186,1,223,24,248,8,257,1,259,1,261,1,263,1,265,1,267,1,269,1,271,1,273,1,275,1,277,1,279,1,281,1,283,1,285,1,287,1,289,1,291,1,293,1,295,1,297,1,299,1,301,1,303,1,305,1,307,1,309,1,311,2,314,1,316,1,318,1,320,1,322,1,324,1,326,1,328,2,331,1,333,1,335,1,337,1,339,1,341,1,343,1,345,1,347,1,349,1,351,1,353,1,355,1,357,1,359,1,361,1,363,1,365,1,367,1,369,1,371,1,373,1,375,1,378,1,380,1,382,3,387,1,389,1,392,1,396,2,402,1,405,1,409,3,414,1,417,1,419,1,421,1,424,1,426,2,429,1,432,1,436,1,438,1,441,2,445,3,454,1,457,1,460,1,462,1,464,1,466,1,468,1,470,1,472,1,474,1,476,2,479,1,481,1,483,1,485,1,487,1,489,1,491,1,493,1,495,2,499,1,501,1,505,1,507,1,509,1,511,1,513,1,515,1,517,1,519,1,521,1,523,1,525,1,527,1,529,1,531,1,533,1,535,1,537,1,539,1,541,1,543,1,545,1,547,1,549,1,551,1,553,1,555,1,557,1,559,1,561,1,563,7,572,1,575,2,578,1,583,1,585,1,587,1,589,1,591,69,661,27,891,3,912,1,940,35,976,2,981,3,985,1,987,1,989,1,991,1,993,1,995,1,997,1,999,1,1001,1,1003,1,1005,1,1007,5,1013,1,1016,1,1019,2,1072,48,1121,1,1123,1,1125,1,1127,1,1129,1,1131,1,1133,1,1135,1,1137,1,1139,1,1141,1,1143,1,1145,1,1147,1,1149,1,1151,1,1153,1,1163,1,1165,1,1167,1,1169,1,1171,1,1173,1,1175,1,1177,1,1179,1,1181,1,1183,1,1185,1,1187,1,1189,1,1191,1,1193,1,1195,1,1197,1,1199,1,1201,1,1203,1,1205,1,1207,1,1209,1,1211,1,1213,1,1215,1,1218,1,1220,1,1222,1,1224,1,1226,1,1228,1,1230,2,1233,1,1235,1,1237,1,1239,1,1241,1,1243,1,1245,1,1247,1,1249,1,1251,1,1253,1,1255,1,1257,1,1259,1,1261,1,1263,1,1265,1,1267,1,1269,1,1271,1,1273,1,1275,1,1277,1,1279,1,1281,1,1283,1,1285,1,1287,1,1289,1,1291,1,1293,1,1295,1,1297,1,1299,1,1377,39,7424,44,7522,22,7545,34,7681,1,7683,1,7685,1,7687,1,7689,1,7691,1,7693,1,7695,1,7697,1,7699,1,7701,1,7703,1,7705,1,7707,1,7709,1,7711,1,7713,1,7715,1,7717,1,7719,1,7721,1,7723,1,7725,1,7727,1,7729,1,7731,1,7733,1,7735,1,7737,1,7739,1,7741,1,7743,1,7745,1,7747,1,7749,1,7751,1,7753,1,7755,1,7757,1,7759,1,7761,1,7763,1,7765,1,7767,1,7769,1,7771,1,7773,1,7775,1,7777,1,7779,1,7781,1,7783,1,7785,1,7787,1,7789,1,7791,1,7793,1,7795,1,7797,1,7799,1,7801,1,7803,1,7805,1,7807,1,7809,1,7811,1,7813,1,7815,1,7817,1,7819,1,7821,1,7823,1,7825,1,7827,1,7829,7,7841,1,7843,1,7845,1,7847,1,7849,1,7851,1,7853,1,7855,1,7857,1,7859,1,7861,1,7863,1,7865,1,7867,1,7869,1,7871,1,7873,1,7875,1,7877,1,7879,1,7881,1,7883,1,7885,1,7887,1,7889,1,7891,1,7893,1,7895,1,7897,1,7899,1,7901,1,7903,1,7905,1,7907,1,7909,1,7911,1,7913,1,7915,1,7917,1,7919,1,7921,1,7923,1,7925,1,7927,1,7929,1,7936,8,7952,6,7968,8,7984,8,8000,6,8016,8,8032,8,8048,14,8064,8,8080,8,8096,8,8112,5,8118,2,8126,1,8130,3,8134,2,8144,4,8150,2,8160,8,8178,3,8182,2,8305,1,8319,1,8458,1,8462,2,8467,1,8495,1,8500,1,8505,1,8508,2,8518,4,8526,1,8580,1,11312,47,11361,1,11365,2,11368,1,11370,1,11372,1,11380,1,11382,2,11393,1,11395,1,11397,1,11399,1,11401,1,11403,1,11405,1,11407,1,11409,1,11411,1,11413,1,11415,1,11417,1,11419,1,11421,1,11423,1,11425,1,11427,1,11429,1,11431,1,11433,1,11435,1,11437,1,11439,1,11441,1,11443,1,11445,1,11447,1,11449,1,11451,1,11453,1,11455,1,11457,1,11459,1,11461,1,11463,1,11465,1,11467,1,11469,1,11471,1,11473,1,11475,1,11477,1,11479,1,11481,1,11483,1,11485,1,11487,1,11489,1,11491,2,11520,38,64256,7,64275,5];
nonBaseCharacterSet=[768,112,1155,4,1160,2,1425,45,1471,1,1473,2,1476,2,1479,1,1552,6,1611,20,1648,1,1750,7,1758,7,1767,2,1770,4,1809,1,1840,27,1958,11,2027,9,2305,3,2364,1,2366,16,2385,4,2402,2,2433,3,2492,1,2494,7,2503,2,2507,3,2519,1,2530,2,2561,3,2620,1,2622,5,2631,2,2635,3,2672,2,2689,3,2748,1,2750,8,2759,3,2763,3,2786,2,2817,3,2876,1,2878,6,2887,2,2891,3,2902,2,2946,1,3006,5,3014,3,3018,4,3031,1,3073,3,3134,7,3142,3,3146,4,3157,2,3202,2,3260,1,3262,7,3270,3,3274,4,3285,2,3298,2,3330,2,3390,6,3398,3,3402,4,3415,1,3458,2,3530,1,3535,6,3542,1,3544,8,3570,2,3633,1,3636,7,3655,8,3761,1,3764,6,3771,2,3784,6,3864,2,3893,1,3895,1,3897,1,3902,2,3953,20,3974,2,3984,8,3993,36,4038,1,4140,7,4150,4,4182,4,4959,1,5906,3,5938,3,5970,2,6002,2,6070,30,6109,1,6155,3,6313,1,6432,12,6448,12,6576,17,6600,2,6679,5,6912,5,6964,17,7019,9,7616,11,7678,2,8400,32,12330,6,12441,2,43010,1,43014,1,43019,1,43043,5,64286,1,65024,16];
punctuationCharacterSet=[33,3,37,6,44,4,58,2,63,2,91,3,95,1,123,1,125,1,161,1,171,1,183,1,187,1,191,1,894,1,903,1,1370,6,1417,2,1470,1,1472,1,1475,1,1478,1,1523,2,1548,2,1563,1,1566,2,1642,4,1748,1,1792,14,2039,3,2404,2,2416,1,3572,1,3663,1,3674,2,3844,15,3898,4,3973,1,4048,2,4170,6,4347,1,4961,8,5741,2,5787,2,5867,3,5941,2,6100,3,6104,3,6144,11,6468,2,6622,2,6686,2,7002,7,8208,24,8240,20,8261,13,8275,12,8317,2,8333,2,9001,2,10088,14,10181,2,10214,6,10627,22,10712,4,10748,2,11513,4,11518,2,11776,24,11804,2,12289,3,12296,10,12308,12,12336,1,12349,1,12448,1,12539,1,43124,4,64830,2,65040,10,65072,35,65108,14,65123,1,65128,1,65130,2,65281,3,65285,6,65292,4,65306,2,65311,2,65339,3,65343,1,65371,1,65373,1];
uppercaseLetterCharacterSet=[65,26,192,23,216,7,256,1,258,1,260,1,262,1,264,1,266,1,268,1,270,1,272,1,274,1,276,1,278,1,280,1,282,1,284,1,286,1,288,1,290,1,292,1,294,1,296,1,298,1,300,1,302,1,304,1,306,1,308,1,310,1,313,1,315,1,317,1,319,1,321,1,323,1,325,1,327,1,330,1,332,1,334,1,336,1,338,1,340,1,342,1,344,1,346,1,348,1,350,1,352,1,354,1,356,1,358,1,360,1,362,1,364,1,366,1,368,1,370,1,372,1,374,1,376,2,379,1,381,1,385,2,388,1,390,2,393,3,398,4,403,2,406,3,412,2,415,2,418,1,420,1,422,2,425,1,428,1,430,2,433,3,437,1,439,2,444,1,452,2,455,2,458,2,461,1,463,1,465,1,467,1,469,1,471,1,473,1,475,1,478,1,480,1,482,1,484,1,486,1,488,1,490,1,492,1,494,1,497,2,500,1,502,3,506,1,508,1,510,1,512,1,514,1,516,1,518,1,520,1,522,1,524,1,526,1,528,1,530,1,532,1,534,1,536,1,538,1,540,1,542,1,544,1,546,1,548,1,550,1,552,1,554,1,556,1,558,1,560,1,562,1,570,2,573,2,577,1,579,4,584,1,586,1,588,1,590,1,902,1,904,3,908,1,910,2,913,17,931,9,978,3,984,1,986,1,988,1,990,1,992,1,994,1,996,1,998,1,1000,1,1002,1,1004,1,1006,1,1012,1,1015,1,1017,2,1021,51,1120,1,1122,1,1124,1,1126,1,1128,1,1130,1,1132,1,1134,1,1136,1,1138,1,1140,1,1142,1,1144,1,1146,1,1148,1,1150,1,1152,1,1162,1,1164,1,1166,1,1168,1,1170,1,1172,1,1174,1,1176,1,1178,1,1180,1,1182,1,1184,1,1186,1,1188,1,1190,1,1192,1,1194,1,1196,1,1198,1,1200,1,1202,1,1204,1,1206,1,1208,1,1210,1,1212,1,1214,1,1216,2,1219,1,1221,1,1223,1,1225,1,1227,1,1229,1,1232,1,1234,1,1236,1,1238,1,1240,1,1242,1,1244,1,1246,1,1248,1,1250,1,1252,1,1254,1,1256,1,1258,1,1260,1,1262,1,1264,1,1266,1,1268,1,1270,1,1272,1,1274,1,1276,1,1278,1,1280,1,1282,1,1284,1,1286,1,1288,1,1290,1,1292,1,1294,1,1296,1,1298,1,1329,38,4256,38,7680,1,7682,1,7684,1,7686,1,7688,1,7690,1,7692,1,7694,1,7696,1,7698,1,7700,1,7702,1,7704,1,7706,1,7708,1,7710,1,7712,1,7714,1,7716,1,7718,1,7720,1,7722,1,7724,1,7726,1,7728,1,7730,1,7732,1,7734,1,7736,1,7738,1,7740,1,7742,1,7744,1,7746,1,7748,1,7750,1,7752,1,7754,1,7756,1,7758,1,7760,1,7762,1,7764,1,7766,1,7768,1,7770,1,7772,1,7774,1,7776,1,7778,1,7780,1,7782,1,7784,1,7786,1,7788,1,7790,1,7792,1,7794,1,7796,1,7798,1,7800,1,7802,1,7804,1,7806,1,7808,1,7810,1,7812,1,7814,1,7816,1,7818,1,7820,1,7822,1,7824,1,7826,1,7828,1,7840,1,7842,1,7844,1,7846,1,7848,1,7850,1,7852,1,7854,1,7856,1,7858,1,7860,1,7862,1,7864,1,7866,1,7868,1,7870,1,7872,1,7874,1,7876,1,7878,1,7880,1,7882,1,7884,1,7886,1,7888,1,7890,1,7892,1,7894,1,7896,1,7898,1,7900,1,7902,1,7904,1,7906,1,7908,1,7910,1,7912,1,7914,1,7916,1,7918,1,7920,1,7922,1,7924,1,7926,1,7928,1,7944,8,7960,6,7976,8,7992,8,8008,6,8025,1,8027,1,8029,1,8031,1,8040,8,8072,8,8088,8,8104,8,8120,5,8136,5,8152,4,8168,5,8184,5,8450,1,8455,1,8459,3,8464,3,8469,1,8473,5,8484,1,8486,1,8488,1,8490,4,8496,4,8510,2,8517,1,8579,1,11264,47,11360,1,11362,3,11367,1,11369,1,11371,1,11381,1,11392,1,11394,1,11396,1,11398,1,11400,1,11402,1,11404,1,11406,1,11408,1,11410,1,11412,1,11414,1,11416,1,11418,1,11420,1,11422,1,11424,1,11426,1,11428,1,11430,1,11432,1,11434,1,11436,1,11438,1,11440,1,11442,1,11444,1,11446,1,11448,1,11450,1,11452,1,11454,1,11456,1,11458,1,11460,1,11462,1,11464,1,11466,1,11468,1,11470,1,11472,1,11474,1,11476,1,11478,1,11480,1,11482,1,11484,1,11486,1,11488,1,11490,1];
whitespaceAndNewlineCharacterSet=[9,5,32,1,133,1,160,1,5760,1,8192,12,8232,2,8239,1,8287,1];
whitespaceCharacterSet=[9,1,32,1,160,1,5760,1,8192,12,8239,1,8287,1];
p;21;CPCompoundPredicate.jt;5056;@STATIC;1.0;i;9;CPArray.ji;13;CPPredicate.jt;5006;
objj_executeFile("CPArray.j",YES);
objj_executeFile("CPPredicate.j",YES);
CPNotPredicateType=0;
CPAndPredicateType=1;
CPOrPredicateType=2;
var _1;
var _2=objj_allocateClassPair(CPPredicate,"CPCompoundPredicate"),_3=_2.isa;
class_addIvars(_2,[new objj_ivar("_type"),new objj_ivar("_predicates")]);
objj_registerClassPair(_2);
class_addMethods(_2,[new objj_method(sel_getUid("initWithType:subpredicates:"),function(_4,_5,_6,_7){
with(_4){
_4=objj_msgSendSuper({receiver:_4,super_class:objj_getClass("CPCompoundPredicate").super_class},"init");
if(_4){
_type=_6;
_predicates=_7;
}
return _4;
}
}),new objj_method(sel_getUid("compoundPredicateType"),function(_8,_9){
with(_8){
return _type;
}
}),new objj_method(sel_getUid("subpredicates"),function(_a,_b){
with(_a){
return _predicates;
}
}),new objj_method(sel_getUid("predicateWithSubstitutionVariables:"),function(_c,_d,_e){
with(_c){
var _f=objj_msgSend(CPArray,"array"),_10=objj_msgSend(_f,"count"),i=0;
for(;i<_10;i++){
var p=objj_msgSend(_f,"objectAtIndex:",i),sp=objj_msgSend(p,"predicateWithSubstitutionVariables:",_e);
objj_msgSend(_f,"addObject:",sp);
}
return objj_msgSend(objj_msgSend(CPCompoundPredicate,"alloc"),"initWithType:subpredicates:",_type,_f);
}
}),new objj_method(sel_getUid("predicateFormat"),function(_11,_12){
with(_11){
var _13="",_14=objj_msgSend(CPArray,"array"),_15=objj_msgSend(_predicates,"count"),i=0;
if(_15==0){
return "TRUEPREDICATE";
}
for(;i<_15;i++){
var _16=objj_msgSend(_predicates,"objectAtIndex:",i),_17=objj_msgSend(_16,"predicateFormat");
if(objj_msgSend(_16,"isKindOfClass:",objj_msgSend(CPCompoundPredicate,"class"))&&objj_msgSend(objj_msgSend(_16,"subpredicates"),"count")>1&&objj_msgSend(_16,"compoundPredicateType")!=_type){
_17=objj_msgSend(CPString,"stringWithFormat:","(%s)",_17);
}
if(_17!=nil){
objj_msgSend(_14,"addObject:",_17);
}
}
switch(_type){
case CPNotPredicateType:
_13+="NOT "+objj_msgSend(_14,"objectAtIndex:",0);
break;
case CPAndPredicateType:
_13+=objj_msgSend(_14,"objectAtIndex:",0);
var _15=objj_msgSend(_14,"count");
for(var j=1;j<_15;j++){
_13+=" AND "+objj_msgSend(_14,"objectAtIndex:",j);
}
break;
case CPOrPredicateType:
_13+=objj_msgSend(_14,"objectAtIndex:",0);
var _15=objj_msgSend(_14,"count");
for(var j=1;j<_15;j++){
_13+=" OR "+objj_msgSend(_14,"objectAtIndex:",j);
}
break;
}
return _13;
}
}),new objj_method(sel_getUid("evaluateWithObject:"),function(_18,_19,_1a){
with(_18){
return objj_msgSend(_18,"evaluateWithObject:substitutionVariables:",_1a,nil);
}
}),new objj_method(sel_getUid("evaluateWithObject:substitutionVariables:"),function(_1b,_1c,_1d,_1e){
with(_1b){
var _1f=NO,_20=objj_msgSend(_predicates,"count"),i=0;
if(_20==0){
return YES;
}
for(;i<_20;i++){
var _21=objj_msgSend(_predicates,"objectAtIndex:",i);
switch(_type){
case CPNotPredicateType:
return !objj_msgSend(_21,"evaluateWithObject:substitutionVariables:",_1d,_1e);
case CPAndPredicateType:
if(i==0){
_1f=objj_msgSend(_21,"evaluateWithObject:substitutionVariables:",_1d,_1e);
}else{
_1f=_1f&&objj_msgSend(_21,"evaluateWithObject:substitutionVariables:",_1d,_1e);
}
if(!_1f){
return NO;
}
break;
case CPOrPredicateType:
if(objj_msgSend(_21,"evaluateWithObject:substitutionVariables:",_1d,_1e)){
return YES;
}
break;
}
}
return _1f;
}
}),new objj_method(sel_getUid("isEqual:"),function(_22,_23,_24){
with(_22){
if(_22===_24){
return YES;
}
if(_24.isa!==_22.isa||_type!==objj_msgSend(_24,"compoundPredicateType")||!objj_msgSend(_predicates,"isEqualToArray:",objj_msgSend(_24,"subpredicates"))){
return NO;
}
return YES;
}
})]);
class_addMethods(_3,[new objj_method(sel_getUid("notPredicateWithSubpredicate:"),function(_25,_26,_27){
with(_25){
return objj_msgSend(objj_msgSend(_25,"alloc"),"initWithType:subpredicates:",CPNotPredicateType,objj_msgSend(CPArray,"arrayWithObject:",_27));
}
}),new objj_method(sel_getUid("andPredicateWithSubpredicates:"),function(_28,_29,_2a){
with(_28){
return objj_msgSend(objj_msgSend(_28,"alloc"),"initWithType:subpredicates:",CPAndPredicateType,_2a);
}
}),new objj_method(sel_getUid("orPredicateWithSubpredicates:"),function(_2b,_2c,_2d){
with(_2b){
return objj_msgSend(objj_msgSend(_2b,"alloc"),"initWithType:subpredicates:",CPOrPredicateType,_2d);
}
})]);
var _2=objj_getClass("CPCompoundPredicate");
if(!_2){
throw new SyntaxError("*** Could not find definition for class \"CPCompoundPredicate\"");
}
var _3=_2.isa;
class_addMethods(_2,[new objj_method(sel_getUid("initWithCoder:"),function(_2e,_2f,_30){
with(_2e){
_2e=objj_msgSendSuper({receiver:_2e,super_class:objj_getClass("CPCompoundPredicate").super_class},"init");
if(_2e!=nil){
_predicates=objj_msgSend(_30,"decodeObjectForKey:","CPCompoundPredicateSubpredicates");
_type=objj_msgSend(_30,"decodeIntForKey:","CPCompoundPredicateType");
}
return _2e;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_31,_32,_33){
with(_31){
objj_msgSend(_33,"encodeObject:forKey:",_predicates,"CPCompoundPredicateSubpredicates");
objj_msgSend(_33,"encodeInt:forKey:",_type,"CPCompoundPredicateType");
}
})]);
p;23;CPComparisonPredicate.jt;12630;@STATIC;1.0;i;9;CPArray.ji;14;CPEnumerator.ji;14;CPExpression.ji;8;CPNull.ji;13;CPPredicate.ji;10;CPString.jt;12514;
objj_executeFile("CPArray.j",YES);
objj_executeFile("CPEnumerator.j",YES);
objj_executeFile("CPExpression.j",YES);
objj_executeFile("CPNull.j",YES);
objj_executeFile("CPPredicate.j",YES);
objj_executeFile("CPString.j",YES);
CPDirectPredicateModifier=0;
CPAllPredicateModifier=1;
CPAnyPredicateModifier=2;
CPCaseInsensitivePredicateOption=1;
CPDiacriticInsensitivePredicateOption=2;
CPDiacriticInsensitiveSearch=128;
CPLessThanPredicateOperatorType=0;
CPLessThanOrEqualToPredicateOperatorType=1;
CPGreaterThanPredicateOperatorType=2;
CPGreaterThanOrEqualToPredicateOperatorType=3;
CPEqualToPredicateOperatorType=4;
CPNotEqualToPredicateOperatorType=5;
CPMatchesPredicateOperatorType=6;
CPLikePredicateOperatorType=7;
CPBeginsWithPredicateOperatorType=8;
CPEndsWithPredicateOperatorType=9;
CPInPredicateOperatorType=10;
CPCustomSelectorPredicateOperatorType=11;
CPContainsPredicateOperatorType=99;
CPBetweenPredicateOperatorType=100;
var _1,_2;
var _3=objj_allocateClassPair(CPPredicate,"CPComparisonPredicate"),_4=_3.isa;
class_addIvars(_3,[new objj_ivar("_left"),new objj_ivar("_right"),new objj_ivar("_modifier"),new objj_ivar("_type"),new objj_ivar("_options"),new objj_ivar("_customSelector")]);
objj_registerClassPair(_3);
class_addMethods(_3,[new objj_method(sel_getUid("initWithLeftExpression:rightExpression:customSelector:"),function(_5,_6,_7,_8,_9){
with(_5){
_5=objj_msgSendSuper({receiver:_5,super_class:objj_getClass("CPComparisonPredicate").super_class},"init");
if(_5){
_left=_7;
_right=_8;
_modifier=CPDirectPredicateModifier;
_type=CPCustomSelectorPredicateOperatorType;
_options=0;
_customSelector=_9;
}
return _5;
}
}),new objj_method(sel_getUid("initWithLeftExpression:rightExpression:modifier:type:options:"),function(_a,_b,_c,_d,_e,_f,_10){
with(_a){
_a=objj_msgSendSuper({receiver:_a,super_class:objj_getClass("CPComparisonPredicate").super_class},"init");
if(_a){
_left=_c;
_right=_d;
_modifier=_e;
_type=_f;
_options=(_f!=CPMatchesPredicateOperatorType&&_f!=CPLikePredicateOperatorType&&_f!=CPBeginsWithPredicateOperatorType&&_f!=CPEndsWithPredicateOperatorType&&_f!=CPInPredicateOperatorType&&_f!=CPContainsPredicateOperatorType)?0:_10;
_customSelector=NULL;
}
return _a;
}
}),new objj_method(sel_getUid("comparisonPredicateModifier"),function(_11,_12){
with(_11){
return _modifier;
}
}),new objj_method(sel_getUid("customSelector"),function(_13,_14){
with(_13){
return _customSelector;
}
}),new objj_method(sel_getUid("leftExpression"),function(_15,_16){
with(_15){
return _left;
}
}),new objj_method(sel_getUid("options"),function(_17,_18){
with(_17){
return _options;
}
}),new objj_method(sel_getUid("predicateOperatorType"),function(_19,_1a){
with(_19){
return _type;
}
}),new objj_method(sel_getUid("rightExpression"),function(_1b,_1c){
with(_1b){
return _right;
}
}),new objj_method(sel_getUid("predicateFormat"),function(_1d,_1e){
with(_1d){
var _1f;
switch(_modifier){
case CPDirectPredicateModifier:
_1f="";
break;
case CPAllPredicateModifier:
_1f="ALL ";
break;
case CPAnyPredicateModifier:
_1f="ANY ";
break;
default:
_1f="";
break;
}
var _20;
switch(_options){
case CPCaseInsensitivePredicateOption:
_20="[c]";
break;
case CPDiacriticInsensitivePredicateOption:
_20="[d]";
break;
case CPCaseInsensitivePredicateOption|CPDiacriticInsensitivePredicateOption:
_20="[cd]";
break;
default:
_20="";
break;
}
var _21;
switch(_type){
case CPLessThanPredicateOperatorType:
_21="<";
break;
case CPLessThanOrEqualToPredicateOperatorType:
_21="<=";
break;
case CPGreaterThanPredicateOperatorType:
_21=">";
break;
case CPGreaterThanOrEqualToPredicateOperatorType:
_21=">=";
break;
case CPEqualToPredicateOperatorType:
_21="==";
break;
case CPNotEqualToPredicateOperatorType:
_21="!=";
break;
case CPMatchesPredicateOperatorType:
_21="MATCHES";
break;
case CPLikePredicateOperatorType:
_21="LIKE";
break;
case CPBeginsWithPredicateOperatorType:
_21="BEGINSWITH";
break;
case CPEndsWithPredicateOperatorType:
_21="ENDSWITH";
break;
case CPInPredicateOperatorType:
_21="IN";
break;
case CPContainsPredicateOperatorType:
_21="CONTAINS";
break;
case CPCustomSelectorPredicateOperatorType:
_21=CPStringFromSelector(_customSelector);
break;
}
return objj_msgSend(CPString,"stringWithFormat:","%s%s %s%s %s",_1f,objj_msgSend(_left,"description"),_21,_20,objj_msgSend(_right,"description"));
}
}),new objj_method(sel_getUid("predicateWithSubstitutionVariables:"),function(_22,_23,_24){
with(_22){
var _25=objj_msgSend(_left,"_expressionWithSubstitutionVariables:",_24),_26=objj_msgSend(_right,"_expressionWithSubstitutionVariables:",_24);
if(_type!=CPCustomSelectorPredicateOperatorType){
return objj_msgSend(CPComparisonPredicate,"predicateWithLeftExpression:rightExpression:modifier:type:options:",_25,_26,_modifier,_type,_options);
}else{
return objj_msgSend(CPComparisonPredicate,"predicateWithLeftExpression:rightExpression:customSelector:",_25,_26,_customSelector);
}
}
}),new objj_method(sel_getUid("isEqual:"),function(_27,_28,_29){
with(_27){
if(_27===_29){
return YES;
}
if(_29.isa!==_27.isa||_modifier!==objj_msgSend(_29,"comparisonPredicateModifier")||_type!==objj_msgSend(_29,"predicateOperatorType")||_options!==objj_msgSend(_29,"options")||_customSelector!==objj_msgSend(_29,"customSelector")||!objj_msgSend(_left,"isEqual:",objj_msgSend(_29,"leftExpression"))||!objj_msgSend(_right,"isEqual:",objj_msgSend(_29,"rightExpression"))){
return NO;
}
return YES;
}
}),new objj_method(sel_getUid("_evaluateValue:rightValue:"),function(_2a,_2b,lhs,rhs){
with(_2a){
var _2c=(lhs==nil||objj_msgSend(lhs,"isEqual:",objj_msgSend(CPNull,"null"))),_2d=(rhs==nil||objj_msgSend(rhs,"isEqual:",objj_msgSend(CPNull,"null")));
if((_2c||_2d)&&_type!=CPCustomSelectorPredicateOperatorType){
return (_2c==_2d&&(_type==CPEqualToPredicateOperatorType||_type==CPLessThanOrEqualToPredicateOperatorType||_type==CPGreaterThanOrEqualToPredicateOperatorType));
}
var _2e=0;
switch(_type){
case CPLessThanPredicateOperatorType:
return (objj_msgSend(lhs,"compare:",rhs)==CPOrderedAscending);
case CPLessThanOrEqualToPredicateOperatorType:
return (objj_msgSend(lhs,"compare:",rhs)!=CPOrderedDescending);
case CPGreaterThanPredicateOperatorType:
return (objj_msgSend(lhs,"compare:",rhs)==CPOrderedDescending);
case CPGreaterThanOrEqualToPredicateOperatorType:
return (objj_msgSend(lhs,"compare:",rhs)!=CPOrderedAscending);
case CPEqualToPredicateOperatorType:
return objj_msgSend(lhs,"isEqual:",rhs);
case CPNotEqualToPredicateOperatorType:
return (!objj_msgSend(lhs,"isEqual:",rhs));
case CPMatchesPredicateOperatorType:
var _2f=(_options&CPCaseInsensitivePredicateOption)?"gi":"g";
if(_options&CPDiacriticInsensitivePredicateOption){
lhs=lhs.stripDiacritics();
rhs=rhs.stripDiacritics();
}
return (new RegExp(rhs,_2f)).test(lhs);
case CPLikePredicateOperatorType:
if(_options&CPDiacriticInsensitivePredicateOption){
lhs=lhs.stripDiacritics();
rhs=rhs.stripDiacritics();
}
var _2f=(_options&CPCaseInsensitivePredicateOption)?"gi":"g",reg=new RegExp(rhs.escapeForRegExp(),_2f);
return reg.test(lhs);
case CPBeginsWithPredicateOperatorType:
var _30=CPMakeRange(0,MIN(objj_msgSend(lhs,"length"),objj_msgSend(rhs,"length")));
if(_options&CPCaseInsensitivePredicateOption){
_2e|=CPCaseInsensitiveSearch;
}
if(_options&CPDiacriticInsensitivePredicateOption){
_2e|=CPDiacriticInsensitiveSearch;
}
return (objj_msgSend(lhs,"compare:options:range:",rhs,_2e,_30)==CPOrderedSame);
case CPEndsWithPredicateOperatorType:
var _30=CPMakeRange(MAX(objj_msgSend(lhs,"length")-objj_msgSend(rhs,"length"),0),MIN(objj_msgSend(lhs,"length"),objj_msgSend(rhs,"length")));
if(_options&CPCaseInsensitivePredicateOption){
_2e|=CPCaseInsensitiveSearch;
}
if(_options&CPDiacriticInsensitivePredicateOption){
_2e|=CPDiacriticInsensitiveSearch;
}
return (objj_msgSend(lhs,"compare:options:range:",rhs,_2e,_30)==CPOrderedSame);
case CPCustomSelectorPredicateOperatorType:
return objj_msgSend(lhs,"performSelector:withObject:",_customSelector,rhs);
case CPInPredicateOperatorType:
var a=lhs;
lhs=rhs;
rhs=a;
case CPContainsPredicateOperatorType:
if(!objj_msgSend(lhs,"isKindOfClass:",objj_msgSend(CPString,"class"))){
if(!objj_msgSend(lhs,"respondsToSelector:",sel_getUid("objectEnumerator"))){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,"The left/right hand side for a CONTAINS/IN  operator must be a collection or a string");
}
return objj_msgSend(lhs,"containsObject:",rhs);
}
if(_options&CPCaseInsensitivePredicateOption){
_2e|=CPCaseInsensitiveSearch;
}
if(_options&CPDiacriticInsensitivePredicateOption){
_2e|=CPDiacriticInsensitiveSearch;
}
return (objj_msgSend(lhs,"rangeOfString:options:",rhs,_2e).location!=CPNotFound);
case CPBetweenPredicateOperatorType:
if(objj_msgSend(rhs,"count")<2){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,"The right hand side for a BETWEEN operator must contain 2 objects");
}
return (objj_msgSend(lhs,"compare:",rhs[0])==CPOrderedDescending&&objj_msgSend(lhs,"compare:",rhs[1])==CPOrderedAscending);
default:
return NO;
}
}
}),new objj_method(sel_getUid("evaluateWithObject:"),function(_31,_32,_33){
with(_31){
return objj_msgSend(_31,"evaluateWithObject:substitutionVariables:",_33,nil);
}
}),new objj_method(sel_getUid("evaluateWithObject:substitutionVariables:"),function(_34,_35,_36,_37){
with(_34){
var _38=objj_msgSend(_left,"expressionValueWithObject:context:",_36,_37),_39=objj_msgSend(_right,"expressionValueWithObject:context:",_36,_37);
if(_modifier==CPDirectPredicateModifier){
return objj_msgSend(_34,"_evaluateValue:rightValue:",_38,_39);
}else{
if(!objj_msgSend(_38,"respondsToSelector:",sel_getUid("objectEnumerator"))){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,"The left hand side for an ALL or ANY operator must be either a CPArray or a CPSet");
}
var e=objj_msgSend(_38,"objectEnumerator"),_3a=(_modifier==CPAllPredicateModifier),_3b;
while((_3b=objj_msgSend(e,"nextObject"))!==nil){
var _3c=objj_msgSend(_34,"_evaluateValue:rightValue:",_3b,_39);
if(_3c!=_3a){
return _3c;
}
}
return _3a;
}
}
})]);
class_addMethods(_4,[new objj_method(sel_getUid("predicateWithLeftExpression:rightExpression:customSelector:"),function(_3d,_3e,_3f,_40,_41){
with(_3d){
return objj_msgSend(objj_msgSend(_3d,"alloc"),"initWithLeftExpression:rightExpression:customSelector:",_3f,_40,_41);
}
}),new objj_method(sel_getUid("predicateWithLeftExpression:rightExpression:modifier:type:options:"),function(_42,_43,_44,_45,_46,_47,_48){
with(_42){
return objj_msgSend(objj_msgSend(_42,"alloc"),"initWithLeftExpression:rightExpression:modifier:type:options:",_44,_45,_46,_47,_48);
}
})]);
var _3=objj_getClass("CPComparisonPredicate");
if(!_3){
throw new SyntaxError("*** Could not find definition for class \"CPComparisonPredicate\"");
}
var _4=_3.isa;
class_addMethods(_3,[new objj_method(sel_getUid("initWithCoder:"),function(_49,_4a,_4b){
with(_49){
_49=objj_msgSendSuper({receiver:_49,super_class:objj_getClass("CPComparisonPredicate").super_class},"init");
if(_49!=nil){
_left=objj_msgSend(_4b,"decodeObjectForKey:","CPComparisonPredicateLeftExpression");
_right=objj_msgSend(_4b,"decodeObjectForKey:","CPComparisonPredicateRightExpression");
_modifier=objj_msgSend(_4b,"decodeIntForKey:","CPComparisonPredicateModifier");
_type=objj_msgSend(_4b,"decodeIntForKey:","CPComparisonPredicateType");
_options=objj_msgSend(_4b,"decodeIntForKey:","CPComparisonPredicateOptions");
_customSelector=objj_msgSend(_4b,"decodeObjectForKey:","CPComparisonPredicateCustomSelector");
}
return _49;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_4c,_4d,_4e){
with(_4c){
objj_msgSend(_4e,"encodeObject:forKey:",_left,"CPComparisonPredicateLeftExpression");
objj_msgSend(_4e,"encodeObject:forKey:",_right,"CPComparisonPredicateRightExpression");
objj_msgSend(_4e,"encodeInt:forKey:",_modifier,"CPComparisonPredicateModifier");
objj_msgSend(_4e,"encodeInt:forKey:",_type,"CPComparisonPredicateType");
objj_msgSend(_4e,"encodeInt:forKey:",_options,"CPComparisonPredicateOptions");
objj_msgSend(_4e,"encodeObject:forKey:",_customSelector,"CPComparisonPredicateCustomSelector");
}
})]);
var _4f=["*","?","(",")","{","}",".","+","|","/","$","^"],_50=[".*",".?","\\(","\\)","\\{","\\}","\\.","\\+","\\|","\\/","\\$","\\^"];
String.prototype.escapeForRegExp=function(){
var _51=false,i=0;
for(;i<_4f.length;++i){
if(this.indexOf(_4f[i])!==-1){
_51=true;
break;
}
}
if(!_51){
return this;
}
var _52="";
for(i=0;i<this.length;++i){
var _53=_4f.indexOf(this.charAt(i));
if(_53!==-1){
_52+=_50[_53];
}else{
_52+=this.charAt(i);
}
}
return _52;
};
p;14;CPExpression.jt;5324;@STATIC;1.0;i;9;CPArray.ji;14;CPDictionary.ji;18;CPKeyValueCoding.ji;10;CPObject.ji;10;CPString.ji;28;_CPConstantValueExpression.ji;19;_CPSelfExpression.ji;23;_CPVariableExpression.ji;22;_CPKeyPathExpression.ji;23;_CPFunctionExpression.ji;24;_CPAggregateExpression.ji;18;_CPSetExpression.ji;23;_CPSubqueryExpression.jt;5000;
objj_executeFile("CPArray.j",YES);
objj_executeFile("CPDictionary.j",YES);
objj_executeFile("CPKeyValueCoding.j",YES);
objj_executeFile("CPObject.j",YES);
objj_executeFile("CPString.j",YES);
CPConstantValueExpressionType=0;
CPEvaluatedObjectExpressionType=1;
CPVariableExpressionType=2;
CPKeyPathExpressionType=3;
CPFunctionExpressionType=4;
CPAggregateExpressionType=5;
CPSubqueryExpressionType=6;
CPUnionSetExpressionType=7;
CPIntersectSetExpressionType=8;
CPMinusSetExpressionType=9;
var _1=objj_allocateClassPair(CPObject,"CPExpression"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_type")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initWithExpressionType:"),function(_3,_4,_5){
with(_3){
_type=_5;
return _3;
}
}),new objj_method(sel_getUid("expressionType"),function(_6,_7){
with(_6){
return _type;
}
}),new objj_method(sel_getUid("constantValue"),function(_8,_9){
with(_8){
_CPRaiseInvalidAbstractInvocation(_8,_9);
return nil;
}
}),new objj_method(sel_getUid("variable"),function(_a,_b){
with(_a){
_CPRaiseInvalidAbstractInvocation(_a,_b);
return nil;
}
}),new objj_method(sel_getUid("keyPath"),function(_c,_d){
with(_c){
_CPRaiseInvalidAbstractInvocation(_c,_d);
return nil;
}
}),new objj_method(sel_getUid("function"),function(_e,_f){
with(_e){
_CPRaiseInvalidAbstractInvocation(_e,_f);
return nil;
}
}),new objj_method(sel_getUid("arguments"),function(_10,_11){
with(_10){
_CPRaiseInvalidAbstractInvocation(_10,_11);
return nil;
}
}),new objj_method(sel_getUid("collection"),function(_12,_13){
with(_12){
_CPRaiseInvalidAbstractInvocation(_12,_13);
return nil;
}
}),new objj_method(sel_getUid("predicate"),function(_14,_15){
with(_14){
_CPRaiseInvalidAbstractInvocation(_14,_15);
return nil;
}
}),new objj_method(sel_getUid("operand"),function(_16,_17){
with(_16){
_CPRaiseInvalidAbstractInvocation(_16,_17);
return nil;
}
}),new objj_method(sel_getUid("leftExpression"),function(_18,_19){
with(_18){
_CPRaiseInvalidAbstractInvocation(_18,_19);
return nil;
}
}),new objj_method(sel_getUid("rightExpression"),function(_1a,_1b){
with(_1a){
_CPRaiseInvalidAbstractInvocation(_1a,_1b);
return nil;
}
}),new objj_method(sel_getUid("_expressionWithSubstitutionVariables:"),function(_1c,_1d,_1e){
with(_1c){
return _1c;
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("expressionForConstantValue:"),function(_1f,_20,_21){
with(_1f){
return objj_msgSend(objj_msgSend(_CPConstantValueExpression,"alloc"),"initWithValue:",_21);
}
}),new objj_method(sel_getUid("expressionForEvaluatedObject"),function(_22,_23){
with(_22){
return objj_msgSend(_CPSelfExpression,"evaluatedObject");
}
}),new objj_method(sel_getUid("expressionForVariable:"),function(_24,_25,_26){
with(_24){
return objj_msgSend(objj_msgSend(_CPVariableExpression,"alloc"),"initWithVariable:",_26);
}
}),new objj_method(sel_getUid("expressionForKeyPath:"),function(_27,_28,_29){
with(_27){
return objj_msgSend(objj_msgSend(_CPKeyPathExpression,"alloc"),"initWithKeyPath:",_29);
}
}),new objj_method(sel_getUid("expressionForAggregate:"),function(_2a,_2b,_2c){
with(_2a){
return objj_msgSend(objj_msgSend(_CPAggregateExpression,"alloc"),"initWithAggregate:",_2c);
}
}),new objj_method(sel_getUid("expressionForUnionSet:with:"),function(_2d,_2e,_2f,_30){
with(_2d){
return objj_msgSend(objj_msgSend(_CPSetExpression,"alloc"),"initWithType:left:right:",CPUnionSetExpressionType,_2f,_30);
}
}),new objj_method(sel_getUid("expressionForIntersectSet:with:"),function(_31,_32,_33,_34){
with(_31){
return objj_msgSend(objj_msgSend(_CPSetExpression,"alloc"),"initWithType:left:right:",CPIntersectSetExpressionType,_33,_34);
}
}),new objj_method(sel_getUid("expressionForMinusSet:with:"),function(_35,_36,_37,_38){
with(_35){
return objj_msgSend(objj_msgSend(_CPSetExpression,"alloc"),"initWithType:left:right:",CPMinusSetExpressionType,_37,_38);
}
}),new objj_method(sel_getUid("expressionForFunction:arguments:"),function(_39,_3a,_3b,_3c){
with(_39){
return objj_msgSend(objj_msgSend(_CPFunctionExpression,"alloc"),"initWithSelector:arguments:",CPSelectorFromString(_3b),_3c);
}
}),new objj_method(sel_getUid("expressionForFunction:selectorName:arguments:"),function(_3d,_3e,_3f,_40,_41){
with(_3d){
return objj_msgSend(objj_msgSend(_CPFunctionExpression,"alloc"),"initWithTarget:selector:arguments:",_3f,CPSelectorFromString(_40),_41);
}
}),new objj_method(sel_getUid("expressionForSubquery:usingIteratorVariable:predicate:"),function(_42,_43,_44,_45,_46){
with(_42){
return objj_msgSend(objj_msgSend(_CPSubqueryExpression,"alloc"),"initWithExpression:usingIteratorVariable:predicate:",_44,_45,_46);
}
})]);
objj_executeFile("_CPConstantValueExpression.j",YES);
objj_executeFile("_CPSelfExpression.j",YES);
objj_executeFile("_CPVariableExpression.j",YES);
objj_executeFile("_CPKeyPathExpression.j",YES);
objj_executeFile("_CPFunctionExpression.j",YES);
objj_executeFile("_CPAggregateExpression.j",YES);
objj_executeFile("_CPSetExpression.j",YES);
objj_executeFile("_CPSubqueryExpression.j",YES);
p;28;_CPConstantValueExpression.jt;1784;@STATIC;1.0;i;14;CPDictionary.ji;14;CPExpression.jt;1727;
objj_executeFile("CPDictionary.j",YES);
objj_executeFile("CPExpression.j",YES);
var _1=objj_allocateClassPair(CPExpression,"_CPConstantValueExpression"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_value")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initWithValue:"),function(_3,_4,_5){
with(_3){
_3=objj_msgSendSuper({receiver:_3,super_class:objj_getClass("_CPConstantValueExpression").super_class},"initWithExpressionType:",CPConstantValueExpressionType);
if(_3){
_value=_5;
}
return _3;
}
}),new objj_method(sel_getUid("isEqual:"),function(_6,_7,_8){
with(_6){
if(_6===_8){
return YES;
}
if(_8.isa!==_6.isa||!objj_msgSend(objj_msgSend(_8,"constantValue"),"isEqual:",_value)){
return NO;
}
return YES;
}
}),new objj_method(sel_getUid("constantValue"),function(_9,_a){
with(_9){
return _value;
}
}),new objj_method(sel_getUid("expressionValueWithObject:context:"),function(_b,_c,_d,_e){
with(_b){
return _value;
}
}),new objj_method(sel_getUid("description"),function(_f,_10){
with(_f){
if(objj_msgSend(_value,"isKindOfClass:",objj_msgSend(CPString,"class"))){
return "\""+_value+"\"";
}
return objj_msgSend(_value,"description");
}
})]);
var _11="CPConstantValue";
var _1=objj_getClass("_CPConstantValueExpression");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"_CPConstantValueExpression\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("initWithCoder:"),function(_12,_13,_14){
with(_12){
var _15=objj_msgSend(_14,"decodeObjectForKey:",_11);
return objj_msgSend(_12,"initWithValue:",_15);
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_16,_17,_18){
with(_16){
objj_msgSend(_18,"encodeObject:forKey:",_value,_11);
}
})]);
p;19;_CPSelfExpression.jt;1255;@STATIC;1.0;i;14;CPDictionary.ji;14;CPExpression.ji;10;CPString.jt;1183;
objj_executeFile("CPDictionary.j",YES);
objj_executeFile("CPExpression.j",YES);
objj_executeFile("CPString.j",YES);
var _1=nil;
var _2=objj_allocateClassPair(CPExpression,"_CPSelfExpression"),_3=_2.isa;
objj_registerClassPair(_2);
class_addMethods(_2,[new objj_method(sel_getUid("init"),function(_4,_5){
with(_4){
_4=objj_msgSendSuper({receiver:_4,super_class:objj_getClass("_CPSelfExpression").super_class},"initWithExpressionType:",CPEvaluatedObjectExpressionType);
return _4;
}
}),new objj_method(sel_getUid("initWithCoder:"),function(_6,_7,_8){
with(_6){
return objj_msgSend(_CPSelfExpression,"evaluatedObject");
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_9,_a,_b){
with(_9){
}
}),new objj_method(sel_getUid("isEqual:"),function(_c,_d,_e){
with(_c){
return (_e===_c);
}
}),new objj_method(sel_getUid("expressionValueWithObject:context:"),function(_f,_10,_11,_12){
with(_f){
return _11;
}
}),new objj_method(sel_getUid("description"),function(_13,_14){
with(_13){
return "SELF";
}
})]);
class_addMethods(_3,[new objj_method(sel_getUid("evaluatedObject"),function(_15,_16){
with(_15){
if(_1==nil){
_1=objj_msgSend(_CPSelfExpression,"new");
}
return _1;
}
})]);
p;23;_CPVariableExpression.jt;2398;@STATIC;1.0;i;14;CPDictionary.ji;13;CPException.ji;14;CPExpression.ji;10;CPString.jt;2308;
objj_executeFile("CPDictionary.j",YES);
objj_executeFile("CPException.j",YES);
objj_executeFile("CPExpression.j",YES);
objj_executeFile("CPString.j",YES);
var _1=objj_allocateClassPair(CPExpression,"_CPVariableExpression"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_variable")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initWithVariable:"),function(_3,_4,_5){
with(_3){
_3=objj_msgSendSuper({receiver:_3,super_class:objj_getClass("_CPVariableExpression").super_class},"initWithExpressionType:",CPVariableExpressionType);
if(_3){
_variable=objj_msgSend(_5,"copy");
}
return _3;
}
}),new objj_method(sel_getUid("isEqual:"),function(_6,_7,_8){
with(_6){
if(_6===_8){
return YES;
}
if(_8.isa!==_6.isa||!objj_msgSend(objj_msgSend(_8,"variable"),"isEqual:",_variable)){
return NO;
}
return YES;
}
}),new objj_method(sel_getUid("variable"),function(_9,_a){
with(_9){
return _variable;
}
}),new objj_method(sel_getUid("expressionValueWithObject:context:"),function(_b,_c,_d,_e){
with(_b){
var _f=objj_msgSend(_b,"_expressionWithSubstitutionVariables:",_e);
return objj_msgSend(_f,"expressionValueWithObject:context:",_d,_e);
}
}),new objj_method(sel_getUid("description"),function(_10,_11){
with(_10){
return objj_msgSend(CPString,"stringWithFormat:","$%s",_variable);
}
}),new objj_method(sel_getUid("_expressionWithSubstitutionVariables:"),function(_12,_13,_14){
with(_12){
var _15=objj_msgSend(_14,"objectForKey:",_variable);
if(_15==nil){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,"Can't get value for '"+_variable+"' in bindings"+_14);
}
if(objj_msgSend(_15,"isKindOfClass:",objj_msgSend(CPExpression,"class"))){
return _15;
}
return objj_msgSend(CPExpression,"expressionForConstantValue:",_15);
}
})]);
var _16="CPVariable";
var _1=objj_getClass("_CPVariableExpression");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"_CPVariableExpression\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("initWithCoder:"),function(_17,_18,_19){
with(_17){
var _1a=objj_msgSend(_19,"decodeObjectForKey:",_16);
return objj_msgSend(_17,"initWithVariable:",_1a);
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_1b,_1c,_1d){
with(_1b){
objj_msgSend(_1d,"encodeObject:forKey:",_variable,_16);
}
})]);
p;22;_CPKeyPathExpression.jt;2089;@STATIC;1.0;i;14;CPExpression.ji;23;_CPFunctionExpression.ji;18;CPKeyValueCoding.ji;10;CPString.jt;1985;
objj_executeFile("CPExpression.j",YES);
objj_executeFile("_CPFunctionExpression.j",YES);
objj_executeFile("CPKeyValueCoding.j",YES);
objj_executeFile("CPString.j",YES);
var _1=objj_allocateClassPair(_CPFunctionExpression,"_CPKeyPathExpression"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initWithKeyPath:"),function(_3,_4,_5){
with(_3){
return objj_msgSend(_3,"initWithOperand:andKeyPath:",objj_msgSend(CPExpression,"expressionForEvaluatedObject"),_5);
}
}),new objj_method(sel_getUid("initWithOperand:andKeyPath:"),function(_6,_7,_8,_9){
with(_6){
var _a=objj_msgSend(CPExpression,"expressionForConstantValue:",_9);
_6=objj_msgSendSuper({receiver:_6,super_class:objj_getClass("_CPKeyPathExpression").super_class},"initWithTarget:selector:arguments:type:",_8,sel_getUid("valueForKeyPath:"),[_a],CPKeyPathExpressionType);
return _6;
}
}),new objj_method(sel_getUid("isEqual:"),function(_b,_c,_d){
with(_b){
if(_d===_b){
return YES;
}
if(_d.isa!==_b.isa||!objj_msgSend(objj_msgSend(_d,"keyPath"),"isEqualToString:",objj_msgSend(_b,"keyPath"))){
return NO;
}
return YES;
}
}),new objj_method(sel_getUid("pathExpression"),function(_e,_f){
with(_e){
return objj_msgSend(objj_msgSend(_e,"arguments"),"objectAtIndex:",0);
}
}),new objj_method(sel_getUid("keyPath"),function(_10,_11){
with(_10){
return objj_msgSend(objj_msgSend(_10,"pathExpression"),"keyPath");
}
}),new objj_method(sel_getUid("description"),function(_12,_13){
with(_12){
var _14="";
if(objj_msgSend(_operand,"expressionType")!=CPEvaluatedObjectExpressionType){
_14+=objj_msgSend(_operand,"description")+".";
}
_14+=objj_msgSend(_12,"keyPath");
return _14;
}
})]);
var _1=objj_getClass("_CPConstantValueExpression");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"_CPConstantValueExpression\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("keyPath"),function(_15,_16){
with(_15){
return objj_msgSend(_15,"constantValue");
}
})]);
p;23;_CPFunctionExpression.jt;7644;@STATIC;1.0;i;9;CPArray.ji;8;CPDate.ji;14;CPDictionary.ji;13;CPException.ji;14;CPExpression.ji;10;CPString.jt;7529;
objj_executeFile("CPArray.j",YES);
objj_executeFile("CPDate.j",YES);
objj_executeFile("CPDictionary.j",YES);
objj_executeFile("CPException.j",YES);
objj_executeFile("CPExpression.j",YES);
objj_executeFile("CPString.j",YES);
var _1=objj_allocateClassPair(CPExpression,"_CPFunctionExpression"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_operand"),new objj_ivar("_selector"),new objj_ivar("_arguments"),new objj_ivar("_argc"),new objj_ivar("_maxargs")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initWithSelector:arguments:"),function(_3,_4,_5,_6){
with(_3){
var _7=objj_msgSend(CPPredicateUtilities,"class");
if(!objj_msgSend(_7,"respondsToSelector:",_5)){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,"Unknown function implementation: "+_5);
}
var _8=objj_msgSend(CPExpression,"expressionForConstantValue:",_7);
return objj_msgSend(_3,"initWithTarget:selector:arguments:",_8,_5,_6);
}
}),new objj_method(sel_getUid("initWithTarget:selector:arguments:"),function(_9,_a,_b,_c,_d){
with(_9){
return objj_msgSend(_9,"initWithTarget:selector:arguments:type:",_b,_c,_d,CPFunctionExpressionType);
}
}),new objj_method(sel_getUid("initWithTarget:selector:arguments:type:"),function(_e,_f,_10,_11,_12,_13){
with(_e){
_e=objj_msgSendSuper({receiver:_e,super_class:objj_getClass("_CPFunctionExpression").super_class},"initWithExpressionType:",_13);
if(_e){
_selector=_11;
_operand=_10;
_arguments=_12;
_argc=objj_msgSend(_12,"count");
_maxargs=objj_msgSend(objj_msgSend(CPStringFromSelector(_selector),"componentsSeparatedByString:",":"),"count")-1;
}
return _e;
}
}),new objj_method(sel_getUid("isEqual:"),function(_14,_15,_16){
with(_14){
if(_14===_16){
return YES;
}
if(_16.isa!==_14.isa||!objj_msgSend(objj_msgSend(_16,"_function"),"isEqual:",_selector)||!objj_msgSend(objj_msgSend(_16,"operand"),"isEqual:",_operand)||!objj_msgSend(objj_msgSend(_16,"arguments"),"isEqualToArray:",_arguments)){
return NO;
}
return YES;
}
}),new objj_method(sel_getUid("_function"),function(_17,_18){
with(_17){
return CPStringFromSelector(_selector);
}
}),new objj_method(sel_getUid("function"),function(_19,_1a){
with(_19){
return objj_msgSend(_19,"_function");
}
}),new objj_method(sel_getUid("arguments"),function(_1b,_1c){
with(_1b){
return _arguments;
}
}),new objj_method(sel_getUid("operand"),function(_1d,_1e){
with(_1d){
return _operand;
}
}),new objj_method(sel_getUid("expressionValueWithObject:context:"),function(_1f,_20,_21,_22){
with(_1f){
var _23=objj_msgSend(_operand,"expressionValueWithObject:context:",_21,_22),_24=[_23,_selector],i=0;
for(;i<_argc;i++){
var arg=objj_msgSend(_arguments[i],"expressionValueWithObject:context:",_21,_22);
_24.push(arg);
}
if(_argc>_maxargs){
var r=MAX(_maxargs+1,2);
_24=_24.slice(0,r).concat([_24.slice(r)]);
}
return objj_msgSend.apply(this,_24);
}
}),new objj_method(sel_getUid("description"),function(_25,_26){
with(_25){
var _27="";
if(objj_msgSend(_operand,"isEqual:",objj_msgSend(CPExpression,"expressionForConstantValue:",objj_msgSend(CPPredicateUtilities,"class")))){
_27+=CPStringFromSelector(_selector)+"(";
}else{
_27+="FUNCTION(";
_27+=_operand?objj_msgSend(_operand,"description")+", ":"";
_27+=_selector?CPStringFromSelector(_selector)+", ":"";
}
for(var i=0;i<_argc;i++){
_27=_27+objj_msgSend(_arguments[i],"description")+((i+1<_argc)?", ":"");
}
_27+=")";
return _27;
}
}),new objj_method(sel_getUid("_expressionWithSubstitutionVariables:"),function(_28,_29,_2a){
with(_28){
var _2b=objj_msgSend(objj_msgSend(_28,"operand"),"_expressionWithSubstitutionVariables:",_2a),_2c=objj_msgSend(CPArray,"array"),i=0;
for(;i<_argc;i++){
objj_msgSend(_2c,"addObject:",objj_msgSend(_arguments[i],"_expressionWithSubstitutionVariables:",_2a));
}
return objj_msgSend(CPExpression,"expressionForFunction:selectorName:arguments:",_2b,objj_msgSend(_28,"_function"),_2c);
}
})]);
var _2d="CPSelectorName",_2e="CPArguments",_2f="CPOperand",_30="CPExpressionType";
var _1=objj_getClass("_CPFunctionExpression");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"_CPFunctionExpression\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("initWithCoder:"),function(_31,_32,_33){
with(_31){
var _34=objj_msgSend(_33,"decodeIntForKey:",_30),_35=objj_msgSend(_33,"decodeObjectForKey:",_2f),_36=CPSelectorFromString(objj_msgSend(_33,"decodeObjectForKey:",_2d)),_37=objj_msgSend(_33,"decodeObjectForKey:",_2e);
return objj_msgSend(_31,"initWithTarget:selector:arguments:type:",_35,_36,_37,_34);
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_38,_39,_3a){
with(_38){
objj_msgSend(_3a,"encodeObject:forKey:",objj_msgSend(_38,"_function"),_2d);
objj_msgSend(_3a,"encodeObject:forKey:",_arguments,_2e);
objj_msgSend(_3a,"encodeObject:forKey:",_operand,_2f);
objj_msgSend(_3a,"encodeInt:forKey:",_type,_30);
}
})]);
var _1=objj_allocateClassPair(CPObject,"CPPredicateUtilities"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_2,[new objj_method(sel_getUid("sum:"),function(_3b,_3c,_3d){
with(_3b){
var sum=0,_3e=_3d.length;
while(_3e--){
sum+=_3d[_3e];
}
return sum;
}
}),new objj_method(sel_getUid("count:"),function(_3f,_40,_41){
with(_3f){
return objj_msgSend(_41,"count");
}
}),new objj_method(sel_getUid("min:"),function(_42,_43,_44){
with(_42){
return _44.sort()[0];
}
}),new objj_method(sel_getUid("max:"),function(_45,_46,_47){
with(_45){
return _47.sort()[_47.length-1];
}
}),new objj_method(sel_getUid("average:"),function(_48,_49,_4a){
with(_48){
return objj_msgSend(_48,"sum:",_4a)/_4a.length;
}
}),new objj_method(sel_getUid("first:"),function(_4b,_4c,_4d){
with(_4b){
return _4d[0];
}
}),new objj_method(sel_getUid("last:"),function(_4e,_4f,_50){
with(_4e){
return _50[_50.length-1];
}
}),new objj_method(sel_getUid("fromObject:index:"),function(_51,_52,_53,_54){
with(_51){
if(objj_msgSend(_53,"isKindOfClass:",objj_msgSend(CPDictionary,"class"))){
return objj_msgSend(_53,"objectForKey:",_54);
}else{
(objj_msgSend(_53,"isKindOfClass:",objj_msgSend(CPArray,"class")));
}
return objj_msgSend(_53,"objectAtIndex:",_54);
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,"object[#] requires a CPDictionary or CPArray");
}
}),new objj_method(sel_getUid("add:to:"),function(_55,_56,n,m){
with(_55){
return n+m;
}
}),new objj_method(sel_getUid("from:substract:"),function(_57,_58,n,m){
with(_57){
return n-m;
}
}),new objj_method(sel_getUid("multiply:by:"),function(_59,_5a,n,m){
with(_59){
return n*m;
}
}),new objj_method(sel_getUid("divide:by:"),function(_5b,_5c,n,m){
with(_5b){
return n/m;
}
}),new objj_method(sel_getUid("sqrt:"),function(_5d,_5e,n){
with(_5d){
return SQRT(n);
}
}),new objj_method(sel_getUid("raise:to:"),function(_5f,_60,num,_61){
with(_5f){
return POW(num,_61);
}
}),new objj_method(sel_getUid("abs:"),function(_62,_63,num){
with(_62){
return ABS(num);
}
}),new objj_method(sel_getUid("now:"),function(_64,_65,_66){
with(_64){
return objj_msgSend(CPDate,"date");
}
}),new objj_method(sel_getUid("ln:"),function(_67,_68,num){
with(_67){
return LN10(num);
}
}),new objj_method(sel_getUid("exp:"),function(_69,_6a,num){
with(_69){
return EXP(num);
}
}),new objj_method(sel_getUid("ceiling:"),function(_6b,_6c,num){
with(_6b){
return CEIL(num);
}
}),new objj_method(sel_getUid("random:"),function(_6d,_6e,num){
with(_6d){
return ROUND(RAND()*num);
}
}),new objj_method(sel_getUid("modulus:by:"),function(_6f,_70,n,m){
with(_6f){
return n%m;
}
}),new objj_method(sel_getUid("chs:"),function(_71,_72,num){
with(_71){
return -num;
}
})]);
p;24;_CPAggregateExpression.jt;2577;@STATIC;1.0;i;9;CPArray.ji;14;CPExpression.ji;10;CPString.jt;2511;
objj_executeFile("CPArray.j",YES);
objj_executeFile("CPExpression.j",YES);
objj_executeFile("CPString.j",YES);
var _1=objj_allocateClassPair(CPExpression,"_CPAggregateExpression"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_aggregate")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initWithAggregate:"),function(_3,_4,_5){
with(_3){
_3=objj_msgSendSuper({receiver:_3,super_class:objj_getClass("_CPAggregateExpression").super_class},"initWithExpressionType:",CPAggregateExpressionType);
if(_3){
_aggregate=_5;
}
return _3;
}
}),new objj_method(sel_getUid("isEqual:"),function(_6,_7,_8){
with(_6){
if(_6===_8){
return YES;
}
if(_8.isa!==_6.isa||!objj_msgSend(objj_msgSend(_8,"collection"),"isEqual:",_aggregate)){
return NO;
}
return YES;
}
}),new objj_method(sel_getUid("collection"),function(_9,_a){
with(_9){
return _aggregate;
}
}),new objj_method(sel_getUid("expressionValueWithObject:context:"),function(_b,_c,_d,_e){
with(_b){
var _f=objj_msgSend(CPArray,"array"),_10=objj_msgSend(_aggregate,"objectEnumerator"),exp;
while((exp=objj_msgSend(_10,"nextObject"))!==nil){
var _11=objj_msgSend(exp,"expressionValueWithObject:context:",_d,_e);
objj_msgSend(_f,"addObject:",_11);
}
return _f;
}
}),new objj_method(sel_getUid("description"),function(_12,_13){
with(_12){
var i=0,_14=objj_msgSend(_aggregate,"count"),_15="{";
for(;i<_14;i++){
_15=_15+objj_msgSend(CPString,"stringWithFormat:","%s%s",objj_msgSend(objj_msgSend(_aggregate,"objectAtIndex:",i),"description"),(i+1<_14)?", ":"");
}
_15=_15+"}";
return _15;
}
}),new objj_method(sel_getUid("_expressionWithSubstitutionVariables:"),function(_16,_17,_18){
with(_16){
var _19=objj_msgSend(CPArray,"array"),_1a=objj_msgSend(_aggregate,"count"),i=0;
for(;i<_1a;i++){
objj_msgSend(_19,"addObject:",objj_msgSend(objj_msgSend(_aggregate,"objectAtIndex:",i),"_expressionWithSubstitutionVariables:",_18));
}
return objj_msgSend(CPExpression,"expressionForAggregate:",_19);
}
})]);
var _1b="CPCollection";
var _1=objj_getClass("_CPAggregateExpression");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"_CPAggregateExpression\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("initWithCoder:"),function(_1c,_1d,_1e){
with(_1c){
var _1f=objj_msgSend(_1e,"decodeObjectForKey:",_1b);
return objj_msgSend(_1c,"initWithAggregate:",_1f);
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_20,_21,_22){
with(_20){
objj_msgSend(_22,"encodeObject:forKey:",_aggregate,_1b);
}
})]);
p;18;_CPSetExpression.jt;3671;@STATIC;1.0;i;13;CPException.ji;14;CPExpression.ji;7;CPSet.jt;3604;
objj_executeFile("CPException.j",YES);
objj_executeFile("CPExpression.j",YES);
objj_executeFile("CPSet.j",YES);
var _1=objj_allocateClassPair(CPExpression,"_CPSetExpression"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_left"),new objj_ivar("_right")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initWithType:left:right:"),function(_3,_4,_5,_6,_7){
with(_3){
_3=objj_msgSendSuper({receiver:_3,super_class:objj_getClass("_CPSetExpression").super_class},"initWithExpressionType:",_5);
if(_3){
_left=_6;
_right=_7;
}
return _3;
}
}),new objj_method(sel_getUid("isEqual:"),function(_8,_9,_a){
with(_8){
if(_8===_a){
return YES;
}
if(_a.isa!==_8.isa||!objj_msgSend(objj_msgSend(_a,"leftExpression"),"isEqual:",_left)||!objj_msgSend(objj_msgSend(_a,"rightExpression"),"isEqual:",_right)){
return NO;
}
return YES;
}
}),new objj_method(sel_getUid("expressionValueWithObject:context:"),function(_b,_c,_d,_e){
with(_b){
var _f=objj_msgSend(_right,"expressionValueWithObject:context:",_d,_e);
if(objj_msgSend(_f,"isKindOfClass:",objj_msgSend(CPArray,"class"))){
_f=objj_msgSend(CPSet,"setWithArray:",_f);
}else{
if(objj_msgSend(_f,"isKindOfClass:",objj_msgSend(CPDictionary,"class"))){
_f=objj_msgSend(CPSet,"setWithArray:",objj_msgSend(_f,"allValues"));
}else{
if(!objj_msgSend(_f,"isKindOfClass:",objj_msgSend(CPSet,"class"))){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,"The right expression for a CP*SetExpressionType expression must evaluate to a CPArray, CPDictionary or CPSet");
}
}
}
var _10=objj_msgSend(_left,"expressionValueWithObject:context:",_d,_e);
if(!objj_msgSend(_10,"isKindOfClass:",objj_msgSend(CPSet,"class"))){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,"The left expression for a CP*SetExpressionType expression must evaluate to a CPSet");
}
var _11=objj_msgSend(_10,"copy");
switch(_type){
case CPIntersectSetExpressionType:
objj_msgSend(_11,"intersectSet:",_f);
break;
case CPUnionSetExpressionType:
objj_msgSend(_11,"unionSet:",_f);
break;
case CPMinusSetExpressionType:
objj_msgSend(_11,"minusSet:",_f);
break;
default:
}
return _11;
}
}),new objj_method(sel_getUid("_expressionWithSubstitutionVariables:"),function(_12,_13,_14){
with(_12){
return _12;
}
}),new objj_method(sel_getUid("leftExpression"),function(_15,_16){
with(_15){
return _left;
}
}),new objj_method(sel_getUid("rightExpression"),function(_17,_18){
with(_17){
return _right;
}
}),new objj_method(sel_getUid("description"),function(_19,_1a){
with(_19){
var _1b;
switch(_type){
case CPIntersectSetExpressionType:
_1b=" INTERSECT ";
break;
case CPUnionSetExpressionType:
_1b=" UNION ";
break;
case CPMinusSetExpressionType:
_1b=" MINUS ";
break;
default:
}
return objj_msgSend(_left,"description")+_1b+objj_msgSend(_right,"description");
}
})]);
var _1c="CPLeftExpression",_1d="CPRightExpression",_1e="CPExpressionType";
var _1=objj_getClass("_CPSetExpression");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"_CPSetExpression\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("initWithCoder:"),function(_1f,_20,_21){
with(_1f){
var _22=objj_msgSend(_21,"decodeObjectForKey:",_1c),_23=objj_msgSend(_21,"decodeObjectForKey:",_1d),_24=objj_msgSend(_21,"decodeIntForKey:",_1e);
return objj_msgSend(_1f,"initWithType:left:right:",_24,_22,_23);
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_25,_26,_27){
with(_25){
objj_msgSend(_27,"encodeObject:forKey:",_left,_1c);
objj_msgSend(_27,"encodeObject:forKey:",_right,_1d);
objj_msgSend(_27,"encodeInt:forKey:",_type,_1e);
}
})]);
p;23;_CPSubqueryExpression.jt;4058;@STATIC;1.0;i;9;CPArray.ji;14;CPDictionary.ji;14;CPExpression.ji;13;CPPredicate.jt;3970;
objj_executeFile("CPArray.j",YES);
objj_executeFile("CPDictionary.j",YES);
objj_executeFile("CPExpression.j",YES);
objj_executeFile("CPPredicate.j",YES);
var _1=objj_allocateClassPair(CPExpression,"_CPSubqueryExpression"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_collection"),new objj_ivar("_variableExpression"),new objj_ivar("_subpredicate")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initWithExpression:usingIteratorVariable:predicate:"),function(_3,_4,_5,_6,_7){
with(_3){
var _8=objj_msgSend(CPExpression,"expressionForVariable:",_6);
return objj_msgSend(_3,"initWithExpression:usingIteratorExpression:predicate:",_5,_8,_7);
}
}),new objj_method(sel_getUid("initWithExpression:usingIteratorExpression:predicate:"),function(_9,_a,_b,_c,_d){
with(_9){
_9=objj_msgSendSuper({receiver:_9,super_class:objj_getClass("_CPSubqueryExpression").super_class},"initWithExpressionType:",CPSubqueryExpressionType);
if(_9){
_subpredicate=_d;
_collection=_b;
_variableExpression=_c;
}
return _9;
}
}),new objj_method(sel_getUid("expressionValueWithObject:context:"),function(_e,_f,_10,_11){
with(_e){
var _12=objj_msgSend(_collection,"expressionValueWithObject:context:",_10,_11),_13=objj_msgSend(_12,"count"),_14=objj_msgSend(CPArray,"array"),_15=objj_msgSend(CPDictionary,"dictionaryWithObject:forKey:",objj_msgSend(CPExpression,"expressionForEvaluatedObject"),objj_msgSend(_e,"variable")),i=0;
for(;i<_13;i++){
var _16=objj_msgSend(_12,"objectAtIndex:",i);
if(objj_msgSend(_subpredicate,"evaluateWithObject:substitutionVariables:",_16,_15)){
objj_msgSend(_14,"addObject:",_16);
}
}
return _14;
}
}),new objj_method(sel_getUid("isEqual:"),function(_17,_18,_19){
with(_17){
if(_17===_19){
return YES;
}
if(_19.isa!==_17.isa||!objj_msgSend(_collection,"isEqual:",objj_msgSend(_19,"collection"))||!objj_msgSend(_variableExpression,"isEqual:",objj_msgSend(_19,"variableExpression"))||!objj_msgSend(_subpredicate,"isEqual:",objj_msgSend(_19,"predicate"))){
return NO;
}
return YES;
}
}),new objj_method(sel_getUid("collection"),function(_1a,_1b){
with(_1a){
return _collection;
}
}),new objj_method(sel_getUid("copy"),function(_1c,_1d){
with(_1c){
return objj_msgSend(objj_msgSend(_CPSubqueryExpression,"alloc"),"initWithExpression:usingIteratorExpression:predicate:",objj_msgSend(_collection,"copy"),objj_msgSend(_variableExpression,"copy"),objj_msgSend(_subpredicate,"copy"));
}
}),new objj_method(sel_getUid("predicate"),function(_1e,_1f){
with(_1e){
return _subpredicate;
}
}),new objj_method(sel_getUid("description"),function(_20,_21){
with(_20){
return objj_msgSend(_20,"predicateFormat");
}
}),new objj_method(sel_getUid("predicateFormat"),function(_22,_23){
with(_22){
return "SUBQUERY("+objj_msgSend(_collection,"description")+", "+objj_msgSend(_variableExpression,"description")+", "+objj_msgSend(_subpredicate,"predicateFormat")+")";
}
}),new objj_method(sel_getUid("variable"),function(_24,_25){
with(_24){
return objj_msgSend(_variableExpression,"variable");
}
}),new objj_method(sel_getUid("variableExpression"),function(_26,_27){
with(_26){
return _variableExpression;
}
})]);
var _28="CPExpression",_29="CPSubpredicate",_2a="CPVariable";
var _1=objj_getClass("_CPSubqueryExpression");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"_CPSubqueryExpression\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("initWithCoder:"),function(_2b,_2c,_2d){
with(_2b){
var _2e=objj_msgSend(_2d,"decodeObjectForKey:",_28),_2f=objj_msgSend(_2d,"decodeObjectForKey:",_29),_30=objj_msgSend(_2d,"decodeObjectForKey:",_2a);
return objj_msgSend(_2b,"initWithExpression:usingIteratorExpression:predicate:",_2e,_30,_2f);
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_31,_32,_33){
with(_31){
objj_msgSend(_33,"encodeObject:forKey:",_collection,_28);
objj_msgSend(_33,"encodeObject:forKey:",_subpredicate,_29);
objj_msgSend(_33,"encodeObject:forKey:",_variableExpression,_2a);
}
})]);
