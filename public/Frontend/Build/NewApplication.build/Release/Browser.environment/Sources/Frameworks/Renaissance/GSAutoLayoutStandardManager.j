@STATIC;1.0;i;21;GSAutoLayoutManager.jt;4034;
objj_executeFile("GSAutoLayoutManager.j",YES);
var _1=objj_allocateClassPair(GSAutoLayoutManager,"GSAutoLayoutStandardManager"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_numberOfExpandingLineParts")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("init"),function(_3,_4){
with(_3){
return objj_msgSendSuper({receiver:_3,super_class:objj_getClass("GSAutoLayoutStandardManager").super_class},"init");
}
}),new objj_method(sel_getUid("dealloc"),function(_5,_6){
with(_5){
objj_msgSendSuper({receiver:_5,super_class:objj_getClass("GSAutoLayoutStandardManager").super_class},"dealloc");
}
}),new objj_method(sel_getUid("internalUpdateMinimumLayout"),function(_7,_8){
with(_7){
var _9=objj_msgSend(CPMutableArray,"new");
var e=objj_msgSend(_lines,"objectEnumerator");
var _a;
while((_a=objj_msgSend(e,"nextObject"))!=nil){
var i,_b=objj_msgSend(_a._segments,"count");
for(i=0;i<_b;i++){
var _c;
_c=objj_msgSend(_a._segments,"objectAtIndex:",i);
if(_c._span>1){
objj_msgSend(_9,"addObject:",_c);
}
}
}
objj_msgSend(_7,"internalUpdateLineParts");
var i,_b=objj_msgSend(_lineParts,"count");
for(i=0;i<_b;i++){
var _d;
var _e;
_d=objj_msgSend(_lineParts,"objectAtIndex:",i);
_e=_d._info;
if(_e!=nil){
(_d._minimumLayout).length=_e._minimumLength;
if(_e._alwaysExpands==YES){
_d._expands=YES;
}
}
}
e=objj_msgSend(_lines,"objectEnumerator");
while((_a=objj_msgSend(e,"nextObject"))!=nil){
var i,_b=objj_msgSend(_a._segments,"count");
for(i=0;i<_b;i++){
var _c;
_c=objj_msgSend(_a._segments,"objectAtIndex:",i);
if(_c._span>1){
}else{
var _d;
var _f;
_d=objj_msgSend(_lineParts,"objectAtIndex:",_c._linePart);
_f=_c._minBorder+_c._minimumContentsLength+_c._maxBorder;
_f=Math.max((_d._minimumLayout).length,_f);
if(_c._alignment==GSAutoLayoutExpand||_c._alignment==GSAutoLayoutWeakExpand){
_d._expands=YES;
}
var _10;
_10=_d._info;
if(_10!=nil){
if(_10._neverExpands==YES){
_d._expands=NO;
}
}
(_d._minimumLayout).length=_f;
}
}
}
var i,_b=objj_msgSend(_9,"count");
for(i=0;i<_b;i++){
var _c;
var j;
var _11=0;
var _12=0;
var _13;
_c=objj_msgSend(_9,"objectAtIndex:",i);
_13=_c._minBorder+_c._minimumContentsLength+_c._maxBorder;
for(j=0;j<_c._span;j++){
var _d;
_d=objj_msgSend(_lineParts,"objectAtIndex:",_c._linePart+j);
_11+=(_d._minimumLayout).length;
if(_d._expands){
_12++;
}
}
if(_11<_13){
if(_12>0){
var _14=(_13-_11)/_12;
for(j=0;j<_c._span;j++){
var _d;
_d=objj_msgSend(_lineParts,"objectAtIndex:",_c._linePart+j);
if(_d._expands){
(_d._minimumLayout).length+=_14;
}
}
}else{
var _14=(_13-_11)/_c._span;
for(j=0;j<_c._span;j++){
var _d;
_d=objj_msgSend(_lineParts,"objectAtIndex:",_c._linePart+j);
(_d._minimumLayout).length+=_14;
}
}
}
if((_c._alignment==GSAutoLayoutExpand||_c._alignment==GSAutoLayoutWeakExpand)&&_12==0){
for(j=0;j<_c._span;j++){
var _d;
_d=objj_msgSend(_lineParts,"objectAtIndex:",_c._linePart+j);
_d._expands=YES;
}
}
}
var _15=0;
var i,_b=objj_msgSend(_lineParts,"count");
for(i=0;i<_b;i++){
var _d;
_d=objj_msgSend(_lineParts,"objectAtIndex:",i);
(_d._minimumLayout).position=_15;
_15+=(_d._minimumLayout).length;
}
_minimumLength=_15;
objj_msgSend(_7,"internalUpdateSegmentsMinimumLayoutFromLineParts");
_numberOfExpandingLineParts=0;
var i,_b=objj_msgSend(_lineParts,"count");
for(i=0;i<_b;i++){
var _d=objj_msgSend(_lineParts,"objectAtIndex:",i);
if(_d._expands){
_numberOfExpandingLineParts++;
}
}
return YES;
}
}),new objj_method(sel_getUid("internalUpdateLayout"),function(_16,_17){
with(_16){
var _18;
if(_length<_minimumLength){
_18=0;
}else{
if(_numberOfExpandingLineParts==0){
_18=0;
}else{
_18=(_length-_minimumLength)/_numberOfExpandingLineParts;
}
}
var i,_19=objj_msgSend(_lineParts,"count");
var _1a=0;
for(i=0;i<_19;i++){
var _1b=objj_msgSend(_lineParts,"objectAtIndex:",i);
(_1b._layout).position=(_1b._minimumLayout).position+_1a;
if(_1b._expands){
(_1b._layout).length=(_1b._minimumLayout).length+_18;
_1a+=_18;
}else{
(_1b._layout).length=(_1b._minimumLayout).length;
}
}
objj_msgSend(_16,"internalUpdateSegmentsLayoutFromLineParts");
return YES;
}
})]);
