@STATIC;1.0;t;2500;
var _1=objj_allocateClassPair(GSAutoLayoutManager,"GSAutoLayoutProportionalManager"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_minimumLayoutUnit"),new objj_ivar("_layoutUnit")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("internalUpdateMinimumLayout"),function(_3,_4){
with(_3){
_minimumLayoutUnit=0;
objj_msgSend(_3,"internalUpdateLineParts");
var i,_5=objj_msgSend(_lineParts,"count");
for(i=0;i<_5;i++){
var _6;
var _7;
_6=objj_msgSend(_lineParts,"objectAtIndex:",i);
_7=_6._info;
if(_7!=nil){
var _8;
if(_7._proportion>0){
_8=(_7._minimumLength/_7._proportion);
_minimumLayoutUnit=Math.max(_minimumLayoutUnit,_8);
_6._proportion=_7._proportion;
}else{
CPLog("GSAutoLayoutProportionalManager: Warning, line part has non-positive proportion %f.  Ignoring.",_7._proportion);
_6._proportion=1;
}
}else{
_6._proportion=1;
}
}
var e=objj_msgSend(_lines,"objectEnumerator");
var _9;
while((_9=objj_msgSend(e,"nextObject"))!=nil){
var i,_5=objj_msgSend(_9._segments,"count");
for(i=0;i<_5;i++){
var _a;
var j;
var _b=0;
_a=objj_msgSend(_9._segments,"objectAtIndex:",i);
for(j=0;j<_a._span;j++){
var _6;
_6=objj_msgSend(_lineParts,"objectAtIndex:",_a._linePart+j);
_b+=_6._proportion;
}
var _c;
var _d;
_d=_a._minBorder+_a._minimumContentsLength+_a._maxBorder;
_c=_d/_b;
_minimumLayoutUnit=Math.max(_c,_minimumLayoutUnit);
}
}
var _e=0;
var i,_5=objj_msgSend(_lineParts,"count");
for(i=0;i<_5;i++){
var _6;
_6=objj_msgSend(_lineParts,"objectAtIndex:",i);
(_6._minimumLayout).position=_e;
(_6._minimumLayout).length=_minimumLayoutUnit*_6._proportion;
_e+=(_6._minimumLayout).length;
}
_minimumLength=_e;
objj_msgSend(_3,"internalUpdateSegmentsMinimumLayoutFromLineParts");
return YES;
}
}),new objj_method(sel_getUid("internalUpdateLayout"),function(_f,_10){
with(_f){
if(_length<_minimumLength){
_layoutUnit=_minimumLayoutUnit;
}else{
if(_minimumLength!=0){
_layoutUnit=(_length*_minimumLayoutUnit)/_minimumLength;
}else{
var _11=0;
var i,_12=objj_msgSend(_lineParts,"count");
for(i=0;i<_12;i++){
var _13;
_13=objj_msgSend(_lineParts,"objectAtIndex:",i);
_11+=_13._proportion;
}
if(_11!=0){
_layoutUnit=_length/_11;
}else{
_layoutUnit=0;
}
}
}
var _14=0;
var i,_12=objj_msgSend(_lineParts,"count");
for(i=0;i<_12;i++){
var _13;
_13=objj_msgSend(_lineParts,"objectAtIndex:",i);
(_13._layout).position=_14;
(_13._layout).length=_layoutUnit*_13._proportion;
_14+=(_13._layout).length;
}
objj_msgSend(_f,"internalUpdateSegmentsLayoutFromLineParts");
return YES;
}
})]);
