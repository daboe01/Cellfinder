@STATIC;1.0;i;19;GSMarkupTagObject.jt;5214;
objj_executeFile("GSMarkupTagObject.j",YES);
hexValueFromUnichars=function(a,b){
var _1=0;
switch(a){
case "0":
_1+=0;
break;
case "1":
_1+=16;
break;
case "2":
_1+=32;
break;
case "3":
_1+=48;
break;
case "4":
_1+=64;
break;
case "5":
_1+=80;
break;
case "6":
_1+=96;
break;
case "7":
_1+=112;
break;
case "8":
_1+=128;
break;
case "9":
_1+=144;
break;
case "A":
case "a":
_1+=160;
break;
case "B":
case "b":
_1+=176;
break;
case "C":
case "c":
_1+=192;
break;
case "D":
case "d":
_1+=208;
break;
case "E":
case "e":
_1+=224;
break;
case "F":
case "f":
_1+=240;
break;
default:
return -1;
}
switch(b){
case "0":
_1+=0;
break;
case "1":
_1+=1;
break;
case "2":
_1+=2;
break;
case "3":
_1+=3;
break;
case "4":
_1+=4;
break;
case "5":
_1+=5;
break;
case "6":
_1+=6;
break;
case "7":
_1+=7;
break;
case "8":
_1+=8;
break;
case "9":
_1+=9;
break;
case "A":
case "a":
_1+=10;
break;
case "B":
case "b":
_1+=11;
break;
case "C":
case "c":
_1+=12;
break;
case "D":
case "d":
_1+=13;
break;
case "E":
case "e":
_1+=14;
break;
case "F":
case "f":
_1+=15;
break;
default:
return -1;
}
return (_1/255);
};
getFontWithSelectorSize=function(_2,_3,_4){
var ms;
var i;
var _5=objj_msgSend(CPFont,"class");
var _6;
ms=objj_msgSend(_5,"methodSignatureForSelector:",_2);
i=objj_msgSend(CPInvocation,"invocationWithMethodSignature:",ms);
objj_msgSend(i,"setSelector:",_2);
objj_msgSend(i,"setTarget:",_5);
objj_msgSend(i,"setArgument:atIndex:",_4,2);
objj_msgSend(i,"invoke");
return objj_msgSend(i,"returnValue");
};
var _7=objj_getClass("GSMarkupTagObject");
if(!_7){
throw new SyntaxError("*** Could not find definition for class \"GSMarkupTagObject\"");
}
var _8=_7.isa;
class_addMethods(_7,[new objj_method(sel_getUid("colorValueForAttribute:"),function(_9,_a,_b){
with(_9){
var _c=objj_msgSend(_attributes,"objectForKey:",_b);
if(_c==nil){
return nil;
}
var _d=objj_msgSend(CPString,"stringWithFormat:","%@Color",_c);
var _e=CPSelectorFromString(_d);
if(_e!=NULL&&objj_msgSend(CPColor,"respondsToSelector:",_e)){
return objj_msgSend(CPColor,"performSelector:",_e);
}
if(objj_msgSend(_c,"length")==6||objj_msgSend(_c,"length")==8){
var r,g,b,a;
r=hexValueFromUnichars(objj_msgSend(_c,"characterAtIndex:",0),objj_msgSend(_c,"characterAtIndex:",1));
if(r==-1){
return nil;
}
g=hexValueFromUnichars(objj_msgSend(_c,"characterAtIndex:",2),objj_msgSend(_c,"characterAtIndex:",3));
if(g==-1){
return nil;
}
b=hexValueFromUnichars(objj_msgSend(_c,"characterAtIndex:",4),objj_msgSend(_c,"characterAtIndex:",5));
if(b==-1){
return nil;
}
if(objj_msgSend(_c,"length")==8){
a=hexValueFromUnichars(objj_msgSend(_c,"characterAtIndex:",6),objj_msgSend(_c,"characterAtIndex:",7));
if(a==-1){
return nil;
}
}else{
a=1;
}
return objj_msgSend(CPColor,"colorWithCalibratedRed:green:blue:alpha:",r,g,b,a);
}
return nil;
}
}),new objj_method(sel_getUid("fontValueForAttribute:"),function(_f,_10,_11){
with(_f){
var _12=objj_msgSend(_attributes,"objectForKey:",_11);
var _13=1;
var _14=NO;
var _15;
var _16;
if(_12==nil){
return nil;
}
_15=sel_getUid("labelFontOfSize:");
_16="label";
var a=objj_msgSend(_12,"componentsSeparatedByString:"," ");
var i,_17=objj_msgSend(a,"count");
for(i=0;i<_17;i++){
var _18=objj_msgSend(a,"objectAtIndex:",i);
var _19=NO;
switch(objj_msgSend(_18,"length")){
case 3:
if(objj_msgSend(_18,"isEqualToString:","big")){
_13=1.25;
_19=YES;
}else{
if(objj_msgSend(_18,"isEqualToString:","Big")){
_13=1.5;
_19=YES;
}
}
break;
case 4:
if(objj_msgSend(_18,"isEqualToString:","huge")){
_13=2;
_19=YES;
}else{
if(objj_msgSend(_18,"isEqualToString:","Huge")){
_13=3;
_19=YES;
}else{
if(objj_msgSend(_18,"isEqualToString:","tiny")){
_13=0.5;
_19=YES;
}else{
if(objj_msgSend(_18,"isEqualToString:","Tiny")){
_13=0.334;
_19=YES;
}
}
}
}
break;
case 5:
if(objj_msgSend(_18,"isEqualToString:","small")){
_13=0.8;
_19=YES;
}else{
if(objj_msgSend(_18,"isEqualToString:","Small")){
_13=0.667;
_19=YES;
}
}
break;
case 6:
if(objj_msgSend(_18,"isEqualToString:","medium")){
_13=1;
_19=YES;
}
break;
}
if(_19){
_14=YES;
}
if(!_19){
var _1a;
var s;
_1a=objj_msgSend(CPString,"stringWithFormat:","%@FontOfSize:",_18);
s=CPSelectorFromString(_1a);
if(s!=NULL&&objj_msgSend(CPFont,"respondsToSelector:",s)){
_15=s;
_16=_18;
_19=YES;
}
}
if(!_19){
var g=objj_msgSend(_18,"floatValue");
if(g>0){
_13=g;
_14=YES;
}
}
}
var f;
f=getFontWithSelectorSize(_15,_16,0);
if(_14){
var _1b=objj_msgSend(f,"pointSize");
_1b=_1b*_13;
f=getFontWithSelectorSize(_15,_16,_1b);
}
return f;
}
}),new objj_method(sel_getUid("integerMaskValueForAttribute:withMaskValuesDictionary:"),function(_1c,_1d,_1e,_1f){
with(_1c){
var _20=objj_msgSend(_attributes,"objectForKey:",_1e);
var _21=0;
if(_20==nil){
return 0;
}
var a=objj_msgSend(_20,"componentsSeparatedByString:","|");
var i,_22=objj_msgSend(a,"count");
for(i=0;i<_22;i++){
var _23=objj_msgSend(a,"objectAtIndex:",i);
var _24=nil;
_23=objj_msgSend(_23,"stringByTrimmingCharactersInSet:",objj_msgSend(CPCharacterSet,"whitespaceAndNewlineCharacterSet"));
_24=objj_msgSend(_1f,"objectForKey:",_23);
if(_24==nil){
CPLog("Warning: <%@> has unknown value '%@' for attribute '%@'.  Ignored.",objj_msgSend(objj_msgSend(_1c,"class"),"tagName"),_23,_1e);
}else{
_21|=objj_msgSend(_24,"intValue");
}
}
return _21;
}
})]);
