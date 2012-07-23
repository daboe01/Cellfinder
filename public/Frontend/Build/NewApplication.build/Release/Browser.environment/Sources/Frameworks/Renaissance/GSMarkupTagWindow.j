@STATIC;1.0;i;19;GSMarkupTagObject.jt;6800;
objj_executeFile("GSMarkupTagObject.j",YES);
var _1=objj_getClass("CPWindow");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"CPWindow\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("setFrameAutosaveName:"),function(_3,_4,_5){
with(_3){
}
}),new objj_method(sel_getUid("setFrameUsingName:"),function(_6,_7,_8){
with(_6){
}
})]);
var _1=objj_allocateClassPair(GSMarkupTagObject,"GSMarkupTagWindow"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initPlatformObject:"),function(_9,_a,_b){
with(_9){
var _c=CPTitledWindowMask|CPClosableWindowMask|CPMiniaturizableWindowMask|CPResizableWindowMask;
var _d=CPMakeRect(200,324,162,100);
var _e=nil;
var _f=NO;
var _10=NO;
if(objj_msgSend(_9,"boolValueForAttribute:","titled")==0){
_c&=~CPTitledWindowMask;
}
if(objj_msgSend(_9,"boolValueForAttribute:","HUD")==1){
_c|=CPHUDBackgroundWindowMask;
}
if(objj_msgSend(_9,"boolValueForAttribute:","bridge")==1){
_c|=CPBorderlessBridgeWindowMask;
}
if(objj_msgSend(_9,"boolValueForAttribute:","modal")==1){
_c|=CPDocModalWindowMask;
}
if(objj_msgSend(_9,"boolValueForAttribute:","closable")==0){
_c&=~CPClosableWindowMask;
}
if(objj_msgSend(_9,"boolValueForAttribute:","miniaturizable")==0){
_c&=~CPMiniaturizableWindowMask;
}
if(objj_msgSend(_9,"boolValueForAttribute:","borderless")==1){
_c&=CPBorderlessWindowMask;
}
if(objj_msgSend(_9,"boolValueForAttribute:","texturedBackground")==1){
_c&=CPTexturedBackgroundWindowMask;
}
if(_content!=nil&&objj_msgSend(_content,"count")>0){
_e=objj_msgSend(objj_msgSend(_content,"objectAtIndex:",0),"platformObject");
if(objj_msgSend(_e,"isKindOfClass:",objj_msgSend(CPView,"class"))){
_d.size=objj_msgSend(_e,"frame").size;
}
}
var _11=objj_msgSend(_9,"boolValueForAttribute:","resizable");
if(_11==0){
_c&=~CPResizableWindowMask;
}else{
if(_11==1){
_10=NO;
_f=NO;
_c|=CPResizableWindowMask;
}else{
if(_e!=nil&&objj_msgSend(_e,"isKindOfClass:",objj_msgSend(CPView,"class"))){
var _12=objj_msgSend(objj_msgSend(_content,"objectAtIndex:",0),"gsAutoLayoutHAlignment");
var _13=objj_msgSend(objj_msgSend(_content,"objectAtIndex:",0),"gsAutoLayoutVAlignment");
if(_12==255){
if(objj_msgSend(_e,"autolayoutDefaultHorizontalAlignment")==GSAutoLayoutExpand){
_12=GSAutoLayoutExpand;
}
}
if(_13==255){
if(objj_msgSend(_e,"autolayoutDefaultVerticalAlignment")==GSAutoLayoutExpand){
_13=GSAutoLayoutExpand;
}
}
if(_12==GSAutoLayoutExpand){
if(_13==GSAutoLayoutExpand){
}else{
_10=YES;
}
}else{
if(_13==GSAutoLayoutExpand){
_f=YES;
}else{
_c&=~CPResizableWindowMask;
}
}
}
}
}
_b=objj_msgSend(_b,"initWithContentRect:styleMask:",_d,_c);
if(_e!=nil&&objj_msgSend(_e,"isKindOfClass:",objj_msgSend(CPView,"class"))){
objj_msgSend(_e,"setAutoresizingMask:",CPViewWidthSizable|CPViewHeightSizable);
objj_msgSend(_b,"setContentView:",_e);
}
var _14=objj_msgSend(objj_msgSend(_b,"contentView"),"frame").size;
var _15,_16;
var _17=NO;
_15=objj_msgSend(_attributes,"objectForKey:","contentWidth");
if(_15!=nil){
var w=objj_msgSend(_15,"floatValue");
if(w>0){
_14.width=w;
_17=YES;
}
}
_16=objj_msgSend(_attributes,"objectForKey:","contentHeight");
if(_16!=nil){
var h=objj_msgSend(_16,"floatValue");
if(h>0){
_14.height=h;
_17=YES;
}
}
if(_17){
objj_msgSend(_b,"setContentSize:",_14);
}
var _18=objj_msgSend(_b,"frame");
var x,y,_15,_16;
var _19=NO;
x=objj_msgSend(_attributes,"objectForKey:","x");
if(x!=nil){
_18.origin.x=objj_msgSend(x,"floatValue");
_19=YES;
}
y=objj_msgSend(_attributes,"objectForKey:","y");
if(y!=nil){
_18.origin.y=objj_msgSend(y,"floatValue");
_19=YES;
}
_15=objj_msgSend(_attributes,"objectForKey:","width");
if(_15!=nil){
var w=objj_msgSend(_15,"floatValue");
if(w>0){
_18.size.width=w;
_19=YES;
}
}
_16=objj_msgSend(_attributes,"objectForKey:","height");
if(_16!=nil){
var h=objj_msgSend(_16,"floatValue");
if(h>0){
_18.size.height=h;
_19=YES;
}
}
if(_19){
objj_msgSend(_b,"setFrame:display:",_18,NO);
}
var _14;
var _15,_16;
var _1a=objj_msgSend(_e,"minimumSizeForContent");
if(!_1a){
_1a=CPMakeSize(100,100);
}
var r=CPMakeRect(0,0,_1a.width,_1a.height);
_14=(objj_msgSend(CPWindow,"frameRectForContentRect:styleMask:",r,objj_msgSend(_b,"styleMask"))).size;
_15=objj_msgSend(_attributes,"objectForKey:","minWidth");
if(_15!=nil){
var w=objj_msgSend(_15,"floatValue");
if(w>0){
_14.width=w;
}
}
_16=objj_msgSend(_attributes,"objectForKey:","minHeight");
if(_16!=nil){
var h=objj_msgSend(_16,"floatValue");
if(h>0){
_14.height=h;
}
}
objj_msgSend(_b,"setMinSize:",_14);
var _14=objj_msgSend(_b,"maxSize");
var _15,_16;
var _17=NO;
_15=objj_msgSend(_attributes,"objectForKey:","maxWidth");
if(_15!=nil){
var w=objj_msgSend(_15,"floatValue");
if(w>0){
_14.width=w;
_17=YES;
}
}else{
if(_f){
_14.width=objj_msgSend(_b,"frame").size.width;
_17=YES;
}
}
_16=objj_msgSend(_attributes,"objectForKey:","maxHeight");
if(_16!=nil){
var h=objj_msgSend(_16,"floatValue");
if(h>0){
_14.height=h;
_17=YES;
}
}else{
if(_10){
_14.height=objj_msgSend(_b,"frame").size.height;
_17=YES;
}
}
if(_17){
objj_msgSend(_b,"setMaxSize:",_14);
}
var _1b=objj_msgSend(_9,"localizedStringValueForAttribute:","title");
if(_1b!=nil){
objj_msgSend(_b,"setTitle:",_1b);
}
var _1c=objj_msgSend(_9,"boolValueForAttribute:","center");
if(_1c==1){
objj_msgSend(_b,"center");
}
var _1d=objj_msgSend(_attributes,"objectForKey:","autosaveName");
if(_1d!=nil){
objj_msgSend(_b,"setFrameUsingName:",_1d);
objj_msgSend(_b,"setFrameAutosaveName:",_1d);
}
var _1e;
_1e=objj_msgSend(_9,"boolValueForAttribute:","releasedWhenClosed");
if(_1e==1){
objj_msgSend(_b,"setReleasedWhenClosed:",YES);
}else{
if(_1e==0){
objj_msgSend(_b,"setReleasedWhenClosed:",NO);
}
}
var bg=objj_msgSend(_9,"colorValueForAttribute:","backgroundColor");
if(bg!=nil){
objj_msgSend(_b,"setBackgroundColor:",bg);
}
return _b;
}
}),new objj_method(sel_getUid("postInitPlatformObject:"),function(_1f,_20,_21){
with(_1f){
var _22=objj_msgSend(_1f,"boolValueForAttribute:","visible");
var _23=objj_msgSend(_1f,"boolValueForAttribute:","keyWindow");
if(_22!=0&&_23==1){
objj_msgSend(_21,"makeKeyAndOrderFront:",nil);
}else{
if(_22!=0){
objj_msgSend(_21,"orderFront:",nil);
}else{
if(_23==1){
objj_msgSend(_21,"makeKeyWindow");
}
}
}
var _24=objj_msgSend(_1f,"boolValueForAttribute:","mainWindow");
if(_24==1){
objj_msgSend(_21,"makeMainWindow");
}
return _21;
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("tagName"),function(_25,_26){
with(_25){
return "window";
}
}),new objj_method(sel_getUid("platformObjectClass"),function(_27,_28){
with(_27){
return objj_msgSend(CPWindow,"class");
}
}),new objj_method(sel_getUid("useInstanceOfAttribute"),function(_29,_2a){
with(_29){
return YES;
}
}),new objj_method(sel_getUid("localizableAttributes"),function(_2b,_2c){
with(_2b){
return objj_msgSend(CPArray,"arrayWithObject:","title");
}
})]);
