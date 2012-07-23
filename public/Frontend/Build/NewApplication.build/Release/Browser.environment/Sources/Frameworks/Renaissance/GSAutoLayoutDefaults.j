@STATIC;1.0;t;4319;
GSAutoLayoutExpand=0;
GSAutoLayoutWeakExpand=1;
GSAutoLayoutAlignMin=2;
GSAutoLayoutAlignCenter=3;
GSAutoLayoutAlignMax=4;
var _1=objj_getClass("CPView");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"CPView\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("autolayoutDefaultHorizontalAlignment"),function(_3,_4){
with(_3){
return GSAutoLayoutAlignCenter;
}
}),new objj_method(sel_getUid("autolayoutDefaultVerticalAlignment"),function(_5,_6){
with(_5){
return GSAutoLayoutAlignCenter;
}
}),new objj_method(sel_getUid("autolayoutDefaultHorizontalBorder"),function(_7,_8){
with(_7){
return 4;
}
}),new objj_method(sel_getUid("autolayoutDefaultVerticalBorder"),function(_9,_a){
with(_9){
return 4;
}
})]);
var _1=objj_getClass("CPTextField");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"CPTextField\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("autolayoutDefaultHorizontalAlignment"),function(_b,_c){
with(_b){
if(0&&objj_msgSend(_b,"isBezeled")||objj_msgSend(_b,"isEditable")){
return GSAutoLayoutExpand;
}
return GSAutoLayoutAlignCenter;
}
}),new objj_method(sel_getUid("autolayoutDefaultVerticalAlignment"),function(_d,_e){
with(_d){
return GSAutoLayoutAlignMin;
}
})]);
var _1=objj_getClass("CPScrollView");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"CPScrollView\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("autolayoutDefaultHorizontalAlignment"),function(_f,_10){
with(_f){
return GSAutoLayoutExpand;
}
}),new objj_method(sel_getUid("autolayoutDefaultVerticalAlignment"),function(_11,_12){
with(_11){
return GSAutoLayoutExpand;
}
})]);
var _1=objj_getClass("CPSplitView");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"CPSplitView\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("autolayoutDefaultHorizontalAlignment"),function(_13,_14){
with(_13){
return GSAutoLayoutExpand;
}
}),new objj_method(sel_getUid("autolayoutDefaultVerticalAlignment"),function(_15,_16){
with(_15){
return GSAutoLayoutExpand;
}
})]);
var _1=objj_getClass("CPBox");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"CPBox\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("autolayoutDefaultHorizontalAlignment"),function(_17,_18){
with(_17){
var _19=objj_msgSend(_17,"contentView");
var _1a;
_1a=objj_msgSend(_19,"autolayoutDefaultHorizontalAlignment");
if(_1a==GSAutoLayoutExpand||_1a==GSAutoLayoutWeakExpand){
return _1a;
}
return GSAutoLayoutAlignCenter;
}
}),new objj_method(sel_getUid("autolayoutDefaultVerticalAlignment"),function(_1b,_1c){
with(_1b){
var _1d=objj_msgSend(_1b,"contentView");
var _1e;
_1e=objj_msgSend(_1d,"autolayoutDefaultVerticalAlignment");
if(_1e==GSAutoLayoutExpand||_1e==GSAutoLayoutWeakExpand){
return _1e;
}
return GSAutoLayoutAlignCenter;
}
})]);
var _1=objj_getClass("CPButton");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"CPButton\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("autolayoutDefaultHorizontalBorder"),function(_1f,_20){
with(_1f){
if(objj_msgSend(_1f,"isBordered")&&objj_msgSend(_1f,"bezelStyle")==CPRoundedBezelStyle){
return 0;
}else{
return 4;
}
}
}),new objj_method(sel_getUid("autolayoutDefaultVerticalBorder"),function(_21,_22){
with(_21){
if(objj_msgSend(_21,"isBordered")&&objj_msgSend(_21,"bezelStyle")==CPRoundedBezelStyle){
return 1;
}else{
return 4;
}
}
})]);
var _1=objj_getClass("CPView");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"CPView\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("setDisplayAutoLayoutContainers:"),function(_23,_24,_25){
with(_23){
var _26=objj_msgSend(_23,"subviews");
var i,_27=objj_msgSend(_26,"count");
for(i=0;i<_27;i++){
var _28=objj_msgSend(_26,"objectAtIndex:",i);
objj_msgSend(_28,"setDisplayAutoLayoutContainers:",_25);
}
}
})]);
var _1=objj_getClass("CPWindow");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"CPWindow\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("setDisplayAutoLayoutContainers:"),function(_29,_2a,_2b){
with(_29){
objj_msgSend(objj_msgSend(_29,"contentView"),"setDisplayAutoLayoutContainers:",_2b);
}
})]);
