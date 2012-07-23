@STATIC;1.0;i;14;CPTypesetter.ji;8;CPText.jt;4665;
objj_executeFile("CPTypesetter.j",YES);
objj_executeFile("CPText.j",YES);
var _1=objj_getClass("CPFont");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"CPFont\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("ascender"),function(_3,_4){
with(_3){
return 10;
}
})]);
var _5=nil;
var _1=objj_allocateClassPair(CPTypesetter,"CPSimpleTypesetter"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_layoutManager"),new objj_ivar("_currentTextContainer"),new objj_ivar("_textStorage"),new objj_ivar("_attributesRange"),new objj_ivar("_currentAttributes"),new objj_ivar("_currentFont"),new objj_ivar("_lineHeight"),new objj_ivar("_lineBase")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("layoutManager"),function(_6,_7){
with(_6){
return _layoutManager;
}
}),new objj_method(sel_getUid("currentTextContainer"),function(_8,_9){
with(_8){
return _currentTextContainer;
}
}),new objj_method(sel_getUid("textContainers"),function(_a,_b){
with(_a){
return objj_msgSend(_layoutManager,"textContainers");
}
}),new objj_method(sel_getUid("layoutGlyphsInLayoutManager:startingAtGlyphIndex:maxNumberOfLineFragments:nextGlyphIndex:"),function(_c,_d,_e,_f,_10,_11){
with(_c){
_layoutManager=_e;
_textStorage=objj_msgSend(_layoutManager,"textStorage");
_currentTextContainer=objj_msgSend(objj_msgSend(_layoutManager,"textContainers"),"objectAtIndex:",0);
_attributesRange=CPMakeRange(0,0);
_lineHeight=0;
_lineBase=0;
var _12=objj_msgSend(_currentTextContainer,"containerSize"),_13=CPMakeRange(_f,0),_14=CPMakeRange(0,0),_15=0,_16=NO,_17=NO;
var _18=0,_19=0,_1a=objj_msgSend(_textStorage,"string"),_1b,_1c,_1d;
if(_f>0){
_1b=CPPointCreateCopy(objj_msgSend(_layoutManager,"lineFragmentRectForGlyphAtIndex:effectiveRange:",_f,nil).origin);
}else{
if(objj_msgSend(_layoutManager,"extraLineFragmentTextContainer")){
_1b=CPPointMake(0,objj_msgSend(_layoutManager,"extraLineFragmentUsedRect").origin.y);
}else{
_1b=CPPointMake(0,0);
}
}
objj_msgSend(_layoutManager,"_removeInvalidLineFragments");
if(!objj_msgSend(_textStorage,"length")){
return;
}
objj_msgSend(_layoutManager,"setExtraLineFragmentRect:usedRect:textContainer:",CPRectMake(0,0),CPRectMake(0,0),nil);
do{
if(!CPLocationInRange(_f,_attributesRange)){
_currentAttributes=objj_msgSend(_textStorage,"attributesAtIndex:effectiveRange:",_f,_attributesRange);
_currentFont=objj_msgSend(_currentAttributes,"objectForKey:",CPFontAttributeName);
if(!_currentFont){
_currentFont=objj_msgSend(_textStorage,"font");
}
_1c=13;
_1d=0;
leading=(_1c-_1d)*0.2;
}
var _1e=objj_msgSend(_1a,"characterAtIndex:",_f),_1f=objj_msgSend(objj_msgSend(_1a,"substringWithRange:",CPMakeRange(_f,1)),"sizeWithFont:",_currentFont);
_13.length++;
if(_1e==" "){
_14=CPCopyRange(_13);
_15=_19;
}else{
if(_1e=="\n"){
_16=YES;
}
}
if(_1b.x+_19+_1f.width>_12.width){
if(_15){
_13=_14;
_19=_15;
}
_16=YES;
_17=YES;
_f=CPMaxRange(_13)-1;
}
_19+=_1f.width;
_lineHeight=Math.max(_lineHeight,_1c-_1d+leading);
_lineBase=Math.max(_lineBase,_1c);
if(_16){
objj_msgSend(_layoutManager,"setTextContainer:forGlyphRange:",_currentTextContainer,_13);
var _20=CPRectMake(_1b.x,_1b.y,_19,_lineHeight);
objj_msgSend(_layoutManager,"setLineFragmentRect:forGlyphRange:usedRect:",_20,_13,_20);
objj_msgSend(_layoutManager,"setLocation:forStartOfGlyphRange:",CPMakePoint(0,_lineBase),_13);
_1b.x=0;
if(_f+1==objj_msgSend(_textStorage,"length")){
_20=CPRectMake(_1b.x,_1b.y,_12.width,_lineHeight);
objj_msgSend(_layoutManager,"setExtraLineFragmentRect:usedRect:textContainer:",_20,_20,_currentTextContainer);
}else{
_20=CPRectMake(_1b.x,_1b.y+_lineHeight,_12.width,_lineHeight);
objj_msgSend(_layoutManager,"setExtraLineFragmentRect:usedRect:textContainer:",_20,_20,_currentTextContainer);
}
_1b.y+=_lineHeight;
_lineHeight=0;
_19=0;
_lineBase=0;
_18++;
_13=CPMakeRange(_f+1,0);
_14=CPMakeRange(0,0);
_15=0;
_16=NO;
_17=NO;
}
_f++;
}while(_18!=_10&&_f<objj_msgSend(_textStorage,"length"));
if(_13.length){
objj_msgSend(_layoutManager,"setTextContainer:forGlyphRange:",_currentTextContainer,_13);
var _20=CPRectMake(_1b.x,_1b.y,_19,_lineHeight);
objj_msgSend(_layoutManager,"setLineFragmentRect:forGlyphRange:usedRect:",_20,_13,_20);
objj_msgSend(_layoutManager,"setLocation:forStartOfGlyphRange:",CPMakePoint(0,_lineBase),_13);
_20=CPRectMake(_1b.x+_19,_1b.y,_12.width-_19,_lineHeight);
objj_msgSend(_layoutManager,"setExtraLineFragmentRect:usedRect:textContainer:",_20,_20,_currentTextContainer);
}
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("sharedInstance"),function(_21,_22){
with(_21){
if(_5===nil){
_5=objj_msgSend(objj_msgSend(CPSimpleTypesetter,"alloc"),"init");
}
return _5;
}
})]);
