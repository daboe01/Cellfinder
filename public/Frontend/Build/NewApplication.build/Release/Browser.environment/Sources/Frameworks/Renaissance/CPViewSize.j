@STATIC;1.0;t;3327;
var _1=objj_getClass("CPView");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"CPView\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("sizeToFitContent"),function(_3,_4){
with(_3){
}
}),new objj_method(sel_getUid("minimumSizeForContent"),function(_5,_6){
with(_5){
var _7;
var _8;
_7=objj_msgSend(_5,"frame");
objj_msgSend(_5,"sizeToFitContent");
_8=objj_msgSend(_5,"frame").size;
objj_msgSend(_5,"setFrame:",_7);
return _8;
}
})]);
var _1=objj_getClass("CPControl");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"CPControl\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("sizeToFitContent"),function(_9,_a){
with(_9){
objj_msgSend(_9,"sizeToFit");
}
})]);
var _1=objj_getClass("CPBox");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"CPBox\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("sizeToFitContent"),function(_b,_c){
with(_b){
objj_msgSend(_b,"sizeToFit");
}
})]);
var _1=objj_getClass("CPSplitView");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"CPSplitView\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("sizeToFitContent"),function(_d,_e){
with(_d){
var _f=CPMakeSize(0,0);
var _10=objj_msgSend(_d,"subviews");
var i,_11=objj_msgSend(_10,"count");
var _12=objj_msgSend(_d,"dividerThickness");
if(_11==0){
objj_msgSend(_d,"setFrameSize:",_f);
return;
}
if(objj_msgSend(_d,"isVertical")){
var _13=objj_msgSend(_10,"objectAtIndex:",0);
var _14=objj_msgSend(_13,"frame");
_f.height=_14.size.height;
for(i=0;i<_11;i++){
_13=objj_msgSend(_10,"objectAtIndex:",i);
_14=objj_msgSend(_13,"frame");
_f.width+=_14.size.width;
}
_f.width+=_12*(_11-1);
}else{
var _13=objj_msgSend(_10,"objectAtIndex:",0);
var _14=objj_msgSend(_13,"frame");
_f.width=_14.size.width;
for(i=0;i<_11;i++){
_13=objj_msgSend(_10,"objectAtIndex:",i);
_14=objj_msgSend(_13,"frame");
_f.height+=_14.size.height;
}
_f.height+=_12*(_11-1);
}
objj_msgSend(_d,"setFrameSize:",_f);
}
})]);
var _1=objj_getClass("CPTextField");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"CPTextField\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("sizeToFitContent"),function(_15,_16){
with(_15){
var _17=objj_msgSend(_15,"stringValue");
if(_17==nil||objj_msgSend(_17,"length")==0){
objj_msgSend(_15,"setStringValue:","Nicola");
objj_msgSend(_15,"sizeToFit");
objj_msgSend(_15,"setStringValue:","");
}else{
objj_msgSend(_15,"sizeToFit");
}
}
})]);
var _1=objj_getClass("CPImageView");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"CPImageView\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("sizeToFitContent"),function(_18,_19){
with(_18){
objj_msgSend(_18,"setFrameSize:",objj_msgSend(objj_msgSend(_18,"image"),"size"));
}
})]);
var _1=objj_getClass("CPColorWell");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"CPColorWell\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("sizeToFitContent"),function(_1a,_1b){
with(_1a){
objj_msgSend(_1a,"setFrameSize:",objj_msgSend(_1a,"minimumSizeForContent"));
}
}),new objj_method(sel_getUid("minimumSizeForContent"),function(_1c,_1d){
with(_1c){
return CPMakeSize(52,30);
}
})]);
