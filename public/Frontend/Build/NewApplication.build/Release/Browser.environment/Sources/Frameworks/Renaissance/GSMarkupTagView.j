@STATIC;1.0;i;19;GSMarkupTagObject.jt;6005;
objj_executeFile("GSMarkupTagObject.j",YES);
var _1=objj_allocateClassPair(GSMarkupTagObject,"GSMarkupTagView"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initPlatformObject:"),function(_3,_4,_5){
with(_3){
var _6=CPMakeRect(0,0,100,100);
var _7;
var _8;
_7=objj_msgSend(_attributes,"objectForKey:","width");
if(_7!=nil){
var w=objj_msgSend(_7,"floatValue");
if(w>0){
_6.size.width=w;
}
}
_8=objj_msgSend(_attributes,"objectForKey:","height");
if(_8!=nil){
var h=objj_msgSend(_8,"floatValue");
if(h>0){
_6.size.height=h;
}
}
_5=objj_msgSend(_5,"initWithFrame:",_6);
return _5;
}
}),new objj_method(sel_getUid("postInitPlatformObject:"),function(_9,_a,_b){
with(_9){
if((objj_msgSend(_attributes,"objectForKey:","width")==nil)||(objj_msgSend(_attributes,"objectForKey:","height")==nil)){
objj_msgSend(_b,"sizeToFitContent");
}
var _c=objj_msgSend(_b,"frame");
var x,y,_d,_e;
var _f=NO;
x=objj_msgSend(_attributes,"objectForKey:","x");
if(x!=nil){
_c.origin.x=objj_msgSend(x,"floatValue");
_f=YES;
}
y=objj_msgSend(_attributes,"objectForKey:","y");
if(y!=nil){
_c.origin.y=objj_msgSend(y,"floatValue");
_f=YES;
}
_d=objj_msgSend(_attributes,"objectForKey:","width");
if(_d!=nil){
var w=objj_msgSend(_d,"floatValue");
if(w>0){
_c.size.width=w;
_f=YES;
}
}
_e=objj_msgSend(_attributes,"objectForKey:","height");
if(_e!=nil){
var h=objj_msgSend(_e,"floatValue");
if(h>0){
_c.size.height=h;
_f=YES;
}
}
if(_f){
objj_msgSend(_b,"setFrame:",_c);
}
var _10=0;
var _11=0;
_11=objj_msgSend(_9,"gsAutoLayoutHAlignment");
if(_11==255){
_11=objj_msgSend(_b,"autolayoutDefaultHorizontalAlignment");
}
switch(_11){
case GSAutoLayoutExpand:
case GSAutoLayoutWeakExpand:
_10|=CPViewWidthSizable;
break;
case GSAutoLayoutAlignMin:
_10|=CPViewMaxXMargin;
break;
case GSAutoLayoutAlignCenter:
_10|=CPViewMaxXMargin|CPViewMinXMargin;
break;
case GSAutoLayoutAlignMax:
_10|=CPViewMinXMargin;
break;
}
var _12=0;
_12=objj_msgSend(_9,"gsAutoLayoutVAlignment");
if(_12==255){
_12=objj_msgSend(_b,"autolayoutDefaultVerticalAlignment");
}
switch(_12){
case GSAutoLayoutExpand:
case GSAutoLayoutWeakExpand:
_10|=CPViewHeightSizable;
break;
case GSAutoLayoutAlignMin:
_10|=CPViewMaxYMargin;
break;
case GSAutoLayoutAlignCenter:
_10|=CPViewMaxYMargin|CPViewMinYMargin;
break;
case GSAutoLayoutAlignMax:
_10|=CPViewMinYMargin;
break;
}
objj_msgSend(_b,"setAutoresizingMask:",_10);
var _13=objj_msgSend(_attributes,"objectForKey:","autoresizingMask");
if(_13!=nil){
var i,_14=objj_msgSend(_13,"length");
var _15=0;
for(i=0;i<_14;i++){
var c=objj_msgSend(_13,"characterAtIndex:",i);
switch(c){
case "h":
_15|=CPViewHeightSizable;
break;
case "w":
_15|=CPViewWidthSizable;
break;
case "x":
_15|=CPViewMinXMargin;
break;
case "X":
_15|=CPViewMaxXMargin;
break;
case "y":
_15|=CPViewMinYMargin;
break;
case "Y":
_15|=CPViewMaxYMargin;
break;
default:
break;
}
}
if(_15!=objj_msgSend(_b,"autoresizingMask")){
objj_msgSend(_b,"setAutoresizingMask:",_15);
}
}
var _16=objj_msgSend(_9,"boolValueForAttribute:","autoresizesSubviews");
if(_16==0){
objj_msgSend(_b,"setAutoresizesSubviews:",NO);
}else{
if(_16==1){
objj_msgSend(_b,"setAutoresizesSubviews:",YES);
}
}
if(objj_msgSend(_9,"boolValueForAttribute:","hidden")==1){
objj_msgSend(_b,"setHidden:",YES);
}
var _17=objj_msgSend(_9,"localizedStringValueForAttribute:","toolTip");
if(_17!=nil){
objj_msgSend(_b,"setToolTip:",_17);
}
if((objj_msgSend(_9,"class")==objj_msgSend(GSMarkupTagView,"class"))||objj_msgSend(_9,"shouldTreatContentAsSubviews")){
var i,_14=objj_msgSend(_content,"count");
for(i=0;i<_14;i++){
var v=objj_msgSend(_content,"objectAtIndex:",i);
var _18=objj_msgSend(v,"platformObject");
if(_18!=nil&&objj_msgSend(_18,"isKindOfClass:",objj_msgSend(CPView,"class"))){
objj_msgSend(_b,"addSubview:",_18);
}
}
}
return _b;
}
}),new objj_method(sel_getUid("shouldTreatContentAsSubviews"),function(_19,_1a){
with(_19){
return NO;
}
}),new objj_method(sel_getUid("gsAutoLayoutHAlignment"),function(_1b,_1c){
with(_1b){
var _1d;
if(objj_msgSend(_1b,"boolValueForAttribute:","hexpand")==1){
return GSAutoLayoutExpand;
}
_1d=objj_msgSend(_attributes,"objectForKey:","halign");
if(_1d!=nil){
if(objj_msgSend(_1d,"isEqualToString:","expand")){
return GSAutoLayoutExpand;
}else{
if(objj_msgSend(_1d,"isEqualToString:","wexpand")){
return GSAutoLayoutWeakExpand;
}else{
if(objj_msgSend(_1d,"isEqualToString:","min")){
return GSAutoLayoutAlignMin;
}else{
if(objj_msgSend(_1d,"isEqualToString:","left")){
return GSAutoLayoutAlignMin;
}else{
if(objj_msgSend(_1d,"isEqualToString:","center")){
return GSAutoLayoutAlignCenter;
}else{
if(objj_msgSend(_1d,"isEqualToString:","max")){
return GSAutoLayoutAlignMax;
}else{
if(objj_msgSend(_1d,"isEqualToString:","right")){
return GSAutoLayoutAlignMax;
}
}
}
}
}
}
}
}
return 255;
}
}),new objj_method(sel_getUid("gsAutoLayoutVAlignment"),function(_1e,_1f){
with(_1e){
var _20;
if(objj_msgSend(_1e,"boolValueForAttribute:","vexpand")==1){
return GSAutoLayoutExpand;
}
_20=objj_msgSend(_attributes,"objectForKey:","valign");
if(_20!=nil){
if(objj_msgSend(_20,"isEqualToString:","expand")){
return GSAutoLayoutExpand;
}else{
if(objj_msgSend(_20,"isEqualToString:","wexpand")){
return GSAutoLayoutWeakExpand;
}else{
if(objj_msgSend(_20,"isEqualToString:","min")){
return GSAutoLayoutAlignMin;
}else{
if(objj_msgSend(_20,"isEqualToString:","bottom")){
return GSAutoLayoutAlignMin;
}else{
if(objj_msgSend(_20,"isEqualToString:","center")){
return GSAutoLayoutAlignCenter;
}else{
if(objj_msgSend(_20,"isEqualToString:","max")){
return GSAutoLayoutAlignMax;
}else{
if(objj_msgSend(_20,"isEqualToString:","top")){
return GSAutoLayoutAlignMax;
}
}
}
}
}
}
}
}
return 255;
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("tagName"),function(_21,_22){
with(_21){
return "view";
}
}),new objj_method(sel_getUid("platformObjectClass"),function(_23,_24){
with(_23){
return objj_msgSend(CPView,"class");
}
}),new objj_method(sel_getUid("useInstanceOfAttribute"),function(_25,_26){
with(_25){
return YES;
}
})]);
