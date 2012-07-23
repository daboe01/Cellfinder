@STATIC;1.0;I;21;Foundation/CPObject.jI;25;Renaissance/Renaissance.jI;24;CoreText/CGContextText.jt;16979;
objj_executeFile("Foundation/CPObject.j",NO);
objj_executeFile("Renaissance/Renaissance.j",NO);
objj_executeFile("CoreText/CGContextText.j",NO);
AIVStylePlain=0;
AIVStyleNumbers=1;
AIVStylePolygon=2;
AIVStyleLengthInfo=4;
AIVStyleAngleInfo=8;
var _1=objj_getClass("CPObject");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"CPObject\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("selectMe"),function(_3,_4){
with(_3){
if(objj_msgSend(_3,"respondsToSelector:",sel_getUid("setSelected:"))){
objj_msgSend(_3,"setSelected:",YES);
}
}
})]);
var _1=objj_allocateClassPair(CPView,"DotView"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_selected"),new objj_ivar("_data")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("data"),function(_5,_6){
with(_5){
return _data;
}
}),new objj_method(sel_getUid("setData:"),function(_7,_8,_9){
with(_7){
_data=_9;
}
}),new objj_method(sel_getUid("setSelected:"),function(_a,_b,_c){
with(_a){
_selected=_c;
objj_msgSend(_a,"setNeedsDisplay:",YES);
}
}),new objj_method(sel_getUid("isSelected"),function(_d,_e){
with(_d){
return _selected;
}
}),new objj_method(sel_getUid("initWithFrame:"),function(_f,_10,_11){
with(_f){
if(_f=objj_msgSendSuper({receiver:_f,super_class:objj_getClass("DotView").super_class},"initWithFrame:",_11)){
objj_msgSend(_f,"setSelected:",NO);
}
return _f;
}
}),new objj_method(sel_getUid("initWithCentroid:"),function(_12,_13,_14){
with(_12){
var _15=objj_msgSend(objj_msgSend(_12,"class"),"frameFromCentroid:",_14);
_12=objj_msgSend(_12,"initWithFrame:",_15);
return _12;
}
}),new objj_method(sel_getUid("drawRect:"),function(_16,_17,_18){
with(_16){
var _19=objj_msgSend(objj_msgSend(CPGraphicsContext,"currentContext"),"graphicsPort");
CGContextSetFillColor(_19,objj_msgSend(objj_msgSend(_16,"class"),"color"));
var _1a=CPMakeRect(_18.origin.x+2,_18.origin.y+2,_18.size.width-2,_18.size.height-2);
CGContextFillEllipseInRect(_19,_1a);
CGContextSetStrokeColor(_19,objj_msgSend(objj_msgSend(_16,"class"),"shadowColor"));
CGContextStrokeEllipseInRect(_19,_1a);
if(_selected){
CGContextSetFillColor(_19,objj_msgSend(CPColor,"whiteColor"));
CGContextSetAlpha(_19,0.5);
CGContextFillEllipseInRect(_19,_18);
}
}
}),new objj_method(sel_getUid("translateByX:andY:"),function(_1b,_1c,_1d,_1e){
with(_1b){
var _1f=objj_msgSend(_1b,"frame");
_1f.origin.x+=_1d;
_1f.origin.y+=_1e;
objj_msgSend(_1b,"setFrame:",_1f);
}
}),new objj_method(sel_getUid("objectValue"),function(_20,_21){
with(_20){
var _22=objj_msgSend(_20,"frame");
var _23=objj_msgSend(objj_msgSend(_20,"class"),"radius");
var r=CPMakePoint(_22.origin.x+1+_23,_22.origin.y+1+_23);
return r;
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("radius"),function(_24,_25){
with(_24){
return 5;
}
}),new objj_method(sel_getUid("color"),function(_26,_27){
with(_26){
return objj_msgSend(CPColor,"yellowColor");
}
}),new objj_method(sel_getUid("shadowColor"),function(_28,_29){
with(_28){
return objj_msgSend(CPColor,"orangeColor");
}
}),new objj_method(sel_getUid("textColor"),function(_2a,_2b){
with(_2a){
return objj_msgSend(CPColor,"blackColor");
}
}),new objj_method(sel_getUid("frameFromCentroid:"),function(_2c,_2d,_2e){
with(_2c){
var _2f=objj_msgSend(objj_msgSend(_2c,"class"),"radius");
return CPMakeRect(_2e.x-_2f-1,_2e.y-_2f-1,_2f*2+1,_2f*2+1);
}
})]);
var _1=objj_allocateClassPair(CPControl,"AnnotatedImageView"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_backgroundImageView"),new objj_ivar("_selOriginOffset"),new objj_ivar("_lastPoint"),new objj_ivar("_currentGraphic"),new objj_ivar("_marqueeSelectionBounds"),new objj_ivar("_marqueeOrigin"),new objj_ivar("_marqueeLayer"),new objj_ivar("_scale"),new objj_ivar("_styleFlags")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("styleFlags"),function(_30,_31){
with(_30){
return _styleFlags;
}
}),new objj_method(sel_getUid("setStyleFlags:"),function(_32,_33,_34){
with(_32){
_styleFlags=_34;
}
}),new objj_method(sel_getUid("stringForObjectValue:"),function(_35,_36,_37){
with(_35){
return parseInt(_37*_scale);
}
}),new objj_method(sel_getUid("objectValueForString:error:"),function(_38,_39,_3a,_3b){
with(_38){
return parseInt(_3a/_scale);
}
}),new objj_method(sel_getUid("initWithFrame:"),function(_3c,_3d,_3e){
with(_3c){
if(_3c=objj_msgSendSuper({receiver:_3c,super_class:objj_getClass("AnnotatedImageView").super_class},"initWithFrame:",_3e)){
_selOriginOffset=CPMakePoint(0,0);
_marqueeSelectionBounds=CPRectMakeZero();
_marqueeLayer=objj_msgSend(CALayer,"layer");
objj_msgSend(_3c,"setLayer:",_marqueeLayer);
objj_msgSend(_marqueeLayer,"setDelegate:",_3c);
_scale=1;
objj_msgSend(_marqueeLayer,"setNeedsDisplay");
}
return _3c;
}
}),new objj_method(sel_getUid("rebuildLayoutForGraphicClass:"),function(_3f,_40,_41){
with(_3f){
var _42=objj_msgSend(_3f,"subviews");
var n=objj_msgSend(_42,"count");
for(var i=0;i<n;i++){
var _43=_42[i];
if(objj_msgSend(_43,"respondsToSelector:",sel_getUid("isSelected"))){
objj_msgSend(_43,"removeFromSuperview");
}
}
var _44=objj_msgSend(_3f,"objectValue");
if(!_44){
return;
}
var l=objj_msgSend(_44,"count");
for(var i=0;i<l;i++){
var ai=objj_msgSend(_44,"objectAtIndex:",i);
var o=objj_msgSend(objj_msgSend(_41,"alloc"),"initWithCentroid:",CPMakePoint(objj_msgSend(ai,"valueForKey:","row"),objj_msgSend(ai,"valueForKey:","col")));
objj_msgSend(o,"setData:",ai);
objj_msgSend(_3f,"addDotView:",o);
}
objj_msgSend(_marqueeLayer,"setNeedsDisplay");
}
}),new objj_method(sel_getUid("sizeToFit"),function(_45,_46){
with(_45){
}
}),new objj_method(sel_getUid("addDotView:"),function(_47,_48,_49){
with(_47){
if(_backgroundImageView){
objj_msgSend(_47,"addSubview:positioned:relativeTo:",_49,CPWindowAbove,_backgroundImageView);
}else{
objj_msgSend(_47,"addSubview:",_49);
}
}
}),new objj_method(sel_getUid("setObjectValue:"),function(_4a,_4b,_4c){
with(_4a){
objj_msgSendSuper({receiver:_4a,super_class:objj_getClass("AnnotatedImageView").super_class},"setObjectValue:",_4c);
objj_msgSend(objj_msgSend(_4c,"entity"),"setFormatter:forColumnName:",_4a,"row");
objj_msgSend(objj_msgSend(_4c,"entity"),"setFormatter:forColumnName:",_4a,"col");
objj_msgSend(_4a,"rebuildLayoutForGraphicClass:",objj_msgSend(DotView,"class"));
}
}),new objj_method(sel_getUid("imageDidLoad:"),function(_4d,_4e,_4f){
with(_4d){
objj_msgSend(_4d,"setBackgroundImage:",_4f);
}
}),new objj_method(sel_getUid("setBackgroundImage:"),function(_50,_51,_52){
with(_50){
if(objj_msgSend(_52,"loadStatus")!=CPImageLoadStatusCompleted){
objj_msgSend(_52,"setDelegate:",_50);
return;
}
var _53=objj_msgSend(_52,"size");
if(_backgroundImageView){
objj_msgSend(_backgroundImageView,"removeFromSuperview");
}
var _54=CPMakeRect(0,0,_53.width,_53.height);
_backgroundImageView=objj_msgSend(objj_msgSend(CPImageView,"alloc"),"initWithFrame:",_54);
objj_msgSend(_backgroundImageView,"setImageScaling:",CPScaleToFit);
objj_msgSend(_backgroundImageView,"setImage:",_52);
objj_msgSend(_50,"addSubview:positioned:relativeTo:",_backgroundImageView,CPWindowBelow,nil);
objj_msgSend(_50,"setFrame:",_54);
objj_msgSend(_50,"setNeedsDisplay:",YES);
}
}),new objj_method(sel_getUid("backgroundImage"),function(_55,_56){
with(_55){
return objj_msgSend(_backgroundImageView,"image");
}
}),new objj_method(sel_getUid("scale"),function(_57,_58){
with(_57){
return _scale;
}
}),new objj_method(sel_getUid("setScale:"),function(_59,_5a,_5b){
with(_59){
_scale=_5b;
objj_msgSend(_59,"setObjectValue:",objj_msgSend(_59,"objectValue"));
}
}),new objj_method(sel_getUid("drawLayer:inContext:"),function(_5c,_5d,_5e,_5f){
with(_5c){
var _60=objj_msgSend(DotView,"class");
if(!CPRectEqualToRect(_marqueeSelectionBounds,CPRectMakeZero())){
CGContextSetStrokeColor(_5f,objj_msgSend(CPColor,"lightGrayColor"));
CGContextStrokeRect(_5f,_marqueeSelectionBounds);
}
if(_styleFlags&AIVStylePolygon){
CGContextBeginPath(_5f);
var _61=objj_msgSend(_5c,"allDots");
var n=objj_msgSend(_61,"count");
var _62=YES;
for(var i=0;i<n;i++){
var _63=_61[i];
var o=objj_msgSend(_63,"objectValue");
if(_62){
CGContextMoveToPoint(_5f,o.x,o.y);
_62=NO;
}else{
CGContextAddLineToPoint(_5f,o.x,o.y);
}
}
CGContextClosePath(_5f);
CGContextSetStrokeColor(_5f,objj_msgSend(CPColor,"yellowColor"));
CGContextStrokePath(_5f);
}
if(_styleFlags&AIVStyleAngleInfo){
CGContextBeginPath(_5f);
var _61=objj_msgSend(_5c,"allDots");
var n=objj_msgSend(_61,"count");
if(n){
var _64=objj_msgSend(_61[0],"objectValue");
var _65=objj_msgSend(_61[n-1],"objectValue");
CGContextMoveToPoint(_5f,_65.x,_65.y);
CGContextAddLineToPoint(_5f,_64.x,_64.y);
CGContextClosePath(_5f);
CGContextSetStrokeColor(_5f,objj_msgSend(CPColor,"yellowColor"));
CGContextStrokePath(_5f);
var _66=(_64.x>_65.x)?Math.atan((_64.y-_65.y)/(_64.x-_65.x)):(3.14-Math.atan((_64.y-_65.y)/(_65.x-_64.x)));
CGContextMoveToPoint(_5f,_65.x,_65.y);
CGContextAddLineToPoint(_5f,_65.x+50,_65.y);
CGContextClosePath(_5f);
CGContextStrokePath(_5f);
CGContextMoveToPoint(_5f,_65.x,_65.y);
CGContextAddArc(_5f,_65.x,_65.y,50,0,_66,NO);
CGContextClosePath(_5f);
CGContextStrokePath(_5f);
}
}
if(_styleFlags&AIVStyleNumbers){
CGContextSelectFont(_5f,objj_msgSend(CPFont,"systemFontOfSize:",8));
CGContextSetFillColor(_5f,objj_msgSend(_60,"textColor"));
CGContextSetStrokeColor(_5f,objj_msgSend(_60,"textColor"));
var _61=objj_msgSend(_5c,"allDots");
var n=objj_msgSend(_61,"count");
for(var i=0;i<n;i++){
var _63=_61[i];
var o=objj_msgSend(_63,"objectValue");
CGContextSetTextPosition(_5f,o.x-2,o.y+1);
CGContextShowText(_5f,i);
}
}
if(_styleFlags&AIVStyleLengthInfo){
CGContextSelectFont(_5f,objj_msgSend(CPFont,"systemFontOfSize:",12));
var _61=objj_msgSend(_5c,"subviews");
var n=objj_msgSend(_61,"count");
var _64,_67;
for(var i=0;i<n;i++){
var _63=_61[i];
if(objj_msgSend(_63,"isKindOfClass:",_60)){
_67=objj_msgSend(_63,"objectValue");
if(_64){
var _68=CGPointMake((_64.x+_67.x)/2,(_64.y+_67.y)/2);
var _69=Math.sqrt((_64.x-_67.x)*(_64.x-_67.x)+(_64.y-_67.y)*(_64.y-_67.y));
var _6a=objj_msgSend(CPString,"stringWithFormat:","%3.2f",_69);
CGContextSetTextPosition(_5f,_68.x+2,_68.y+2);
CGContextSetFillColor(_5f,objj_msgSend(CPColor,"blackColor"));
CGContextSetStrokeColor(_5f,objj_msgSend(CPColor,"blackColor"));
CGContextShowText(_5f,_6a);
CGContextSetTextPosition(_5f,_68.x+1,_68.y+1);
CGContextSetFillColor(_5f,objj_msgSend(_60,"color"));
CGContextSetStrokeColor(_5f,objj_msgSend(_60,"color"));
CGContextShowText(_5f,_6a);
}
_64=_67;
}
}
}
}
}),new objj_method(sel_getUid("autolayoutDefaultVerticalAlignment"),function(_6b,_6c){
with(_6b){
return GSAutoLayoutExpand;
}
}),new objj_method(sel_getUid("autolayoutDefaultHorizontalAlignment"),function(_6d,_6e){
with(_6d){
return GSAutoLayoutExpand;
}
}),new objj_method(sel_getUid("graphicsWithinRect:"),function(_6f,_70,_71){
with(_6f){
var _72=objj_msgSend(_6f,"subviews");
var n=objj_msgSend(_72,"count");
var _73=objj_msgSend(DotView,"class");
var ret=objj_msgSend(CPArray,"new");
for(var i=0;i<n;i++){
var _74=_72[i];
if(objj_msgSend(_74,"isKindOfClass:",_73)){
if(CPRectIntersectsRect(_71,objj_msgSend(_74,"frame"))||CPRectContainsPoint(objj_msgSend(_74,"frame"),_71.origin)){
objj_msgSend(ret,"addObject:",_74);
}
}
}
return ret;
}
}),new objj_method(sel_getUid("graphicUnderPoint:"),function(_75,_76,_77){
with(_75){
var ret=objj_msgSend(_75,"graphicsWithinRect:",CPMakeRect(_77.x,_77.y,1,1));
return ret.length?ret[0]:nil;
}
}),new objj_method(sel_getUid("deselectAllSubviews"),function(_78,_79){
with(_78){
var _7a=objj_msgSend(_78,"subviews");
var n=objj_msgSend(_7a,"count");
var _7b=objj_msgSend(DotView,"class");
for(var i=0;i<n;i++){
var _7c=_7a[i];
if(objj_msgSend(_7c,"respondsToSelector:",sel_getUid("setSelected:"))){
objj_msgSend(_7c,"setSelected:",NO);
}
}
return nil;
}
}),new objj_method(sel_getUid("selectedDots"),function(_7d,_7e){
with(_7d){
var _7f=objj_msgSend(_7d,"subviews");
var n=objj_msgSend(_7f,"count");
var ret=objj_msgSend(CPMutableArray,"new");
for(var i=0;i<n;i++){
var _80=_7f[i];
if(objj_msgSend(_80,"respondsToSelector:",sel_getUid("isSelected"))&&objj_msgSend(_80,"isSelected")){
objj_msgSend(ret,"addObject:",_80);
}
}
return ret;
}
}),new objj_method(sel_getUid("moveSelectedGraphicsWithEvent:"),function(_81,_82,_83){
with(_81){
var _84=objj_msgSend(_83,"type");
if(_84==CPLeftMouseUp){
_lastPoint=nil;
var _85=objj_msgSend(_currentGraphic,"data");
if(_85){
var p=objj_msgSend(_currentGraphic,"objectValue");
objj_msgSend(_85,"setValue:forKey:",p.y,"col");
objj_msgSend(_85,"setValue:forKey:",p.x,"row");
}
objj_msgSend(_marqueeLayer,"setNeedsDisplay");
return;
}else{
if(_84==CPLeftMouseDragged){
var _86=objj_msgSend(_81,"convertPoint:fromView:",objj_msgSend(_83,"locationInWindow"),nil);
_86.x-=_selOriginOffset.x;
_86.y-=_selOriginOffset.y;
if(!_lastPoint){
_lastPoint=_86;
}
if(!CPPointEqualToPoint(_lastPoint,_86)){
objj_msgSend(_currentGraphic,"translateByX:andY:",(_86.x-_lastPoint.x),(_86.y-_lastPoint.y));
}
_lastPoint=_86;
}
}
objj_msgSend(_marqueeLayer,"setNeedsDisplay");
objj_msgSend(CPApp,"setTarget:selector:forNextEventMatchingMask:untilDate:inMode:dequeue:",_81,sel_getUid("moveSelectedGraphicsWithEvent:"),CPLeftMouseDraggedMask|CPLeftMouseUpMask,nil,nil,YES);
}
}),new objj_method(sel_getUid("dragMarqueeWithEvent:"),function(_87,_88,_89){
with(_87){
var _8a=objj_msgSend(_89,"type");
if(_8a==CPLeftMouseUp){
_marqueeSelectionBounds=CPRectMakeZero();
objj_msgSend(_marqueeLayer,"setNeedsDisplay");
return;
}else{
if(_8a==CPLeftMouseDragged){
var _8b=objj_msgSend(_87,"convertPoint:fromView:",objj_msgSend(_89,"locationInWindow"),nil);
var x1=Math.min(_marqueeOrigin.x,_8b.x);
var y1=Math.min(_marqueeOrigin.y,_8b.y);
var x2=Math.max(_marqueeOrigin.x,_8b.x);
var y2=Math.max(_marqueeOrigin.y,_8b.y);
_marqueeSelectionBounds=CPRectMake(x1,y1,Math.abs(x1-x2),Math.abs(y1-y2));
objj_msgSend(_marqueeLayer,"setNeedsDisplay");
objj_msgSend(_87,"deselectAllSubviews");
var arr=objj_msgSend(_87,"graphicsWithinRect:",_marqueeSelectionBounds);
objj_msgSend(arr,"makeObjectsPerformSelector:",sel_getUid("selectMe"));
}
}
objj_msgSend(CPApp,"setTarget:selector:forNextEventMatchingMask:untilDate:inMode:dequeue:",_87,sel_getUid("dragMarqueeWithEvent:"),CPLeftMouseDraggedMask|CPLeftMouseUpMask,nil,nil,YES);
}
}),new objj_method(sel_getUid("mouseDown:"),function(_8c,_8d,_8e){
with(_8c){
var _8f=objj_msgSend(_8c,"convertPoint:fromView:",objj_msgSend(_8e,"locationInWindow"),nil);
var _90=objj_msgSend(DotView,"radius");
var _91=CPMakeRect(_8f.x-_90-1,_8f.y-_90-1,_90*2+1,_90*2+1);
var _92;
if(_92=objj_msgSend(_8c,"graphicUnderPoint:",_8f)){
mydotframe=objj_msgSend(_92,"frame");
_currentGraphic=_92;
if(!objj_msgSend(_8e,"modifierFlags")){
objj_msgSend(_8c,"deselectAllSubviews");
}
objj_msgSend(_currentGraphic,"setSelected:",YES);
_selOriginOffset.x=mydotframe.origin.x-_8f.x;
_selOriginOffset.y=mydotframe.origin.y-_8f.y;
objj_msgSend(_8c,"moveSelectedGraphicsWithEvent:",_8e);
}else{
if(objj_msgSend(_8e,"modifierFlags")){
if(CPRectEqualToRect(_marqueeSelectionBounds,CPRectMakeZero())){
_marqueeSelectionBounds.origin=_marqueeOrigin=_8f;
}
objj_msgSend(_8c,"dragMarqueeWithEvent:",_8e);
}else{
_92=objj_msgSend(objj_msgSend(DotView,"alloc"),"initWithFrame:",_91);
objj_msgSend(_8c,"addToModelPoint:",objj_msgSend(_92,"objectValue"));
objj_msgSend(_8c,"deselectAllSubviews");
objj_msgSend(_8c,"addDotView:",_92);
_currentGraphic=_92;
objj_msgSend(_8c,"moveSelectedGraphicsWithEvent:",_8e);
}
}
}
}),new objj_method(sel_getUid("addToModelPoint:"),function(_93,_94,_95){
with(_93){
var _96=objj_msgSend(_93,"objectValue");
var _97=objj_msgSend(CPDictionary,"new");
objj_msgSend(_97,"setObject:forKey:",_95.x,"row");
objj_msgSend(_97,"setObject:forKey:",_95.y,"col");
objj_msgSend(_96,"addObject:",_97);
}
}),new objj_method(sel_getUid("deleteDots:"),function(_98,_99,arr){
with(_98){
var _9a=objj_msgSend(_98,"objectValue");
var n=objj_msgSend(arr,"count");
for(var i=0;i<n;i++){
var dot=objj_msgSend(arr,"objectAtIndex:",i);
if(objj_msgSend(dot,"data")){
objj_msgSend(_9a,"removeObject:",objj_msgSend(dot,"data"));
}
objj_msgSend(dot,"removeFromSuperview");
}
objj_msgSend(_marqueeLayer,"setNeedsDisplay");
}
}),new objj_method(sel_getUid("delete:"),function(_9b,_9c,_9d){
with(_9b){
objj_msgSend(_9b,"deleteDots:",objj_msgSend(_9b,"selectedDots"));
}
}),new objj_method(sel_getUid("allDots"),function(_9e,_9f){
with(_9e){
var _a0=objj_msgSend(_9e,"subviews");
var n=objj_msgSend(_a0,"count");
var ret=objj_msgSend(CPMutableArray,"new");
for(var i=0;i<n;i++){
var _a1=_a0[i];
if(objj_msgSend(_a1,"respondsToSelector:",sel_getUid("isSelected"))){
objj_msgSend(ret,"addObject:",_a1);
}
}
return ret;
}
})]);
var _1=objj_allocateClassPair(GSMarkupTagView,"GSMarkupTagAnnotatedImageView"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_2,[new objj_method(sel_getUid("tagName"),function(_a2,_a3){
with(_a2){
return "annotatedImageView";
}
}),new objj_method(sel_getUid("platformObjectClass"),function(_a4,_a5){
with(_a4){
return objj_msgSend(AnnotatedImageView,"class");
}
})]);
