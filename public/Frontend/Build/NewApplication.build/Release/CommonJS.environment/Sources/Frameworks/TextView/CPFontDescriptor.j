@STATIC;1.0;I;21;Foundation/CPObject.jt;6584;
objj_executeFile("Foundation/CPObject.j",NO);
CPFontNameAttribute="CPFontNameAttribute";
CPFontSizeAttribute="CPFontSizeAttribute";
CPFontTraitsAttribute="CPFontTraitsAttribute";
CPFontSymbolicTrait="CPFontSymbolicTrait";
CPFontWeightTrait="CPFontWeightTrait";
CPFontUnknownClass=(0<<28);
CPFontOldStyleSerifsClass=(1<<28);
CPFontTransitionalSerifsClass=(2<<28);
CPFontModernSerifsClass=(3<<28);
CPFontClarendonSerifsClass=(4<<28);
CPFontSlabSerifsClass=(5<<28);
CPFontFreeformSerifsClass=(7<<28);
CPFontSansSerifClass=(8<<28);
CPFontSerifClass=(CPFontOldStyleSerifsClass|CPFontTransitionalSerifsClass|CPFontModernSerifsClass|CPFontClarendonSerifsClass|CPFontSlabSerifsClass|CPFontFreeformSerifsClass);
CPFontFamilyClassMask=4026531840;
CPFontItalicTrait=(1<<0);
CPFontBoldTrait=(1<<1);
CPFontExpandedTrait=(1<<5);
CPFontCondensedTrait=(1<<6);
CPFontSmallCapsTrait=(1<<7);
var _1=objj_allocateClassPair(CPObject,"CPFontDescriptor"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_attributes")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initWithFontAttributes:"),function(_3,_4,_5){
with(_3){
_3=objj_msgSendSuper({receiver:_3,super_class:objj_getClass("CPFontDescriptor").super_class},"init");
if(_3){
_attributes=objj_msgSend(objj_msgSend(CPMutableDictionary,"alloc"),"init");
if(_5){
objj_msgSend(_attributes,"addEntriesFromDictionary:",_5);
}
}
return _3;
}
}),new objj_method(sel_getUid("fontDescriptorByAddingAttributes:"),function(_6,_7,_8){
with(_6){
var _9=objj_msgSend(_attributes,"copy");
objj_msgSend(_9,"addEntriesFromDictionary:",_8);
return objj_msgSend(objj_msgSend(CPFontDescriptor,"alloc"),"initWithFontAttributes:",_9);
}
}),new objj_method(sel_getUid("fontDescriptorWithSize:"),function(_a,_b,_c){
with(_a){
var _d=objj_msgSend(_attributes,"copy");
objj_msgSend(_d,"setObject:forKey:",objj_msgSend(CPString,"stringWithString:",_c+""),CPFontSizeAttribute);
return objj_msgSend(objj_msgSend(CPFontDescriptor,"alloc"),"initWithFontAttributes:",_d);
}
}),new objj_method(sel_getUid("fontDescriptorWithSymbolicTraits:"),function(_e,_f,_10){
with(_e){
var _11=objj_msgSend(_attributes,"copy");
if(objj_msgSend(_11,"objectForKey:",CPFontTraitsAttribute)){
objj_msgSend(objj_msgSend(_11,"objectForKey:",CPFontTraitsAttribute),"setObject:forKey:",objj_msgSend(CPNumber,"numberWithUnsignedInt:",_10),CPFontSymbolicTrait);
}else{
objj_msgSend(_11,"setObject:forKey:",objj_msgSend(CPDictionary,"dictionaryWithObject:forKey:",objj_msgSend(CPNumber,"numberWithUnsignedInt:",_10),CPFontSymbolicTrait),CPFontTraitsAttribute);
}
return objj_msgSend(objj_msgSend(CPFontDescriptor,"alloc"),"initWithFontAttributes:",_11);
}
}),new objj_method(sel_getUid("objectForKey:"),function(_12,_13,_14){
with(_12){
return objj_msgSend(_attributes,"objectForKey:",_14);
}
}),new objj_method(sel_getUid("fontAttributes"),function(_15,_16){
with(_15){
return _attributes;
}
}),new objj_method(sel_getUid("pointSize"),function(_17,_18){
with(_17){
var _19=objj_msgSend(_attributes,"objectForKey:",CPFontSizeAttribute);
if(_19){
return objj_msgSend(_19,"floatValue");
}
return 0;
}
}),new objj_method(sel_getUid("symbolicTraits"),function(_1a,_1b){
with(_1a){
var _1c=objj_msgSend(_attributes,"objectForKey:",CPFontTraitsAttribute);
if(_1c&&objj_msgSend(_1c,"objectForKey:",CPFontSymbolicTrait)){
return objj_msgSend(objj_msgSend(_1c,"objectForKey:",CPFontSymbolicTrait),"unsignedIntValue");
}
return 0;
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("fontDescriptorWithFontAttributes:"),function(_1d,_1e,_1f){
with(_1d){
return objj_msgSend(objj_msgSend(CPFontDescriptor,"alloc"),"initWithFontAttributes:",_1f);
}
}),new objj_method(sel_getUid("fontDescriptorWithName:size:"),function(_20,_21,_22,_23){
with(_20){
return objj_msgSend(objj_msgSend(CPFontDescriptor,"alloc"),"initWithFontAttributes:",objj_msgSend(CPDictionary,"dictionaryWithObjects:forKeys:",[_22,objj_msgSend(CPString,"stringWithString:",_23+"")],[CPFontNameAttribute,CPFontSizeAttribute]));
}
})]);
var _24="CPFontDescriptorAttributesKey";
var _1=objj_getClass("CPFontDescriptor");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"CPFontDescriptor\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("initWithCoder:"),function(_25,_26,_27){
with(_25){
return objj_msgSend(_25,"initWithFontAttributes:",objj_msgSend(_27,"decodeObjectForKey:",_24));
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_28,_29,_2a){
with(_28){
objj_msgSend(_2a,"encodeObject:forKey:",_attributes,_24);
}
})]);
var _2b=new RegExp(/(\w+\s+\w+)(,*)/g);
var _1=objj_getClass("CPFontDescriptor");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"CPFontDescriptor\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("fontStyleCSSString"),function(_2c,_2d){
with(_2c){
if(objj_msgSend(_2c,"symbolicTraits")&CPFontItalicTrait){
return "italic";
}
return "normal";
}
}),new objj_method(sel_getUid("fontWeightCSSString"),function(_2e,_2f){
with(_2e){
var _30=objj_msgSend(_attributes,"objectForKey:",CPFontTraitsAttribute);
if(_30){
if(objj_msgSend(_30,"objectForKey:",CPFontWeightTrait)){
return objj_msgSend(_30,"objectForKey:",CPFontWeightTrait);
}
if(objj_msgSend(_2e,"symbolicTraits")&CPFontBoldTrait){
return "bold";
}
}
return "normal";
}
}),new objj_method(sel_getUid("fontSizeCSSString"),function(_31,_32){
with(_31){
if(objj_msgSend(_attributes,"objectForKey:",CPFontSizeAttribute)){
return objj_msgSend(objj_msgSend(_attributes,"objectForKey:",CPFontSizeAttribute),"intValue")+"px";
}
return "";
}
}),new objj_method(sel_getUid("fontFamilyCSSString"),function(_33,_34){
with(_33){
var _35="";
if(objj_msgSend(_attributes,"objectForKey:",CPFontNameAttribute)){
_35+=objj_msgSend(_attributes,"objectForKey:",CPFontNameAttribute).replace(_2b,"\"$1\"$2");
}
var _36=objj_msgSend(_33,"symbolicTraits");
if(_36){
if((_36&CPFontFamilyClassMask)&CPFontSansSerifClass){
_35+=", sans-serif";
}else{
if((_36&CPFontFamilyClassMask)&CPFontSerifClass){
_35+=", serif";
}
}
}
return _35;
}
}),new objj_method(sel_getUid("fontVariantCSSString"),function(_37,_38){
with(_37){
if(objj_msgSend(_37,"symbolicTraits")&CPFontSmallCapsTrait){
return "small-caps";
}
return "normal";
}
}),new objj_method(sel_getUid("cssString"),function(_39,_3a){
with(_39){
return objj_msgSend(CPString,"stringWithString:",objj_msgSend(_39,"fontStyleCSSString")+" "+objj_msgSend(_39,"fontVariantCSSString")+" "+objj_msgSend(_39,"fontWeightCSSString")+" "+objj_msgSend(_39,"fontSizeCSSString")+" "+objj_msgSend(_39,"fontFamilyCSSString"));
}
})]);
