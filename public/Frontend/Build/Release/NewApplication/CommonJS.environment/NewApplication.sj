@STATIC;1.0;p;20;AnnotatedImageView.jt;17084;@STATIC;1.0;I;21;Foundation/CPObject.jI;25;Renaissance/Renaissance.jI;24;CoreText/CGContextText.jt;16979;
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
p;15;AppController.jt;14667;@STATIC;1.0;I;21;Foundation/CPObject.jI;25;Renaissance/Renaissance.ji;17;CompoController.ji;17;ImageController.jt;14547;
objj_executeFile("Foundation/CPObject.j",NO);
objj_executeFile("Renaissance/Renaissance.j",NO);
objj_executeFile("CompoController.j",YES);
objj_executeFile("ImageController.j",YES);
var _1="http://localhost/cellfinder_image/";
var _2=objj_getClass("CPObject");
if(!_2){
throw new SyntaxError("*** Could not find definition for class \"CPObject\"");
}
var _3=_2.isa;
class_addMethods(_2,[new objj_method(sel_getUid("_cellfinderImageFromID"),function(_4,_5){
with(_4){
var _6=_1+objj_msgSend(_4,"valueForKey:","id")+"?width=10000";
var _7=objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:",_6);
objj_msgSend(_7,"setDelegate:",_4);
return _7;
}
}),new objj_method(sel_getUid("provideImageForCollectionViewItem:"),function(_8,_9,_a){
with(_8){
var _b=Math.floor(Math.random()*100000);
var _c=_1+objj_msgSend(_8,"valueForKey:","idimage")+"?rnd="+_b;
if(objj_msgSend(_8,"respondsToSelector:",sel_getUid("entity"))){
var _d=objj_msgSend(_8,"entity");
var _e=objj_msgSend(_a,"compoID");
if(_e){
_c+=("&cmp="+parseInt(_e));
}
if(objj_msgSend(objj_msgSend(_d,"columns"),"containsObject:","idmontage")){
var _f=objj_msgSend(_8,"valueForKey:","parameter");
if(_f){
_c+=("&handover_params="+_f);
}
}
}
var _10=objj_msgSend(_a,"size");
if(!_10){
_10=10000;
}
_c+="&width="+_10;
var img=objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:",_c);
return img;
}
})]);
var _2=objj_allocateClassPair(CPCollectionViewItem,"SimpleImageViewCollectionItem"),_3=_2.isa;
class_addIvars(_2,[new objj_ivar("_img"),new objj_ivar("_imgv"),new objj_ivar("_size"),new objj_ivar("_compoID")]);
objj_registerClassPair(_2);
class_addMethods(_2,[new objj_method(sel_getUid("size"),function(_11,_12){
with(_11){
return _size;
}
}),new objj_method(sel_getUid("setSize:"),function(_13,_14,_15){
with(_13){
_size=_15;
}
}),new objj_method(sel_getUid("compoID"),function(_16,_17){
with(_16){
return _compoID;
}
}),new objj_method(sel_getUid("setCompoID:"),function(_18,_19,_1a){
with(_18){
_compoID=_1a;
}
}),new objj_method(sel_getUid("setSize:"),function(_1b,_1c,_1d){
with(_1b){
_size=_1d*_1d;
_img=objj_msgSend(_representedObject,"provideImageForCollectionViewItem:",_1b);
objj_msgSend(_img,"setDelegate:",_1b);
}
}),new objj_method(sel_getUid("setCompoID:"),function(_1e,_1f,_20){
with(_1e){
_compoID=_20;
_img=objj_msgSend(_representedObject,"provideImageForCollectionViewItem:",_1e);
objj_msgSend(_img,"setDelegate:",_1e);
}
}),new objj_method(sel_getUid("imageDidLoad:"),function(_21,_22,_23){
with(_21){
objj_msgSend(_imgv,"setImage:",_23);
var _24=objj_msgSend(_imgv,"frame");
var _25=objj_msgSend(_23,"size");
objj_msgSend(_imgv,"setFrame:",CPMakeRect(_24.origin.x,_24.origin.y,_25.width,_25.height));
}
}),new objj_method(sel_getUid("loadView"),function(_26,_27){
with(_26){
_imgv=objj_msgSend(CPImageView,"new");
objj_msgSend(_imgv,"setImageScaling:",CPScaleProportionally);
var _28=objj_msgSend(CPBox,"new");
var _29=objj_msgSend(_representedObject,"valueForKeyPath:","image.name");
objj_msgSend(_28,"setTitle:",_29);
objj_msgSend(_28,"setTitlePosition:",CPBelowBottom);
objj_msgSend(_28,"setBorderType:",CPLineBorder);
objj_msgSend(_28,"setBorderWidth:",2);
objj_msgSend(_28,"setContentView:",_imgv);
objj_msgSend(_26,"setView:",_28);
_img=objj_msgSend(_representedObject,"provideImageForCollectionViewItem:",_26);
objj_msgSend(_img,"setDelegate:",_26);
return _28;
}
}),new objj_method(sel_getUid("setRepresentedObject:"),function(_2a,_2b,_2c){
with(_2a){
objj_msgSendSuper({receiver:_2a,super_class:objj_getClass("SimpleImageViewCollectionItem").super_class},"setRepresentedObject:",_2c);
objj_msgSend(_2a,"loadView");
}
}),new objj_method(sel_getUid("setSelected:"),function(_2d,_2e,_2f){
with(_2d){
objj_msgSend(objj_msgSend(_2d,"view"),"setBorderColor:",_2f?objj_msgSend(CPColor,"yellowColor"):objj_msgSend(CPColor,"blackColor"));
}
})]);
var _2=objj_allocateClassPair(CPObject,"FlickerController"),_3=_2.isa;
class_addIvars(_2,[new objj_ivar("myAppController"),new objj_ivar("flickerSuperview"),new objj_ivar("imageView"),new objj_ivar("slider"),new objj_ivar("imageArray"),new objj_ivar("_imageIndex")]);
objj_registerClassPair(_2);
class_addMethods(_2,[new objj_method(sel_getUid("initWithImageArray:andAppController:"),function(_30,_31,_32,_33){
with(_30){
if(_30=objj_msgSend(_30,"init")){
myAppController=_33;
objj_msgSend(CPBundle,"loadRessourceNamed:owner:","flicker.gsmarkup",_30);
imageArray=_32;
objj_msgSend(slider,"setMaxValue:",objj_msgSend(imageArray,"count")-1);
objj_msgSend(_30,"setImageIndex:",0);
}
return _30;
}
}),new objj_method(sel_getUid("setImageIndex:"),function(_34,_35,_36){
with(_34){
_imageIndex=Math.floor(_36);
_imageIndex=Math.min(_imageIndex,objj_msgSend(imageArray,"count")-1);
var _37=objj_msgSend(imageArray,"objectAtIndex:",_imageIndex);
var _38=objj_msgSend(_37,"size");
var _39=objj_msgSend(imageView,"frame");
objj_msgSend(imageView,"setFrame:",CPMakeRect(_39.origin.x,_39.origin.y,_38.width,_38.height));
objj_msgSend(imageView,"setObjectValue:",_37);
}
}),new objj_method(sel_getUid("imageIndex"),function(_3a,_3b){
with(_3a){
return _imageIndex;
}
})]);
PhotoDragType="PhotoDragType";
var _2=objj_allocateClassPair(CPObject,"StacksController"),_3=_2.isa;
class_addIvars(_2,[new objj_ivar("myAppController"),new objj_ivar("stacksCollectionView"),new objj_ivar("stacksWindow"),new objj_ivar("_viewingCompo"),new objj_ivar("stacksettingswindow"),new objj_ivar("_itemSize")]);
objj_registerClassPair(_2);
class_addMethods(_2,[new objj_method(sel_getUid("initWithTrial:andAppController:"),function(_3c,_3d,_3e,_3f){
with(_3c){
if(_3c=objj_msgSend(_3c,"init")){
myAppController=_3f;
objj_msgSend(CPBundle,"loadRessourceNamed:owner:","stacks.gsmarkup",_3c);
objj_msgSend(stacksCollectionView,"registerForDraggedTypes:",[PhotoDragType]);
_itemSize=10000;
}
}
}),new objj_method(sel_getUid("setItemSize:"),function(_40,_41,_42){
with(_40){
_itemSize=_42;
objj_msgSend(objj_msgSend(stacksCollectionView,"items"),"makeObjectsPerformSelector:withObject:",sel_getUid("setSize:"),_itemSize);
objj_msgSend(stacksCollectionView,"setMinItemSize:",CPMakeSize(_itemSize,_itemSize));
}
}),new objj_method(sel_getUid("itemSize"),function(_43,_44){
with(_43){
return _itemSize;
}
}),new objj_method(sel_getUid("newStack:"),function(_45,_46,_47){
with(_45){
objj_msgSend(myAppController.stacksController,"addObject:",objj_msgSend(CPDictionary,"dictionaryWithObject:forKey:","NewStack","name"));
objj_msgSend(_45,"runSetting:",_45);
}
}),new objj_method(sel_getUid("deleteStack:"),function(_48,_49,_4a){
with(_48){
objj_msgSend(myAppController.stacksController,"delete:",_48);
}
}),new objj_method(sel_getUid("runSettings:"),function(_4b,_4c,_4d){
with(_4b){
objj_msgSend(CPApp,"beginSheet:modalForWindow:modalDelegate:didEndSelector:contextInfo:",stacksettingswindow,stacksWindow,_4b,sel_getUid("didEndSheet:returnCode:contextInfo:"),nil);
}
}),new objj_method(sel_getUid("setViewingCompo:"),function(_4e,_4f,_50){
with(_4e){
_viewingCompo=_50;
objj_msgSend(objj_msgSend(stacksCollectionView,"items"),"makeObjectsPerformSelector:withObject:",sel_getUid("setCompoID:"),_viewingCompo);
}
}),new objj_method(sel_getUid("viewingCompo"),function(_51,_52){
with(_51){
return _viewingCompo;
}
}),new objj_method(sel_getUid("runFlicker:"),function(_53,_54,_55){
with(_53){
var _56=objj_msgSend(stacksCollectionView,"selectionIndexes");
var _57=objj_msgSend(_56,"count")?objj_msgSend(objj_msgSend(stacksCollectionView,"items"),"objectsAtIndexes:",_56):objj_msgSend(stacksCollectionView,"items");
var _58=objj_msgSend(CPMutableArray,"new");
var i,n=objj_msgSend(_57,"count");
for(i=0;i<n;i++){
var o=objj_msgSend(_57,"objectAtIndex:",i);
objj_msgSend(_58,"addObject:",o._img);
}
objj_msgSend(objj_msgSend(FlickerController,"alloc"),"initWithImageArray:andAppController:",_58,myAppController);
}
}),new objj_method(sel_getUid("applyMerge:"),function(_59,_5a,_5b){
with(_59){
}
}),new objj_method(sel_getUid("performBurnIn:"),function(_5c,_5d,_5e){
with(_5c){
}
}),new objj_method(sel_getUid("performDragOperation:"),function(_5f,_60,_61){
with(_5f){
var _62=objj_msgSend(objj_msgSend(_61,"draggingPasteboard"),"dataForType:",PhotoDragType);
var o=objj_msgSend(CPKeyedUnarchiver,"unarchiveObjectWithData:",_62);
objj_msgSend(myAppController.stacksContentController,"addObject:",objj_msgSend(CPDictionary,"dictionaryWithObjects:forKeys:",[objj_msgSend(o,"objectForKey:","idimage")],["idimage"]));
}
}),new objj_method(sel_getUid("closeSheet:"),function(_63,_64,_65){
with(_63){
objj_msgSend(CPApp,"endSheet:returnCode:",stacksettingswindow,objj_msgSend(_65,"tag"));
}
}),new objj_method(sel_getUid("didEndSheet:returnCode:contextInfo:"),function(_66,_67,_68,_69,_6a){
with(_66){
}
})]);
var _2=objj_allocateClassPair(CPObject,"AppController"),_3=_2.isa;
class_addIvars(_2,[new objj_ivar("store"),new objj_ivar("trialsController"),new objj_ivar("trialsWindow"),new objj_ivar("stacksController"),new objj_ivar("stacksContentController"),new objj_ivar("folderContentController"),new objj_ivar("folderCollectionView"),new objj_ivar("_itemSize"),new objj_ivar("_viewingCompoID"),new objj_ivar("analysesController"),new objj_ivar("resultsController"),new objj_ivar("filterPredicate"),new objj_ivar("_imageControllers"),new objj_ivar("trialsettingswindow"),new objj_ivar("displayfilters_ac"),new objj_ivar("uploadfilters_ac"),new objj_ivar("fixupfilters_ac"),new objj_ivar("overlayfilters_ac"),new objj_ivar("analyticsfilters_ac"),new objj_ivar("perlfilters_ac"),new objj_ivar("javascriptfilters_ac")]);
objj_registerClassPair(_2);
class_addMethods(_2,[new objj_method(sel_getUid("store"),function(_6b,_6c){
with(_6b){
return store;
}
}),new objj_method(sel_getUid("setStore:"),function(_6d,_6e,_6f){
with(_6d){
store=_6f;
}
}),new objj_method(sel_getUid("viewingCompoID"),function(_70,_71){
with(_70){
return _viewingCompoID;
}
}),new objj_method(sel_getUid("setViewingCompoID:"),function(_72,_73,_74){
with(_72){
_viewingCompoID=_74;
}
}),new objj_method(sel_getUid("setViewingCompoID:"),function(_75,_76,_77){
with(_75){
_viewingCompoID=_77;
objj_msgSend(objj_msgSend(folderCollectionView,"items"),"makeObjectsPerformSelector:withObject:",sel_getUid("setCompoID:"),_viewingCompoID);
}
}),new objj_method(sel_getUid("setItemSize:"),function(_78,_79,_7a){
with(_78){
_itemSize=_7a;
objj_msgSend(objj_msgSend(folderCollectionView,"items"),"makeObjectsPerformSelector:withObject:",sel_getUid("setSize:"),_itemSize);
objj_msgSend(folderCollectionView,"setMinItemSize:",CPMakeSize(_itemSize,_itemSize));
}
}),new objj_method(sel_getUid("itemSize"),function(_7b,_7c){
with(_7b){
return _itemSize;
}
}),new objj_method(sel_getUid("baseImageURL"),function(_7d,_7e){
with(_7d){
return _1;
}
}),new objj_method(sel_getUid("imageControllersForIDTrial:"),function(_7f,_80,_81){
with(_7f){
var all=objj_msgSend(_imageControllers,"allObjects");
var i,l=all.length;
var ret=objj_msgSend(CPMutableArray,"new");
for(i=0;i<l;i++){
if(objj_msgSend(all[i],"idtrial")==_81){
objj_msgSend(ret,"addObject:",all[i]);
}
}
return ret;
}
}),new objj_method(sel_getUid("applicationDidFinishLaunching:"),function(_82,_83,_84){
with(_82){
store=objj_msgSend(objj_msgSend(FSStore,"alloc"),"initWithBaseURL:","http://127.0.0.1:3000");
_itemSize=100;
objj_msgSend(CPBundle,"loadRessourceNamed:owner:","gui.gsmarkup",_82);
}
}),new objj_method(sel_getUid("configureIC:forTrial:"),function(_85,_86,_87,_88){
with(_85){
var _89=objj_msgSend(CPURLRequest,"requestWithURL:",_1+"0?cmp="+objj_msgSend(_88,"valueForKey:","composition_for_javascript"));
var _8a=objj_msgSend(objj_msgSend(CPURLConnection,"sendSynchronousRequest:returningResponse:",_89,nil),"rawString");
var arr=JSON.parse(_8a);
var i,l=arr.length;
for(i=0;i<l;i++){
var m=arr[i];
if(objj_msgSend(m,"characterAtIndex:",0)=="<"){
next;
}
var sel=CPSelectorFromString(m);
if(sel){
objj_msgSend(_87,"performSelector:",sel);
}
}
}
}),new objj_method(sel_getUid("loadImage:"),function(_8b,_8c,_8d){
with(_8b){
var o=objj_msgSend(objj_msgSend(folderContentController,"arrangedObjects"),"objectAtIndex:",objj_msgSend(_8d,"selectedRow"));
if(o){
if(!_imageControllers){
_imageControllers=objj_msgSend(CPMutableSet,"new");
}
var ic=objj_msgSend(objj_msgSend(ImageController,"alloc"),"initWithImageID:appController:",objj_msgSend(o,"valueForKey:","idimage"),_8b);
objj_msgSend(_8b,"configureIC:forTrial:",ic,objj_msgSend(trialsController,"selectedObject"));
objj_msgSend(_imageControllers,"addObject:",ic);
}
}
}),new objj_method(sel_getUid("loadAnalysis:"),function(_8e,_8f,_90){
with(_8e){
var o=objj_msgSend(objj_msgSend(analysesController,"arrangedObjects"),"objectAtIndex:",objj_msgSend(_90,"selectedRow"));
if(o){
objj_msgSend(objj_msgSend(AnalysesController,"alloc"),"initWithAnalysis:andAppController:",o,_8e);
}
}
}),new objj_method(sel_getUid("runStacks:"),function(_91,_92,_93){
with(_91){
var o=objj_msgSend(trialsController,"valueForKeyPath:","selection");
if(o){
objj_msgSend(objj_msgSend(StacksController,"alloc"),"initWithTrial:andAppController:",o,_91);
}
}
}),new objj_method(sel_getUid("delete:"),function(_94,_95,_96){
with(_94){
objj_msgSend(objj_msgSend(objj_msgSend(CPApp,"keyWindow"),"delegate"),"delete:",_96);
}
}),new objj_method(sel_getUid("collectionView:didDoubleClickOnItemAtIndex:"),function(_97,_98,_99,_9a){
with(_97){
var o=objj_msgSend(objj_msgSend(_99,"itemAtIndex:",_9a),"representedObject");
var ic=objj_msgSend(objj_msgSend(ImageController,"alloc"),"initWithImageID:appController:",objj_msgSend(o,"valueForKey:","idimage"),_97);
objj_msgSend(_imageControllers,"addObject:",ic);
}
}),new objj_method(sel_getUid("collectionView:dragTypesForItemsAtIndexes:"),function(_9b,_9c,_9d,_9e){
with(_9b){
return [PhotoDragType];
}
}),new objj_method(sel_getUid("collectionView:dataForItemsAtIndexes:forType:"),function(_9f,_a0,_a1,_a2,_a3){
with(_9f){
var _a4=objj_msgSend(_a2,"firstIndex");
return objj_msgSend(CPKeyedArchiver,"archivedDataWithRootObject:",objj_msgSend(objj_msgSend(_a1,"itemAtIndex:",_a4),"representedObject"));
}
}),new objj_method(sel_getUid("closeSheet:"),function(_a5,_a6,_a7){
with(_a5){
objj_msgSend(CPApp,"endSheet:returnCode:",trialsettingswindow,objj_msgSend(_a7,"tag"));
}
}),new objj_method(sel_getUid("didEndSheet:returnCode:contextInfo:"),function(_a8,_a9,_aa,_ab,_ac){
with(_a8){
}
}),new objj_method(sel_getUid("runSettings:"),function(_ad,_ae,_af){
with(_ad){
objj_msgSend(CPApp,"beginSheet:modalForWindow:modalDelegate:didEndSelector:contextInfo:",trialsettingswindow,trialsWindow,_ad,sel_getUid("didEndSheet:returnCode:contextInfo:"),nil);
}
})]);
p;17;CompoController.jt;10197;@STATIC;1.0;I;21;Foundation/CPObject.jI;25;Renaissance/Renaissance.jt;10121;
objj_executeFile("Foundation/CPObject.j",NO);
objj_executeFile("Renaissance/Renaissance.j",NO);
var _1=objj_getClass("FSObject");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"FSObject\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("unpercentedValueForKey:"),function(_3,_4,_5){
with(_3){
var r=objj_msgSend(_3,"valueForKey:",_5);
return objj_msgSend(r,"stringByReplacingOccurrencesOfString:withString:","%","");
}
})]);
var _1=objj_allocateClassPair(CPFormatter,"ReversePercentageFormatter"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("stringForObjectValue:"),function(_6,_7,_8){
with(_6){
return objj_msgSend(_8,"stringByReplacingOccurrencesOfString:withString:","%","");
}
}),new objj_method(sel_getUid("objectValueForString:error:"),function(_9,_a,_b,_c){
with(_9){
if(!objj_msgSend(_b,"isKindOfClass:",objj_msgSend(CPString,"class"))){
_b=objj_msgSend(_b,"stringValue");
}
return objj_msgSend(_b,"stringByAppendingString:","%");
}
})]);
var _1=objj_allocateClassPair(CPSlider,"OptionSlider"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("mouseDown:"),function(_d,_e,_f){
with(_d){
if(objj_msgSend(_f,"modifierFlags")){
objj_msgSend(_d,"setContinuous:",YES);
}else{
objj_msgSend(_d,"setContinuous:",NO);
}
objj_msgSendSuper({receiver:_d,super_class:objj_getClass("OptionSlider").super_class},"mouseDown:",_f);
}
})]);
var _1=objj_allocateClassPair(CPControl,"DualPercentageSlider"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("slider1"),new objj_ivar("slider2")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("setFrame:"),function(_10,_11,_12){
with(_10){
objj_msgSendSuper({receiver:_10,super_class:objj_getClass("DualPercentageSlider").super_class},"setFrame:",_12);
objj_msgSend(slider1,"setFrame:",CPMakeRect(0,0,_12.size.width,32));
objj_msgSend(slider2,"setFrame:",CPMakeRect(0,32,_12.size.width,32));
}
}),new objj_method(sel_getUid("_newSlider"),function(_13,_14){
with(_13){
var _15=objj_msgSend(objj_msgSend(OptionSlider,"alloc"),"initWithFrame:",CPRectMakeZero());
objj_msgSend(_15,"setMinValue:",0);
objj_msgSend(_15,"setMaxValue:",100);
objj_msgSend(_15,"setTarget:",_13);
objj_msgSend(_15,"setAction:",sel_getUid("_sliderChanged:"));
objj_msgSend(_15,"setContinuous:",NO);
objj_msgSend(_13,"addSubview:",_15);
return _15;
}
}),new objj_method(sel_getUid("_sliderChanged:"),function(_16,_17,_18){
with(_16){
objj_msgSend(_16,"_reverseSetBinding");
}
}),new objj_method(sel_getUid("initWithFrame:"),function(_19,_1a,_1b){
with(_19){
if(_19=objj_msgSendSuper({receiver:_19,super_class:objj_getClass("DualPercentageSlider").super_class},"initWithFrame:",_1b)){
slider1=objj_msgSend(_19,"_newSlider");
slider2=objj_msgSend(_19,"_newSlider");
}
return _19;
}
}),new objj_method(sel_getUid("setObjectValue:"),function(_1c,_1d,_1e){
with(_1c){
objj_msgSendSuper({receiver:_1c,super_class:objj_getClass("DualPercentageSlider").super_class},"setObjectValue:",_1e);
var re=new RegExp("^([0-9]+)%s*x([0-9]+)%");
var _1f=_1e.match(re);
objj_msgSend(slider1,"setIntValue:",_1f[1]);
objj_msgSend(slider2,"setIntValue:",_1f[2]);
}
}),new objj_method(sel_getUid("objectValue"),function(_20,_21){
with(_20){
return objj_msgSend(CPString,"stringWithFormat:","%sx%s",objj_msgSend(slider1,"intValue")+"%",objj_msgSend(slider2,"intValue")+"%");
}
}),new objj_method(sel_getUid("autolayoutDefaultHorizontalAlignment"),function(_22,_23){
with(_22){
return GSAutoLayoutExpand;
}
})]);
var _1=objj_allocateClassPair(GSMarkupTagSlider,"GSMarkupTagOptionSlider"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_2,[new objj_method(sel_getUid("tagName"),function(_24,_25){
with(_24){
return "optionSlider";
}
}),new objj_method(sel_getUid("platformObjectClass"),function(_26,_27){
with(_26){
return objj_msgSend(OptionSlider,"class");
}
})]);
var _1=objj_allocateClassPair(GSMarkupTagControl,"GSMarkupTagDualSlider"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initPlatformObject:"),function(_28,_29,_2a){
with(_28){
_2a=objj_msgSendSuper({receiver:_28,super_class:objj_getClass("GSMarkupTagDualSlider").super_class},"initPlatformObject:",_2a);
objj_msgSend(_attributes,"setObject:forKey:","64","height");
objj_msgSend(_attributes,"setObject:forKey:","83","width");
return _2a;
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("tagName"),function(_2b,_2c){
with(_2b){
return "dualSlider";
}
}),new objj_method(sel_getUid("platformObjectClass"),function(_2d,_2e){
with(_2d){
return objj_msgSend(DualPercentageSlider,"class");
}
})]);
var _1=objj_allocateClassPair(CPObject,"CompoController"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_panel"),new objj_ivar("_myAppController"),new objj_ivar("_myNameTable")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("observeValueForKeyPath:ofObject:change:context:"),function(_2f,_30,_31,_32,_33,_34){
with(_2f){
var _35=objj_msgSend(_myAppController,"imageControllersForIDTrial:",_34);
objj_msgSend(_35,"makeObjectsPerformSelector:withObject:",sel_getUid("reload:"),_2f);
}
}),new objj_method(sel_getUid("initWithCompo:andAppController:"),function(_36,_37,_38,_39){
with(_36){
_myAppController=_39;
var _3a=objj_msgSend(_myAppController,"store");
var _3b=objj_msgSend(objj_msgSend(FSEntity,"alloc"),"initWithName:andStore:","parameter_lists",_3a);
objj_msgSend(_3b,"setColumns:",objj_msgSend(CPArray,"arrayWithObjects:","id","idpatch_parameter","value"));
objj_msgSend(_3b,"setPk:","id");
var _3c=objj_msgSend(_38,"valueForKey:","inputParams");
_myNameTable=objj_msgSend(CPMutableDictionary,"new");
var i,l=objj_msgSend(_3c,"count");
var _3d="<gsmarkup><objects><window id=\"panel\" title=\"Inspector\" HUD=\"yes\" closable=\"yes\" x=\"600\" y=\"30\" width=\"200\">";
_3d+="<vbox id=\"toplevel_container\">";
for(i=0;i<l;i++){
var _3e=objj_msgSend(_3c,"objectAtIndex:",i);
switch(objj_msgSend(_3e,"valueForKey:","type")){
case "1":
var _3f="";
if(objj_msgSend(objj_msgSend(_3e,"valueForKey:","range2"),"hasSuffix:","%")){
objj_msgSend(_3e,"setFormatter:forColumnName:",objj_msgSend(ReversePercentageFormatter,"new"),"value");
}
var _40=objj_msgSend(_3e,"unpercentedValueForKey:","range1");
var _41=objj_msgSend(_3e,"unpercentedValueForKey:","range2");
var _42=objj_msgSend(_3e,"unpercentedValueForKey:","value");
_3d+="<hbox><label textColor=\"white\" valign=\"center\" halign=\"min\" width=\"100\">"+objj_msgSend(_3e,"valueForKey:","patch")+"("+objj_msgSend(_3e,"valueForKey:","name")+")"+"</label><label textColor=\"white\" valign=\"center\" halign=\"min\" width=\"20\">"+objj_msgSend(_3e,"valueForKey:","range1")+"</label>"+"<optionSlider continuous=\"NO\" id=\"_connectme1_"+i+"\" valign=\"center\" halign=\"expand\"  min=\""+_40+"\" max=\""+_41+"\" current=\""+_42+"\" /><label textColor=\"white\" valign=\"center\" halign=\"min\" width=\"20\">"+objj_msgSend(_3e,"valueForKey:","range2")+"</label><textField width=\"50\" valign=\"center\" halign=\"center\" id=\"_connectme2_"+i+"\"></textField></hbox>";
break;
case "5":
var _43="_popconnectme"+objj_msgSend(_3e,"valueForKey:","idparameter");
_3d+="<hbox><label textColor=\"white\" valign=\"center\" halign=\"min\" width=\"100\">"+objj_msgSend(_3e,"valueForKey:","patch")+"("+objj_msgSend(_3e,"valueForKey:","name")+")"+"</label><popUpButton id=\"_popupcntme_"+i+"\" valign=\"center\" halign=\"expand\" itemsBinding=\"#CPOwner._myNameTable."+_43+".arrangedObjects.value\" "+"valueBinding=\"#CPOwner._myNameTable."+_43+".selection.id\"/></hbox>";
var ac=objj_msgSend(FSArrayController,"new");
var _44=objj_msgSend(CPPredicate,"predicateWithFormat:argumentArray:","idpatch_parameter=='"+objj_msgSend(_3e,"valueForKey:","idparameter")+"'",nil);
objj_msgSend(ac,"setContent:",objj_msgSend(objj_msgSend(_3b,"allObjects"),"filteredArrayUsingPredicate:",_44));
objj_msgSend(_myNameTable,"setObject:forKey:",ac,_43);
objj_msgSend(ac,"setEntity:",_3b);
break;
default:
var _42=objj_msgSend(_3e,"valueForKey:","value");
var re=new RegExp("^([0-9%]+)s*x([0-9%]+)");
var _45=_42.match(re);
if(_45){
_3d+="<hbox><label textColor=\"white\" valign=\"center\" halign=\"min\" width=\"100\">"+objj_msgSend(_3e,"valueForKey:","patch")+"("+objj_msgSend(_3e,"valueForKey:","name")+")"+"</label><dualSlider id=\"_connectme1_"+i+"\"/><textField width=\"50\" valign=\"center\" halign=\"expand\" id=\"_connectme2_"+i+"\"></textField></hbox>";
}else{
_3d+="<hbox><label textColor=\"white\" valign=\"center\" halign=\"min\" width=\"100\">"+objj_msgSend(_3e,"valueForKey:","patch")+"("+objj_msgSend(_3e,"valueForKey:","name")+")"+"</label> <textField width=\"50\" valign=\"center\" halign=\"expand\" id=\"_connectme2_"+i+"\"></textField></hbox>";
}
}
}
_3d+="</vbox></window></objects><connectors>"+"<outlet source=\"#CPOwner\" target =\"panel\" label =\"_panel\"/></connectors></gsmarkup>";
var _46=objj_msgSend(CPBundle,"loadGSMarkupData:externalNameTable:localizableStringsTable:inBundle:tagMapping:",objj_msgSend(CPData,"dataWithRawString:",_3d),objj_msgSend(CPDictionary,"dictionaryWithObject:forKey:",_36,"CPOwner"),nil,nil,nil);
var _47=objj_msgSend(objj_msgSend(_46,"nameTable"),"allValues");
var i,l=objj_msgSend(_47,"count");
for(i=0;i<l;i++){
var _3e=objj_msgSend(_47,"objectAtIndex:",i);
var _48;
if(_48=objj_msgSend(objj_msgSend(_3e,"attributes"),"objectForKey:","id")){
var po=objj_msgSend(_3e,"platformObject");
var cip;
if(objj_msgSend(_48,"hasPrefix:","_connectme")){
var idx=parseInt(objj_msgSend(_48,"substringFromIndex:",12));
cip=objj_msgSend(_3c,"objectAtIndex:",idx);
objj_msgSend(po,"bind:toObject:withKeyPath:options:",CPValueBinding,cip,"value",nil);
}else{
if(objj_msgSend(_48,"hasPrefix:","_popupcntme")){
var idx=parseInt(objj_msgSend(_48,"substringFromIndex:",12));
cip=objj_msgSend(_3c,"objectAtIndex:",idx);
objj_msgSend(po,"bind:toObject:withKeyPath:options:","integerValue",cip,"value",nil);
}
}
if(cip){
objj_msgSend(cip,"addObserver:forKeyPath:options:context:",_36,"value",CPKeyValueObservingOptionNew,objj_msgSend(_38,"valueForKeyPath:","trial.id"));
}
}
}
}
})]);
p;17;ImageController.jt;6831;@STATIC;1.0;I;21;Foundation/CPObject.jI;25;Renaissance/Renaissance.ji;20;AnnotatedImageView.jt;6731;
objj_executeFile("Foundation/CPObject.j",NO);
objj_executeFile("Renaissance/Renaissance.j",NO);
objj_executeFile("AnnotatedImageView.j",YES);
var _1=objj_allocateClassPair(CPObject,"ImageController"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("imageSuperview"),new objj_ivar("rawImageSuperview"),new objj_ivar("annotatedImageView"),new objj_ivar("myAppController"),new objj_ivar("compoPopup"),new objj_ivar("_analysesController"),new objj_ivar("_scale"),new objj_ivar("_originalSize"),new objj_ivar("_compoID"),new objj_ivar("_imageID"),new objj_ivar("_progress"),new objj_ivar("_mywindow"),new objj_ivar("_rawImage"),new objj_ivar("_cookedImage"),new objj_ivar("_analyzedImage"),new objj_ivar("_idtrial"),new objj_ivar("_updateContinuously"),new objj_ivar("_isLoadingImage")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("scale"),function(_3,_4){
with(_3){
return _scale;
}
}),new objj_method(sel_getUid("setScale:"),function(_5,_6,_7){
with(_5){
_scale=_7;
}
}),new objj_method(sel_getUid("compoID"),function(_8,_9){
with(_8){
return _compoID;
}
}),new objj_method(sel_getUid("setCompoID:"),function(_a,_b,_c){
with(_a){
_compoID=_c;
}
}),new objj_method(sel_getUid("idtrial"),function(_d,_e){
with(_d){
return _idtrial;
}
}),new objj_method(sel_getUid("setIdtrial:"),function(_f,_10,_11){
with(_f){
_idtrial=_11;
}
}),new objj_method(sel_getUid("updateContinuously"),function(_12,_13){
with(_12){
return _updateContinuously;
}
}),new objj_method(sel_getUid("setUpdateContinuously:"),function(_14,_15,_16){
with(_14){
_updateContinuously=_16;
}
}),new objj_method(sel_getUid("isLoadingImage"),function(_17,_18){
with(_17){
return _isLoadingImage;
}
}),new objj_method(sel_getUid("setIsLoadingImage:"),function(_19,_1a,_1b){
with(_19){
_isLoadingImage=_1b;
}
}),new objj_method(sel_getUid("getImagePixelCount"),function(_1c,_1d){
with(_1c){
return Math.floor(_originalSize.width*_scale*_originalSize.height*_scale);
}
}),new objj_method(sel_getUid("_backgroundImage"),function(_1e,_1f){
with(_1e){
var _20=objj_msgSend(_analysesController,"valueForKeyPath:","selection.idcomposition_for_editing");
var _21=objj_msgSend(_analysesController,"valueForKeyPath:","selection.idimage");
var _22=objj_msgSend(myAppController,"baseImageURL")+_21+"?cmp="+_20;
if(_originalSize){
_22+="&width="+objj_msgSend(_1e,"getImagePixelCount");
}
var img=objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:",_22);
return img;
}
}),new objj_method(sel_getUid("imageDidLoad:"),function(_23,_24,_25){
with(_23){
var _26=objj_msgSend(_25,"size");
var _27=objj_msgSend(objj_msgSend(CPImageView,"alloc"),"initWithFrame:",CPMakeRect(0,0,_26.width,_26.height));
if(!_originalSize&&_scale==1){
_originalSize=CPSizeCreateCopy(_26);
}
objj_msgSend(_27,"setImage:",_25);
if(_25==_cookedImage){
objj_msgSend(imageSuperview,"setDocumentView:",_27);
}else{
if(_25==_rawImage){
objj_msgSend(rawImageSuperview,"setDocumentView:",_27);
}else{
if(_25==_analyzedImage){
}
}
}
_isLoadingImage=NO;
objj_msgSend(_progress,"stopAnimation:",_23);
}
}),new objj_method(sel_getUid("_setImageID:"),function(_28,_29,_2a){
with(_28){
_imageID=_2a;
var rnd=Math.floor(Math.random()*100000);
var _2b=objj_msgSend(myAppController,"baseImageURL")+_2a+"?rnd="+rnd;
if(_originalSize){
_2b+="&width="+objj_msgSend(_28,"getImagePixelCount");
}
_isLoadingImage=YES;
objj_msgSend(_progress,"startAnimation:",_28);
if(_compoID){
_cookedImage=objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:",_2b+"&cmp="+_compoID+"&cc=1");
objj_msgSend(_cookedImage,"setDelegate:",_28);
}
_rawImage=objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:",_2b);
objj_msgSend(_rawImage,"setDelegate:",_28);
_analyzedImage=objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:",_2b);
objj_msgSend(_analyzedImage,"setDelegate:",_28);
objj_msgSend(annotatedImageView,"bind:toObject:withKeyPath:options:","backgroundImage",_28,"_backgroundImage",nil);
objj_msgSend(annotatedImageView,"bind:toObject:withKeyPath:options:","scale",_28,"_scale",nil);
}
}),new objj_method(sel_getUid("initWithImageID:appController:"),function(_2c,_2d,_2e,_2f){
with(_2c){
_2c=objj_msgSendSuper({receiver:_2c,super_class:objj_getClass("ImageController").super_class},"init");
_scale=1;
myAppController=_2f;
_analysesController=objj_msgSend(FSArrayController,"new");
objj_msgSend(_analysesController,"setEntity:",objj_msgSend(myAppController.analysesController,"entity"));
objj_msgSend(_analysesController,"setContent:",objj_msgSend(myAppController.folderContentController,"valueForKeyPath:","selection.image.analyses"));
objj_msgSend(CPBundle,"loadRessourceNamed:owner:","image.gsmarkup",_2c);
_compoID=objj_msgSend(objj_msgSend(compoPopup,"selectedItem"),"tag");
objj_msgSend(_2c,"_setImageID:",_2e);
_idtrial=parseInt(objj_msgSend(myAppController.trialsController,"valueForKeyPath:","selection.id"));
objj_msgSend(_mywindow,"setTitle:","Image "+_2e);
return _2c;
}
}),new objj_method(sel_getUid("setScale:"),function(_30,_31,_32){
with(_30){
_scale=_32;
if(!_originalSize){
return;
}
objj_msgSend(_30,"_setImageID:",_imageID);
}
}),new objj_method(sel_getUid("compoChanged:"),function(_33,_34,_35){
with(_33){
_compoID=objj_msgSend(objj_msgSend(_35,"selectedItem"),"tag");
objj_msgSend(_33,"_setImageID:",_imageID);
}
}),new objj_method(sel_getUid("reload:"),function(_36,_37,_38){
with(_36){
if(!objj_msgSend(_36,"isLoadingImage")){
objj_msgSend(_36,"_setImageID:",_imageID);
}
}
}),new objj_method(sel_getUid("editCompo:"),function(_39,_3a,_3b){
with(_39){
var _3c=objj_msgSend(objj_msgSend(compoPopup,"selectedItem"),"tag");
var o=objj_msgSend(objj_msgSend(myAppController.displayfilters_ac,"entity"),"objectWithPK:",_3c);
if(o){
objj_msgSend(objj_msgSend(CompoController,"alloc"),"initWithCompo:andAppController:",o,myAppController);
}
}
}),new objj_method(sel_getUid("delete:"),function(_3d,_3e,_3f){
with(_3d){
objj_msgSend(annotatedImageView,"delete:",_3f);
}
})]);
var _1=objj_getClass("ImageController");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"ImageController\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("setNumberingPoints"),function(_40,_41){
with(_40){
objj_msgSend(annotatedImageView,"setStyleFlags:",objj_msgSend(annotatedImageView,"styleFlags")|AIVStyleNumbers);
}
}),new objj_method(sel_getUid("setDrawingLines"),function(_42,_43){
with(_42){
objj_msgSend(annotatedImageView,"setStyleFlags:",objj_msgSend(annotatedImageView,"styleFlags")|AIVStylePolygon);
}
}),new objj_method(sel_getUid("setDrawingAngle"),function(_44,_45){
with(_44){
objj_msgSend(annotatedImageView,"setStyleFlags:",objj_msgSend(annotatedImageView,"styleFlags")|AIVStyleAngleInfo);
}
})]);
p;6;main.jt;267;@STATIC;1.0;I;23;Foundation/Foundation.jI;15;AppKit/AppKit.ji;15;AppController.jt;181;
objj_executeFile("Foundation/Foundation.j",NO);
objj_executeFile("AppKit/AppKit.j",NO);
objj_executeFile("AppController.j",YES);
main=function(_1,_2){
CPApplicationMain(_1,_2);
};
p;87;Frameworks/CommonJS/cappuccino/lib/capp/Resources/Templates/Application/AppController.jt;956;@STATIC;1.0;I;21;Foundation/CPObject.jt;912;
objj_executeFile("Foundation/CPObject.j",NO);
var _1=objj_allocateClassPair(CPObject,"AppController"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("applicationDidFinishLaunching:"),function(_3,_4,_5){
with(_3){
var _6=objj_msgSend(objj_msgSend(CPWindow,"alloc"),"initWithContentRect:styleMask:",CGRectMakeZero(),CPBorderlessBridgeWindowMask),_7=objj_msgSend(_6,"contentView");
var _8=objj_msgSend(objj_msgSend(CPTextField,"alloc"),"initWithFrame:",CGRectMakeZero());
objj_msgSend(_8,"setStringValue:","Hello World!");
objj_msgSend(_8,"setFont:",objj_msgSend(CPFont,"boldSystemFontOfSize:",24));
objj_msgSend(_8,"sizeToFit");
objj_msgSend(_8,"setAutoresizingMask:",CPViewMinXMargin|CPViewMaxXMargin|CPViewMinYMargin|CPViewMaxYMargin);
objj_msgSend(_8,"setCenter:",objj_msgSend(_7,"center"));
objj_msgSend(_7,"addSubview:",_8);
objj_msgSend(_6,"orderFront:",_3);
}
})]);
p;78;Frameworks/CommonJS/cappuccino/lib/capp/Resources/Templates/Application/main.jt;267;@STATIC;1.0;I;23;Foundation/Foundation.jI;15;AppKit/AppKit.ji;15;AppController.jt;181;
objj_executeFile("Foundation/Foundation.j",NO);
objj_executeFile("AppKit/AppKit.j",NO);
objj_executeFile("AppController.j",YES);
main=function(_1,_2){
CPApplicationMain(_1,_2);
};
p;81;Frameworks/CommonJS/cappuccino/lib/capp/Resources/Templates/Framework/Framework.jt;119;@STATIC;1.0;i;35;__project.nameasidentifier__Class.jt;62;
objj_executeFile("__project.nameasidentifier__Class.j",YES);
p;86;Frameworks/CommonJS/cappuccino/lib/capp/Resources/Templates/Framework/FrameworkClass.jt;418;@STATIC;1.0;I;21;Foundation/CPObject.jt;374;
objj_executeFile("Foundation/CPObject.j",NO);
var _1=objj_allocateClassPair(Nil,"__project"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_2,[new objj_method(sel_getUid("version"),function(_3,_4){
with(_3){
var _5=objj_msgSend(CPBundle,"bundleForClass:",objj_msgSend(_3,"class"));
return objj_msgSend(_5,"objectForInfoDictionaryKey:","CPBundleVersion");
}
})]);
p;90;Frameworks/CommonJS/cappuccino/lib/capp/Resources/Templates/NibApplication/AppController.jt;484;@STATIC;1.0;I;21;Foundation/CPObject.jt;440;
objj_executeFile("Foundation/CPObject.j",NO);
var _1=objj_allocateClassPair(CPObject,"AppController"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("theWindow")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("applicationDidFinishLaunching:"),function(_3,_4,_5){
with(_3){
}
}),new objj_method(sel_getUid("awakeFromCib"),function(_6,_7){
with(_6){
objj_msgSend(theWindow,"setFullPlatformWindow:",YES);
}
})]);
p;81;Frameworks/CommonJS/cappuccino/lib/capp/Resources/Templates/NibApplication/main.jt;267;@STATIC;1.0;I;23;Foundation/Foundation.jI;15;AppKit/AppKit.ji;15;AppController.jt;181;
objj_executeFile("Foundation/Foundation.j",NO);
objj_executeFile("AppKit/AppKit.j",NO);
objj_executeFile("AppController.j",YES);
main=function(_1,_2){
CPApplicationMain(_1,_2);
};
p;82;Frameworks/CommonJS/cappuccino/lib/capp/Resources/Templates/ThemeDescriptor/main.jt;341;@STATIC;1.0;I;23;Foundation/Foundation.jI;15;AppKit/AppKit.jI;19;BlendKit/BlendKit.ji;18;ThemeDescriptors.jt;228;
objj_executeFile("Foundation/Foundation.j",NO);
objj_executeFile("AppKit/AppKit.j",NO);
objj_executeFile("BlendKit/BlendKit.j",NO);
objj_executeFile("ThemeDescriptors.j",YES);
main=function(_1,_2){
CPApplicationMain(_1,_2);
};
p;94;Frameworks/CommonJS/cappuccino/lib/capp/Resources/Templates/ThemeDescriptor/ThemeDescriptors.jt;980;@STATIC;1.0;I;28;BlendKit/BKThemeDescriptor.jt;929;
objj_executeFile("BlendKit/BKThemeDescriptor.j",NO);
var _1=objj_allocateClassPair(Nil,"__project"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_2,[new objj_method(sel_getUid("themeName"),function(_3,_4){
with(_3){
return "__project.name__";
}
}),new objj_method(sel_getUid("themedButton"),function(_5,_6){
with(_5){
var _7=objj_msgSend(objj_msgSend(CPButton,"alloc"),"initWithFrame:",CGRectMake(0,0,100,20));
objj_msgSend(_7,"setValue:forThemeAttribute:",objj_msgSend(CPColor,"blueColor"),"bezel-color");
objj_msgSend(_7,"setValue:forThemeAttribute:inState:",objj_msgSend(CPColor,"greenColor"),"bezel-color",CPThemeStateHighlighted);
objj_msgSend(_7,"setValue:forThemeAttribute:",objj_msgSend(CPColor,"redColor"),"text-color");
objj_msgSend(_7,"setValue:forThemeAttribute:inState:",objj_msgSend(CPColor,"yellowColor"),"text-color",CPThemeStateHighlighted);
objj_msgSend(_7,"setTitle:","Yikes!");
return _7;
}
})]);
p;66;Frameworks/CommonJS/cappuccino/lib/cappuccino/cib-analysis-tools.jt;1626;@STATIC;1.0;I;23;Foundation/Foundation.jI;15;AppKit/AppKit.jt;1559;
objj_executeFile("Foundation/Foundation.j",NO);
objj_executeFile("AppKit/AppKit.j",NO);
findCibClassDependencies=function(_1){
var _2=objj_msgSend(objj_msgSend(CPCib,"alloc"),"initWithContentsOfURL:",_1),_3={},_4=CPClassFromString;
CPClassFromString=function(_5){
var _6=_4(_5);
_3[_5]=true;
return _6;
};
objj_msgSend(CPApplication,"sharedApplication");
try{
var x=objj_msgSend(_2,"pressInstantiate");
}
catch(e){
CPLog.warn("Exception thrown when instantiating "+_1+": "+e);
}
finally{
CPClassFromString=_4;
}
return Object.keys(_3);
};
var _7=objj_getClass("CPCib");
if(!_7){
throw new SyntaxError("*** Could not find definition for class \"CPCib\"");
}
var _8=_7.isa;
class_addMethods(_7,[new objj_method(sel_getUid("pressInstantiate"),function(_9,_a){
with(_9){
var _b=_bundle,_c=nil;
if(!_b&&_c){
_b=objj_msgSend(CPBundle,"bundleForClass:",objj_msgSend(_c,"class"));
}
var _d=objj_msgSend(objj_msgSend(_CPCibKeyedUnarchiver,"alloc"),"initForReadingWithData:bundle:awakenCustomResources:",_data,_b,_awakenCustomResources),_e=nil;
if(_e){
var _f=nil,_10=objj_msgSend(_e,"keyEnumerator");
while((_f=objj_msgSend(_10,"nextObject"))!==nil){
objj_msgSend(_d,"setClass:forClassName:",objj_msgSend(_e,"objectForKey:",_f),_f);
}
}
objj_msgSend(_d,"setExternalObjectsForProxyIdentifiers:",nil);
var _11=objj_msgSend(_d,"decodeObjectForKey:","CPCibObjectDataKey");
if(!_11||!objj_msgSend(_11,"isKindOfClass:",objj_msgSend(_CPCibObjectData,"class"))){
return NO;
}
var _12=nil;
objj_msgSend(_11,"instantiateWithOwner:topLevelObjects:",_c,_12);
return YES;
}
})]);
p;56;Frameworks/CommonJS/cappuccino/lib/cappuccino/fontinfo.jt;199;@STATIC;1.0;t;181;
var OS=require("os");
exports.fontinfo=function(_1,_2){
var p=OS.popen(["fontinfo","-n",_1,_2||12]);
if(p.wait()===0){
return JSON.parse(p.stdout.read());
}else{
return null;
}
};
p;67;Frameworks/CommonJS/cappuccino/lib/cappuccino/objj-analysis-tools.jt;8187;@STATIC;1.0;t;8168;
var _1=require("file");
var _2=require("objective-j");
var _3=require("interpreter").Context;
ObjectiveJRuntimeAnalyzer=function(_4){
this.rootPath=_4;
this.rootURL=new CFURL(String(_4));
this.context=new _3();
this.scope=setupObjectiveJ(this.context);
this.require=this.context.global.require;
this.mainBundleURL=new this.context.global.CFURL("file:"+this.rootPath);
var _5=this.require("objective-j");
_5.Executable.prototype.path=function(){
var _6=this.URL();
return _6?_6.absoluteURL().path():null;
};
_5.FileDependency.prototype.path=function(){
var _7=this.URL();
return _7?_7.path():null;
};
this.context.global.CFBundle.prototype.executablePath=function(){
var _8=this.executableURL();
return _8?_8.absoluteURL().path():null;
};
this.require("cappuccino/objj-flatten-additions");
if(!this.context.global.CFHTTPRequest._lookupCachedRequest){
print("Warning: CFHTTPRequest._lookupCachedRequest. Need to import objj-flatten-additions module.");
}
var _9=this.requestedURLs={};
var _a=this.context.global.CFHTTPRequest._lookupCachedRequest;
this.context.global.CFHTTPRequest._lookupCachedRequest=function(_b){
var _c=new CFURL(_b,this.rootURL).absoluteURL().path();
_9[_c]=true;
return _a.apply(null,arguments);
};
};
ObjectiveJRuntimeAnalyzer.prototype.setIncludePaths=function(_d){
this.context.global.OBJJ_INCLUDE_PATHS=_d;
};
ObjectiveJRuntimeAnalyzer.prototype.setEnvironments=function(_e){
this.context.global.CFBundle.environments=function(){
return _e;
};
};
ObjectiveJRuntimeAnalyzer.prototype.makeAbsoluteURL=function(_f){
if(_f instanceof this.context.global.CFURL&&_f.scheme()){
return _f;
}
return new this.context.global.CFURL(_f,this.mainBundleURL);
};
ObjectiveJRuntimeAnalyzer.prototype.initializeGlobalRecorder=function(){
this.initializeGlobalRecorder=function(){
};
this.ignore=cloneProperties(this.scope,true);
this.files={};
var _10=[];
var _11=null;
var _12=null;
var _13=this;
recordAndReset=function(){
var _14=cloneProperties(_13.scope);
if(_11&&_12){
_13.files[_12]=_13.files[_12]||{};
_13.files[_12].globals=_13.files[_12].globals||{};
diff({before:_11,after:_14,ignore:_13.ignore,added:_13.files[_12].globals,changed:_13.files[_12].globals});
}else{
if(!_12){
}
}
_11=_14;
};
var _15=this.require("objective-j");
var _16=_15.Executable.fileExecuterForURL;
_15.Executable.fileExecuterForURL=function(_17){
_17=_13.makeAbsoluteURL(_17);
var _18=_17.absoluteURL().path();
var _19=_16.apply(this,arguments);
return function(_1a,_1b,_1c){
var _1d=typeof _1a==="string"?_1a:_1a.absoluteURL().path();
recordAndReset();
_10.push(_12);
if(_1b&&!_1.isAbsolute(_1d)){
_12=_1.normal(_1.join(_18,_1d));
}else{
_12=_1d;
}
system.stderr.write(">").flush();
_19.apply(this,arguments);
system.stderr.write("<").flush();
recordAndReset();
_12=_10.pop();
};
};
};
ObjectiveJRuntimeAnalyzer.prototype.load=function(_1e){
this.require("objective-j").objj_eval("("+(function(_1f){
objj_importFile(_1f,true,function(){
print("Done importing and evaluating: "+_1f);
});
})+")")(_1e);
};
ObjectiveJRuntimeAnalyzer.prototype.finishLoading=function(_20){
this.require("browser/timeout").serviceTimeouts();
};
ObjectiveJRuntimeAnalyzer.prototype.mapGlobalsToFiles=function(){
this.mergeLibraryImports();
var _21={};
for(var _22 in this.files){
for(var _23 in this.files[_22].globals){
(_21[_23]=_21[_23]||[]).push(_22);
}
}
return _21;
};
ObjectiveJRuntimeAnalyzer.prototype.mapFilesToGlobals=function(){
this.mergeLibraryImports();
var _24={};
for(var _25 in this.files){
_24[_25]={};
for(var _26 in this.files[_25].globals){
_24[_25][_26]=true;
}
}
return _24;
};
ObjectiveJRuntimeAnalyzer.prototype.mergeLibraryImports=function(){
for(var _27 in this.files){
if(_1.isRelative(_27)){
var _28=this.executableForImport(_27,false).path();
CPLog.debug("Merging "+_27+" => "+_28);
this.files[_28]=this.files[_28]||{};
this.files[_28].globals=this.files[_28].globals||{};
for(var _29 in this.files[_27].globals){
this.files[_28].globals[_29]=true;
}
delete this.files[_27];
}
}
};
ObjectiveJRuntimeAnalyzer.prototype.executableForImport=function(_2a,_2b){
if(_2b===undefined){
_2b=true;
}
var _2c=this.require("objective-j"),_2d=nil,URL=new this.context.global.CFURL(_2a);
_2c.Executable.fileExecutableSearcherForURL(URL)(URL,_2b,function(_2e){
_2d=_2e;
});
return _2d;
};
ObjectiveJRuntimeAnalyzer.prototype.traverseDependencies=function(_2f,_30){
_30=_30||{};
_30.processedFiles=_30.processedFiles||{};
_30.importedFiles=_30.importedFiles||{};
_30.referencedFiles=_30.referencedFiles||{};
_30.ignoredImports=_30.ignoredImports||{};
var _31=_2f.path();
if(_30.processedFiles[_31]){
return;
}
_30.processedFiles[_31]=true;
var _32=false;
if(_30.ignoreAllImports){
_32=true;
}else{
if(_30.ignoreFrameworkImports){
var _33=_31.match(new RegExp("([^\\/]+)\\/([^\\/]+)\\.j$"));
if(_33&&_33[1]===_33[2]){
_32=true;
}
}
}
var _34={},_35={};
if(_30.progressCallback){
_30.progressCallback(this.rootPath.relative(_31),_31);
}
var _36=_2f.code();
var _37=uniqueTokens(_36);
markFilesReferencedByTokens(_37,this.mapGlobalsToFiles(),_34);
delete _34[_31];
if(_32){
if(_30.ignoreImportsCallback){
_30.ignoreImportsCallback(this.rootPath.relative(_31),_31);
}
_30.ignoredImports[_31]=true;
}else{
_2f.fileDependencies().forEach(function(_38){
var _39=null;
if(_38.isLocal()){
_39=this.executableForImport(_1.normal(_1.join(_1.dirname(_31),_38.path())),true);
}else{
_39=this.executableForImport(_38.path(),false);
}
if(_39){
var _3a=_39.path();
if(_3a!==_31){
_35[_3a]=true;
}else{
CPLog.error("Ignoring self import (why are you importing yourself?!): "+this.rootPath.relative(_3a));
}
}else{
CPLog.error("Couldn't find file for import "+_38.path()+" ("+_38.isLocal()+")");
}
},this);
}
this.checkImported(_30,_31,_35);
_30.importedFiles[_31]=_35;
this.checkReferenced(_30,_31,_34);
_30.referencedFiles[_31]=_34;
return _30;
};
ObjectiveJRuntimeAnalyzer.prototype.checkImported=function(_3b,_3c,_3d){
for(var _3e in _3d){
if(_3e!==_3c){
if(_3b.importCallback){
_3b.importCallback(_3c,_3e);
}
var _3f=this.executableForImport(_3e,true);
if(_3f){
this.traverseDependencies(_3f,_3b);
}else{
CPLog.error("Missing imported file: "+_3e);
}
}
}
};
ObjectiveJRuntimeAnalyzer.prototype.checkReferenced=function(_40,_41,_42){
for(var _43 in _42){
if(_43!==_41){
if(_40.referenceCallback){
_40.referenceCallback(_41,_43,_42[_43]);
}
var _44=this.executableForImport(_43,true);
if(_44){
this.traverseDependencies(_44,_40);
}else{
CPLog.error("Missing referenced file: "+_43);
}
}
}
};
ObjectiveJRuntimeAnalyzer.prototype.fileExecutables=function(){
var _45=this.require("objective-j");
return _45.FileExecutablesForPaths;
};
uniqueTokens=function(_46){
var _47=new _2.Lexer(_46,null);
var _48,_49={};
while(_48=_47.skip_whitespace()){
_49[_48]=true;
}
return Object.keys(_49);
};
markFilesReferencedByTokens=function(_4a,_4b,_4c){
_4a.forEach(function(_4d){
if(_4b.hasOwnProperty(_4d)){
var _4e=_4b[_4d];
for(var i=0;i<_4e.length;i++){
_4c[_4e[i]]=_4c[_4e[i]]||{};
_4c[_4e[i]][_4d]=true;
}
}
});
};
setupObjectiveJ=function(_4f){
_4f.global.NARWHAL_HOME=system.prefix;
_4f.global.NARWHAL_ENGINE_HOME=_1.join(system.prefix,"engines","rhino");
var _50=_1.join(_4f.global.NARWHAL_ENGINE_HOME,"bootstrap.js");
_4f.evalFile(_50);
_4f.global.require("browser");
var _51=_4f.global.require("objective-j");
addMockBrowserEnvironment(_51.window);
return _51.window;
};
addMockBrowserEnvironment=function(_52){
if(!_52.window){
_52.window=_52;
}
if(!_52.location){
_52.location={};
}
if(!_52.location.href){
_52.location.href="";
}
if(!_52.Element){
_52.Element=function(){
this.style={};
};
}
if(!_52.document){
_52.document={createElement:function(){
return new _52.Element();
}};
}
};
cloneProperties=function(_53,_54){
var _55={};
for(var _56 in _53){
_55[_56]=_54?true:_53[_56];
}
return _55;
};
diff=function(o){
for(var i in o.after){
if(o.added&&!o.ignore[i]&&typeof o.before[i]=="undefined"){
o.added[i]=true;
}
}
for(var i in o.after){
if(o.changed&&!o.ignore[i]&&typeof o.before[i]!="undefined"&&typeof o.after[i]!="undefined"&&o.before[i]!==o.after[i]){
o.changed[i]=true;
}
}
for(var i in o.before){
if(o.deleted&&!o.ignore[i]&&typeof o.after[i]=="undefined"){
o.deleted[i]=true;
}
}
};
p;62;Frameworks/CommonJS/cappuccino/lib/cappuccino/jake/blendtask.jt;5564;@STATIC;1.0;I;23;Foundation/Foundation.jI;15;AppKit/AppKit.jI;19;BlendKit/BlendKit.jt;5473;
objj_executeFile("Foundation/Foundation.j",NO);
objj_executeFile("AppKit/AppKit.j",NO);
objj_executeFile("BlendKit/BlendKit.j",NO);
var _1=require("file"),_2=require("narwhal/term"),_3=require("jake").task,_4=require("jake").filedir,_5=require("objective-j/jake/bundletask").BundleTask;
BlendTask=function(_6){
_5.apply(this,arguments);
this._themeDescriptors=[];
this._keyedThemes=[];
};
BlendTask.__proto__=_5;
BlendTask.prototype.__proto__=_5.prototype;
BlendTask.prototype.packageType=function(){
return "BLND";
};
BlendTask.prototype.infoPlist=function(){
var _7=_5.prototype.infoPlist.apply(this,arguments);
_7.setValueForKey("CPKeyedThemes",require("narwhal/util").unique(this._keyedThemes));
return _7;
};
BlendTask.prototype.themeDescriptors=function(){
return this._themeDescriptors;
};
BlendTask.prototype.setThemeDescriptors=function(_8){
this._themeDescriptors=_8;
};
BlendTask.prototype.defineTasks=function(){
this.defineThemeDescriptorTasks();
_5.prototype.defineTasks.apply(this,arguments);
};
BlendTask.prototype.defineSourceTasks=function(){
};
BlendTask.prototype.defineThemeDescriptorTasks=function(){
this.environments().forEach(function(_9){
var _a=_9.name()+".environment",_b=this.themeDescriptors(),_c=this.resourcesPath(),_d=_1.join(this.buildIntermediatesProductPath(),_a,"Resources"),_e=this.buildProductStaticPathForEnvironment(_9),_f=this._keyedThemes,_10=this.name()+":themes";
this.enhance(_10);
_b.forEach(function(_11){
objj_importFile(_1.absolute(_11),YES);
});
objj_msgSend(BKThemeDescriptor,"allThemeDescriptorClasses").forEach(function(_12){
var _13=_1.join(_d,objj_msgSend(_12,"themeName")+".keyedtheme");
_4(_13,_10);
_4(_e,[_13]);
_f.push(objj_msgSend(_12,"themeName")+".keyedtheme");
});
_3(_10,function(){
objj_msgSend(BKThemeDescriptor,"allThemeDescriptorClasses").forEach(function(_14){
var _15=objj_msgSend(objj_msgSend(BKThemeTemplate,"alloc"),"init");
objj_msgSend(_15,"setValue:forKey:",objj_msgSend(_14,"themeName"),"name");
var _16=objj_msgSend(_14,"themedObjectTemplates"),_17=cibDataFromTopLevelObjects(_16.concat([_15])),_18=themeFromCibData(_17);
_1.mkdirs(_d);
_1.write(_1.join(_d,objj_msgSend(_14,"themeName")+".keyedtheme"),"t;"+_18.length+";"+_18,{charset:"UTF-8"});
});
});
},this);
};
cibDataFromTopLevelObjects=function(_19){
var _1a=objj_msgSend(CPData,"data"),_1b=objj_msgSend(objj_msgSend(CPKeyedArchiver,"alloc"),"initForWritingWithMutableData:",_1a),_1c=objj_msgSend(objj_msgSend(_CPCibObjectData,"alloc"),"init");
_1c._fileOwner=objj_msgSend(_CPCibCustomObject,"new");
_1c._fileOwner._className="CPObject";
var _1d=0,_1e=_19.length;
for(;_1d<_1e;++_1d){
_1c._objectsValues[_1d]=_1c._fileOwner;
_1c._objectsKeys[_1d]=_19[_1d];
}
objj_msgSend(_1b,"encodeObject:forKey:",_1c,"CPCibObjectDataKey");
objj_msgSend(_1b,"finishEncoding");
return _1a;
};
themeFromCibData=function(_1f){
var cib=objj_msgSend(objj_msgSend(CPCib,"alloc"),"initWithData:",_1f),_20=[];
objj_msgSend(cib,"_setAwakenCustomResources:",NO);
objj_msgSend(cib,"instantiateCibWithExternalNameTable:",objj_msgSend(CPDictionary,"dictionaryWithObject:forKey:",_20,CPCibTopLevelObjects));
var _21=_20.length,_22=nil,_23=[];
while(_21--){
var _24=_20[_21];
_23=_23.concat(objj_msgSend(_24,"blendThemeObjectTemplates"));
if(objj_msgSend(_24,"isKindOfClass:",objj_msgSend(BKThemeTemplate,"class"))){
_22=objj_msgSend(objj_msgSend(CPTheme,"alloc"),"initWithName:",objj_msgSend(_24,"valueForKey:","name"));
}
}
_2.stream.print("Building \x00green("+objj_msgSend(_22,"name")+"\x00) theme");
objj_msgSend(_23,"makeObjectsPerformSelector:withObject:",sel_getUid("blendAddThemedObjectAttributesToTheme:"),_22);
return objj_msgSend(objj_msgSend(CPKeyedArchiver,"archivedDataWithRootObject:",_22),"rawString");
};
var _25=objj_getClass("CPCib");
if(!_25){
throw new SyntaxError("*** Could not find definition for class \"CPCib\"");
}
var _26=_25.isa;
class_addMethods(_25,[new objj_method(sel_getUid("initWithData:"),function(_27,_28,_29){
with(_27){
_27=objj_msgSendSuper({receiver:_27,super_class:objj_getClass("CPCib").super_class},"init");
if(_27){
_data=_29;
}
return _27;
}
})]);
var _25=objj_getClass("CPObject");
if(!_25){
throw new SyntaxError("*** Could not find definition for class \"CPObject\"");
}
var _26=_25.isa;
class_addMethods(_25,[new objj_method(sel_getUid("blendThemeObjectTemplates"),function(_2a,_2b){
with(_2a){
var _2c=objj_msgSend(_2a,"class");
if(objj_msgSend(_2c,"isKindOfClass:",objj_msgSend(BKThemedObjectTemplate,"class"))){
return [_2a];
}
if(objj_msgSend(_2c,"isKindOfClass:",objj_msgSend(CPView,"class"))){
var _2d=[],_2e=objj_msgSend(_2a,"subviews"),_2f=objj_msgSend(_2e,"count");
while(_2f--){
_2d=_2d.concat(objj_msgSend(_2e[_2f],"blendThemeObjectTemplates"));
}
return _2d;
}
return [];
}
})]);
var _25=objj_getClass("BKThemedObjectTemplate");
if(!_25){
throw new SyntaxError("*** Could not find definition for class \"BKThemedObjectTemplate\"");
}
var _26=_25.isa;
class_addMethods(_25,[new objj_method(sel_getUid("blendAddThemedObjectAttributesToTheme:"),function(_30,_31,_32){
with(_30){
var _33=objj_msgSend(_30,"valueForKey:","themedObject");
if(!_33){
var _34=objj_msgSend(_30,"subviews");
if(objj_msgSend(_34,"count")>0){
_33=_34[0];
}
}
if(_33){
_2.stream.print(" Recording themed properties for \x00purple("+objj_msgSend(_33,"className")+"\x00).");
objj_msgSend(_32,"takeThemeFromObject:",_33);
}
}
})]);
exports.BlendTask=BlendTask;
exports.blend=function(_35,_36){
return BlendTask.defineTask(_35,_36);
};
p;80;Frameworks/CommonJS/cappuccino/support/XcodeCapp.app/Contents/Resources/parser.jt;9294;@STATIC;1.0;I;23;Foundation/Foundation.jt;9247;
objj_executeFile("Foundation/Foundation.j",NO);
var _1=require("file");
main=function(_2){
var _3=new CFURL(_2[1]),_4=new CFURL(_2[2]),_5=_1.read(_3,{charset:"UTF-8"}),_6=ObjectiveJ.Preprocessor.Flags.IncludeDebugSymbols|ObjectiveJ.Preprocessor.Flags.IncludeTypeSignatures,_7={};
_5=ObjectiveJ.preprocess(_5,_3,_6).code();
_5=_5.replace(/objj_allocateClassPair\([a-zA-Z_$](\w|$)*/g,function(_8){
var _9=_8.substr("objj_allocateClassPair(".length);
return "objj_allocateClassPair(\""+_9+"\", CPObject";
});
var _a=objj_allocateClassPair;
objj_allocateClassPair=function(_b){
_7[arguments[2]]=_b;
return _a(arguments[1],arguments[2]);
};
var _c=[],_d=objj_registerClassPair;
objj_registerClassPair=function(_e){
_e.actual_super_class;
_d(_e);
_c.push(_e);
};
objj_executeFile=function(){
};
eval(_5);
var _f="";
_c.forEach(function(_10){
var _11=[];
class_copyIvarList(_10).forEach(function(_12){
var _13=ivar_getTypeEncoding(_12).split(" ");
if(_13.indexOf("IBOutlet")!==CPNotFound||_13.indexOf("@outlet")!==CPNotFound){
_13.forEach(function(_14,_15){
if(_14==="@outlet"){
_13[_15]="IBOutlet";
}else{
if(_14!=="IBOutlet"){
_13[_15]=NSCompatibleClassName(_14,YES);
}
}
});
_11.push("    "+_13.join(" ")+" "+ivar_getName(_12)+";");
}
});
var _16=[];
class_copyMethodList(_10).forEach(function(_17){
var _18=_17.types,_19=_18[0];
if(_19==="IBAction"||_19==="@action"){
_16.push("- (IBAction)"+method_getName(_17)+"("+NSCompatibleClassName(_18[1]||"id",YES)+")aSender;");
}
});
var _1a=class_getName(_10),_1b=_7[_1a];
_f+="\n@interface "+class_getName(_10)+(_1b==="Nil"?"":(" : "+NSCompatibleClassName(_1b)))+"\n{\n"+_11.join("\n")+"\n}\n"+_16.join("\n")+"\n@end";
});
if(_f.length){
_1.write(_4,_f,{charset:"UTF-8"});
}
};
NSCompatibleClassName=function(_1c,_1d){
if(_1c==="var"||_1c==="id"){
return "id";
}
var _1e=_1c.substr(0,2),_1f=_1d?"*":"";
if(_1e!=="CP"){
return _1c+_1f;
}
var _20="NS"+_1c.substr(2);
if(_21[_20]){
return _20+_1f;
}
return _1c+_1f;
};
var _21={"NSAffineTransform":YES,"NSAppleEventDescriptor":YES,"NSAppleEventManager":YES,"NSAppleScript":YES,"NSArchiver":YES,"NSArray":YES,"NSAssertionHandler":YES,"NSAttributedString":YES,"NSAutoreleasePool":YES,"NSBlockOperation":YES,"NSBundle":YES,"NSCache":YES,"NSCachedURLResponse":YES,"NSCalendar":YES,"NSCharacterSet":YES,"NSClassDescription":YES,"NSCloneCommand":YES,"NSCloseCommand":YES,"NSCoder":YES,"NSComparisonPredicate":YES,"NSCompoundPredicate":YES,"NSCondition":YES,"NSConditionLock":YES,"NSConnection":YES,"NSCountCommand":YES,"NSCountedSet":YES,"NSCreateCommand":YES,"NSData":YES,"NSDate":YES,"NSDateComponents":YES,"NSDateFormatter":YES,"NSDecimalNumber":YES,"NSDecimalNumberHandler":YES,"NSDeleteCommand":YES,"NSDeserializer":YES,"NSDictionary":YES,"NSDirectoryEnumerator":YES,"NSDistantObject":YES,"NSDistantObjectRequest":YES,"NSDistributedLock":YES,"NSDistributedNotificationCenter":YES,"NSEnumerator":YES,"NSError":YES,"NSException":YES,"NSExistsCommand":YES,"NSExpression":YES,"NSFileHandle":YES,"NSFileManager":YES,"NSFileWrapper":YES,"NSFormatter":YES,"NSGarbageCollector":YES,"NSGetCommand":YES,"NSHashTable":YES,"NSHost":YES,"NSHTTPCookie":YES,"NSHTTPCookieStorage":YES,"NSHTTPURLResponse":YES,"NSIndexPath":YES,"NSIndexSet":YES,"NSIndexSpecifier":YES,"NSInputStream":YES,"NSInvocation":YES,"NSInvocationOperation":YES,"NSKeyedArchiver":YES,"NSKeyedUnarchiver":YES,"NSLocale":YES,"NSLock":YES,"NSLogicalTest":YES,"NSMachBootstrapServer":YES,"NSMachPort":YES,"NSMapTable":YES,"NSMessagePort":YES,"NSMessagePortNameServer":YES,"NSMetadataItem":YES,"NSMetadataQuery":YES,"NSMetadataQueryAttributeValueTuple":YES,"NSMetadataQueryResultGroup":YES,"NSMethodSignature":YES,"NSMiddleSpecifier":YES,"NSMoveCommand":YES,"NSMutableArray":YES,"NSMutableAttributedString":YES,"NSMutableCharacterSet":YES,"NSMutableData":YES,"NSMutableDictionary":YES,"NSMutableIndexSet":YES,"NSMutableSet":YES,"NSMutableString":YES,"NSMutableURLRequest":YES,"NSNameSpecifier":YES,"NSNetService":YES,"NSNetServiceBrowser":YES,"NSNotification":YES,"NSNotificationCenter":YES,"NSNotificationQueue":YES,"NSNull":YES,"NSNumber":YES,"NSNumberFormatter":YES,"NSObject":YES,"NSOperation":YES,"NSOperationQueue":YES,"NSOrthography":YES,"NSOutputStream":YES,"NSPipe":YES,"NSPointerArray":YES,"NSPointerFunctions":YES,"NSPort":YES,"NSPortCoder":YES,"NSPortMessage":YES,"NSPortNameServer":YES,"NSPositionalSpecifier":YES,"NSPredicate":YES,"NSProcessInfo":YES,"NSPropertyListSerialization":YES,"NSPropertySpecifier":YES,"NSProtocolChecker":YES,"NSProxy":YES,"NSPurgeableData":YES,"NSQuitCommand":YES,"NSRandomSpecifier":YES,"NSRangeSpecifier":YES,"NSRecursiveLock":YES,"NSRelativeSpecifier":YES,"NSRunLoop":YES,"NSScanner":YES,"NSScriptClassDescription":YES,"NSScriptCoercionHandler":YES,"NSScriptCommand":YES,"NSScriptCommandDescription":YES,"NSScriptExecutionContext":YES,"NSScriptObjectSpecifier":YES,"NSScriptSuiteRegistry":YES,"NSScriptWhoseTest":YES,"NSSerializer":YES,"NSSet":YES,"NSSetCommand":YES,"NSSocketPort":YES,"NSSocketPortNameServer":YES,"NSSortDescriptor":YES,"NSSpecifierTest":YES,"NSSpellServer":YES,"NSStream":YES,"NSString":YES,"NSTask":YES,"NSTextCheckingResult":YES,"NSThread":YES,"NSTimer":YES,"NSTimeZone":YES,"NSUnarchiver":YES,"NSUndoManager":YES,"NSUniqueIDSpecifier":YES,"NSURL":YES,"NSURLAuthenticationChallenge":YES,"NSURLCache":YES,"NSURLConnection":YES,"NSURLCredential":YES,"NSURLCredentialStorage":YES,"NSURLDownload":YES,"NSURLHandle":YES,"NSURLProtectionSpace":YES,"NSURLProtocol":YES,"NSURLRequest":YES,"NSURLResponse":YES,"NSUserDefaults":YES,"NSValue":YES,"NSValueTransformer":YES,"NSWhoseSpecifier":YES,"NSXMLDocument":YES,"NSXMLDTD":YES,"NSXMLDTDNode":YES,"NSXMLElement":YES,"NSXMLNode":YES,"NSXMLParser":YES,"NSActionCell":YES,"NSAffineTransform Additions":YES,"NSAlert":YES,"NSAnimation":YES,"NSAnimationContext":YES,"NSAppleScript Additions":YES,"NSApplication":YES,"NSArrayController":YES,"NSATSTypesetter":YES,"NSAttributedString Application Kit Additions":YES,"NSBezierPath":YES,"NSBitmapImageRep":YES,"NSBox":YES,"NSBrowser":YES,"NSBrowserCell":YES,"NSBundle Additions":YES,"NSButton":YES,"NSButtonCell":YES,"NSCachedImageRep":YES,"NSCell":YES,"NSCIImageRep":YES,"NSClipView":YES,"NSCoder Application Kit Additions":YES,"NSCollectionView":YES,"NSCollectionViewItem":YES,"NSColor":YES,"NSColorList":YES,"NSColorPanel":YES,"NSColorPicker":YES,"NSColorSpace":YES,"NSColorWell":YES,"NSComboBox":YES,"NSComboBoxCell":YES,"NSControl":YES,"NSController":YES,"NSCursor":YES,"NSCustomImageRep":YES,"NSDatePicker":YES,"NSDatePickerCell":YES,"NSDictionaryController":YES,"NSDockTile":YES,"NSDocument":YES,"NSDocumentController":YES,"NSDrawer":YES,"NSEPSImageRep":YES,"NSEvent":YES,"NSFileWrapper":YES,"NSFont":YES,"NSFontDescriptor":YES,"NSFontManager":YES,"NSFontPanel":YES,"NSForm":YES,"NSFormCell":YES,"NSGlyphGenerator":YES,"NSGlyphInfo":YES,"NSGradient":YES,"NSGraphicsContext":YES,"NSHelpManager":YES,"NSImage":YES,"NSImageCell":YES,"NSImageRep":YES,"NSImageView":YES,"NSLayoutManager":YES,"NSLevelIndicator":YES,"NSLevelIndicatorCell":YES,"NSMatrix":YES,"NSMenu":YES,"NSMenuItem":YES,"NSMenuItemCell":YES,"NSMenuView":YES,"NSMutableAttributedString Additions":YES,"NSMutableParagraphStyle":YES,"NSNib":YES,"NSNibConnector":YES,"NSNibControlConnector":YES,"NSNibOutletConnector":YES,"NSObjectController":YES,"NSOpenGLContext":YES,"NSOpenGLLayer":YES,"NSOpenGLPixelBuffer":YES,"NSOpenGLPixelFormat":YES,"NSOpenGLView":YES,"NSOpenPanel":YES,"NSOutlineView":YES,"NSPageLayout":YES,"NSPanel":YES,"NSParagraphStyle":YES,"NSPasteboard":YES,"NSPasteboardItem":YES,"NSPathCell":YES,"NSPathComponentCell":YES,"NSPathControl":YES,"NSPDFImageRep":YES,"NSPersistentDocument":YES,"NSPICTImageRep":YES,"NSPopUpButton":YES,"NSPopUpButtonCell":YES,"NSPredicateEditor":YES,"NSPredicateEditorRowTemplate":YES,"NSPrinter":YES,"NSPrintInfo":YES,"NSPrintOperation":YES,"NSPrintPanel":YES,"NSProgressIndicator":YES,"NSResponder":YES,"NSRuleEditor":YES,"NSRulerMarker":YES,"NSRulerView":YES,"NSRunningApplication":YES,"NSSavePanel":YES,"NSScreen":YES,"NSScroller":YES,"NSScrollView":YES,"NSSearchField":YES,"NSSearchFieldCell":YES,"NSSecureTextField":YES,"NSSecureTextFieldCell":YES,"NSSegmentedCell":YES,"NSSegmentedControl":YES,"NSShadow":YES,"NSSlider":YES,"NSSliderCell":YES,"NSSound":YES,"NSSpeechRecognizer":YES,"NSSpeechSynthesizer":YES,"NSSpellChecker":YES,"NSSplitView":YES,"NSStatusBar":YES,"NSStatusItem":YES,"NSStepper":YES,"NSStepperCell":YES,"NSString Application Kit Additions":YES,"NSTableColumn":YES,"NSTableHeaderCell":YES,"NSTableHeaderView":YES,"NSTableView":YES,"NSTabView":YES,"NSTabViewItem":YES,"NSText":YES,"NSTextAttachment":YES,"NSTextAttachmentCell":YES,"NSTextBlock":YES,"NSTextContainer":YES,"NSTextField":YES,"NSTextFieldCell":YES,"NSTextInputContext":YES,"NSTextList":YES,"NSTextStorage":YES,"NSTextTab":YES,"NSTextTable":YES,"NSTextTableBlock":YES,"NSTextView":YES,"NSTokenField":YES,"NSTokenFieldCell":YES,"NSToolbar":YES,"NSToolbarItem":YES,"NSToolbarItemGroup":YES,"NSTouch":YES,"NSTrackingArea":YES,"NSTreeController":YES,"NSTreeNode":YES,"NSTypesetter":YES,"NSURL Additions":YES,"NSUserDefaultsController":YES,"NSView":YES,"NSViewAnimation":YES,"NSViewController":YES,"NSWindow":YES,"NSWindowController":YES,"NSWorkspace":YES,"NSPopover":YES};
p;35;Frameworks/CoreText/CGContextText.jt;1255;@STATIC;1.0;t;1236;
kCGTextFill=0;
kCGTextStroke=1;
kCGTextFillStroke=2;
kCGTextInvisible=3;
CGContextGetTextMatrix=function(_1){
return _1._textMatrix;
};
CGContextSetTextMatrix=function(_2,_3){
_2._textMatrix=_3;
};
CGContextGetTextPosition=function(_4){
return _4._textPosition||_CGPointMakeZero();
};
CGContextSetTextPosition=function(_5,x,y){
_5._textPosition=CGPointMake(x,y);
};
CGContextGetFont=function(_6){
return _6._CPFont;
};
CGContextSelectFont=function(_7,_8){
_7.font=objj_msgSend(_8,"cssString");
_7._CPFont=_8;
};
CGContextSetTextDrawingMode=function(_9,_a){
_9._textDrawingMode=_a;
};
CGContextShowText=function(_b,_c){
CGContextShowTextAtPoint(_b,_b._textPosition.x,_b._textPosition.y,_c);
};
CGContextShowTextAtPoint=function(_d,x,y,_e){
_d.textBaseline="middle";
_d.textAlign="left";
var _f=_d._textDrawingMode;
if(!_f&&_f!==0){
_f=kCGTextFill;
}
var _10=_d.measureText(_e).width;
if(_f===kCGTextFill||_f===kCGTextFillStroke){
_d.fillText(_e,x,y);
}
if(_f===kCGTextStroke||_f===kCGTextFillStroke){
_d.strokeText(_e,x,y);
}
_d._textPosition=CGPointMake(x+_10,y);
};
CGContextSetFillColor=function(_11,_12){
_11.fillStyle=objj_msgSend(_12,"cssString");
_11._CPColor=_12;
};
CGContextGetFillColor=function(_13){
return _13._CPColor;
};
p;30;Frameworks/CoreText/CoreText.jt;338;@STATIC;1.0;i;15;CTFramesetter.ji;9;CTFrame.ji;14;CTTypesetter.ji;8;CTLine.ji;7;CTRun.ji;15;CGContextText.jt;225;
objj_executeFile("CTFramesetter.j",YES);
objj_executeFile("CTFrame.j",YES);
objj_executeFile("CTTypesetter.j",YES);
objj_executeFile("CTLine.j",YES);
objj_executeFile("CTRun.j",YES);
objj_executeFile("CGContextText.j",YES);
p;29;Frameworks/CoreText/CTFrame.jt;2747;@STATIC;1.0;i;8;CTLine.jt;2716;
objj_executeFile("CTLine.j",YES);
kCTFrameProgressionTopToBottom=0;
kCTFrameProgressionRightToLeft=1;
kCTFrameProgressionAttributeName="kCTFrameProgressionAttributeName";
_CTFrameCreate=function(_1,_2,_3,_4){
return {path:_1,attributes:_2,lines:_3,string:_4};
};
_CTFrameCreate.displayName="_CTFrameCreate";
CTFrameGetStringRange=function(_5){
return CPMakeRange();
};
CTFrameGetStringRange.displayName="CTFrameGetStringRange";
CTFrameGetVisibleStringRange=function(_6){
return CPMakeRange();
};
CTFrameGetVisibleStringRange.displayName="CTFrameGetVisibleStringRange";
CTFrameGetPath=function(_7){
return _7.path;
};
CTFrameGetPath.displayName="CTFrameGetPath";
CTFrameGetFrameAttributes=function(_8){
return _8.frameAttributes;
};
CTFrameGetFrameAttributes.displayName="CTFrameGetFrameAttributes";
CTFrameGetLines=function(_9){
return _9.lines;
};
CTFrameGetLines.displayName="CTFrameGetLines";
CTFrameGetLineOrigins=function(_a,_b){
var _c=[],_d=_b?CTFrameGetLinesForRange(_a,_b):_a.lines;
for(var i=-1,_e=_d.length;++i<_e;){
_c.push(_d[i].origin);
}
return _c;
};
CTFrameGetLineOrigins.displayName="CTFrameGetLineOrigins";
CTFrameGetLinesForRange=function(_f,lhs){
var _10=_f.lines,_11=[];
for(var i=-1,_12=_10.length;++i<_12;){
var _13=_10[i],rhs=CTLineGetStringRange(_13);
if((CPMaxRange(lhs)<rhs.location||CPMaxRange(rhs)<lhs.location)&&result.length){
break;
}
if(lhs.location>=rhs.location&&rhs.location<=CPMaxRange(lhs)&&CPMaxRange(rhs)>lhs.location){
_11.push(_13);
}
}
return _11;
};
CTFrameGetLinesForRange.displayName="CTFrameGetLinesForRange";
CTFrameGetRangeForPoint=function(_14,_15){
var _16=_14.lines,y=_15.y;
for(var i=-1,_17=_16.length;++i<_17;){
var _18=_16[i],_19=CTLineGetImageBounds(_18),_1a=_18._startPosition.y;
if(y>=_1a&&y<_19.size.height+_1a){
var _1b=CTLineGetStringIndexForPosition(_18,_15),_1c=CTLineGetStringRange(_18);
_1c.location+=_1b;
_1c.length=0;
return _1c;
}
}
};
CTFrameGetRangeForPoint.displayName="CTFrameGetRangeForPoint";
CTFrameDraw=function(_1d,_1e){
var _1f=_1d.path.start,_20=_1d.lines;
CGContextSetTextPosition(_1e,_1f.x,_1f.y);
for(var i=-1,_21=_20.length;++i<_21;){
var _22=_20[i],_23=objj_msgSend(_22.string,"attribute:atIndex:effectiveRange:","alignment",0,CPMakeRange(0,0)),_24=CGContextGetTextPosition(_1e);
if(_23===CPRightTextAlignment){
_22.origin=CGPointMake((_1d.path.elements[1].x-_1f.x*2)-CTLineGetTypographicBounds(_22).width,_24.y);
}else{
if(_23===CPCenterTextAlignment){
_22.origin=CGPointMake(((_1d.path.elements[1].x-_1f.x)/2)-CTLineGetTypographicBounds(_22).width/2,_24.y);
}else{
_22.origin=CGPointMake(_1f.x,_24.y);
}
}
CGContextSetTextPosition(_1e,_22.origin.x,_22.origin.y);
CTLineDraw(_22,_1e);
}
};
CTFrameDraw.displayName="CTFrameDraw";
p;35;Frameworks/CoreText/CTFramesetter.jt;1765;@STATIC;1.0;i;9;CTFrame.ji;14;CTTypesetter.jt;1714;
objj_executeFile("CTFrame.j",YES);
objj_executeFile("CTTypesetter.j",YES);
CTFramesetterCreateWithAttributedString=function(_1){
return {string:_1,typesetter:CTTypesetterCreateWithAttributedString(_1)};
};
CTFramesetterCreateWithAttributedString.displayName="CTFramesetterCreateWithAttributedString";
CTFramesetterCreateFrame=function(_2,_3,_4,_5){
if(_2._cachedFrame&&objj_msgSend(_2._cachedAttributes,"isEqual:",_5)){
return _2._cachedFrame;
}
var _6=_3?objj_msgSend(_2.string,"attributedSubstringFromRange:",_3):_2.string,_7=objj_msgSend(_6,"string"),_8=_7.split(/\n|\r/g),_9=[];
var _a=0;
for(var i=-1,_b=_8.length;++i<_b;){
var _c=_8[i].length;
if(i!==_b-1){
++_c;
}
var _d=CPMakeRange(_a,_c),_e=CTLineCreateWithAttributedString(objj_msgSend(_6,"attributedSubstringFromRange:",_d));
_e.range=_d;
_e.prevLine=_f;
if(_f){
_f.nextLine=_e;
}
_9.push(_e);
_a+=_c;
var _f=_e;
}
return _2._cachedFrame=_CTFrameCreate(_4,_5,_9);
};
CTFramesetterCreateFrame.displayName="CTFramesetterCreateFrame";
CTFramesetterGetTypesetter=function(_10){
return _10.typesetter;
};
CTFramesetterGetTypesetter.displayName="CTFramesetterGetTypesetter";
CTFramesetterSuggestFrameSizeWithConstraints=function(_11,_12,_13,_14,_15){
var _16=CTFramesetterCreateFrame(_11,_12,null,_13),_17=CTFrameGetLines(_16),_18=0,_19=0;
for(var i=-1,_1a=_17.length;++i<_1a;){
var _1b=CTLineGetTypographicBounds(_17[i]);
_18=MAX(_18,_1b.width);
_19+=_1b.lineHeight;
}
return CGSizeMake(_18,_19);
};
CTFramesetterSuggestFrameSizeWithConstraints.displayName="CTFramesetterSuggestFrameSizeWithConstraints";
CTFramesetterGetAttributedString=function(_1c){
return _1c.string;
};
CTFramesetterGetAttributedString.displayName="CTFramesetterGetAttributedString";
p;28;Frameworks/CoreText/CTLine.jt;3428;@STATIC;1.0;i;7;CTRun.jt;3398;
objj_executeFile("CTRun.j",YES);
kCTLineTruncationStart=0;
kCTLineTruncationEnd=1;
kCTLineTruncationMiddle=2;
CTLineCreateWithAttributedString=function(_1){
var _2={string:_1,runs:[]};
_CTLineCreateRuns(_2);
return _2;
};
CTLineCreateWithAttributedString.displayName="CTLineCreateWithAttributedString";
CTLineCreateTruncatedLine=function(_3,_4,_5,_6){
return _3;
};
CTLineCreateTruncatedLine.displayName="CTLineCreateTruncatedLine";
CTLineCreateJustifiedLine=function(_7,_8,_9){
return _7;
};
CTLineCreateJustifiedLine.displayName="CTLineCreateJustifiedLine";
CTLineGetGlyphCount=function(_a){
return objj_msgSend(_a.string,"length");
};
CTLineGetGlyphCount.displayName="CTLineGetGlyphCount";
CTLineGetGlyphRuns=function(_b){
return _b.runs;
};
CTLineGetGlyphRuns.displayName="CTLineGetGlyphRuns";
CTLineGetStringRange=function(_c){
return CPCopyRange(_c.range)||CPMakeRange(0,objj_msgSend(_c.string,"length"));
};
CTLineGetStringRange.displayName="CTLineGetStringRange";
CTLineGetPenOffsetForFlush=function(_d,_e,_f){
};
CTLineGetPenOffsetForFlush.displayName="CTLineGetPenOffsetForFlush";
CTLineDraw=function(_10,_11){
var _12=_10._startPosition=CGContextGetTextPosition(_11),_13=CTLineGetImageBounds(_10,_11).size.height;
CGContextSetTextPosition(_11,_12.x,_12.y+_13*0.5);
var _14=_10.runs;
for(var i=-1,_15=_14.length;++i<_15;){
CTRunDraw(_14[i],_11);
}
CGContextSetTextPosition(_11,_12.x,_12.y+_13);
};
CTLineDraw.displayName="CTLineDraw";
CTLineGetImageBounds=function(_16,_17){
if(_16._imageBounds){
return _16._imageBounds;
}
var _18=_16.runs,_19=0,_1a=0;
for(var i=-1,_1b=_18.length;++i<_1b;){
var _1c=CTRunGetImageBounds(_18[i],_17).size;
_19+=_1c.width;
_1a=MAX(_1a,_1c.height);
}
return _16._imageBounds=CGRectMake(0,0,_19,_1a);
};
CTLineGetImageBounds.displayName="CTLineGetImageBounds";
CTLineGetTypographicBounds=function(_1d){
if(_1d._typographicBounds){
return _1d._typographicBounds;
}
var _1e=_1d.runs,_1f=0,_20=0,_21=0,_22=0;
for(var i=-1,_23=_1e.length;++i<_23;){
var _24=CTRunGetTypographicBounds(_1e[i]);
_1f+=_24.width;
_20=MAX(_20,_24.ascent);
_21=MAX(_21,_24.descent);
_22=MAX(_22,_24.lineHeight);
}
return _1d._typographicBounds={width:_1f,ascent:_20,descent:_21,lineHeight:_22};
};
CTLineGetTypographicBounds.displayName="CTLineGetTypographicBounds";
CTLineGetStringIndexForPosition=function(_25,_26){
var _27=_25.runs,x=_26.x,_28=0;
for(var i=-1,_29=_27.length;++i<_29;){
var run=_27[i],_2a=run.glyphOrigins;
for(var j=-1,_2b=_2a.length;++j<_2b;){
var _2c=_2a[j],_2d;
if(j<_2b-1){
_2d=_2a[j+1];
}else{
if(i<_29-1){
_2d=_27[i+1].glyphOrigins[0];
}else{
return _28++;
}
}
if(x<=(_2d.x-_2c.x)/2+_2c.x){
return _28;
}
_28++;
}
}
};
CTLineGetStringIndexForPosition.displayName="CTLineGetStringIndexForPosition";
CTLineGetOffsetForStringIndex=function(_2e,_2f,_30){
var _31=_2e.runs;
for(var i=-1,_32=_31.length;++i<_32;){
var run=_31[i],_33=run.range;
if(CPLocationInRange(_2f,_33)){
return run.glyphOrigins[_2f-_33.location];
}
}
};
CTLineGetOffsetForStringIndex.displayName="CTLineGetOffsetForStringIndex";
_CTLineCreateRuns=function(_34){
var _35=_34.string,_36=_34.runs,_37=_35._rangeEntries;
for(var i=-1,_38=_37.length;++i<_38;){
var _39=_37[i],_3a=_39.range,_3b=objj_msgSend(objj_msgSend(_35,"string"),"substringWithRange:",_3a),_3c=_39.attributes;
var run=_CTRunCreate(_3b,_3c);
run.range=_3a;
_36.push(run);
}
};
_CTLineCreateRuns.displayName="_CTLineCreateRuns";
p;27;Frameworks/CoreText/CTRun.jt;4011;@STATIC;1.0;t;3992;
kCTRunStatusNoStatus=0;
kCTRunStatusRightToLeft=1<<0;
kCTRunStatusNonMonotonic=1<<1;
kCTRunStatusNonIdentityMatrix=1<<2;
_CTRunCreate=function(_1,_2){
return {glyphs:_1,attributes:_2,status:kCTRunStatusNoStatus};
};
_CTRunCreate.displayName="_CTRunCreate";
CTRunGetGlyphCount=function(_3){
return _3.glyphs.length;
};
CTRunGetGlyphCount.displayName="CTRunGetGlyphCount";
CTRunGetAttributes=function(_4){
return _4.attributes;
};
CTRunGetAttributes.displayName="CTRunGetAttributes";
CTRunGetStatus=function(_5){
return _5.status||kCTRunStatusNoStatus;
};
CTRunGetStatus.displayName="CTRunGetStatus";
CTRunGetGlyphs=function(_6,_7){
if(!_6.glyphs){
_6.glyphs=[];
}
return _6.glyphs;
};
CTRunGetGlyphs.displayName="CTRunGetGlyphs";
CTRunGetPositions=function(_8,_9){
if(!_8.positions){
_8.positions=[];
}
return _8.positions;
};
CTRunGetPositions.displayName="CTRunGetPositions";
CTRunGetAdvances=function(_a,_b){
if(!_a.advances){
_a.advances=[];
}
return _a.advances;
};
CTRunGetAdvances.displayName="CTRunGetAdvances";
CTRunGetStringIndices=function(_c,_d){
if(!_c.stringIndices){
_c.stringIndices=[];
}
return _c.stringIndices;
};
CTRunGetStringIndices.displayName="CTRunGetStringIndices";
CTRunGetStringRange=function(_e){
return _e.range;
};
CTRunGetStringRange.displayName="CTRunGetStringRange";
CTRunGetTypographicBounds=function(_f,_10){
if(_f._typographicBounds){
return _f._typographicBounds;
}
var _11=_f.attributes,_12=objj_msgSend(_11,"valueForKey:","font"),_13=_CTRunStringForRange(_f,_10);
return _f._typographicBounds={width:objj_msgSend(_13,"sizeWithFont:",_12).width,ascender:objj_msgSend(_12,"ascender"),descender:objj_msgSend(_12,"descender"),lineHeight:objj_msgSend(_12,"defaultLineHeightForFont")};
};
CTRunGetTypographicBounds.displayName="CTRunGetTypographicBounds";
CTRunGetImageBounds=function(_14,_15,_16){
if(_14._imageBounds){
return _14._imageBounds;
}
_CTRunPrepareDraw(_14,_15);
var _17=_CTRunStringForRange(_14,_16),_18=_15.measureText(_17).width,_19=objj_msgSend(CGContextGetFont(_15),"defaultLineHeightForFont");
_CTRunUnprepareDraw(_14,_15);
return _14._imageBounds=CGRectMake(0,0,_18,_19);
};
CTRunGetImageBounds.displayName="CTRunGetImageBounds";
CTRunGetTextMatrix=function(_1a){
};
CTRunGetTextMatrix.displayName="CTRunGetTextMatrix";
CTRunDraw=function(_1b,_1c,_1d){
_CTRunPrepareDraw(_1b,_1c);
var _1e=_1d?objj_msgSend(_1b.glyphs,"substringWithRange:",_1d):_1b.glyphs;
_CTRunDrawShadow(_1b,_1c,_1e);
var _1f=_1b.glyphOrigins=[];
for(var i=-1,_20=_1e.length;++i<_20;){
var _21=_1e[i];
_1f[i]=CGContextGetTextPosition(_1c);
CGContextShowText(_1c,_21);
}
_CTRunUnprepareDraw(_1b,_1c);
};
CTRunDraw.displayName="CTRunDraw";
_CTRunDrawShadow=function(_22,_23,_24){
var _25=_22.attributes,_26=objj_msgSend(_25,"valueForKey:","text-shadow-color"),_27=objj_msgSend(_25,"valueForKey:","text-shadow-offset");
if(_26&&_27){
var _28=CGContextGetFillColor(_23),_29=CGContextGetTextPosition(_23);
CGContextSetFillColor(_23,_26);
CGContextShowTextAtPoint(_23,_29.x+_27.width,_29.y+_27.height,_24);
CGContextSetFillColor(_23,_28);
CGContextSetTextPosition(_23,_29.x,_29.y);
}
};
_CTRunDrawShadow.displayName="_CTRunDrawShadow";
_CTRunPrepareDraw=function(_2a,_2b){
var _2c=_2a.attributes,_2d=objj_msgSend(_2c,"valueForKey:","font"),_2e=objj_msgSend(_2c,"valueForKey:","color");
if(_2d){
CGContextSelectFont(_2b,_2d);
_2a._cachedFont=CGContextGetFont(_2b);
}
if(_2e){
CGContextSetFillColor(_2b,_2e);
_2a._cachedColor=CGContextGetFillColor(_2b);
}
};
_CTRunPrepareDraw.displayName="_CTRunPrepareDraw";
_CTRunUnprepareDraw=function(_2f,_30){
if(_2f._cachedFont){
CGContextSelectFont(_30,_2f._cachedFont);
_2f._cachedFont=nil;
}
if(_2f._cachedColor){
CGContextSetFillColor(_30,_2f._cachedColor);
_2f._cachedColor=nil;
}
};
_CTRunUnprepareDraw.displayName="_CTRunUnprepareDraw";
_CTRunStringForRange=function(_31,_32){
return (!_32||_32.length===0)?_31.glyphs:objj_msgSend(_31.glyphs,"substringWithRange:",_32);
};
_CTRunStringForRange.displayName="_CTRunStringForRange";
p;34;Frameworks/CoreText/CTTypesetter.jt;604;@STATIC;1.0;i;8;CTLine.jt;574;
objj_executeFile("CTLine.j",YES);
kCTTypesetterOptionDisableBidiProcessing="kCTTypesetterOptionDisableBidiProcessing";
kCTTypesetterOptionForcedEmbeddingLevel="kCTTypesetterOptionForcedEmbeddingLevel";
CTTypesetterCreateWithAttributedString=function(_1){
return CTTypesetterCreateWithAttributedStringAndOptions(_1,nil);
};
CTTypesetterCreateWithAttributedStringAndOptions=function(_2,_3){
return {string:_2,options:_3};
};
CTTypesetterCreateLine=function(_4,_5){
};
CTTypesetterSuggestLineBreak=function(_6,_7,_8){
};
CTTypesetterSuggestClusterBreak=function(_9,_a,_b){
};
p;35;Frameworks/Renaissance/CPViewSize.jt;3346;@STATIC;1.0;t;3327;
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
p;33;Frameworks/Renaissance/Fireside.jt;18513;@STATIC;1.0;I;21;Foundation/CPObject.ji;16;FSMutableArray.jt;18446;
objj_executeFile("Foundation/CPObject.j",NO);
objj_executeFile("FSMutableArray.j",YES);
var _1=objj_getClass("CPArray");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"CPArray\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("allObjects"),function(_3,_4){
with(_3){
return _3;
}
})]);
var _1=objj_getClass("CPDictionary");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"CPDictionary\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("toJSON"),function(_5,_6){
with(_5){
var _7=objj_msgSend(_5,"allKeys");
var i,l=_7.length;
var o={};
for(i=0;i<l;i++){
var _8=_7[i];
o[_8]=objj_msgSend(_5,"objectForKey:",_8);
}
return JSON.stringify(o);
}
})]);
var _9;
var _1=objj_allocateClassPair(CPObject,"FSEntity"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_name"),new objj_ivar("_pk"),new objj_ivar("_columns"),new objj_ivar("_relations"),new objj_ivar("_store"),new objj_ivar("_pkcache"),new objj_ivar("_formatters")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("name"),function(_a,_b){
with(_a){
return _name;
}
}),new objj_method(sel_getUid("setName:"),function(_c,_d,_e){
with(_c){
_name=_e;
}
}),new objj_method(sel_getUid("pk"),function(_f,_10){
with(_f){
return _pk;
}
}),new objj_method(sel_getUid("setPk:"),function(_11,_12,_13){
with(_11){
_pk=_13;
}
}),new objj_method(sel_getUid("columns"),function(_14,_15){
with(_14){
return _columns;
}
}),new objj_method(sel_getUid("setColumns:"),function(_16,_17,_18){
with(_16){
_columns=_18;
}
}),new objj_method(sel_getUid("store"),function(_19,_1a){
with(_19){
return _store;
}
}),new objj_method(sel_getUid("setStore:"),function(_1b,_1c,_1d){
with(_1b){
_store=_1d;
}
}),new objj_method(sel_getUid("initWithName:andStore:"),function(_1e,_1f,_20,_21){
with(_1e){
_1e=objj_msgSendSuper({receiver:_1e,super_class:objj_getClass("FSEntity").super_class},"init");
if(_1e){
_store=_21;
_name=_20;
}
return _1e;
}
}),new objj_method(sel_getUid("init"),function(_22,_23){
with(_22){
return objj_msgSend(_22,"initWithName:andStore:",nil,nil);
}
}),new objj_method(sel_getUid("createObject"),function(_24,_25){
with(_24){
return objj_msgSend(_24,"createObjectWithDictionary:",nil);
}
}),new objj_method(sel_getUid("createObjectWithDictionary:"),function(_26,_27,_28){
with(_26){
var r=objj_msgSend(objj_msgSend(FSObject,"alloc"),"initWithEntity:",_26);
if(_28){
r._changes=_28;
var _29=objj_msgSend(_28,"allKeys");
var i,l=objj_msgSend(_29,"count");
for(i=0;i<l;i++){
var _2a=objj_msgSend(_29,"objectAtIndex:",i);
var _2b=objj_msgSend(_28,"objectForKey:",_2a);
var _2c;
if(_2c=objj_msgSend(_26,"formatterForColumnName:",_2a)){
_2b=objj_msgSend(_2c,"objectValueForString:error:",_2b,nil);
objj_msgSend(_28,"setObject:forKey:",_2b,_2a);
}
}
}
return r;
}
}),new objj_method(sel_getUid("insertObject:"),function(_2d,_2e,_2f){
with(_2d){
if(objj_msgSend(_2f,"isKindOfClass:",objj_msgSend(CPDictionary,"class"))){
_2f=objj_msgSend(_2d,"createObjectWithDictionary:",_2f);
}else{
if(!objj_msgSend(_2f,"isKindOfClass:",objj_msgSend(FSObject,"class"))){
}
}
objj_msgSend(objj_msgSend(_2d,"store"),"insertObject:",_2f);
return _2f;
}
}),new objj_method(sel_getUid("deleteObject:"),function(_30,_31,_32){
with(_30){
objj_msgSend(objj_msgSend(_30,"store"),"deleteObject:",_32);
}
}),new objj_method(sel_getUid("setFormatter:forColumnName:"),function(_33,_34,_35,_36){
with(_33){
if(!_formatters){
_formatters=objj_msgSend(CPMutableDictionary,"new");
}
objj_msgSend(_formatters,"setObject:forKey:",_35,_36);
}
}),new objj_method(sel_getUid("formatterForColumnName:"),function(_37,_38,_39){
with(_37){
if(!_formatters){
return nil;
}
return objj_msgSend(_formatters,"objectForKey:",_39);
}
}),new objj_method(sel_getUid("objectWithPK:"),function(_3a,_3b,_3c){
with(_3a){
var a=objj_msgSend(objj_msgSend(_3a,"store"),"fetchObjectsWithKey:equallingValue:inEntity:",objj_msgSend(_3a,"pk"),_3c,_3a);
if(objj_msgSend(a,"count")==1){
return objj_msgSend(a,"objectAtIndex:",0);
}
return nil;
}
}),new objj_method(sel_getUid("relationOfName:"),function(_3d,_3e,_3f){
with(_3d){
var _40=objj_msgSend(_relations,"allObjects");
var i,l=objj_msgSend(_40,"count");
for(i=0;i<l;i++){
var r=_40[i];
if(objj_msgSend(r,"name")==_3f){
return r;
}
}
return nil;
}
}),new objj_method(sel_getUid("relationships"),function(_41,_42){
with(_41){
return objj_msgSend(_relations,"allObjects");
}
}),new objj_method(sel_getUid("addRelationship:"),function(_43,_44,_45){
with(_43){
if(!_relations){
_relations=objj_msgSend(CPSet,"setWithObject:",_45);
}else{
objj_msgSend(_relations,"addObject:",_45);
}
}
}),new objj_method(sel_getUid("allObjects"),function(_46,_47){
with(_46){
return objj_msgSend(_store,"fetchAllObjectsInEntity:",_46);
}
}),new objj_method(sel_getUid("_registerObjectInPKCache:"),function(_48,_49,_4a){
with(_48){
if(!_pkcache){
_pkcache=objj_msgSend(CPMutableArray,"new");
}
_pkcache[objj_msgSend(_4a,"valueForKey:",_pk)]=_4a;
}
}),new objj_method(sel_getUid("_registeredObjectForPK:"),function(_4b,_4c,_4d){
with(_4b){
if(!_pkcache){
return nil;
}
return _pkcache[_4d];
}
}),new objj_method(sel_getUid("_hasCaches"),function(_4e,_4f){
with(_4e){
var _50=objj_msgSend(_relations,"allObjects");
var i,l=objj_msgSend(_50,"count");
for(i=0;i<l;i++){
var r=objj_msgSend(_50,"objectAtIndex:",i);
if(r._target_cache&&objj_msgSend(r._target_cache,"count")){
return YES;
}
}
return NO;
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("relationshipsWithTargetProperty:"),function(_51,_52,_53){
with(_51){
var ret=[];
if(!_9){
return ret;
}
var i,l=_9.length;
for(i=0;i<l;i++){
var r=_9[i];
if(objj_msgSend(r,"targetColumn")==_53){
objj_msgSend(ret,"addObject:",r);
}
}
return ret;
}
}),new objj_method(sel_getUid("_registerRelationship:"),function(_54,_55,_56){
with(_54){
if(!_9){
_9=objj_msgSend(CPMutableArray,"new");
}
return objj_msgSend(_9,"addObject:",_56);
}
})]);
FSRelationshipTypeToOne=0;
FSRelationshipTypeToMany=1;
var _1=objj_allocateClassPair(CPObject,"FSRelationship"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_name"),new objj_ivar("_source"),new objj_ivar("_target"),new objj_ivar("_bindingColumn"),new objj_ivar("_targetColumn"),new objj_ivar("_type"),new objj_ivar("_target_cache")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("name"),function(_57,_58){
with(_57){
return _name;
}
}),new objj_method(sel_getUid("setName:"),function(_59,_5a,_5b){
with(_59){
_name=_5b;
}
}),new objj_method(sel_getUid("source"),function(_5c,_5d){
with(_5c){
return _source;
}
}),new objj_method(sel_getUid("setSource:"),function(_5e,_5f,_60){
with(_5e){
_source=_60;
}
}),new objj_method(sel_getUid("target"),function(_61,_62){
with(_61){
return _target;
}
}),new objj_method(sel_getUid("setTarget:"),function(_63,_64,_65){
with(_63){
_target=_65;
}
}),new objj_method(sel_getUid("bindingColumn"),function(_66,_67){
with(_66){
return _bindingColumn;
}
}),new objj_method(sel_getUid("setBindingColumn:"),function(_68,_69,_6a){
with(_68){
_bindingColumn=_6a;
}
}),new objj_method(sel_getUid("_targetColumn"),function(_6b,_6c){
with(_6b){
return _targetColumn;
}
}),new objj_method(sel_getUid("setTargetColumn:"),function(_6d,_6e,_6f){
with(_6d){
_targetColumn=_6f;
}
}),new objj_method(sel_getUid("type"),function(_70,_71){
with(_70){
return _type;
}
}),new objj_method(sel_getUid("setType:"),function(_72,_73,_74){
with(_72){
_type=_74;
}
}),new objj_method(sel_getUid("initWithName:source:andTargetEntity:"),function(_75,_76,_77,_78,_79){
with(_75){
_75=objj_msgSendSuper({receiver:_75,super_class:objj_getClass("FSRelationship").super_class},"init");
if(_75){
_target=_79;
_name=_77;
_source=_78;
_type=FSRelationshipTypeToOne;
}
objj_msgSend(FSEntity,"_registerRelationship:",_75);
return _75;
}
}),new objj_method(sel_getUid("init"),function(_7a,_7b){
with(_7a){
return objj_msgSend(_7a,"initWithName:source:andTargetEntity:",nil,nil,nil);
}
}),new objj_method(sel_getUid("targetColumn"),function(_7c,_7d){
with(_7c){
if(_targetColumn&&_targetColumn.length){
return _targetColumn;
}
return objj_msgSend(_target,"pk");
}
}),new objj_method(sel_getUid("fetchObjectsForKey:"),function(_7e,_7f,_80){
with(_7e){
if(!_80){
return nil;
}
var _81;
if(!_target_cache){
_target_cache=[];
}
if(_81=_target_cache[_80]){
return _81;
}
var res=objj_msgSend(objj_msgSend(_target,"store"),"fetchObjectsWithKey:equallingValue:inEntity:",objj_msgSend(_7e,"targetColumn"),_80,_target);
_target_cache[_80]=res;
return res;
}
}),new objj_method(sel_getUid("_invalidateCache"),function(_82,_83){
with(_82){
_target_cache=[];
}
})]);
var _1=objj_allocateClassPair(CPObject,"FSObject"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_data"),new objj_ivar("_changes"),new objj_ivar("_formatters"),new objj_ivar("_entity")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("entity"),function(_84,_85){
with(_84){
return _entity;
}
}),new objj_method(sel_getUid("setEntity:"),function(_86,_87,_88){
with(_86){
_entity=_88;
}
}),new objj_method(sel_getUid("initWithEntity:"),function(_89,_8a,_8b){
with(_89){
_89=objj_msgSendSuper({receiver:_89,super_class:objj_getClass("FSObject").super_class},"init");
if(_89){
_entity=_8b;
}
return _89;
}
}),new objj_method(sel_getUid("_setDataFromJSONObject:"),function(_8c,_8d,o){
with(_8c){
_data=objj_msgSend(CPMutableDictionary,"dictionary");
var _8e=objj_msgSend(objj_msgSend(_entity,"columns"),"allObjects");
var i,l=_8e.length;
for(i=0;i<l;i++){
var _8f=_8e[i];
objj_msgSend(_data,"setObject:forKey:",o[_8f],_8f);
}
}
}),new objj_method(sel_getUid("setFormatter:forColumnName:"),function(_90,_91,_92,_93){
with(_90){
if(!_formatters){
_formatters=objj_msgSend(CPMutableDictionary,"new");
}
objj_msgSend(_formatters,"setObject:forKey:",_92,_93);
}
}),new objj_method(sel_getUid("formatterForColumnName:"),function(_94,_95,_96){
with(_94){
if(!_formatters){
return nil;
}
return objj_msgSend(_formatters,"objectForKey:",_96);
}
}),new objj_method(sel_getUid("description"),function(_97,_98){
with(_97){
return objj_msgSend(_data,"description");
}
}),new objj_method(sel_getUid("typeOfKey:"),function(_99,_9a,_9b){
with(_99){
if(objj_msgSend(objj_msgSend(_entity,"columns"),"containsObject:",_9b)){
return 0;
}
if(objj_msgSend(_entity,"relationOfName:",_9b)){
return 1;
}
return CPNotFound;
}
}),new objj_method(sel_getUid("valueForKey:"),function(_9c,_9d,_9e){
with(_9c){
var _9f=objj_msgSend(_9c,"typeOfKey:",_9e);
if(_9f==0){
if(!_data){
}
var o=objj_msgSend(_changes,"objectForKey:",_9e);
if(!o){
o=objj_msgSend(_data,"objectForKey:",_9e);
}
if(o){
if(!objj_msgSend(o,"isKindOfClass:",objj_msgSend(CPString,"class"))){
o=objj_msgSend(o,"stringValue");
}
}
var _a0=objj_msgSend(_9c,"formatterForColumnName:",_9e);
if(_a0||(_a0=objj_msgSend(_entity,"formatterForColumnName:",_9e))){
return objj_msgSend(_a0,"stringForObjectValue:",o);
}else{
return o;
}
}else{
if(_9f==1){
var rel=objj_msgSend(_entity,"relationOfName:",_9e);
var _a1=objj_msgSend(rel,"bindingColumn");
if(!_a1){
_a1=objj_msgSend(_entity,"pk");
}
var _a2=(objj_msgSend(rel,"type")==FSRelationshipTypeToMany);
var _a3=objj_msgSend(rel,"fetchObjectsForKey:",objj_msgSend(_9c,"valueForKey:",_a1));
if(_a2){
var r=objj_msgSend(objj_msgSend(FSMutableArray,"alloc"),"initWithArray:ofEntity:",_a3,objj_msgSend(rel,"target"));
var _a4=objj_msgSend(CPDictionary,"dictionaryWithObject:forKey:",objj_msgSend(_9c,"valueForKey:",_a1),rel._targetColumn);
objj_msgSend(r,"setDefaults:",_a4);
return r;
}else{
return (_a3&&_a3.length)?objj_msgSend(_a3,"objectAtIndex:",0):nil;
}
}else{
var _a5=sel_getName(_9e);
if(_a5&&objj_msgSend(_9c,"respondsToSelector:",_a5)){
return objj_msgSend(_9c,"performSelector:",_a5);
}else{
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,"Key "+_9e+" is not a column in entity "+objj_msgSend(_entity,"name"));
}
}
}
}
}),new objj_method(sel_getUid("setValue:forKey:"),function(_a6,_a7,_a8,_a9){
with(_a6){
var _aa=objj_msgSend(_a6,"typeOfKey:",_a9);
var _ab=objj_msgSend(_a6,"valueForKey:",_a9);
if(_ab===_a8){
return;
}
if(_aa==0){
if(!_changes){
_changes=objj_msgSend(CPMutableDictionary,"dictionary");
}
objj_msgSend(_a6,"willChangeValueForKey:",_a9);
var _ac=objj_msgSend(_a6,"formatterForColumnName:",_a9);
if(_ac||(_ac=objj_msgSend(_entity,"formatterForColumnName:",_a9))){
_a8=objj_msgSend(_ac,"objectValueForString:error:",_a8,nil);
}
objj_msgSend(_changes,"setObject:forKey:",_a8,_a9);
objj_msgSend(_a6,"didChangeValueForKey:",_a9);
objj_msgSend(objj_msgSend(_entity,"store"),"writeChangesInObject:",_a6);
var _ad=objj_msgSend(FSEntity,"relationshipsWithTargetProperty:",_a9);
if(_ad){
var i,l=_ad.length;
for(i=0;i<l;i++){
var rel=_ad[i];
if(objj_msgSend(rel,"type")==FSRelationshipTypeToMany){
objj_msgSend(rel,"_invalidateCache");
var _ae=objj_msgSend(objj_msgSend(rel,"source"),"objectWithPK:",_ab);
var _af=objj_msgSend(rel,"fetchObjectsForKey:",_ab);
objj_msgSend(_ae,"willChangeValueForKey:",objj_msgSend(rel,"name"));
objj_msgSend(_ae,"setValue:forKey:",_af,objj_msgSend(rel,"name"));
objj_msgSend(_ae,"didChangeValueForKey:",objj_msgSend(rel,"name"));
}
}
}
}else{
if(_aa==1){
}else{
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,"Key "+_a9+" is not a column");
}
}
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_b0,_b1,_b2){
with(_b0){
objj_msgSendSuper({receiver:_b0,super_class:objj_getClass("FSObject").super_class},"encodeWithCoder:",_b2);
var _b3=objj_msgSend(_data,"copy");
if(_changes){
objj_msgSend(_b3,"addEntriesFromDictionary:",_changes);
}
objj_msgSend(_b2,"_encodeDictionaryOfObjects:forKey:",_b3,"FS.objects");
}
}),new objj_method(sel_getUid("initWithCoder:"),function(_b4,_b5,_b6){
with(_b4){
_b4=objj_msgSendSuper({receiver:_b4,super_class:objj_getClass("FSObject").super_class},"initWithCoder:",_b6);
if(_b4){
_changes=objj_msgSend(_b6,"_decodeDictionaryOfObjectsForKey:","FS.objects");
}
return _b4;
}
})]);
var _1=objj_allocateClassPair(CPObject,"FSStore"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_baseURL"),new objj_ivar("_fetchLimit")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("baseURL"),function(_b7,_b8){
with(_b7){
return _baseURL;
}
}),new objj_method(sel_getUid("setBaseURL:"),function(_b9,_ba,_bb){
with(_b9){
_baseURL=_bb;
}
}),new objj_method(sel_getUid("fetchLimit"),function(_bc,_bd){
with(_bc){
return _fetchLimit;
}
}),new objj_method(sel_getUid("setFetchLimit:"),function(_be,_bf,_c0){
with(_be){
_fetchLimit=_c0;
}
}),new objj_method(sel_getUid("requestForAddressingObjectsWithKey:equallingValue:inEntity:"),function(_c1,_c2,_c3,_c4,_c5){
with(_c1){
var _c6=objj_msgSend(CPURLRequest,"requestWithURL:",objj_msgSend(_c1,"baseURL")+"/"+objj_msgSend(_c5,"name")+"/"+_c3+"/"+_c4);
return _c6;
}
}),new objj_method(sel_getUid("requestForAddressingAllObjectsInEntity:"),function(_c7,_c8,_c9){
with(_c7){
return objj_msgSend(CPURLRequest,"requestWithURL:",objj_msgSend(_c7,"baseURL")+"/"+objj_msgSend(_c9,"name"));
}
}),new objj_method(sel_getUid("initWithBaseURL:"),function(_ca,_cb,_cc){
with(_ca){
_ca=objj_msgSendSuper({receiver:_ca,super_class:objj_getClass("FSStore").super_class},"init");
if(_ca){
_baseURL=_cc;
}
return _ca;
}
}),new objj_method(sel_getUid("fetchObjectsForURLRequest:inEntity:"),function(_cd,_ce,_cf,_d0){
with(_cd){
var _d1=objj_msgSend(CPURLConnection,"sendSynchronousRequest:returningResponse:",_cf,nil);
var j=JSON.parse(objj_msgSend(_d1,"rawString"));
var a=objj_msgSend(CPMutableArray,"new");
var i,l=j.length;
for(i=0;i<l;i++){
var pk=j[i][objj_msgSend(_d0,"pk")];
var _d2;
if(_d2=objj_msgSend(_d0,"_registeredObjectForPK:",pk)){
objj_msgSend(a,"addObject:",_d2);
}else{
var t=objj_msgSend(objj_msgSend(FSObject,"alloc"),"initWithEntity:",_d0);
objj_msgSend(t,"_setDataFromJSONObject:",j[i]);
objj_msgSend(_d0,"_registerObjectInPKCache:",t);
objj_msgSend(a,"addObject:",t);
}
}
return a;
}
}),new objj_method(sel_getUid("fetchAllObjectsInEntity:"),function(_d3,_d4,_d5){
with(_d3){
return objj_msgSend(_d3,"fetchObjectsForURLRequest:inEntity:",objj_msgSend(_d3,"requestForAddressingAllObjectsInEntity:",_d5),_d5);
}
}),new objj_method(sel_getUid("fetchObjectsWithKey:equallingValue:inEntity:"),function(_d6,_d7,_d8,_d9,_da){
with(_d6){
if(_d8==objj_msgSend(_da,"pk")){
var _db;
if(_db=objj_msgSend(_da,"_registeredObjectForPK:",_d9)){
return objj_msgSend(CPArray,"arrayWithObject:",_db);
}
}
var _dc=objj_msgSend(_d6,"requestForAddressingObjectsWithKey:equallingValue:inEntity:",_d8,_d9,_da);
return objj_msgSend(_d6,"fetchObjectsForURLRequest:inEntity:",_dc,_da);
}
}),new objj_method(sel_getUid("writeChangesInObject:"),function(_dd,_de,obj){
with(_dd){
if(objj_msgSend(objj_msgSend(obj,"entity"),"pk")===undefined){
return;
}
if(!obj._changes){
return;
}
var _df=objj_msgSend(_dd,"requestForAddressingObjectsWithKey:equallingValue:inEntity:",objj_msgSend(objj_msgSend(obj,"entity"),"pk"),objj_msgSend(obj,"valueForKey:",objj_msgSend(objj_msgSend(obj,"entity"),"pk")),objj_msgSend(obj,"entity"));
objj_msgSend(_df,"setHTTPMethod:","PUT");
objj_msgSend(_df,"setHTTPBody:",objj_msgSend(obj._changes,"toJSON"));
objj_msgSend(CPURLConnection,"sendSynchronousRequest:returningResponse:",_df,nil);
}
}),new objj_method(sel_getUid("insertObject:"),function(_e0,_e1,_e2){
with(_e0){
var _e3=objj_msgSend(_e2,"entity");
var _e4=objj_msgSend(CPURLRequest,"requestWithURL:",objj_msgSend(_e0,"baseURL")+"/"+objj_msgSend(_e3,"name")+"/"+objj_msgSend(_e3,"pk"));
objj_msgSend(_e4,"setHTTPMethod:","POST");
objj_msgSend(_e4,"setHTTPBody:",objj_msgSend(_e2._changes,"toJSON"));
var _e5=objj_msgSend(CPURLConnection,"sendSynchronousRequest:returningResponse:",_e4,nil);
var j=JSON.parse(objj_msgSend(_e5,"rawString"));
var pk=j["pk"];
objj_msgSend(_e2,"willChangeValueForKey:",objj_msgSend(_e3,"pk"));
if(!_e2._data){
_e2._data=objj_msgSend(CPMutableDictionary,"new");
}
objj_msgSend(_e2._data,"setObject:forKey:",pk,objj_msgSend(_e3,"pk"));
objj_msgSend(_e2,"didChangeValueForKey:",objj_msgSend(_e3,"pk"));
}
}),new objj_method(sel_getUid("deleteObject:"),function(_e6,_e7,obj){
with(_e6){
var _e8=objj_msgSend(_e6,"requestForAddressingObjectsWithKey:equallingValue:inEntity:",objj_msgSend(objj_msgSend(obj,"entity"),"pk"),objj_msgSend(obj,"valueForKey:",objj_msgSend(objj_msgSend(obj,"entity"),"pk")),objj_msgSend(obj,"entity"));
objj_msgSend(_e8,"setHTTPMethod:","DELETE");
objj_msgSend(CPURLConnection,"sendSynchronousRequest:returningResponse:",_e8,nil);
}
})]);
p;39;Frameworks/Renaissance/FSMutableArray.jt;7133;@STATIC;1.0;I;21;Foundation/CPObject.jt;7088;
objj_executeFile("Foundation/CPObject.j",NO);
var _1=objj_allocateClassPair(CPMutableArray,"FSMutableArray"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_entity"),new objj_ivar("_proxyObject"),new objj_ivar("_defaults")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("entity"),function(_3,_4){
with(_3){
return _entity;
}
}),new objj_method(sel_getUid("setEntity:"),function(_5,_6,_7){
with(_5){
_entity=_7;
}
}),new objj_method(sel_getUid("defaults"),function(_8,_9){
with(_8){
return _defaults;
}
}),new objj_method(sel_getUid("setDefaults:"),function(_a,_b,_c){
with(_a){
_defaults=_c;
}
}),new objj_method(sel_getUid("initWithArray:ofEntity:"),function(_d,_e,_f,_10){
with(_d){
_d=objj_msgSendSuper({receiver:_d,super_class:objj_getClass("FSMutableArray").super_class},"init");
_proxyObject=_f;
_entity=_10;
return _d;
}
}),new objj_method(sel_getUid("copy"),function(_11,_12){
with(_11){
var i=0,_13=[],_14=objj_msgSend(_11,"count");
for(;i<_14;i++){
objj_msgSend(_13,"addObject:",objj_msgSend(_11,"objectAtIndex:",i));
}
return _13;
}
}),new objj_method(sel_getUid("_representedObject"),function(_15,_16){
with(_15){
return _proxyObject;
}
}),new objj_method(sel_getUid("_setRepresentedObject:"),function(_17,_18,_19){
with(_17){
objj_msgSend(_proxyObject,"setArray:",_19);
}
}),new objj_method(sel_getUid("count"),function(_1a,_1b){
with(_1a){
return objj_msgSend(objj_msgSend(_1a,"_representedObject"),"count");
}
}),new objj_method(sel_getUid("indexOfObject:inRange:"),function(_1c,_1d,_1e,_1f){
with(_1c){
var _20=_1f.location,_21=_1f.length,_22=!!_1e.isa;
for(;_20<_21;++_20){
var _23=objj_msgSend(_1c,"objectAtIndex:",_20);
if(_1e===_23||_22&&!!_23.isa&&objj_msgSend(_1e,"isEqual:",_23)){
return _20;
}
}
return CPNotFound;
}
}),new objj_method(sel_getUid("indexOfObject:"),function(_24,_25,_26){
with(_24){
return objj_msgSend(_24,"indexOfObject:inRange:",_26,CPMakeRange(0,objj_msgSend(_24,"count")));
}
}),new objj_method(sel_getUid("indexOfObjectIdenticalTo:inRange:"),function(_27,_28,_29,_2a){
with(_27){
var _2b=_2a.location,_2c=_2a.length;
for(;_2b<_2c;++_2b){
if(_29===objj_msgSend(_27,"objectAtIndex:",_2b)){
return _2b;
}
}
return CPNotFound;
}
}),new objj_method(sel_getUid("indexOfObjectIdenticalTo:"),function(_2d,_2e,_2f){
with(_2d){
return objj_msgSend(_2d,"indexOfObjectIdenticalTo:inRange:",_2f,CPMakeRange(0,objj_msgSend(_2d,"count")));
}
}),new objj_method(sel_getUid("objectAtIndex:"),function(_30,_31,_32){
with(_30){
return objj_msgSend(objj_msgSend(_30,"objectsAtIndexes:",objj_msgSend(CPIndexSet,"indexSetWithIndex:",_32)),"firstObject");
}
}),new objj_method(sel_getUid("objectsAtIndexes:"),function(_33,_34,_35){
with(_33){
return objj_msgSend(objj_msgSend(_33,"_representedObject"),"objectsAtIndexes:",_35);
}
}),new objj_method(sel_getUid("_addToDBObject:"),function(_36,_37,_38){
with(_36){
if(_defaults){
if(objj_msgSend(_38,"isKindOfClass:",objj_msgSend(CPDictionary,"class"))){
objj_msgSend(_38,"addEntriesFromDictionary:",_defaults);
}else{
if(objj_msgSend(_38,"isKindOfClass:",objj_msgSend(FSObject,"class"))){
if(!_38._changes){
_38._changes=objj_msgSend(CPMutableDictionary,"dictionary");
}
objj_msgSend(_38._changes,"addEntriesFromDictionary:",_defaults);
}
}
}
return objj_msgSend(_entity,"insertObject:",_38);
}
}),new objj_method(sel_getUid("addObject:"),function(_39,_3a,_3b){
with(_39){
objj_msgSend(_39,"insertObject:atIndex:",_3b,objj_msgSend(_39,"count"));
}
}),new objj_method(sel_getUid("addObjectsFromArray:"),function(_3c,_3d,_3e){
with(_3c){
var _3f=0,_40=objj_msgSend(_3e,"count");
objj_msgSend(_3c,"insertObjects:atIndexes:",_3e,objj_msgSend(CPIndexSet,"indexSetWithIndexesInRange:",CPMakeRange(objj_msgSend(_3c,"count"),_40)));
}
}),new objj_method(sel_getUid("insertObject:atIndex:"),function(_41,_42,_43,_44){
with(_41){
objj_msgSend(_41,"insertObjects:atIndexes:",[_43],objj_msgSend(CPIndexSet,"indexSetWithIndex:",_44));
}
}),new objj_method(sel_getUid("insertObjects:atIndexes:"),function(_45,_46,_47,_48){
with(_45){
var _49=objj_msgSend(objj_msgSend(_45,"_representedObject"),"copy");
var _4a=[];
var l=objj_msgSend(_47,"count");
for(var i=0;i<l;i++){
var o=objj_msgSend(_47,"objectAtIndex:",i);
if(_entity){
o=objj_msgSend(_45,"_addToDBObject:",o);
}
objj_msgSend(_4a,"addObject:",o);
}
objj_msgSend(_49,"insertObjects:atIndexes:",_4a,_48);
objj_msgSend(_45,"_setRepresentedObject:",_49);
}
}),new objj_method(sel_getUid("removeObject:"),function(_4b,_4c,_4d){
with(_4b){
objj_msgSend(_4b,"removeObject:inRange:",_4d,CPMakeRange(0,objj_msgSend(_4b,"count")));
}
}),new objj_method(sel_getUid("removeObjectsInArray:"),function(_4e,_4f,_50){
with(_4e){
var l=objj_msgSend(_50,"count");
for(var i=0;i<l;i++){
objj_msgSend(_entity,"deleteObject:",objj_msgSend(_50,"objectAtIndex:",i));
}
var _51=objj_msgSend(objj_msgSend(_4e,"_representedObject"),"copy");
objj_msgSend(_51,"removeObjectsInArray:",_50);
objj_msgSend(_4e,"_setRepresentedObject:",_51);
}
}),new objj_method(sel_getUid("removeObject:inRange:"),function(_52,_53,_54,_55){
with(_52){
var _56;
while((_56=objj_msgSend(_52,"indexOfObject:inRange:",_54,_55))!==CPNotFound){
objj_msgSend(_entity,"deleteObject:",objj_msgSend(_52,"objectAtIndex:",_56));
objj_msgSend(_52,"removeObjectAtIndex:",_56);
_55=CPIntersectionRange(CPMakeRange(_56,length-_56),_55);
}
}
}),new objj_method(sel_getUid("removeLastObject"),function(_57,_58){
with(_57){
objj_msgSend(_57,"removeObjectsAtIndexes:",objj_msgSend(CPIndexSet,"indexSetWithIndex:",objj_msgSend(_57,"count")-1));
}
}),new objj_method(sel_getUid("removeObjectAtIndex:"),function(_59,_5a,_5b){
with(_59){
objj_msgSend(_59,"removeObjectsAtIndexes:",objj_msgSend(CPIndexSet,"indexSetWithIndex:",_5b));
}
}),new objj_method(sel_getUid("removeObjectsAtIndexes:"),function(_5c,_5d,_5e){
with(_5c){
var _5f=objj_msgSend(objj_msgSend(_5c,"_representedObject"),"copy");
var _60=objj_msgSend(objj_msgSend(_5c,"_representedObject"),"objectsAtIndexes:",_5e);
var l=objj_msgSend(_60,"count");
for(var i=0;i<l;i++){
objj_msgSend(_entity,"deleteObject:",objj_msgSend(_60,"objectAtIndex:",i));
}
objj_msgSend(_5f,"removeObjectsAtIndexes:",_5e);
objj_msgSend(_5c,"_setRepresentedObject:",_5f);
}
}),new objj_method(sel_getUid("replaceObjectAtIndex:withObject:"),function(_61,_62,_63,_64){
with(_61){
objj_msgSend(_61,"replaceObjectsAtIndexes:withObjects:",objj_msgSend(CPIndexSet,"indexSetWithIndex:",_63),[_64]);
}
}),new objj_method(sel_getUid("replaceObjectsAtIndexes:withObjects:"),function(_65,_66,_67,_68){
with(_65){
var _69=objj_msgSend(objj_msgSend(_65,"_representedObject"),"copy");
objj_msgSend(_69,"replaceObjectsAtIndexes:withObjects:",_67,_68);
objj_msgSend(_65,"_setRepresentedObject:",_69);
}
}),new objj_method(sel_getUid("description"),function(_6a,_6b){
with(_6a){
return objj_msgSend(objj_msgSend(_6a,"_representedObject"),"description");
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("alloc"),function(_6c,_6d){
with(_6c){
var _6e=[];
_6e.isa=_6c;
var _6f=class_copyIvarList(_6c),_70=_6f.length;
while(_70--){
_6e[ivar_getName(_6f[_70])]=nil;
}
return _6e;
}
})]);
p;45;Frameworks/Renaissance/GSAutoLayoutDefaults.jt;4338;@STATIC;1.0;t;4319;
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
p;41;Frameworks/Renaissance/GSAutoLayoutHBox.jt;14410;@STATIC;1.0;i;21;GSAutoLayoutManager.ji;29;GSAutoLayoutStandardManager.ji;33;GSAutoLayoutProportionalManager.jt;14292;
objj_executeFile("GSAutoLayoutManager.j",YES);
objj_executeFile("GSAutoLayoutStandardManager.j",YES);
objj_executeFile("GSAutoLayoutProportionalManager.j",YES);
var _1=objj_allocateClassPair(CPObject,"GSAutoLayoutHBoxViewInfo"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_view"),new objj_ivar("_minimumSize"),new objj_ivar("_hAlignment"),new objj_ivar("_vAlignment"),new objj_ivar("_hBorder"),new objj_ivar("_vBorder"),new objj_ivar("_proportion"),new objj_ivar("_column")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initWithView:column:"),function(_3,_4,_5,_6){
with(_3){
_view=_5;
_column=_6;
return _3;
}
})]);
var _1=objj_allocateClassPair(CPView,"GSAutoLayoutHBox"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_viewInfo"),new objj_ivar("_hExpand"),new objj_ivar("_hWeakExpand"),new objj_ivar("_vExpand"),new objj_ivar("_vWeakExpand"),new objj_ivar("_hManager"),new objj_ivar("_vManager"),new objj_ivar("_line"),new objj_ivar("_displayAutoLayoutContainers")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("init"),function(_7,_8){
with(_7){
var _9;
_7=objj_msgSendSuper({receiver:_7,super_class:objj_getClass("GSAutoLayoutHBox").super_class},"initWithFrame:",CPZeroRect);
objj_msgSend(_7,"setAutoresizesSubviews:",NO);
objj_msgSend(_7,"setAutoresizingMask:",CPViewWidthSizable|CPViewHeightSizable);
_viewInfo=objj_msgSend(CPMutableArray,"new");
_9=objj_msgSend(GSAutoLayoutStandardManager,"new");
objj_msgSend(_7,"setAutoLayoutManager:",_9);
_vManager=objj_msgSend(GSAutoLayoutStandardManager,"new");
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"addObserver:selector:name:object:",_7,sel_getUid("autoLayoutManagerChangedVLayout:"),GSAutoLayoutManagerChangedLayoutNotification,_vManager);
return _7;
}
}),new objj_method(sel_getUid("setBoxType:"),function(_a,_b,_c){
with(_a){
if(_c!=objj_msgSend(_a,"boxType")){
var _d=nil;
if(_c==GSAutoLayoutProportionalBox){
_d=objj_msgSend(GSAutoLayoutProportionalManager,"new");
}else{
_d=objj_msgSend(GSAutoLayoutStandardManager,"new");
}
objj_msgSend(_a,"setAutoLayoutManager:",_d);
}
}
}),new objj_method(sel_getUid("boxType"),function(_e,_f){
with(_e){
if(objj_msgSend(_hManager,"isKindOfClass:",objj_msgSend(GSAutoLayoutProportionalManager,"class"))){
return GSAutoLayoutProportionalBox;
}else{
return GSAutoLayoutStandardBox;
}
}
}),new objj_method(sel_getUid("setAutoLayoutManager:"),function(_10,_11,_12){
with(_10){
_hManager=_12;
_line=objj_msgSend(_hManager,"addLine");
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"addObserver:selector:name:object:",_10,sel_getUid("autoLayoutManagerChangedHLayout:"),GSAutoLayoutManagerChangedLayoutNotification,_hManager);
}
}),new objj_method(sel_getUid("autoLayoutManager"),function(_13,_14){
with(_13){
return _hManager;
}
}),new objj_method(sel_getUid("infoForView:"),function(_15,_16,_17){
with(_15){
var i,_18=objj_msgSend(_viewInfo,"count");
for(i=0;i<_18;i++){
var _19=objj_msgSend(_viewInfo,"objectAtIndex:",i);
if(_19._view==_17){
return _19;
}
}
return nil;
}
}),new objj_method(sel_getUid("pushToHManagerInfoForViewAtIndex:"),function(_1a,_1b,i){
with(_1a){
var _1c=objj_msgSend(_viewInfo,"objectAtIndex:",i);
objj_msgSend(_hManager,"setMinimumLength:alignment:minBorder:maxBorder:span:ofSegmentAtIndex:inLine:",(_1c._minimumSize).width,_1c._hAlignment,_1c._hBorder,_1c._hBorder,1,i,_line);
if(_1c._proportion!=1){
objj_msgSend(_hManager,"setMinimumLength:alwaysExpands:neverExpands:proportion:ofLinePartAtIndex:",0,NO,NO,_1c._proportion,i);
}else{
objj_msgSend(_hManager,"removeInformationOnLinePartAtIndex:",i);
}
objj_msgSend(_hManager,"updateLayout");
}
}),new objj_method(sel_getUid("pushToVManagerInfoForViewAtIndex:"),function(_1d,_1e,i){
with(_1d){
var _1f=objj_msgSend(_viewInfo,"objectAtIndex:",i);
objj_msgSend(_vManager,"setMinimumLength:alignment:minBorder:maxBorder:span:ofSegmentAtIndex:inLine:",(_1f._minimumSize).height,_1f._vAlignment,_1f._vBorder,_1f._vBorder,1,0,_1f._column);
objj_msgSend(_vManager,"updateLayout");
}
}),new objj_method(sel_getUid("addView:"),function(_20,_21,_22){
with(_20){
var _23=objj_msgSend(_viewInfo,"count");
var _24;
var _25=objj_msgSend(_vManager,"addLine");
_24=objj_msgSend(objj_msgSend(GSAutoLayoutHBoxViewInfo,"alloc"),"initWithView:column:",_22,_25);
_24._minimumSize=objj_msgSend(_22,"frame").size;
_24._hAlignment=objj_msgSend(_22,"autolayoutDefaultHorizontalAlignment");
_24._vAlignment=objj_msgSend(_22,"autolayoutDefaultVerticalAlignment");
_24._hBorder=objj_msgSend(_22,"autolayoutDefaultHorizontalBorder");
_24._vBorder=objj_msgSend(_22,"autolayoutDefaultVerticalBorder");
_24._proportion=1;
if(_24._hAlignment==GSAutoLayoutExpand){
_hExpand=YES;
}
if(_24._hAlignment==GSAutoLayoutWeakExpand){
_hWeakExpand=YES;
}
if(_24._vAlignment==GSAutoLayoutExpand){
_vExpand=YES;
}
if(_24._vAlignment==GSAutoLayoutWeakExpand){
_vWeakExpand=YES;
}
objj_msgSend(_viewInfo,"addObject:",_24);
objj_msgSend(_20,"addSubview:",_22);
objj_msgSend(_vManager,"insertNewSegmentAtIndex:inLine:",0,_25);
objj_msgSend(_20,"pushToVManagerInfoForViewAtIndex:",_23);
objj_msgSend(_hManager,"insertNewSegmentAtIndex:inLine:",_23,_line);
objj_msgSend(_20,"pushToHManagerInfoForViewAtIndex:",_23);
}
}),new objj_method(sel_getUid("removeView:"),function(_26,_27,_28){
with(_26){
var _29=objj_msgSend(_26,"infoForView:",_28);
var _2a=objj_msgSend(_viewInfo,"indexOfObject:",_29);
objj_msgSend(_vManager,"removeSegmentAtIndex:inLine:",0,_29._column);
objj_msgSend(_vManager,"removeLine:",_29._column);
objj_msgSend(_hManager,"removeInformationOnLinePartAtIndex:",_2a);
objj_msgSend(_hManager,"removeSegmentAtIndex:inLine:",_2a,_line);
objj_msgSend(_viewInfo,"removeObject:",_29);
var i,_2b=objj_msgSend(_viewInfo,"count");
_vExpand=NO;
_vWeakExpand=NO;
_hExpand=NO;
_hWeakExpand=NO;
for(i=0;i<_2b;i++){
_29=objj_msgSend(_viewInfo,"objectAtIndex:",i);
if(_29._vAlignment==GSAutoLayoutExpand){
_vExpand=YES;
}
if(_29._vAlignment==GSAutoLayoutWeakExpand){
_vWeakExpand=YES;
}
if(_29._hAlignment==GSAutoLayoutExpand){
_hExpand=YES;
}
if(_29._hAlignment==GSAutoLayoutWeakExpand){
_hWeakExpand=YES;
}
}
objj_msgSend(_28,"removeFromSuperview");
objj_msgSend(_vManager,"updateLayout");
objj_msgSend(_hManager,"updateLayout");
}
}),new objj_method(sel_getUid("autoLayoutManagerChangedVLayout:"),function(_2c,_2d,_2e){
with(_2c){
var _2f;
var i,_30;
if(objj_msgSend(_2e,"object")!=_vManager){
return;
}
_2f=objj_msgSend(_vManager,"lineLength");
objj_msgSendSuper({receiver:_2c,super_class:objj_getClass("GSAutoLayoutHBox").super_class},"setFrameSize:",CPMakeSize((objj_msgSend(_2c,"frame")).size.width,_2f));
_30=objj_msgSend(_viewInfo,"count");
for(i=0;i<_30;i++){
var s;
var _31;
var _32;
_31=objj_msgSend(_viewInfo,"objectAtIndex:",i);
s=objj_msgSend(_vManager,"layoutOfSegmentAtIndex:inLine:",0,_31._column);
_32=objj_msgSend(_31._view,"frame");
_32.origin.y=s.position;
_32.size.height=s.length;
objj_msgSend(_31._view,"setFrame:",_32);
}
}
}),new objj_method(sel_getUid("autoLayoutManagerChangedHLayout:"),function(_33,_34,_35){
with(_33){
var _36;
var i,_37;
if(objj_msgSend(_35,"object")!=_hManager){
return;
}
_36=objj_msgSend(_hManager,"lineLength");
objj_msgSendSuper({receiver:_33,super_class:objj_getClass("GSAutoLayoutHBox").super_class},"setFrameSize:",CPMakeSize(_36,(objj_msgSend(_33,"frame").size).height));
_37=objj_msgSend(_viewInfo,"count");
for(i=0;i<_37;i++){
var s;
var _38;
var _39;
_38=objj_msgSend(_viewInfo,"objectAtIndex:",i);
s=objj_msgSend(_hManager,"layoutOfSegmentAtIndex:inLine:",i,_line);
_39=objj_msgSend(_38._view,"frame");
_39.origin.x=s.position;
_39.size.width=s.length;
objj_msgSend(_38._view,"setFrame:",_39);
}
}
}),new objj_method(sel_getUid("numberOfViews"),function(_3a,_3b){
with(_3a){
return objj_msgSend(_viewInfo,"count");
}
}),new objj_method(sel_getUid("setFrame:"),function(_3c,_3d,_3e){
with(_3c){
if(CPEqualRects(objj_msgSend(_3c,"frame"),_3e)){
return;
}
objj_msgSendSuper({receiver:_3c,super_class:objj_getClass("GSAutoLayoutHBox").super_class},"setFrame:",_3e);
if(objj_msgSend(_viewInfo,"count")>0){
var _3f;
_3f=objj_msgSend(_viewInfo,"objectAtIndex:",0);
objj_msgSend(_vManager,"forceLength:ofLine:",_3e.size.height,_3f._column);
objj_msgSend(_vManager,"updateLayout");
}else{
}
objj_msgSend(_hManager,"forceLength:ofLine:",_3e.size.width,_line);
objj_msgSend(_hManager,"updateLayout");
}
}),new objj_method(sel_getUid("setFrameSize:"),function(_40,_41,_42){
with(_40){
var _43=objj_msgSend(_40,"frame").size;
if(_43.width==_42.width&&_43.height==_42.height){
return;
}
objj_msgSendSuper({receiver:_40,super_class:objj_getClass("GSAutoLayoutHBox").super_class},"setFrameSize:",_42);
if(objj_msgSend(_viewInfo,"count")>0){
var _44;
_44=objj_msgSend(_viewInfo,"objectAtIndex:",0);
objj_msgSend(_vManager,"forceLength:ofLine:",_42.height,_44._column);
objj_msgSend(_vManager,"updateLayout");
}else{
}
objj_msgSend(_hManager,"forceLength:ofLine:",_42.width,_line);
objj_msgSend(_hManager,"updateLayout");
}
}),new objj_method(sel_getUid("setMinimumSize:forView:"),function(_45,_46,_47,_48){
with(_45){
var _49=objj_msgSend(_45,"infoForView:",_48);
var _4a=objj_msgSend(_viewInfo,"indexOfObject:",_49);
_49._minimumSize=_47;
objj_msgSend(_45,"pushToHManagerInfoForViewAtIndex:",_4a);
objj_msgSend(_45,"pushToVManagerInfoForViewAtIndex:",_4a);
}
}),new objj_method(sel_getUid("minimumSizeForView:"),function(_4b,_4c,_4d){
with(_4b){
var _4e=objj_msgSend(_4b,"infoForView:",_4d);
return _4e._minimumSize;
}
}),new objj_method(sel_getUid("setHorizontalAlignment:forView:"),function(_4f,_50,_51,_52){
with(_4f){
var _53=objj_msgSend(_4f,"infoForView:",_52);
var _54=objj_msgSend(_viewInfo,"indexOfObject:",_53);
var i,_55;
_53._hAlignment=_51;
_hExpand=NO;
_hWeakExpand=NO;
_55=objj_msgSend(_viewInfo,"count");
for(i=0;i<_55;i++){
_53=objj_msgSend(_viewInfo,"objectAtIndex:",i);
if(_53._hAlignment==GSAutoLayoutExpand){
_hExpand=YES;
}
if(_53._hAlignment==GSAutoLayoutWeakExpand){
_hWeakExpand=YES;
}
}
objj_msgSend(_4f,"pushToHManagerInfoForViewAtIndex:",_54);
}
}),new objj_method(sel_getUid("horizontalAlignmentForView:"),function(_56,_57,_58){
with(_56){
var _59=objj_msgSend(_56,"infoForView:",_58);
return _59._hAlignment;
}
}),new objj_method(sel_getUid("setVerticalAlignment:forView:"),function(_5a,_5b,_5c,_5d){
with(_5a){
var _5e=objj_msgSend(_5a,"infoForView:",_5d);
var _5f=objj_msgSend(_viewInfo,"indexOfObject:",_5e);
var i,_60;
_5e._vAlignment=_5c;
_vExpand=NO;
_vWeakExpand=NO;
_60=objj_msgSend(_viewInfo,"count");
for(i=0;i<_60;i++){
_5e=objj_msgSend(_viewInfo,"objectAtIndex:",i);
if(_5e._vAlignment==GSAutoLayoutExpand){
_vExpand=YES;
}
if(_5e._vAlignment==GSAutoLayoutWeakExpand){
_vWeakExpand=YES;
}
}
objj_msgSend(_5a,"pushToVManagerInfoForViewAtIndex:",_5f);
}
}),new objj_method(sel_getUid("verticalAlignmentForView:"),function(_61,_62,_63){
with(_61){
var _64=objj_msgSend(_61,"infoForView:",_63);
return _64._vAlignment;
}
}),new objj_method(sel_getUid("setHorizontalBorder:forView:"),function(_65,_66,_67,_68){
with(_65){
var _69=objj_msgSend(_65,"infoForView:",_68);
var _6a=objj_msgSend(_viewInfo,"indexOfObject:",_69);
_69._hBorder=_67;
objj_msgSend(_65,"pushToHManagerInfoForViewAtIndex:",_6a);
}
}),new objj_method(sel_getUid("horizontalBorderForView:"),function(_6b,_6c,_6d){
with(_6b){
var _6e=objj_msgSend(_6b,"infoForView:",_6d);
return _6e._hBorder;
}
}),new objj_method(sel_getUid("setVerticalBorder:forView:"),function(_6f,_70,_71,_72){
with(_6f){
var _73=objj_msgSend(_6f,"infoForView:",_72);
var _74=objj_msgSend(_viewInfo,"indexOfObject:",_73);
_73._vBorder=_71;
objj_msgSend(_6f,"pushToVManagerInfoForViewAtIndex:",_74);
}
}),new objj_method(sel_getUid("verticalBorderForView:"),function(_75,_76,_77){
with(_75){
var _78=objj_msgSend(_75,"infoForView:",_77);
return _78._vBorder;
}
}),new objj_method(sel_getUid("setProportion:forView:"),function(_79,_7a,_7b,_7c){
with(_79){
var _7d=objj_msgSend(_79,"infoForView:",_7c);
var _7e=objj_msgSend(_viewInfo,"indexOfObject:",_7d);
_7d._proportion=_7b;
objj_msgSend(_79,"pushToHManagerInfoForViewAtIndex:",_7e);
}
}),new objj_method(sel_getUid("proportionForView:"),function(_7f,_80,_81){
with(_7f){
var _82=objj_msgSend(_7f,"infoForView:",_81);
return _82._proportion;
}
}),new objj_method(sel_getUid("autolayoutDefaultHorizontalAlignment"),function(_83,_84){
with(_83){
if(_hExpand){
return GSAutoLayoutExpand;
}else{
if(_hWeakExpand){
return GSAutoLayoutWeakExpand;
}else{
return GSAutoLayoutAlignCenter;
}
}
}
}),new objj_method(sel_getUid("autolayoutDefaultVerticalAlignment"),function(_85,_86){
with(_85){
if(_vExpand){
return GSAutoLayoutExpand;
}else{
if(_vWeakExpand){
return GSAutoLayoutWeakExpand;
}else{
return GSAutoLayoutAlignCenter;
}
}
}
}),new objj_method(sel_getUid("autolayoutDefaultHorizontalBorder"),function(_87,_88){
with(_87){
return 0;
}
}),new objj_method(sel_getUid("autolayoutDefaultVerticalBorder"),function(_89,_8a){
with(_89){
return 0;
}
}),new objj_method(sel_getUid("sizeToFitContent"),function(_8b,_8c){
with(_8b){
objj_msgSend(_8b,"setFrameSize:",objj_msgSend(_8b,"minimumSizeForContent"));
}
}),new objj_method(sel_getUid("minimumSizeForContent"),function(_8d,_8e){
with(_8d){
var _8f={height:objj_msgSend(_vManager,"minimumLineLength"),width:objj_msgSend(_hManager,"minimumLineLength")};
return _8f;
}
}),new objj_method(sel_getUid("setDisplayAutoLayoutContainers:"),function(_90,_91,_92){
with(_90){
objj_msgSendSuper({receiver:_90,super_class:objj_getClass("GSAutoLayoutHBox").super_class},"setDisplayAutoLayoutContainers:",_92);
_displayAutoLayoutContainers=_92;
objj_msgSend(_90,"setNeedsDisplay:",YES);
}
}),new objj_method(sel_getUid("drawRect:"),function(_93,_94,_95){
with(_93){
if(_displayAutoLayoutContainers){
var _96=objj_msgSend(_93,"bounds");
objj_msgSend(objj_msgSend(CPColor,"redColor"),"set");
CPFrameRect(_96);
var i,_97=objj_msgSend(_hManager,"linePartCount");
for(i=0;i<_97;i++){
var s;
s=objj_msgSend(_hManager,"layoutOfLinePartAtIndex:",i);
if(i>0){
var _98;
var _99=new Array(1,2);
_98=objj_msgSend(CPBezierPath,"bezierPath");
objj_msgSend(_98,"setLineDash:count:phase:",_99,2,0);
objj_msgSend(_98,"moveToPoint:",CPMakePoint(s.position,CPMinY(_96)));
objj_msgSend(_98,"lineToPoint:",CPMakePoint(s.position,CPMaxY(_96)));
objj_msgSend(_98,"stroke");
}
}
}
}
})]);
p;43;Frameworks/Renaissance/GSAutoLayoutHSpace.jt;350;@STATIC;1.0;i;19;GSAutoLayoutSpace.jt;308;
objj_executeFile("GSAutoLayoutSpace.j",YES);
var _1=objj_allocateClassPair(GSAutoLayoutSpace,"GSAutoLayoutHSpace"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("autolayoutDefaultVerticalAlignment"),function(_3,_4){
with(_3){
return GSAutoLayoutAlignCenter;
}
})]);
p;44;Frameworks/Renaissance/GSAutoLayoutManager.jt;12314;@STATIC;1.0;t;12294;
GSAutoLayoutManagerChangedLayoutNotification="GSAutoLayoutManagerChangedLayoutNotification";
GSAutoLayoutStandardBox=0;
GSAutoLayoutProportionalBox=1;
CPOtherMouseDraggedMask=(1<<CPOtherMouseDragged);
CPZeroRect=CPMakeRect(0,0,0,0);
CPEqualRects=function(_1,_2){
if(_1.origin.x!=_2.origin.x||_1.origin.y!=_2.origin.y||_1.size.width!=_2.size.width||_1.size.height!=_2.size.height){
return NO;
}
return YES;
};
var _3=objj_allocateClassPair(CPObject,"GSAutoLayoutManagerSegment"),_4=_3.isa;
class_addIvars(_3,[new objj_ivar("_minimumContentsLength"),new objj_ivar("_minBorder"),new objj_ivar("_maxBorder"),new objj_ivar("_alignment"),new objj_ivar("_linePart"),new objj_ivar("_span"),new objj_ivar("_minimumLayout"),new objj_ivar("_layout"),new objj_ivar("_contentsLayout")]);
objj_registerClassPair(_3);
class_addMethods(_3,[new objj_method(sel_getUid("init"),function(_5,_6){
with(_5){
_minimumLayout={position:0,length:0};
_layout={position:0,length:0};
_contentsLayout={position:0,length:0};
_span=1;
return _5;
}
})]);
var _3=objj_allocateClassPair(CPObject,"GSAutoLayoutManagerLinePartInformation"),_4=_3.isa;
class_addIvars(_3,[new objj_ivar("_minimumLength"),new objj_ivar("_proportion"),new objj_ivar("_alwaysExpands"),new objj_ivar("_neverExpands")]);
objj_registerClassPair(_3);
class_addMethods(_3,[new objj_method(sel_getUid("init"),function(_7,_8){
with(_7){
return _7;
}
})]);
var _3=objj_allocateClassPair(CPObject,"GSAutoLayoutManagerLinePart"),_4=_3.isa;
class_addIvars(_3,[new objj_ivar("_info"),new objj_ivar("_expands"),new objj_ivar("_proportion"),new objj_ivar("_minimumLayout"),new objj_ivar("_layout")]);
objj_registerClassPair(_3);
class_addMethods(_3,[new objj_method(sel_getUid("initWithInfo:"),function(_9,_a,_b){
with(_9){
_minimumLayout={position:0,length:0};
_layout={position:0,length:0};
_info=_b;
return _9;
}
})]);
var _3=objj_allocateClassPair(CPObject,"GSAutoLayoutManagerLine"),_4=_3.isa;
class_addIvars(_3,[new objj_ivar("_forcedLength"),new objj_ivar("_segments")]);
objj_registerClassPair(_3);
class_addMethods(_3,[new objj_method(sel_getUid("init"),function(_c,_d){
with(_c){
_segments=objj_msgSend(CPMutableArray,"new");
_forcedLength=-1;
return _c;
}
}),new objj_method(sel_getUid("dealloc"),function(_e,_f){
with(_e){
objj_msgSendSuper({receiver:_e,super_class:objj_getClass("GSAutoLayoutManagerLine").super_class},"dealloc");
}
})]);
var _3=objj_allocateClassPair(CPObject,"GSAutoLayoutManager"),_4=_3.isa;
class_addIvars(_3,[new objj_ivar("_lines"),new objj_ivar("_linePartInformation"),new objj_ivar("_lineParts"),new objj_ivar("_minimumLength"),new objj_ivar("_length"),new objj_ivar("_needsUpdateMinimumLayout"),new objj_ivar("_needsUpdateLayout")]);
objj_registerClassPair(_3);
class_addMethods(_3,[new objj_method(sel_getUid("init"),function(_10,_11){
with(_10){
_lines=objj_msgSend(CPMutableSet,"new");
_linePartInformation=objj_msgSend(CPMutableDictionary,"new");
_lineParts=objj_msgSend(CPMutableArray,"new");
return _10;
}
}),new objj_method(sel_getUid("dealloc"),function(_12,_13){
with(_12){
objj_msgSendSuper({receiver:_12,super_class:objj_getClass("GSAutoLayoutManager").super_class},"dealloc");
}
}),new objj_method(sel_getUid("updateLayout"),function(_14,_15){
with(_14){
if(_needsUpdateMinimumLayout){
if(objj_msgSend(_14,"internalUpdateMinimumLayout")){
_needsUpdateLayout=YES;
}
_needsUpdateMinimumLayout=NO;
}
if(_needsUpdateLayout){
var e=objj_msgSend(_lines,"objectEnumerator");
var _16;
_length=-1;
while((_16=objj_msgSend(e,"nextObject"))!=nil){
var _17=_16._forcedLength;
if(_17<0){
}else{
if(_length<0){
_length=_17;
}else{
_length=min(_17,_length);
}
}
}
if(_length<0){
_length=_minimumLength;
}
if(objj_msgSend(_14,"internalUpdateLayout")){
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:userInfo:",GSAutoLayoutManagerChangedLayoutNotification,_14,nil);
}
_needsUpdateLayout=NO;
}
}
}),new objj_method(sel_getUid("internalUpdateLineParts"),function(_18,_19){
with(_18){
var e=objj_msgSend(_lines,"objectEnumerator");
var _1a;
var i,_1b=0;
objj_msgSend(_lineParts,"removeAllObjects");
while((_1a=objj_msgSend(e,"nextObject"))!=nil){
var _1c=0;
var _1d=objj_msgSend(_1a._segments,"count");
for(i=0;i<_1d;i++){
var _1e;
_1e=objj_msgSend(_1a._segments,"objectAtIndex:",i);
_1e._linePart=_1c;
_1c+=_1e._span;
}
_1b=Math.max(_1c,_1b);
}
for(i=0;i<_1b;i++){
var _1f;
var _20;
_20=objj_msgSend(_linePartInformation,"objectForKey:",objj_msgSend(CPNumber,"numberWithInt:",i));
_1f=objj_msgSend(objj_msgSend(GSAutoLayoutManagerLinePart,"alloc"),"initWithInfo:",_20);
objj_msgSend(_lineParts,"addObject:",_1f);
}
}
}),new objj_method(sel_getUid("internalUpdateSegmentsMinimumLayoutFromLineParts"),function(_21,_22){
with(_21){
var e=objj_msgSend(_lines,"objectEnumerator");
var _23;
e=objj_msgSend(_lines,"objectEnumerator");
while((_23=objj_msgSend(e,"nextObject"))!=nil){
var i,_24=objj_msgSend(_23._segments,"count");
for(i=0;i<_24;i++){
var _25;
var j;
_25=objj_msgSend(_23._segments,"objectAtIndex:",i);
(_25._minimumLayout).length=0;
for(j=0;j<_25._span;j++){
var _26;
_26=objj_msgSend(_lineParts,"objectAtIndex:",_25._linePart+j);
if(j==0){
(_25._minimumLayout).position=(_26._minimumLayout).position;
}
(_25._minimumLayout).length+=(_26._minimumLayout).length;
}
}
}
}
}),new objj_method(sel_getUid("internalUpdateSegmentsLayoutFromLineParts"),function(_27,_28){
with(_27){
var e=objj_msgSend(_lines,"objectEnumerator");
var _29;
e=objj_msgSend(_lines,"objectEnumerator");
while((_29=objj_msgSend(e,"nextObject"))!=nil){
var i,_2a=objj_msgSend(_29._segments,"count");
for(i=0;i<_2a;i++){
var _2b;
var j;
_2b=objj_msgSend(_29._segments,"objectAtIndex:",i);
(_2b._layout).length=0;
for(j=0;j<_2b._span;j++){
var _2c;
_2c=objj_msgSend(_lineParts,"objectAtIndex:",_2b._linePart+j);
if(j==0){
(_2b._layout).position=(_2c._layout).position;
}
(_2b._layout).length+=(_2c._layout).length;
}
var s=_2b._layout;
switch(_2b._alignment){
case GSAutoLayoutExpand:
case GSAutoLayoutWeakExpand:
s.position+=_2b._minBorder;
s.length-=_2b._minBorder+_2b._maxBorder;
break;
case GSAutoLayoutAlignMin:
s.position+=_2b._minBorder;
s.length=_2b._minimumContentsLength;
break;
case GSAutoLayoutAlignMax:
s.position+=s.length-_2b._maxBorder-_2b._minimumContentsLength;
s.length=_2b._minimumContentsLength;
break;
case GSAutoLayoutAlignCenter:
default:
s.position+=((s.length-_2b._minimumContentsLength)/2);
s.length=_2b._minimumContentsLength;
break;
}
_2b._contentsLayout=s;
}
}
}
}),new objj_method(sel_getUid("internalUpdateMinimumLayout"),function(_2d,_2e){
with(_2d){
return NO;
}
}),new objj_method(sel_getUid("internalUpdateLayout"),function(_2f,_30){
with(_2f){
return NO;
}
}),new objj_method(sel_getUid("addLine"),function(_31,_32){
with(_31){
var _33;
_33=objj_msgSend(GSAutoLayoutManagerLine,"new");
objj_msgSend(_lines,"addObject:",_33);
_needsUpdateMinimumLayout=YES;
_needsUpdateLayout=YES;
return _33;
}
}),new objj_method(sel_getUid("removeLine:"),function(_34,_35,_36){
with(_34){
objj_msgSend(_lines,"removeObject:",_36);
_needsUpdateMinimumLayout=YES;
_needsUpdateLayout=YES;
}
}),new objj_method(sel_getUid("forceLength:ofLine:"),function(_37,_38,_39,_3a){
with(_37){
var l=_3a;
if(l._forcedLength!=_39){
_needsUpdateLayout=YES;
l._forcedLength=_39;
}
}
}),new objj_method(sel_getUid("insertNewSegmentAtIndex:inLine:"),function(_3b,_3c,_3d,_3e){
with(_3b){
var s;
var l=_3e;
s=objj_msgSend(GSAutoLayoutManagerSegment,"new");
objj_msgSend(l._segments,"insertObject:atIndex:",s,_3d);
_needsUpdateMinimumLayout=YES;
_needsUpdateLayout=YES;
}
}),new objj_method(sel_getUid("removeSegmentAtIndex:inLine:"),function(_3f,_40,_41,_42){
with(_3f){
var l=_42;
objj_msgSend(l._segments,"removeObjectAtIndex:",_41);
_needsUpdateMinimumLayout=YES;
_needsUpdateLayout=YES;
}
}),new objj_method(sel_getUid("segmentCountInLine:"),function(_43,_44,_45){
with(_43){
var l=_45;
return objj_msgSend(l._segments,"count");
}
}),new objj_method(sel_getUid("linePartCount"),function(_46,_47){
with(_46){
return objj_msgSend(_lineParts,"count");
}
}),new objj_method(sel_getUid("linePartCountInLine:"),function(_48,_49,_4a){
with(_48){
var l=_4a;
var _4b=0;
var i,_4c=objj_msgSend(l._segments,"count");
for(i=0;i<_4c;i++){
var _4d=objj_msgSend(l._segments,"objectAtIndex:",i);
_4b+=_4d._span;
}
return _4b;
}
}),new objj_method(sel_getUid("setMinimumLength:alignment:minBorder:maxBorder:span:ofSegmentAtIndex:inLine:"),function(_4e,_4f,min,_50,_51,_52,_53,_54,_55){
with(_4e){
var l=_55;
var s=objj_msgSend(l._segments,"objectAtIndex:",_54);
if(s._minimumContentsLength!=min){
s._minimumContentsLength=min;
_needsUpdateMinimumLayout=YES;
}
if(s._alignment!=_50){
s._alignment=_50;
_needsUpdateMinimumLayout=YES;
}
if(s._minBorder!=_51){
s._minBorder=_51;
_needsUpdateMinimumLayout=YES;
}
if(s._maxBorder!=_52){
s._maxBorder=_52;
_needsUpdateMinimumLayout=YES;
}
if(s._span!=_53){
if(_53>0){
s._span=_53;
_needsUpdateMinimumLayout=YES;
}else{
CPLog("GSAutoLayoutManager: Warning, segment has non-positive span %d.  Ignored",_53);
}
}
}
}),new objj_method(sel_getUid("minimumLengthOfSegmentAtIndex:inLine:"),function(_56,_57,_58,_59){
with(_56){
var l=_59;
var s=objj_msgSend(l._segments,"objectAtIndex:",_58);
return s._minimumContentsLength;
}
}),new objj_method(sel_getUid("alignmentOfSegmentAtIndex:inLine:"),function(_5a,_5b,_5c,_5d){
with(_5a){
var l=_5d;
var s=objj_msgSend(l._segments,"objectAtIndex:",_5c);
return s._alignment;
}
}),new objj_method(sel_getUid("minBorderOfSegmentAtIndex:inLine:"),function(_5e,_5f,_60,_61){
with(_5e){
var l=_61;
var s=objj_msgSend(l._segments,"objectAtIndex:",_60);
return s._minBorder;
}
}),new objj_method(sel_getUid("maxBorderOfSegmentAtIndex:inLine:"),function(_62,_63,_64,_65){
with(_62){
var l=_65;
var s=objj_msgSend(l._segments,"objectAtIndex:",_64);
return s._maxBorder;
}
}),new objj_method(sel_getUid("spanOfSegmentAtIndex:inLine:"),function(_66,_67,_68,_69){
with(_66){
var l=_69;
var s=objj_msgSend(l._segments,"objectAtIndex:",_68);
return s._span;
}
}),new objj_method(sel_getUid("setMinimumLength:alwaysExpands:neverExpands:proportion:ofLinePartAtIndex:"),function(_6a,_6b,min,_6c,_6d,_6e,_6f){
with(_6a){
var _70=objj_msgSend(GSAutoLayoutManagerLinePartInformation,"new");
_70._minimumLength=min;
_70._alwaysExpands=_6c;
_70._neverExpands=_6d;
_70._proportion=_6e;
objj_msgSend(_linePartInformation,"setObject:forKey:",_70,objj_msgSend(CPNumber,"numberWithInt:",_6f));
_needsUpdateMinimumLayout=YES;
}
}),new objj_method(sel_getUid("proportionOfLinePartAtIndex:"),function(_71,_72,_73){
with(_71){
var _74;
_74=objj_msgSend(_linePartInformation,"objectForKey:",objj_msgSend(CPNumber,"numberWithInt:",_73));
if(_74==nil){
return 1;
}else{
return _74._proportion;
}
}
}),new objj_method(sel_getUid("minimumLengthOfLinePartAtIndex:"),function(_75,_76,_77){
with(_75){
var _78;
_78=objj_msgSend(_linePartInformation,"objectForKey:",objj_msgSend(CPNumber,"numberWithInt:",_77));
if(_78==nil){
return 0;
}else{
return _78._minimumLength;
}
}
}),new objj_method(sel_getUid("alwaysExpandsOfLinePartAtIndex:"),function(_79,_7a,_7b){
with(_79){
var _7c;
_7c=objj_msgSend(_linePartInformation,"objectForKey:",objj_msgSend(CPNumber,"numberWithInt:",_7b));
if(_7c==nil){
return NO;
}else{
return _7c._alwaysExpands;
}
}
}),new objj_method(sel_getUid("neverExpandsOfLinePartAtIndex:"),function(_7d,_7e,_7f){
with(_7d){
var _80;
_80=objj_msgSend(_linePartInformation,"objectForKey:",objj_msgSend(CPNumber,"numberWithInt:",_7f));
if(_80==nil){
return NO;
}else{
return _80._neverExpands;
}
}
}),new objj_method(sel_getUid("removeInformationOnLinePartAtIndex:"),function(_81,_82,_83){
with(_81){
objj_msgSend(_linePartInformation,"removeObjectForKey:",objj_msgSend(CPNumber,"numberWithInt:",_83));
}
}),new objj_method(sel_getUid("lineLength"),function(_84,_85){
with(_84){
return _length;
}
}),new objj_method(sel_getUid("layoutOfSegmentAtIndex:inLine:"),function(_86,_87,_88,_89){
with(_86){
var l=_89;
var s=objj_msgSend(l._segments,"objectAtIndex:",_88);
return s._contentsLayout;
}
}),new objj_method(sel_getUid("layoutOfLinePartAtIndex:"),function(_8a,_8b,_8c){
with(_8a){
var l=objj_msgSend(_lineParts,"objectAtIndex:",_8c);
return l._layout;
}
}),new objj_method(sel_getUid("minimumLineLength"),function(_8d,_8e){
with(_8d){
return _minimumLength;
}
})]);
p;56;Frameworks/Renaissance/GSAutoLayoutProportionalManager.jt;2519;@STATIC;1.0;t;2500;
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
p;42;Frameworks/Renaissance/GSAutoLayoutSpace.jt;905;@STATIC;1.0;I;15;AppKit/CPView.jt;867;
objj_executeFile("AppKit/CPView.j",NO);
var _1=objj_allocateClassPair(CPView,"GSAutoLayoutSpace"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("autolayoutDefaultHorizontalAlignment"),function(_3,_4){
with(_3){
return GSAutoLayoutWeakExpand;
}
}),new objj_method(sel_getUid("autolayoutDefaultVerticalAlignment"),function(_5,_6){
with(_5){
return GSAutoLayoutWeakExpand;
}
}),new objj_method(sel_getUid("autolayoutDefaultHorizontalBorder"),function(_7,_8){
with(_7){
return 0;
}
}),new objj_method(sel_getUid("autolayoutDefaultVerticalBorder"),function(_9,_a){
with(_9){
return 0;
}
}),new objj_method(sel_getUid("sizeToFitContent"),function(_b,_c){
with(_b){
objj_msgSend(_b,"setFrameSize:",CPMakeSize(0,0));
}
}),new objj_method(sel_getUid("minimumSizeForContent"),function(_d,_e){
with(_d){
return CPMakeSize(0,0);
}
})]);
p;52;Frameworks/Renaissance/GSAutoLayoutStandardManager.jt;4079;@STATIC;1.0;i;21;GSAutoLayoutManager.jt;4034;
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
p;41;Frameworks/Renaissance/GSAutoLayoutVBox.jt;14410;@STATIC;1.0;i;21;GSAutoLayoutManager.ji;29;GSAutoLayoutStandardManager.ji;33;GSAutoLayoutProportionalManager.jt;14292;
objj_executeFile("GSAutoLayoutManager.j",YES);
objj_executeFile("GSAutoLayoutStandardManager.j",YES);
objj_executeFile("GSAutoLayoutProportionalManager.j",YES);
var _1=objj_allocateClassPair(CPObject,"GSAutoLayoutVBoxViewInfo"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_view"),new objj_ivar("_minimumSize"),new objj_ivar("_hAlignment"),new objj_ivar("_vAlignment"),new objj_ivar("_hBorder"),new objj_ivar("_vBorder"),new objj_ivar("_proportion"),new objj_ivar("_column")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initWithView:column:"),function(_3,_4,_5,_6){
with(_3){
_view=_5;
_column=_6;
return _3;
}
})]);
var _1=objj_allocateClassPair(CPView,"GSAutoLayoutVBox"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_viewInfo"),new objj_ivar("_hExpand"),new objj_ivar("_hWeakExpand"),new objj_ivar("_vExpand"),new objj_ivar("_vWeakExpand"),new objj_ivar("_hManager"),new objj_ivar("_vManager"),new objj_ivar("_line"),new objj_ivar("_displayAutoLayoutContainers")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("init"),function(_7,_8){
with(_7){
var _9;
_7=objj_msgSendSuper({receiver:_7,super_class:objj_getClass("GSAutoLayoutVBox").super_class},"initWithFrame:",CPZeroRect);
objj_msgSend(_7,"setAutoresizesSubviews:",NO);
objj_msgSend(_7,"setAutoresizingMask:",CPViewWidthSizable|CPViewHeightSizable);
_viewInfo=objj_msgSend(CPMutableArray,"new");
_9=objj_msgSend(GSAutoLayoutStandardManager,"new");
objj_msgSend(_7,"setAutoLayoutManager:",_9);
_hManager=objj_msgSend(GSAutoLayoutStandardManager,"new");
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"addObserver:selector:name:object:",_7,sel_getUid("autoLayoutManagerChangedHLayout:"),GSAutoLayoutManagerChangedLayoutNotification,_hManager);
return _7;
}
}),new objj_method(sel_getUid("setBoxType:"),function(_a,_b,_c){
with(_a){
if(_c!=objj_msgSend(_a,"boxType")){
var _d=nil;
if(_c==GSAutoLayoutProportionalBox){
_d=objj_msgSend(GSAutoLayoutProportionalManager,"new");
}else{
_d=objj_msgSend(GSAutoLayoutStandardManager,"new");
}
objj_msgSend(_a,"setAutoLayoutManager:",_d);
}
}
}),new objj_method(sel_getUid("boxType"),function(_e,_f){
with(_e){
if(objj_msgSend(_hManager,"isKindOfClass:",objj_msgSend(GSAutoLayoutProportionalManager,"class"))){
return GSAutoLayoutProportionalBox;
}else{
return GSAutoLayoutStandardBox;
}
}
}),new objj_method(sel_getUid("setAutoLayoutManager:"),function(_10,_11,_12){
with(_10){
_vManager=_12;
_line=objj_msgSend(_vManager,"addLine");
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"addObserver:selector:name:object:",_10,sel_getUid("autoLayoutManagerChangedVLayout:"),GSAutoLayoutManagerChangedLayoutNotification,_vManager);
}
}),new objj_method(sel_getUid("autoLayoutManager"),function(_13,_14){
with(_13){
return _vManager;
}
}),new objj_method(sel_getUid("infoForView:"),function(_15,_16,_17){
with(_15){
var i,_18=objj_msgSend(_viewInfo,"count");
for(i=0;i<_18;i++){
var _19=objj_msgSend(_viewInfo,"objectAtIndex:",i);
if(_19._view==_17){
return _19;
}
}
return nil;
}
}),new objj_method(sel_getUid("pushToHManagerInfoForViewAtIndex:"),function(_1a,_1b,i){
with(_1a){
var _1c=objj_msgSend(_viewInfo,"objectAtIndex:",i);
objj_msgSend(_hManager,"setMinimumLength:alignment:minBorder:maxBorder:span:ofSegmentAtIndex:inLine:",(_1c._minimumSize).width,_1c._hAlignment,_1c._hBorder,_1c._hBorder,1,0,_1c._column);
objj_msgSend(_hManager,"updateLayout");
}
}),new objj_method(sel_getUid("pushToVManagerInfoForViewAtIndex:"),function(_1d,_1e,i){
with(_1d){
var _1f=objj_msgSend(_viewInfo,"objectAtIndex:",i);
objj_msgSend(_vManager,"setMinimumLength:alignment:minBorder:maxBorder:span:ofSegmentAtIndex:inLine:",(_1f._minimumSize).height,_1f._vAlignment,_1f._vBorder,_1f._vBorder,1,i,_line);
if(_1f._proportion!=1){
objj_msgSend(_vManager,"setMinimumLength:alwaysExpands:neverExpands:proportion:ofLinePartAtIndex:",0,NO,NO,_1f._proportion,i);
}else{
objj_msgSend(_vManager,"removeInformationOnLinePartAtIndex:",i);
}
objj_msgSend(_vManager,"updateLayout");
}
}),new objj_method(sel_getUid("addView:"),function(_20,_21,_22){
with(_20){
var _23=objj_msgSend(_viewInfo,"count");
var _24;
var _25=objj_msgSend(_hManager,"addLine");
_24=objj_msgSend(objj_msgSend(GSAutoLayoutVBoxViewInfo,"alloc"),"initWithView:column:",_22,_25);
_24._minimumSize=objj_msgSend(_22,"frame").size;
_24._hAlignment=objj_msgSend(_22,"autolayoutDefaultHorizontalAlignment");
_24._vAlignment=objj_msgSend(_22,"autolayoutDefaultVerticalAlignment");
_24._hBorder=objj_msgSend(_22,"autolayoutDefaultHorizontalBorder");
_24._vBorder=objj_msgSend(_22,"autolayoutDefaultVerticalBorder");
_24._proportion=1;
if(_24._hAlignment==GSAutoLayoutExpand){
_hExpand=YES;
}
if(_24._hAlignment==GSAutoLayoutWeakExpand){
_hWeakExpand=YES;
}
if(_24._vAlignment==GSAutoLayoutExpand){
_vExpand=YES;
}
if(_24._vAlignment==GSAutoLayoutWeakExpand){
_vWeakExpand=YES;
}
objj_msgSend(_viewInfo,"addObject:",_24);
objj_msgSend(_20,"addSubview:",_22);
objj_msgSend(_hManager,"insertNewSegmentAtIndex:inLine:",0,_25);
objj_msgSend(_20,"pushToHManagerInfoForViewAtIndex:",_23);
objj_msgSend(_vManager,"insertNewSegmentAtIndex:inLine:",_23,_line);
objj_msgSend(_20,"pushToVManagerInfoForViewAtIndex:",_23);
}
}),new objj_method(sel_getUid("removeView:"),function(_26,_27,_28){
with(_26){
var _29=objj_msgSend(_26,"infoForView:",_28);
var _2a=objj_msgSend(_viewInfo,"indexOfObject:",_29);
objj_msgSend(_hManager,"removeSegmentAtIndex:inLine:",0,_29._column);
objj_msgSend(_hManager,"removeLine:",_29._column);
objj_msgSend(_vManager,"removeInformationOnLinePartAtIndex:",_2a);
objj_msgSend(_vManager,"removeSegmentAtIndex:inLine:",_2a,_line);
objj_msgSend(_viewInfo,"removeObject:",_29);
var i,_2b=objj_msgSend(_viewInfo,"count");
_hExpand=NO;
_hWeakExpand=NO;
_vExpand=NO;
_vWeakExpand=NO;
for(i=0;i<_2b;i++){
_29=objj_msgSend(_viewInfo,"objectAtIndex:",i);
if(_29._hAlignment==GSAutoLayoutExpand){
_hExpand=YES;
}
if(_29._hAlignment==GSAutoLayoutWeakExpand){
_hWeakExpand=YES;
}
if(_29._vAlignment==GSAutoLayoutExpand){
_vExpand=YES;
}
if(_29._vAlignment==GSAutoLayoutWeakExpand){
_vWeakExpand=YES;
}
}
objj_msgSend(_28,"removeFromSuperview");
objj_msgSend(_hManager,"updateLayout");
objj_msgSend(_vManager,"updateLayout");
}
}),new objj_method(sel_getUid("autoLayoutManagerChangedVLayout:"),function(_2c,_2d,_2e){
with(_2c){
var _2f;
var i,_30;
if(objj_msgSend(_2e,"object")!=_vManager){
return;
}
_2f=objj_msgSend(_vManager,"lineLength");
objj_msgSendSuper({receiver:_2c,super_class:objj_getClass("GSAutoLayoutVBox").super_class},"setFrameSize:",CPMakeSize((objj_msgSend(_2c,"frame")).size.width,_2f));
_30=objj_msgSend(_viewInfo,"count");
for(i=0;i<_30;i++){
var s;
var _31;
var _32;
_31=objj_msgSend(_viewInfo,"objectAtIndex:",i);
s=objj_msgSend(_vManager,"layoutOfSegmentAtIndex:inLine:",i,_line);
_32=objj_msgSend(_31._view,"frame");
_32.origin.y=s.position;
_32.size.height=s.length;
objj_msgSend(_31._view,"setFrame:",_32);
}
}
}),new objj_method(sel_getUid("autoLayoutManagerChangedHLayout:"),function(_33,_34,_35){
with(_33){
var _36;
var i,_37;
if(objj_msgSend(_35,"object")!=_hManager){
return;
}
_36=objj_msgSend(_hManager,"lineLength");
objj_msgSendSuper({receiver:_33,super_class:objj_getClass("GSAutoLayoutVBox").super_class},"setFrameSize:",CPMakeSize(_36,(objj_msgSend(_33,"frame").size).height));
_37=objj_msgSend(_viewInfo,"count");
for(i=0;i<_37;i++){
var s;
var _38;
var _39;
_38=objj_msgSend(_viewInfo,"objectAtIndex:",i);
s=objj_msgSend(_hManager,"layoutOfSegmentAtIndex:inLine:",0,_38._column);
_39=objj_msgSend(_38._view,"frame");
_39.origin.x=s.position;
_39.size.width=s.length;
objj_msgSend(_38._view,"setFrame:",_39);
}
}
}),new objj_method(sel_getUid("numberOfViews"),function(_3a,_3b){
with(_3a){
return objj_msgSend(_viewInfo,"count");
}
}),new objj_method(sel_getUid("setFrame:"),function(_3c,_3d,_3e){
with(_3c){
if(CPEqualRects(objj_msgSend(_3c,"frame"),_3e)){
return;
}
objj_msgSendSuper({receiver:_3c,super_class:objj_getClass("GSAutoLayoutVBox").super_class},"setFrame:",_3e);
if(objj_msgSend(_viewInfo,"count")>0){
var _3f;
_3f=objj_msgSend(_viewInfo,"objectAtIndex:",0);
objj_msgSend(_hManager,"forceLength:ofLine:",_3e.size.width,_3f._column);
objj_msgSend(_hManager,"updateLayout");
}else{
}
objj_msgSend(_vManager,"forceLength:ofLine:",_3e.size.height,_line);
objj_msgSend(_vManager,"updateLayout");
}
}),new objj_method(sel_getUid("setFrameSize:"),function(_40,_41,_42){
with(_40){
var _43=objj_msgSend(_40,"frame").size;
if(_43.width==_42.width&&_43.height==_42.height){
return;
}
objj_msgSendSuper({receiver:_40,super_class:objj_getClass("GSAutoLayoutVBox").super_class},"setFrameSize:",_42);
if(objj_msgSend(_viewInfo,"count")>0){
var _44;
_44=objj_msgSend(_viewInfo,"objectAtIndex:",0);
objj_msgSend(_hManager,"forceLength:ofLine:",_42.width,_44._column);
objj_msgSend(_hManager,"updateLayout");
}else{
}
objj_msgSend(_vManager,"forceLength:ofLine:",_42.height,_line);
objj_msgSend(_vManager,"updateLayout");
}
}),new objj_method(sel_getUid("setMinimumSize:forView:"),function(_45,_46,_47,_48){
with(_45){
var _49=objj_msgSend(_45,"infoForView:",_48);
var _4a=objj_msgSend(_viewInfo,"indexOfObject:",_49);
_49._minimumSize=_47;
objj_msgSend(_45,"pushToHManagerInfoForViewAtIndex:",_4a);
objj_msgSend(_45,"pushToVManagerInfoForViewAtIndex:",_4a);
}
}),new objj_method(sel_getUid("minimumSizeForView:"),function(_4b,_4c,_4d){
with(_4b){
var _4e=objj_msgSend(_4b,"infoForView:",_4d);
return _4e._minimumSize;
}
}),new objj_method(sel_getUid("setHorizontalAlignment:forView:"),function(_4f,_50,_51,_52){
with(_4f){
var _53=objj_msgSend(_4f,"infoForView:",_52);
var _54=objj_msgSend(_viewInfo,"indexOfObject:",_53);
var i,_55;
_53._hAlignment=_51;
_hExpand=NO;
_hWeakExpand=NO;
_55=objj_msgSend(_viewInfo,"count");
for(i=0;i<_55;i++){
_53=objj_msgSend(_viewInfo,"objectAtIndex:",i);
if(_53._hAlignment==GSAutoLayoutExpand){
_hExpand=YES;
}
if(_53._hAlignment==GSAutoLayoutWeakExpand){
_hWeakExpand=YES;
}
}
objj_msgSend(_4f,"pushToHManagerInfoForViewAtIndex:",_54);
}
}),new objj_method(sel_getUid("horizontalAlignmentForView:"),function(_56,_57,_58){
with(_56){
var _59=objj_msgSend(_56,"infoForView:",_58);
return _59._hAlignment;
}
}),new objj_method(sel_getUid("setVerticalAlignment:forView:"),function(_5a,_5b,_5c,_5d){
with(_5a){
var _5e=objj_msgSend(_5a,"infoForView:",_5d);
var _5f=objj_msgSend(_viewInfo,"indexOfObject:",_5e);
var i,_60;
_5e._vAlignment=_5c;
_vExpand=NO;
_vWeakExpand=NO;
_60=objj_msgSend(_viewInfo,"count");
for(i=0;i<_60;i++){
_5e=objj_msgSend(_viewInfo,"objectAtIndex:",i);
if(_5e._vAlignment==GSAutoLayoutExpand){
_vExpand=YES;
}
if(_5e._vAlignment==GSAutoLayoutWeakExpand){
_vWeakExpand=YES;
}
}
objj_msgSend(_5a,"pushToVManagerInfoForViewAtIndex:",_5f);
}
}),new objj_method(sel_getUid("verticalAlignmentForView:"),function(_61,_62,_63){
with(_61){
var _64=objj_msgSend(_61,"infoForView:",_63);
return _64._vAlignment;
}
}),new objj_method(sel_getUid("setHorizontalBorder:forView:"),function(_65,_66,_67,_68){
with(_65){
var _69=objj_msgSend(_65,"infoForView:",_68);
var _6a=objj_msgSend(_viewInfo,"indexOfObject:",_69);
_69._hBorder=_67;
objj_msgSend(_65,"pushToHManagerInfoForViewAtIndex:",_6a);
}
}),new objj_method(sel_getUid("horizontalBorderForView:"),function(_6b,_6c,_6d){
with(_6b){
var _6e=objj_msgSend(_6b,"infoForView:",_6d);
return _6e._hBorder;
}
}),new objj_method(sel_getUid("setVerticalBorder:forView:"),function(_6f,_70,_71,_72){
with(_6f){
var _73=objj_msgSend(_6f,"infoForView:",_72);
var _74=objj_msgSend(_viewInfo,"indexOfObject:",_73);
_73._vBorder=_71;
objj_msgSend(_6f,"pushToVManagerInfoForViewAtIndex:",_74);
}
}),new objj_method(sel_getUid("verticalBorderForView:"),function(_75,_76,_77){
with(_75){
var _78=objj_msgSend(_75,"infoForView:",_77);
return _78._vBorder;
}
}),new objj_method(sel_getUid("setProportion:forView:"),function(_79,_7a,_7b,_7c){
with(_79){
var _7d=objj_msgSend(_79,"infoForView:",_7c);
var _7e=objj_msgSend(_viewInfo,"indexOfObject:",_7d);
_7d._proportion=_7b;
objj_msgSend(_79,"pushToVManagerInfoForViewAtIndex:",_7e);
}
}),new objj_method(sel_getUid("proportionForView:"),function(_7f,_80,_81){
with(_7f){
var _82=objj_msgSend(_7f,"infoForView:",_81);
return _82._proportion;
}
}),new objj_method(sel_getUid("autolayoutDefaultHorizontalAlignment"),function(_83,_84){
with(_83){
if(_hExpand){
return GSAutoLayoutExpand;
}else{
if(_hWeakExpand){
return GSAutoLayoutWeakExpand;
}else{
return GSAutoLayoutAlignCenter;
}
}
}
}),new objj_method(sel_getUid("autolayoutDefaultVerticalAlignment"),function(_85,_86){
with(_85){
if(_vExpand){
return GSAutoLayoutExpand;
}else{
if(_vWeakExpand){
return GSAutoLayoutWeakExpand;
}else{
return GSAutoLayoutAlignCenter;
}
}
}
}),new objj_method(sel_getUid("autolayoutDefaultHorizontalBorder"),function(_87,_88){
with(_87){
return 0;
}
}),new objj_method(sel_getUid("autolayoutDefaultVerticalBorder"),function(_89,_8a){
with(_89){
return 0;
}
}),new objj_method(sel_getUid("sizeToFitContent"),function(_8b,_8c){
with(_8b){
objj_msgSend(_8b,"setFrameSize:",objj_msgSend(_8b,"minimumSizeForContent"));
}
}),new objj_method(sel_getUid("minimumSizeForContent"),function(_8d,_8e){
with(_8d){
var _8f={height:objj_msgSend(_vManager,"minimumLineLength"),width:objj_msgSend(_hManager,"minimumLineLength")};
return _8f;
}
}),new objj_method(sel_getUid("setDisplayAutoLayoutContainers:"),function(_90,_91,_92){
with(_90){
objj_msgSendSuper({receiver:_90,super_class:objj_getClass("GSAutoLayoutVBox").super_class},"setDisplayAutoLayoutContainers:",_92);
_displayAutoLayoutContainers=_92;
objj_msgSend(_90,"setNeedsDisplay:",YES);
}
}),new objj_method(sel_getUid("drawRect:"),function(_93,_94,_95){
with(_93){
if(_displayAutoLayoutContainers){
var _96=objj_msgSend(_93,"bounds");
objj_msgSend(objj_msgSend(CPColor,"redColor"),"set");
CPFrameRect(_96);
var i,_97=objj_msgSend(_vManager,"linePartCount");
for(i=0;i<_97;i++){
var s;
s=objj_msgSend(_vManager,"layoutOfLinePartAtIndex:",i);
if(i>0){
var _98;
var _99=new Array(1,2);
_98=objj_msgSend(CPBezierPath,"bezierPath");
objj_msgSend(_98,"setLineDash:count:phase:",_99,2,0);
objj_msgSend(_98,"moveToPoint:",CPMakePoint(CPMinX(_96),s.position));
objj_msgSend(_98,"lineToPoint:",CPMakePoint(CPMaxX(_96),s.position));
objj_msgSend(_98,"stroke");
}
}
}
}
})]);
p;39;Frameworks/Renaissance/GSMarkupAwaker.jt;1047;@STATIC;1.0;I;21;Foundation/CPObject.jt;1002;
objj_executeFile("Foundation/CPObject.j",NO);
var _1=objj_allocateClassPair(CPObject,"GSMarkupAwaker"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("init"),function(_3,_4){
with(_3){
_objects=objj_msgSend(CPMutableSet,"new");
return _3;
}
}),new objj_method(sel_getUid("dealloc"),function(_5,_6){
with(_5){
objj_msgSendSuper({receiver:_5,super_class:objj_getClass("GSMarkupAwaker").super_class},"dealloc");
}
}),new objj_method(sel_getUid("registerObject:"),function(_7,_8,_9){
with(_7){
objj_msgSend(_objects,"addObject:",_9);
}
}),new objj_method(sel_getUid("deregisterObject:"),function(_a,_b,_c){
with(_a){
objj_msgSend(_objects,"removeObject:",_c);
}
}),new objj_method(sel_getUid("awakeObjects"),function(_d,_e){
with(_d){
var e=objj_msgSend(_objects,"objectEnumerator");
var _f;
while((_f=objj_msgSend(e,"nextObject"))!=nil){
if(objj_msgSend(_f,"respondsToSelector:",sel_getUid("awakeFromGSMarkup"))){
objj_msgSend(_f,"awakeFromGSMarkup");
}
}
}
})]);
p;48;Frameworks/Renaissance/GSMarkupBundleAdditions.jt;5266;@STATIC;1.0;I;21;Foundation/CPBundle.ji;17;GSMarkupDecoder.ji;16;GSMarkupAwaker.ji;19;GSMarkupLocalizer.ji;19;GSMarkupConnector.jt;5130;
objj_executeFile("Foundation/CPBundle.j",NO);
objj_executeFile("GSMarkupDecoder.j",YES);
objj_executeFile("GSMarkupAwaker.j",YES);
objj_executeFile("GSMarkupLocalizer.j",YES);
objj_executeFile("GSMarkupConnector.j",YES);
GSMarkupBundleDidLoadGSMarkupNotification="GSMarkupBundleDidLoadGSMarkupNotification";
var _1;
var _2=objj_getClass("CPBundle");
if(!_2){
throw new SyntaxError("*** Could not find definition for class \"CPBundle\"");
}
var _3=_2.isa;
class_addMethods(_2,[new objj_method(sel_getUid("localizedStringForKey:value:table:"),function(_4,_5,_6,_7,_8){
with(_4){
if(!_6||!_8){
return _7;
}
return _6;
}
})]);
class_addMethods(_3,[new objj_method(sel_getUid("registerStaticObject:withName:"),function(_9,_a,_b,_c){
with(_9){
if(_1==nil){
_1=objj_msgSend(CPMutableDictionary,"new");
}
objj_msgSend(_1,"setObject:forKey:",_b,_c);
}
}),new objj_method(sel_getUid("loadGSMarkupData:externalNameTable:localizableStringsTable:inBundle:tagMapping:"),function(_d,_e,_f,_10,_11,_12,_13){
with(_d){
objj_msgSend(_d,"registerStaticObject:withName:",objj_msgSend(CPApplication,"sharedApplication"),"CPApp");
var _14=NO;
if(_f==nil){
return NO;
}
if(_12==nil){
_12=objj_msgSend(CPBundle,"mainBundle");
}
var _15;
var _16;
var _17;
var _18;
var i,_19;
var e;
var key;
var _1a=nil;
var _1b=objj_msgSend(GSMarkupAwaker,"new");
var _1c=objj_msgSend(objj_msgSend(GSMarkupDecoder,"alloc"),"initWithXMLString:",objj_msgSend(_f,"rawString"));
objj_msgSend(_1c,"setExternalNameTable:",_10);
objj_msgSend(_1c,"parse");
var _1d=objj_msgSend(_1c,"objects");
if(_13!=nil){
e=objj_msgSend(_13,"keyEnumerator");
while((key=objj_msgSend(e,"nextObject"))!=nil){
var _1e=objj_msgSend(_13,"objectForKey:",key);
objj_msgSend(_1c,"setObjectClass:forTagName:",_1e,key);
}
}
_18=objj_msgSend(CPMutableArray,"arrayWithCapacity:",objj_msgSend(_1d,"count"));
var _1f=objj_msgSend(objj_msgSend(GSMarkupLocalizer,"alloc"),"initWithTable:bundle:",_11,_12);
_15=objj_msgSend(objj_msgSend(_1c,"nameTable"),"mutableCopy");
_17=objj_msgSend(_1c,"connectors");
_19=objj_msgSend(_1d,"count");
for(i=0;i<_19;i++){
var o;
var _20;
o=objj_msgSend(_1d,"objectAtIndex:",i);
objj_msgSend(o,"setLocalizer:",_1f);
objj_msgSend(o,"setAwaker:",_1b);
_20=objj_msgSend(o,"platformObject");
if(_20!=nil){
objj_msgSend(_18,"addObject:",_20);
}
}
e=objj_msgSend(objj_msgSend(_15,"allKeys"),"objectEnumerator");
while((key=objj_msgSend(e,"nextObject"))!=nil){
var _21=objj_msgSend(_15,"objectForKey:",key);
var _20=objj_msgSend(_21,"platformObject");
if(_20!=nil){
objj_msgSend(_15,"setObject:forKey:",_20,key);
}else{
objj_msgSend(_15,"removeObjectForKey:",key);
}
}
e=objj_msgSend(_10,"keyEnumerator");
while((key=objj_msgSend(e,"nextObject"))!=nil){
var _21=objj_msgSend(_10,"objectForKey:",key);
if(objj_msgSend(key,"isEqualToString:","CPTopLevelObjects")&&objj_msgSend(_21,"isKindOfClass:",objj_msgSend(CPMutableArray,"class"))){
_1a=_21;
}else{
objj_msgSend(_15,"setObject:forKey:",_21,key);
}
}
if(_1!=nil){
objj_msgSend(_15,"addEntriesFromDictionary:",_1);
}
_19=objj_msgSend(_17,"count");
for(i=0;i<_19;i++){
var _22=objj_msgSend(_17,"objectAtIndex:",i);
objj_msgSend(_22,"establishConnectionUsingNameTable:",_15);
}
var _23=objj_msgSend(_15,"objectForKey:","CPOwner");
if(_23!=nil){
objj_msgSend(_1b,"registerObject:",_23);
}
objj_msgSend(_1b,"awakeObjects");
var _23=objj_msgSend(_15,"objectForKey:","CPOwner");
var _1d=objj_msgSend(CPMutableArray,"array");
var n;
_19=objj_msgSend(_18,"count");
for(i=0;i<_19;i++){
var _21=objj_msgSend(_18,"objectAtIndex:",i);
objj_msgSend(_1d,"addObject:",_21);
}
n=objj_msgSend(CPNotification,"notificationWithName:object:userInfo:",GSMarkupBundleDidLoadGSMarkupNotification,_23,objj_msgSend(CPDictionary,"dictionaryWithObject:forKey:",_1d,"CPTopLevelObjects"));
if(_23!=nil){
if(objj_msgSend(_23,"respondsToSelector:",sel_getUid("bundleDidLoadGSMarkup:"))){
objj_msgSend(_23,"bundleDidLoadGSMarkup:",n);
}
}
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotification:",n);
if(_1a!=nil){
_19=objj_msgSend(_18,"count");
for(i=0;i<_19;i++){
var _21=objj_msgSend(_18,"objectAtIndex:",i);
objj_msgSend(_1a,"addObject:",_21);
}
}
_16=objj_msgSend(_10,"objectForKey:","GSMarkupNameTable");
if(_16!=nil&&objj_msgSend(_16,"isKindOfClass:",objj_msgSend(CPMutableDictionary,"class"))==YES){
var k;
objj_msgSend(_16,"removeAllObjects");
e=objj_msgSend(_15,"keyEnumerator");
while((k=objj_msgSend(e,"nextObject"))!=nil){
if(objj_msgSend(_10,"objectForKey:",k)==nil){
objj_msgSend(_16,"setObject:forKey:",objj_msgSend(_15,"objectForKey:",k),k);
}
}
}
_14=YES;
return _14?_1c:nil;
}
}),new objj_method(sel_getUid("loadRessourceNamed:owner:"),function(_24,_25,_26,_27){
with(_24){
var _28=objj_msgSend(objj_msgSend(CPData,"alloc"),"initWithContentsOfURL:",objj_msgSend(CPURL,"URLWithString:",objj_msgSend(CPString,"stringWithFormat:","%@/%@",objj_msgSend(objj_msgSend(CPBundle,"mainBundle"),"resourcePath"),_26)));
return objj_msgSend(CPBundle,"loadGSMarkupData:externalNameTable:localizableStringsTable:inBundle:tagMapping:",_28,objj_msgSend(CPDictionary,"dictionaryWithObject:forKey:",_27,"CPOwner"),nil,nil,nil);
}
})]);
p;42;Frameworks/Renaissance/GSMarkupConnector.jt;7390;@STATIC;1.0;I;21;Foundation/CPObject.jt;7345;
objj_executeFile("Foundation/CPObject.j",NO);
var _1=objj_allocateClassPair(CPObject,"GSMarkupConnector"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initWithAttributes:content:"),function(_3,_4,_5,_6){
with(_3){
return _3;
}
}),new objj_method(sel_getUid("attributes"),function(_7,_8){
with(_7){
return objj_msgSend(CPDictionary,"dictionary");
}
}),new objj_method(sel_getUid("content"),function(_9,_a){
with(_9){
return nil;
}
}),new objj_method(sel_getUid("establishConnectionUsingNameTable:"),function(_b,_c,_d){
with(_b){
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("tagName"),function(_e,_f){
with(_e){
return nil;
}
}),new objj_method(sel_getUid("getObjectForIdString:usingNameTable:"),function(_10,_11,_12,_13){
with(_10){
var r=objj_msgSend(_12,"rangeOfString:",".");
if(r.location==CPNotFound){
return objj_msgSend(_13,"objectForKey:",_12);
}else{
var _14=objj_msgSend(_12,"substringToIndex:",r.location);
var _15=objj_msgSend(_12,"substringFromIndex:",CPMaxRange(r));
var _16=objj_msgSend(_13,"objectForKey:",_14);
return objj_msgSend(_16,"valueForKeyPath:",_15);
}
}
}),new objj_method(sel_getUid("getPlatformObjectForIdString:usingNameTable:"),function(_17,_18,_19,_1a){
with(_17){
var r=objj_msgSend(_19,"rangeOfString:",".");
if(r.location==CPNotFound){
return objj_msgSend(objj_msgSend(_1a,"objectForKey:",_19),"platformObject");
}else{
var _1b=objj_msgSend(_19,"substringToIndex:",r.location);
var _1c=objj_msgSend(_19,"substringFromIndex:",CPMaxRange(r));
var _1d=objj_msgSend(objj_msgSend(_1a,"objectForKey:",_1b),"platformObject");
return objj_msgSend(_1d,"valueForKeyPath:",_1c);
}
}
})]);
var _1=objj_allocateClassPair(GSMarkupConnector,"GSMarkupOneToOneConnector"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_source"),new objj_ivar("_target"),new objj_ivar("_label")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initWithSource:target:label:"),function(_1e,_1f,_20,_21,_22){
with(_1e){
if(objj_msgSend(_20,"hasPrefix:","#")){
_20=objj_msgSend(_20,"substringFromIndex:",1);
}
_source=_20;
if(objj_msgSend(_21,"hasPrefix:","#")){
_21=objj_msgSend(_21,"substringFromIndex:",1);
}
_target=_21;
_label=_22;
return _1e;
}
}),new objj_method(sel_getUid("initWithAttributes:content:"),function(_23,_24,_25,_26){
with(_23){
return objj_msgSend(_23,"initWithSource:target:label:",objj_msgSend(_25,"objectForKey:","source"),objj_msgSend(_25,"objectForKey:","target"),objj_msgSend(_25,"objectForKey:","label"));
}
}),new objj_method(sel_getUid("attributes"),function(_27,_28){
with(_27){
var d;
var _29;
var _2a;
_29=objj_msgSend(CPString,"stringWithFormat:","#%@",_source);
_2a=objj_msgSend(CPString,"stringWithFormat:","#%@",_target);
d=objj_msgSend(CPDictionary,"dictionaryWithObjectsAndKeys:",_29,"source",_2a,"target",_label,"label",nil);
return d;
}
}),new objj_method(sel_getUid("content"),function(_2b,_2c){
with(_2b){
return nil;
}
}),new objj_method(sel_getUid("setSource:"),function(_2d,_2e,_2f){
with(_2d){
_source=_2f;
}
}),new objj_method(sel_getUid("source"),function(_30,_31){
with(_30){
return _source;
}
}),new objj_method(sel_getUid("setTarget:"),function(_32,_33,_34){
with(_32){
_target=_34;
}
}),new objj_method(sel_getUid("target"),function(_35,_36){
with(_35){
return _target;
}
}),new objj_method(sel_getUid("setLabel:"),function(_37,_38,_39){
with(_37){
_label=_39;
}
}),new objj_method(sel_getUid("label"),function(_3a,_3b){
with(_3a){
return _label;
}
}),new objj_method(sel_getUid("description"),function(_3c,_3d){
with(_3c){
return objj_msgSend(CPString,"stringWithFormat:","<%@ source=\"%@\" target=\"%@\" label=\"%@\">",CPStringFromClass(objj_msgSend(_3c,"class")),_source,_target,_label);
}
})]);
var _1=objj_allocateClassPair(GSMarkupOneToOneConnector,"GSMarkupControlConnector"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initWithAttributes:content:"),function(_3e,_3f,_40,_41){
with(_3e){
var _42;
_42=objj_msgSend(_40,"objectForKey:","action");
if(_42==nil){
_42=objj_msgSend(_40,"objectForKey:","label");
}
return objj_msgSend(_3e,"initWithSource:target:label:",objj_msgSend(_40,"objectForKey:","source"),objj_msgSend(_40,"objectForKey:","target"),_42);
}
}),new objj_method(sel_getUid("attributes"),function(_43,_44){
with(_43){
var d;
var _45;
var _46;
_45=objj_msgSend(CPString,"stringWithFormat:","#%@",_source);
_46=objj_msgSend(CPString,"stringWithFormat:","#%@",_target);
d=objj_msgSend(CPDictionary,"dictionaryWithObjectsAndKeys:",_45,"source",_46,"target",_label,"action",nil);
return d;
}
}),new objj_method(sel_getUid("establishConnectionUsingNameTable:"),function(_47,_48,_49){
with(_47){
var _4a=CPSelectorFromString(_label);
var _4b=objj_msgSend(GSMarkupConnector,"getObjectForIdString:usingNameTable:",_source,_49);
var _4c=objj_msgSend(GSMarkupConnector,"getObjectForIdString:usingNameTable:",_target,_49);
objj_msgSend(_4b,"setAction:",_4a);
objj_msgSend(_4b,"setTarget:",_4c);
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("tagName"),function(_4d,_4e){
with(_4d){
return "control";
}
})]);
var _1=objj_allocateClassPair(GSMarkupOneToOneConnector,"GSMarkupOutletConnector"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initWithAttributes:content:"),function(_4f,_50,_51,_52){
with(_4f){
var _53;
_53=objj_msgSend(_51,"objectForKey:","key");
if(_53==nil){
_53=objj_msgSend(_51,"objectForKey:","label");
}
return objj_msgSend(_4f,"initWithSource:target:label:",objj_msgSend(_51,"objectForKey:","source"),objj_msgSend(_51,"objectForKey:","target"),_53);
}
}),new objj_method(sel_getUid("establishConnectionUsingNameTable:"),function(_54,_55,_56){
with(_54){
var _57=objj_msgSend(GSMarkupConnector,"getObjectForIdString:usingNameTable:",_source,_56);
var _58=objj_msgSend(GSMarkupConnector,"getObjectForIdString:usingNameTable:",_target,_56);
objj_msgSend(_57,"setValue:forKey:",_58,objj_msgSend(_label,"substringFromIndex:",objj_msgSend(_label,"characterAtIndex:",0)=="#"?1:0));
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("tagName"),function(_59,_5a){
with(_59){
return "outlet";
}
})]);
var _1=objj_allocateClassPair(GSMarkupOneToOneConnector,"GSMarkupBindingConnector"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_entityName")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initWithAttributes:content:"),function(_5b,_5c,_5d,_5e){
with(_5b){
var o=objj_msgSend(_5b,"initWithSource:target:label:",objj_msgSend(_5d,"objectForKey:","source"),objj_msgSend(_5d,"objectForKey:","target"),objj_msgSend(_5d,"objectForKey:","label"));
_entityName=objj_msgSend(_5d,"objectForKey:","entity");
return o;
}
}),new objj_method(sel_getUid("establishConnectionUsingNameTable:"),function(_5f,_60,_61){
with(_5f){
var _62=objj_msgSend(GSMarkupConnector,"getObjectForIdString:usingNameTable:",_source,_61);
var _63=objj_msgSend(GSMarkupConnector,"getObjectForIdString:usingNameTable:",_target,_61);
if(objj_msgSend(_62,"isKindOfClass:",objj_msgSend(CPTableView,"class"))&&objj_msgSend(_63,"isKindOfClass:",objj_msgSend(CPArrayController,"class"))){
}
objj_msgSend(_62,"bind:toObject:withKeyPath:options:",CPValueBinding,_63,_label,nil);
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("tagName"),function(_64,_65){
with(_64){
return "binding";
}
})]);
p;40;Frameworks/Renaissance/GSMarkupDecoder.jt;14793;@STATIC;1.0;I;21;Foundation/CPObject.ji;19;GSMarkupConnector.jt;14723;
objj_executeFile("Foundation/CPObject.j",NO);
objj_executeFile("GSMarkupConnector.j",YES);
var _1=objj_getClass("CPString");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"CPString\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("stringByUppercasingFirstCharacter"),function(_3,_4){
with(_3){
var _5=objj_msgSend(_3,"length");
if(_5<1){
return _3;
}else{
var s;
var c=objj_msgSend(_3,"characterAtIndex:",0);
if(c<"a"||c>"z"){
return _3;
}
c=c.toUpperCase();
s=objj_msgSend(CPString,"stringWithString:",c);
if(_5==1){
return s;
}else{
return objj_msgSend(s,"stringByAppendingString:",objj_msgSend(_3,"substringFromIndex:",1));
}
}
}
}),new objj_method(sel_getUid("trimmedString"),function(_6,_7){
with(_6){
var t=_6.replace(/^\s+|\s+$/g,"");
if(!t){
return "";
}
return objj_msgSend(CPString,"stringWithString:",t);
}
})]);
var _1=objj_getClass("CPData");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"CPData\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("initWithContentsOfURL:"),function(_8,_9,_a){
with(_8){
var _b=objj_msgSend(CPURLConnection,"sendSynchronousRequest:returningResponse:error:",objj_msgSend(CPURLRequest,"requestWithURL:",_a),nil,nil);
if(_b==nil){
return nil;
}
return _b;
}
}),new objj_method(sel_getUid("initWithContentsOfFile:"),function(_c,_d,_e){
with(_c){
return objj_msgSend(_c,"initWithContentsOfURL:",objj_msgSend(CPURL,"URLWithString:",_e));
}
})]);
var _1=objj_allocateClassPair(CPObject,"GSMarkupDecoder"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_uniqueID"),new objj_ivar("_nameTable"),new objj_ivar("_externalNameTable"),new objj_ivar("_tagNameToObjectClass"),new objj_ivar("_xmlStr"),new objj_ivar("_objects"),new objj_ivar("_connectors")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initWithContentsOfFile:"),function(_f,_10,_11){
with(_f){
var d=objj_msgSend(objj_msgSend(CPData,"alloc"),"initWithContentsOfFile:",_11);
return objj_msgSend(_f,"initWithData:",d);
}
}),new objj_method(sel_getUid("initWithData:"),function(_12,_13,_14){
with(_12){
return objj_msgSend(_12,"initWithXMLString:",objj_msgSend(_14,"rawString"));
}
}),new objj_method(sel_getUid("objectClassForTagName:mappedByFormatArray:"),function(_15,_16,_17,arr){
with(_15){
var c;
var _18=objj_msgSend(_17,"stringByUppercasingFirstCharacter");
var _19=objj_msgSend(_tagNameToObjectClass,"objectForKey:",_17);
if(_19!=nil){
objj_msgSend(arr,"insertObject:atIndex:",_19,0);
}
var i,cnt=arr.length;
for(i=0;i<cnt;i++){
_19=objj_msgSend(CPString,"stringWithFormat:",arr[i],_18);
c=CPClassFromString(_19);
if(c!=Nil){
return c;
}
}
return Nil;
}
}),new objj_method(sel_getUid("objectClassForTagName:"),function(_1a,_1b,_1c){
with(_1a){
return objj_msgSend(_1a,"objectClassForTagName:mappedByFormatArray:",_1c,objj_msgSend(CPArray,"arrayWithObjects:","GSMarkup%@Tag","GSMarkupTag%@","GS%@Tag","GSTag%@","%@Tag","Tag%@"));
}
}),new objj_method(sel_getUid("connectorClassForTagName:"),function(_1d,_1e,_1f){
with(_1d){
if(_1f=="control"){
return objj_msgSend(GSMarkupControlConnector,"class");
}else{
if(_1f=="outlet"){
return objj_msgSend(GSMarkupOutletConnector,"class");
}
}
return objj_msgSend(_1d,"objectClassForTagName:mappedByFormatArray:",_1f,objj_msgSend(CPArray,"arrayWithObjects:","GSMarkup%@Connector","GSMarkupConnector%@","GS%@Connector","GSConnector%@","%@Connector","Connector%@"));
}
}),new objj_method(sel_getUid("entityClassForTagName:"),function(_20,_21,_22){
with(_20){
return objj_msgSend(_20,"objectClassForTagName:mappedByFormatArray:",_22,objj_msgSend(CPArray,"arrayWithObjects:","GSMarkup%@"));
}
}),new objj_method(sel_getUid("attributesForDOMNode:"),function(_23,_24,_25){
with(_23){
var _26=_25.attributes;
if(!_26){
return nil;
}
var ret=objj_msgSend(CPMutableDictionary,"dictionary");
var i,cnt=_26.length;
for(i=0;i<cnt;i++){
objj_msgSend(ret,"setValue:forKey:",_26[i].nodeValue,_26[i].nodeName);
}
return ret;
}
}),new objj_method(sel_getUid("insertChildrenOfDOMNode:intoContainer:"),function(_27,_28,_29,_2a){
with(_27){
if(!_29){
return nil;
}
var _2b;
if(_2b=_29.childNodes){
var _2c=objj_msgSend(CPMutableArray,"new");
var _2d=_2b.length;
var i;
for(i=0;i<_2d;i++){
var co=objj_msgSend(_27,"insertMarkupObjectFromDOMNode:intoContainer:",_2b[i],nil);
if(co){
objj_msgSend(_2c,"addObject:",co);
}else{
var cnv=_2b[i].nodeValue;
var ts=objj_msgSend(cnv,"trimmedString");
if(ts&&ts.length){
return objj_msgSend(CPArray,"arrayWithObject:",cnv);
}
}
}
return _2c;
}
return nil;
}
}),new objj_method(sel_getUid("insertMarkupObjectFromDOMNode:intoContainer:"),function(_2e,_2f,o,_30){
with(_2e){
var _31;
_31=objj_msgSend(_2e,"objectClassForTagName:",o.nodeName);
if(!_31){
_31=objj_msgSend(_2e,"connectorClassForTagName:",o.nodeName);
}
if(!_31){
_31=objj_msgSend(_2e,"entityClassForTagName:",o.nodeName);
}
if(_31){
var _32=objj_msgSend(_2e,"attributesForDOMNode:",o);
var oid=objj_msgSend(_32,"objectForKey:","id");
if(!oid){
oid=objj_msgSend(CPString,"stringWithFormat:","%@%d",o.nodeName,++_uniqueID);
}
var _33=objj_msgSend(_32,"allKeys");
var i,_34=objj_msgSend(_33,"count");
for(i=0;i<_34;i++){
var key,_35;
key=objj_msgSend(_33,"objectAtIndex:",i);
if(!objj_msgSend(key,"length")){
continue;
}
_35=objj_msgSend(_32,"objectForKey:",key);
if(_30!=_connectors&&objj_msgSend(_35,"hasPrefix:","#")){
if(_30==_entites){
objj_msgSend(_32,"setObject:forKey:",objj_msgSend(GSMarkupConnector,"getObjectForIdString:usingNameTable:",objj_msgSend(_35,"substringFromIndex:",1),_externalNameTable),key);
}else{
if(key!="itemsBinding"&&key!="valueBinding"){
var _36;
var _36=objj_msgSend(objj_msgSend(GSMarkupOutletConnector,"alloc"),"initWithSource:target:label:",oid,_35,key);
if(_36){
objj_msgSend(_connectors,"addObject:",_36);
objj_msgSend(_32,"removeObjectForKey:",key);
}
}
}
}
}
var _37=objj_msgSend(objj_msgSend(_31,"alloc"),"initWithAttributes:content:",_32,objj_msgSend(_2e,"insertChildrenOfDOMNode:intoContainer:",o,_30));
if(!_37){
return nil;
}
if(_30){
objj_msgSend(_30,"addObject:",_37);
}
if(_30!=_connectors){
objj_msgSend(_nameTable,"setObject:forKey:",_37,oid);
}
return _37;
}
return nil;
}
}),new objj_method(sel_getUid("parseXMLString:"),function(_38,_39,_3a){
with(_38){
_parseXml=function(_3b){
if(typeof window.DOMParser!="undefined"){
return (new window.DOMParser()).parseFromString(_3b,"text/xml");
}else{
if(typeof window.ActiveXObject!="undefined"&&new window.ActiveXObject("Microsoft.XMLDOM")){
var _3c=new window.ActiveXObject("Microsoft.XMLDOM");
_3c.async="false";
_3c.loadXML(_3b);
return _3c;
}else{
throw new Error("No XML parser found");
}
}
};
var t=_parseXml(_3a);
if(!t){
return nil;
}
return t;
}
}),new objj_method(sel_getUid("initWithXMLString:"),function(_3d,_3e,_3f){
with(_3d){
_xmlStr=_3f;
_nameTable=objj_msgSend(CPMutableDictionary,"dictionary");
_tagNameToObjectClass=objj_msgSend(CPMutableDictionary,"dictionary");
_objects=objj_msgSend(CPMutableArray,"array");
_connectors=objj_msgSend(CPMutableArray,"array");
_entites=objj_msgSend(CPMutableArray,"array");
return _3d;
}
}),new objj_method(sel_getUid("setExternalNameTable:"),function(_40,_41,_42){
with(_40){
_externalNameTable=_42;
}
}),new objj_method(sel_getUid("setObjectClass:forTagName:"),function(_43,_44,_45,_46){
with(_43){
objj_msgSend(_tagNameToObjectClass,"setObject:forKey:",_45,_46);
}
}),new objj_method(sel_getUid("processDOMNode:intoContainer:"),function(_47,_48,_49,_4a){
with(_47){
if(!_49){
return;
}
var _4b;
if(_4b=_49.childNodes){
var _4c=_4b.length;
for(i=0;i<_4c;i++){
objj_msgSend(_47,"insertMarkupObjectFromDOMNode:intoContainer:",_4b[i],_4a);
}
}
}
}),new objj_method(sel_getUid("_postprocessEntities"),function(_4d,_4e){
with(_4d){
var i,l=_entites.length;
for(i=0;i<l;i++){
var e=_entites[i];
var eFS=objj_msgSend(e,"platformObject");
var _4f=objj_msgSend(eFS,"relationships");
if(!_4f){
continue;
}
var j,l1=_4f.length;
for(j=0;j<l1;j++){
objj_msgSend(_4f[j],"setTarget:",objj_msgSend(objj_msgSend(_nameTable,"objectForKey:",objj_msgSend(_4f[j],"target")),"platformObject"));
}
}
}
}),new objj_method(sel_getUid("_getObjectForIdString:"),function(_50,_51,_52){
with(_50){
var ret;
if(objj_msgSend(_52,"hasPrefix:","#")){
ret=objj_msgSend(GSMarkupConnector,"getObjectForIdString:usingNameTable:",objj_msgSend(_52,"substringFromIndex:",1),_externalNameTable);
}else{
ret=objj_msgSend(GSMarkupConnector,"getPlatformObjectForIdString:usingNameTable:",_52,_nameTable);
}
return ret;
}
}),new objj_method(sel_getUid("_postprocessForBindings:"),function(_53,_54,_55){
with(_53){
var i,l=_55.length;
for(i=0;i<l;i++){
var o=_55[i];
if(!objj_msgSend(o,"respondsToSelector:",sel_getUid("platformObject"))){
continue;
}
var oPO=objj_msgSend(o,"platformObject");
var _56;
if(_56=objj_msgSend(objj_msgSend(o,"attributes"),"objectForKey:","itemsBinding")){
var r=objj_msgSend(_56,"rangeOfString:",".");
if(r.location!=CPNotFound){
r=objj_msgSend(_56,"rangeOfString:options:",".",CPBackwardsSearch);
var _57=objj_msgSend(_56,"componentsSeparatedByString:",".");
var _58=objj_msgSend(_57,"subarrayWithRange:",CPMakeRange(0,_57.length-2));
var _59=(_58.length>1)?_58.join("."):_58[0];
var _5a=objj_msgSend(_53,"_getObjectForIdString:",_59);
var _5b=objj_msgSend(_56,"substringFromIndex:",CPMaxRange(r));
var _5c=objj_msgSend(_5a,"pk");
if(objj_msgSend(oPO,"isKindOfClass:",objj_msgSend(CPPopUpButton,"class"))){
if(_5b&&_5c){
objj_msgSend(oPO,"bind:toObject:withKeyPath:options:","itemArray",_5a,"arrangedObjects."+_5b,nil);
objj_msgSend(oPO,"bind:toObject:withKeyPath:options:","tagArray",_5a,"arrangedObjects."+_5c,nil);
}
}
}
}
if(_56=objj_msgSend(objj_msgSend(o,"attributes"),"objectForKey:","valueBinding")){
var r=objj_msgSend(_56,"rangeOfString:",".");
if(objj_msgSend(oPO,"isKindOfClass:",objj_msgSend(CPTableView,"class"))){
var _5d=objj_msgSend(_53,"_getObjectForIdString:",_56);
objj_msgSend(oPO,"bind:toObject:withKeyPath:options:","content",_5d,"arrangedObjects",nil);
objj_msgSend(oPO,"bind:toObject:withKeyPath:options:","sortDescriptors",_5d,"sortDescriptors",nil);
var _5e=objj_msgSend(o,"content");
var j,l1=_5e.length;
for(j=0;j<l1;j++){
var _5f=_5e[j];
if(_5f&&objj_msgSend(_5f,"isKindOfClass:",objj_msgSend(GSMarkupTagTableColumn,"class"))){
objj_msgSend(objj_msgSend(_5f,"platformObject"),"bind:toObject:withKeyPath:options:",CPValueBinding,_5d,"arrangedObjects."+objj_msgSend(objj_msgSend(_5f,"attributes"),"objectForKey:","identifier"),nil);
}
}
}else{
var _60=objj_msgSend(_56,"substringToIndex:",r.location);
var _5d=objj_msgSend(_53,"_getObjectForIdString:",_60);
var _61=objj_msgSend(_56,"substringFromIndex:",CPMaxRange(r));
if(objj_msgSend(oPO,"isKindOfClass:",objj_msgSend(CPPredicateEditor,"class"))){
objj_msgSend(oPO,"setObjectValue:",objj_msgSend(_53,"_getObjectForIdString:",_56));
objj_msgSend(_5d,"bind:toObject:withKeyPath:options:","filterPredicate",oPO,"objectValue",nil);
}else{
var _62=CPValueBinding;
if(objj_msgSend(oPO,"isKindOfClass:",objj_msgSend(FSArrayController,"class"))){
_62="contentArray";
}else{
if(objj_msgSend(oPO,"isKindOfClass:",objj_msgSend(CPPopUpButton,"class"))){
_62="integerValue";
}
}
objj_msgSend(oPO,"bind:toObject:withKeyPath:options:",_62,_5d,_61,nil);
}
}
}
if(_56=objj_msgSend(objj_msgSend(o,"attributes"),"objectForKey:","filterPredicate")){
if(objj_msgSend(oPO,"isKindOfClass:",objj_msgSend(FSArrayController,"class"))){
objj_msgSend(oPO,"setClearsFilterPredicateOnInsertion:",NO);
objj_msgSend(oPO,"setFilterPredicate:",objj_msgSend(_53,"_getObjectForIdString:",_56));
}
}
if(_56=objj_msgSend(objj_msgSend(o,"attributes"),"objectForKey:","formatterClass")){
var _63=objj_msgSend(objj_msgSend(o,"attributes"),"objectForKey:","displayFormat");
var _64=objj_msgSend(objj_msgSend(o,"attributes"),"objectForKey:","editingFormat");
var _65=(objj_msgSend(o,"boolValueForAttribute:","editingFormat")==1);
if(!_63&&!_64){
objj_msgSend(oPO,"setFormatter:",objj_msgSend(CPClassFromString(_56),"new"));
}else{
objj_msgSend(oPO,"setFormatter:",objj_msgSend(CPClassFromString(_56),"formatterWithDisplayFormat:editingFormat:emptyIsValid:",_63,_64,_65));
}
}
objj_msgSend(_53,"_postprocessForBindings:",objj_msgSend(o,"content"));
}
}
}),new objj_method(sel_getUid("_postprocessForEntities:"),function(_66,_67,_68){
with(_66){
var i,l=_68.length;
for(i=0;i<l;i++){
var o=_68[i];
if(!objj_msgSend(o,"respondsToSelector:",sel_getUid("platformObject"))){
continue;
}
var oPO=objj_msgSend(o,"platformObject");
if(objj_msgSend(oPO,"isKindOfClass:",objj_msgSend(FSArrayController,"class"))){
var _69;
if(_69=objj_msgSend(objj_msgSend(o,"attributes"),"objectForKey:","sortDescriptor")){
objj_msgSend(oPO,"setSortDescriptors:",[objj_msgSend(_66,"_getObjectForIdString:",_69)]);
}
if(_69=objj_msgSend(objj_msgSend(o,"attributes"),"objectForKey:","entity")){
var _6a=objj_msgSend(objj_msgSend(_nameTable,"objectForKey:",_69),"platformObject");
objj_msgSend(oPO,"setEntity:",_6a);
}
if(objj_msgSend(o,"boolValueForAttribute:","autoFetch")==1){
var _6b=objj_msgSend(objj_msgSend(o,"attributes"),"objectForKey:","entity");
if(_6b){
var _6a;
if(_6a=objj_msgSend(objj_msgSend(_nameTable,"objectForKey:",_6b),"platformObject")){
objj_msgSend(oPO,"setContent:",objj_msgSend(_6a,"allObjects"));
}
}
}
}
objj_msgSend(_66,"_postprocessForEntities:",objj_msgSend(o,"content"));
}
}
}),new objj_method(sel_getUid("parse"),function(_6c,_6d){
with(_6c){
var t=objj_msgSend(_6c,"parseXMLString:",_xmlStr);
var _6e=t.getElementsByTagName("objects");
if(_6e){
objj_msgSend(_6c,"processDOMNode:intoContainer:",_6e[0],_objects);
}
var _6f=t.getElementsByTagName("entities");
if(_6f){
objj_msgSend(_6c,"processDOMNode:intoContainer:",_6f[0],_entites);
objj_msgSend(_6c,"_postprocessEntities");
}
var _70=t.getElementsByTagName("connectors");
if(_70){
objj_msgSend(_6c,"processDOMNode:intoContainer:",_70[0],_connectors);
}
objj_msgSend(_6c,"_postprocessForEntities:",_objects);
objj_msgSend(_6c,"_postprocessForBindings:",_objects);
}
}),new objj_method(sel_getUid("nameTable"),function(_71,_72){
with(_71){
return _nameTable;
}
}),new objj_method(sel_getUid("objects"),function(_73,_74){
with(_73){
return _objects;
}
}),new objj_method(sel_getUid("connectors"),function(_75,_76){
with(_75){
return _connectors;
}
}),new objj_method(sel_getUid("entities"),function(_77,_78){
with(_77){
return _entities;
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("initialize"),function(_79,_7a){
with(_79){
if(_79=objj_msgSendSuper({receiver:_79,super_class:objj_getMetaClass("GSMarkupDecoder").super_class},"initialize")){
}
return _79;
}
}),new objj_method(sel_getUid("decoderWithContentsOfFile:"),function(_7b,_7c,_7d){
with(_7b){
return objj_msgSend(objj_msgSend(_7b,"alloc"),"initWithContentsOfFile:",_7d);
}
})]);
p;42;Frameworks/Renaissance/GSMarkupLocalizer.jt;847;@STATIC;1.0;I;21;Foundation/CPObject.jt;803;
objj_executeFile("Foundation/CPObject.j",NO);
var _1=objj_allocateClassPair(CPObject,"GSMarkupLocalizer"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initWithTable:bundle:"),function(_3,_4,_5,_6){
with(_3){
_bundle=_6;
_table=_5;
return _3;
}
}),new objj_method(sel_getUid("dealloc"),function(_7,_8){
with(_7){
objj_msgSendSuper({receiver:_7,super_class:objj_getClass("GSMarkupLocalizer").super_class},"dealloc");
}
}),new objj_method(sel_getUid("localizeString:"),function(_9,_a,_b){
with(_9){
var _c;
_c=objj_msgSend(_bundle,"localizedStringForKey:value:table:",_b,nil,_table);
if(objj_msgSend(_c,"isEqualToString:","")||objj_msgSend(_c,"isEqualToString:",_b)){
_c=objj_msgSend(_bundle,"localizedStringForKey:value:table:",_b,_b,nil);
}
return _c;
}
})]);
p;39;Frameworks/Renaissance/GSMarkupTagBox.jt;4171;@STATIC;1.0;i;17;GSMarkupTagView.jt;4130;
objj_executeFile("GSMarkupTagView.j",YES);
var _1=objj_allocateClassPair(CPView,"GSMarkupBoxContentView"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("firstSubview"),function(_3,_4){
with(_3){
var _5=objj_msgSend(_3,"subviews");
if(_5!=nil&&objj_msgSend(_5,"count")>0){
return objj_msgSend(_5,"objectAtIndex:",0);
}else{
return nil;
}
}
}),new objj_method(sel_getUid("sizeToFit"),function(_6,_7){
with(_6){
var _8=objj_msgSend(_6,"firstSubview");
objj_msgSend(_6,"setAutoresizesSubviews:",NO);
if(_8){
objj_msgSend(_6,"setFrameSize:",objj_msgSend(_8,"frame").size);
}else{
objj_msgSend(_6,"setFrameSize:",CPMakeSize(50,50));
}
objj_msgSend(_6,"setAutoresizesSubviews:",YES);
}
}),new objj_method(sel_getUid("autolayoutDefaultVerticalAlignment"),function(_9,_a){
with(_9){
var _b=objj_msgSend(_9,"firstSubview");
if(_b){
return objj_msgSend(_b,"autolayoutDefaultVerticalAlignment");
}else{
return objj_msgSendSuper({receiver:_9,super_class:objj_getClass("GSMarkupBoxContentView").super_class},"autolayoutDefaultVerticalAlignment");
}
}
}),new objj_method(sel_getUid("autolayoutDefaultHorizontalAlignment"),function(_c,_d){
with(_c){
var _e=objj_msgSend(_c,"firstSubview");
if(_e){
return objj_msgSend(_e,"autolayoutDefaultHorizontalAlignment");
}else{
return objj_msgSendSuper({receiver:_c,super_class:objj_getClass("GSMarkupBoxContentView").super_class},"autolayoutDefaultHorizontalAlignment");
}
}
})]);
var _1=objj_allocateClassPair(GSMarkupTagView,"GSMarkupTagBox"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initPlatformObject:"),function(_f,_10,_11){
with(_f){
_11=objj_msgSend(_11,"init");
var _12=objj_msgSend(_f,"localizedStringValueForAttribute:","title");
if(_12==nil){
}else{
objj_msgSend(_11,"setTitlePosition:",CPAtTop);
objj_msgSend(_11,"setTitle:",_12);
}
if(objj_msgSend(_f,"boolValueForAttribute:","hasBorder")==0){
objj_msgSend(_11,"setBorderType:",CPNoBorder);
}
if(_content!=nil&&objj_msgSend(_content,"count")>0){
var _13=objj_msgSend(objj_msgSend(_content,"objectAtIndex:",0),"platformObject");
if(objj_msgSend(_13,"isKindOfClass:",objj_msgSend(CPView,"class"))){
var v=objj_msgSend(GSMarkupBoxContentView,"new");
objj_msgSend(_11,"setAutoresizingMask:",objj_msgSend(_13,"autoresizingMask"));
objj_msgSend(v,"setAutoresizingMask:",CPViewWidthSizable|CPViewHeightSizable);
objj_msgSend(v,"addSubview:",_13);
objj_msgSend(_11,"setAutoresizesSubviews:",NO);
objj_msgSend(_11,"setContentView:",v);
objj_msgSend(v,"sizeToFit");
objj_msgSend(_11,"sizeToFit");
objj_msgSend(_11,"setAutoresizesSubviews:",YES);
}
}
return _11;
}
}),new objj_method(sel_getUid("gsAutoLayoutVAlignment"),function(_14,_15){
with(_14){
var _16=objj_msgSendSuper({receiver:_14,super_class:objj_getClass("GSMarkupTagBox").super_class},"gsAutoLayoutVAlignment");
if(_16!=255){
return _16;
}
var _17=objj_msgSend(_content,"objectAtIndex:",0);
if(objj_msgSend(_17,"isKindOfClass:",objj_msgSend(GSMarkupTagView,"class"))){
_16=objj_msgSend(_17,"gsAutoLayoutVAlignment");
if(_16!=255){
if(_16==GSAutoLayoutExpand||_16==GSAutoLayoutWeakExpand){
return _16;
}else{
return GSAutoLayoutAlignCenter;
}
}
}
return 255;
}
}),new objj_method(sel_getUid("gsAutoLayoutHAlignment"),function(_18,_19){
with(_18){
var _1a=objj_msgSendSuper({receiver:_18,super_class:objj_getClass("GSMarkupTagBox").super_class},"gsAutoLayoutHAlignment");
if(_1a!=255){
return _1a;
}
var _1b=objj_msgSend(_content,"objectAtIndex:",0);
if(objj_msgSend(_1b,"isKindOfClass:",objj_msgSend(GSMarkupTagView,"class"))){
_1a=objj_msgSend(_1b,"gsAutoLayoutHAlignment");
if(_1a!=255){
if(_1a==GSAutoLayoutExpand||_1a==GSAutoLayoutWeakExpand){
return _1a;
}else{
return GSAutoLayoutAlignCenter;
}
}
}
return 255;
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("tagName"),function(_1c,_1d){
with(_1c){
return "box";
}
}),new objj_method(sel_getUid("platformObjectClass"),function(_1e,_1f){
with(_1e){
return objj_msgSend(CPBox,"class");
}
}),new objj_method(sel_getUid("localizableAttributes"),function(_20,_21){
with(_20){
return objj_msgSend(CPArray,"arrayWithObject:","title");
}
})]);
p;42;Frameworks/Renaissance/GSMarkupTagButton.jt;4532;@STATIC;1.0;i;20;GSMarkupTagControl.jt;4488;
objj_executeFile("GSMarkupTagControl.j",YES);
var _1=objj_allocateClassPair(GSMarkupTagControl,"GSMarkupTagButton"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initPlatformObject:"),function(_3,_4,_5){
with(_3){
_5=objj_msgSendSuper({receiver:_3,super_class:objj_getClass("GSMarkupTagButton").super_class},"initPlatformObject:",_5);
var _6=objj_msgSend(_3,"localizedStringValueForAttribute:","title");
if(_6!=nil){
objj_msgSend(_5,"setTitle:",_6);
}else{
objj_msgSend(_5,"setTitle:","");
}
var f=objj_msgSend(_3,"fontValueForAttribute:","font");
if(f==nil){
}
var _7=objj_msgSend(_attributes,"objectForKey:","image");
if(_7!=nil){
objj_msgSend(_5,"setImage:",objj_msgSend(CPImage,"imageNamed:",_7));
}
var _8=objj_msgSend(_attributes,"objectForKey:","imagePosition");
if(_8!=nil&&objj_msgSend(_8,"length")>0){
switch(objj_msgSend(_8,"characterAtIndex:",0)){
case "a":
if(objj_msgSend(_8,"isEqualToString:","above")){
objj_msgSend(_5,"setImagePosition:",CPImageAbove);
}
break;
case "b":
if(objj_msgSend(_8,"isEqualToString:","below")){
objj_msgSend(_5,"setImagePosition:",CPImageBelow);
}
break;
case "l":
if(objj_msgSend(_8,"isEqualToString:","left")){
objj_msgSend(_5,"setImagePosition:",CPImageLeft);
}
break;
case "o":
if(objj_msgSend(_8,"isEqualToString:","overlaps")){
objj_msgSend(_5,"setImagePosition:",CPImageOverlaps);
}
break;
case "r":
if(objj_msgSend(_8,"isEqualToString:","right")){
objj_msgSend(_5,"setImagePosition:",CPImageRight);
}
break;
case "i":
if(objj_msgSend(_8,"isEqualToString:","imageOnly")){
objj_msgSend(_5,"setImagePosition:",CPImageOnly);
}
break;
}
}
var _9=objj_msgSend(_attributes,"objectForKey:","keyEquivalent");
if(_9==nil){
_9=objj_msgSend(_attributes,"objectForKey:","key");
if(_9!=nil){
CPLog("The 'key' attribute of the <button> tag is obsolete; please replace it with 'keyEquivalent'");
}
}
if(_9!=nil){
objj_msgSend(_5,"setKeyEquivalent:",_9);
}
var _a=objj_msgSend(_attributes,"objectForKey:","keyEquivalentModifierMask");
if(_a!=nil){
var _b;
var _c=-1;
_b=objj_msgSend(CPDictionary,"dictionaryWithObjectsAndKeys:",objj_msgSend(CPNumber,"numberWithInt:",0),"noKey",objj_msgSend(CPNumber,"numberWithInt:",CPControlKeyMask),"controlKey",objj_msgSend(CPNumber,"numberWithInt:",CPAlternateKeyMask),"alternateKey",objj_msgSend(CPNumber,"numberWithInt:",CPCommandKeyMask),"commandKey",objj_msgSend(CPNumber,"numberWithInt:",CPShiftKeyMask),"shiftKey");
_c=objj_msgSend(_3,"integerMaskValueForAttribute:withMaskValuesDictionary:","keyEquivalentModifierMask",_b);
objj_msgSend(_5,"setKeyEquivalentModifierMask:",_c);
}
var t=objj_msgSend(_3,"localizedStringValueForAttribute:","alternateTitle");
if(t!=nil){
objj_msgSend(_5,"setAlternateTitle:",t);
}
var _7=objj_msgSend(_attributes,"objectForKey:","alternateImage");
if(_7!=nil){
objj_msgSend(_5,"setAlternateImage:",objj_msgSend(CPImage,"imageNamed:",_7));
}
var _d=objj_msgSend(_attributes,"objectForKey:","type");
var _e=YES;
if(_d!=nil){
switch(objj_msgSend(_d,"characterAtIndex:",0)){
case "m":
if(objj_msgSend(_d,"isEqualToString:","momentaryPushIn")){
objj_msgSend(_5,"setButtonType:",CPMomentaryPushInButton);
}
if(objj_msgSend(_d,"isEqualToString:","momentaryChange")){
objj_msgSend(_5,"setButtonType:",CPMomentaryChangeButton);
}
break;
case "p":
if(objj_msgSend(_d,"isEqualToString:","pushOnPushOff")){
objj_msgSend(_5,"setButtonType:",CPPushOnPushOffButton);
}
break;
case "t":
if(objj_msgSend(_d,"isEqualToString:","toggle")){
objj_msgSend(_5,"setButtonType:",CPToggleButton);
}
break;
case "s":
if(objj_msgSend(_d,"isEqualToString:","switch")){
objj_msgSend(_5,"setButtonType:",CPSwitchButton);
_e=NO;
}
break;
}
}else{
objj_msgSend(_5,"setButtonType:",CPMomentaryPushInButton);
}
if(_e){
if(objj_msgSend(_attributes,"objectForKey:","image")==nil){
objj_msgSend(_5,"setBezelStyle:",CPRoundedBezelStyle);
}else{
objj_msgSend(_5,"setBezelStyle:",CPRegularSquareBezelStyle);
}
}
var _f=objj_msgSend(_attributes,"objectForKey:","sound");
if(_f!=nil){
objj_msgSend(_5,"setSound:",objj_msgSend(CPSound,"soundNamed:",_f));
}
return _5;
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("tagName"),function(_10,_11){
with(_10){
return "button";
}
}),new objj_method(sel_getUid("platformObjectClass"),function(_12,_13){
with(_12){
return objj_msgSend(CPButton,"class");
}
}),new objj_method(sel_getUid("localizableAttributes"),function(_14,_15){
with(_14){
return objj_msgSend(CPArray,"arrayWithObjects:","title","alternateTitle",nil);
}
})]);
p;55;Frameworks/Renaissance/GSMarkupTagCappuccinoAdditions.jt;16287;@STATIC;1.0;i;17;GSMarkupTagView.jt;16245;
objj_executeFile("GSMarkupTagView.j",YES);
var _1=objj_allocateClassPair(GSMarkupTagView,"GSMarkupTagFlashView"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initPlatformObject:"),function(_3,_4,_5){
with(_3){
_5=objj_msgSendSuper({receiver:_3,super_class:objj_getClass("GSMarkupTagFlashView").super_class},"initPlatformObject:",_5);
var _6=objj_msgSend(_attributes,"objectForKey:","ressource");
if(_6!=nil){
objj_msgSend(_5,"setFlashMovie:",objj_msgSend(CPFlashMovie,"flashMovieWithFile:",objj_msgSend(CPString,"stringWithFormat:","%@/%@",objj_msgSend(objj_msgSend(CPBundle,"mainBundle"),"resourcePath"),_6)));
}
return _5;
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("tagName"),function(_7,_8){
with(_7){
return "flashView";
}
}),new objj_method(sel_getUid("platformObjectClass"),function(_9,_a){
with(_9){
return objj_msgSend(CPFlashView,"class");
}
})]);
var _1=objj_allocateClassPair(GSMarkupTagControl,"GSMarkupTagLevelIndicator"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initPlatformObject:"),function(_b,_c,_d){
with(_b){
_d=objj_msgSendSuper({receiver:_b,super_class:objj_getClass("GSMarkupTagLevelIndicator").super_class},"initPlatformObject:",_d);
var _e;
var _f;
var _10;
var _11;
var _12;
_e=objj_msgSend(_attributes,"objectForKey:","min");
if(_e!=nil){
objj_msgSend(_d,"setMinValue:",objj_msgSend(_e,"doubleValue"));
}
_f=objj_msgSend(_attributes,"objectForKey:","max");
if(_f!=nil){
objj_msgSend(_d,"setMaxValue:",objj_msgSend(_f,"doubleValue"));
}
_10=objj_msgSend(_attributes,"objectForKey:","warning");
if(_10!=nil){
objj_msgSend(_d,"setWarningValue:",objj_msgSend(_10,"doubleValue"));
}
_11=objj_msgSend(_attributes,"objectForKey:","critical");
if(_11!=nil){
objj_msgSend(_d,"setCriticalValue:",objj_msgSend(_11,"doubleValue"));
}
var _13;
_13=objj_msgSend(_attributes,"objectForKey:","height");
if(_13==nil){
objj_msgSend(_attributes,"setObject:forKey:","25","height");
}
var _14;
_14=objj_msgSend(_attributes,"objectForKey:","width");
if(_14==nil){
objj_msgSend(_attributes,"setObject:forKey:","250","width");
}
return _d;
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("tagName"),function(_15,_16){
with(_15){
return "levelIndicator";
}
}),new objj_method(sel_getUid("platformObjectClass"),function(_17,_18){
with(_17){
return objj_msgSend(CPLevelIndicator,"class");
}
})]);
var _1=objj_allocateClassPair(GSMarkupTagObject,"GSMarkupOperator"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("content"),function(_19,_1a){
with(_19){
return _content;
}
}),new objj_method(sel_getUid("allocPlatformObject"),function(_1b,_1c){
with(_1b){
return nil;
}
}),new objj_method(sel_getUid("operator"),function(_1d,_1e){
with(_1d){
var _1f=objj_msgSend(_attributes,"objectForKey:","type");
if(_1f=="equal"){
return objj_msgSend(CPNumber,"numberWithInt:",CPEqualToPredicateOperatorType);
}else{
if(_1f=="begins"){
return objj_msgSend(CPNumber,"numberWithInt:",CPBeginsWithPredicateOperatorType);
}else{
if(_1f=="ends"){
return objj_msgSend(CPNumber,"numberWithInt:",CPEndsWithPredicateOperatorType);
}
}
}
return nil;
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("tagName"),function(_20,_21){
with(_20){
return "operator";
}
})]);
var _1=objj_allocateClassPair(GSMarkupTagObject,"GSMarkupLexpression"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("content"),function(_22,_23){
with(_22){
return _content;
}
}),new objj_method(sel_getUid("allocPlatformObject"),function(_24,_25){
with(_24){
return nil;
}
}),new objj_method(sel_getUid("keyPath"),function(_26,_27){
with(_26){
return objj_msgSend(_attributes,"objectForKey:","keyPath");
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("tagName"),function(_28,_29){
with(_28){
return "lexpression";
}
})]);
var _1=objj_allocateClassPair(GSMarkupTagObject,"GSMarkupRexpression"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("content"),function(_2a,_2b){
with(_2a){
return _content;
}
}),new objj_method(sel_getUid("allocPlatformObject"),function(_2c,_2d){
with(_2c){
return nil;
}
}),new objj_method(sel_getUid("keyPath"),function(_2e,_2f){
with(_2e){
return objj_msgSend(_attributes,"objectForKey:","keyPath");
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("tagName"),function(_30,_31){
with(_30){
return "rexpression";
}
})]);
var _1=objj_allocateClassPair(GSMarkupTagObject,"GSMarkupRowTemplate"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("allocPlatformObject"),function(_32,_33){
with(_32){
return nil;
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("tagName"),function(_34,_35){
with(_34){
return "rowTemplate";
}
})]);
var _1=objj_getClass("CPPredicateEditor");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"CPPredicateEditor\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("sizeToFit"),function(_36,_37){
with(_36){
}
})]);
var _1=objj_allocateClassPair(GSMarkupTagView,"GSMarkupTagPredicateEditor"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initPlatformObject:"),function(_38,_39,_3a){
with(_38){
_3a=objj_msgSendSuper({receiver:_38,super_class:objj_getClass("GSMarkupTagPredicateEditor").super_class},"initPlatformObject:",_3a);
var _3b=objj_msgSend(CPMutableArray,"new");
var i,_3c=_content.length;
for(i=0;i<_3c;i++){
var v=_content[i];
if(objj_msgSend(v,"isKindOfClass:",objj_msgSend(GSMarkupRowTemplate,"class"))){
var _3d=objj_msgSend(v,"content");
var j,l1=_3d.length;
var _3e=objj_msgSend(CPMutableArray,"new");
var ops=objj_msgSend(CPMutableArray,"new");
for(j=0;j<l1;j++){
var _3f=_3d[j];
if(objj_msgSend(_3f,"isKindOfClass:",objj_msgSend(GSMarkupLexpression,"class"))){
objj_msgSend(_3e,"addObject:",objj_msgSend(CPExpression,"expressionForKeyPath:",objj_msgSend(_3f,"keyPath")));
}else{
if(objj_msgSend(_3f,"isKindOfClass:",objj_msgSend(GSMarkupOperator,"class"))){
if(objj_msgSend(_3f,"operator")){
objj_msgSend(ops,"addObject:",objj_msgSend(_3f,"operator"));
}
}
}
}
var _40=objj_msgSend(objj_msgSend(CPPredicateEditorRowTemplate,"alloc"),"initWithLeftExpressions:rightExpressionAttributeType:modifier:operators:options:",_3e,CPStringAttributeType,0,ops,0);
objj_msgSend(_3b,"addObject:",_40);
}
}
objj_msgSend(_3a,"setNestingMode:",CPRuleEditorNestingModeCompound);
objj_msgSend(_3b,"addObject:",objj_msgSend(objj_msgSend(CPPredicateEditorRowTemplate,"alloc"),"initWithCompoundTypes:",objj_msgSend(CPArray,"arrayWithObjects:",objj_msgSend(CPNumber,"numberWithInt:",CPAndPredicateType),objj_msgSend(CPNumber,"numberWithInt:",CPOrPredicateType),objj_msgSend(CPNumber,"numberWithInt:",CPNotPredicateType))));
objj_msgSend(_3a,"setRowTemplates:",_3b);
objj_msgSend(_3a,"setFormattingStringsFilename:",nil);
return _3a;
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("tagName"),function(_41,_42){
with(_41){
return "predicateEditor";
}
}),new objj_method(sel_getUid("platformObjectClass"),function(_43,_44){
with(_43){
return objj_msgSend(CPPredicateEditor,"class");
}
})]);
var _1=objj_allocateClassPair(GSMarkupTagObject,"GSMarkupTagPredicate"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initPlatformObject:"),function(_45,_46,_47){
with(_45){
_47=objj_msgSend(CPPredicate,"predicateWithFormat:argumentArray:",objj_msgSend(_attributes,"objectForKey:","format"),nil);
return _47;
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("tagName"),function(_48,_49){
with(_48){
return "predicate";
}
}),new objj_method(sel_getUid("platformObjectClass"),function(_4a,_4b){
with(_4a){
return nil;
}
})]);
var _1=objj_allocateClassPair(GSMarkupTagObject,"GSMarkupTagTabViewItem"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("title"),function(_4c,_4d){
with(_4c){
return objj_msgSend(_attributes,"objectForKey:","title");
}
}),new objj_method(sel_getUid("initPlatformObject:"),function(_4e,_4f,_50){
with(_4e){
_50=objj_msgSend(objj_msgSend(CPTabViewItem,"alloc"),"initWithIdentifier:",objj_msgSend(_4e,"title"));
return _50;
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("tagName"),function(_51,_52){
with(_51){
return "tabViewItem";
}
}),new objj_method(sel_getUid("platformObjectClass"),function(_53,_54){
with(_53){
return nil;
}
})]);
var _1=objj_allocateClassPair(GSMarkupTagView,"GSMarkupTagTabView"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("type"),function(_55,_56){
with(_55){
if(objj_msgSend(_attributes,"objectForKey:","type")=="topBezel"){
return CPTopTabsBezelBorder;
}
return CPNoTabsBezelBorder;
}
}),new objj_method(sel_getUid("initPlatformObject:"),function(_57,_58,_59){
with(_57){
_59=objj_msgSendSuper({receiver:_57,super_class:objj_getClass("GSMarkupTagTabView").super_class},"initPlatformObject:",_59);
objj_msgSend(_59,"setTabViewType:",objj_msgSend(_57,"type"));
var i,_5a=_content.length;
for(i=0;i<_5a;i++){
var _5b=objj_msgSend(_content[i],"platformObject");
objj_msgSend(_5b,"setView:",objj_msgSend(objj_msgSend(_content[i],"content")[0],"platformObject"));
objj_msgSend(_5b,"setLabel:",objj_msgSend(_content[i],"title"));
objj_msgSend(_59,"addTabViewItem:",_5b);
}
return _59;
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("tagName"),function(_5c,_5d){
with(_5c){
return "tabView";
}
}),new objj_method(sel_getUid("platformObjectClass"),function(_5e,_5f){
with(_5e){
return objj_msgSend(CPTabView,"class");
}
})]);
var _1=objj_getClass("CPTabView");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"CPTabView\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("autolayoutDefaultVerticalAlignment"),function(_60,_61){
with(_60){
return GSAutoLayoutExpand;
}
}),new objj_method(sel_getUid("autolayoutDefaultHorizontalAlignment"),function(_62,_63){
with(_62){
return GSAutoLayoutExpand;
}
})]);
var _1=objj_allocateClassPair(GSMarkupTagControl,"GSMarkupTagCheckBox"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initPlatformObject:"),function(_64,_65,_66){
with(_64){
_66=objj_msgSendSuper({receiver:_64,super_class:objj_getClass("GSMarkupTagCheckBox").super_class},"initPlatformObject:",_66);
objj_msgSend(_66,"setTitle:",objj_msgSend(_attributes,"objectForKey:","title"));
return _66;
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("tagName"),function(_67,_68){
with(_67){
return "checkBox";
}
}),new objj_method(sel_getUid("platformObjectClass"),function(_69,_6a){
with(_69){
return objj_msgSend(CPCheckBox,"class");
}
})]);
var _1=objj_getClass("CPCollectionView");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"CPCollectionView\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("setObjectValue:"),function(_6b,_6c,_6d){
with(_6b){
objj_msgSend(_6b,"setContent:",_6d);
}
}),new objj_method(sel_getUid("value"),function(_6e,_6f){
with(_6e){
return objj_msgSend(_6e,"content");
}
}),new objj_method(sel_getUid("setValue:"),function(_70,_71,_72){
with(_70){
return objj_msgSend(_70,"setObjectValue:",_72);
}
}),new objj_method(sel_getUid("autolayoutDefaultVerticalAlignment"),function(_73,_74){
with(_73){
return GSAutoLayoutExpand;
}
}),new objj_method(sel_getUid("autolayoutDefaultHorizontalAlignment"),function(_75,_76){
with(_75){
return GSAutoLayoutExpand;
}
}),new objj_method(sel_getUid("performDragOperation:"),function(_77,_78,_79){
with(_77){
objj_msgSend(_delegate,"performDragOperation:",_79);
}
})]);
var _1=objj_allocateClassPair(GSMarkupTagView,"GSMarkupTagCollectionView"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initPlatformObject:"),function(_7a,_7b,_7c){
with(_7a){
_7c=objj_msgSendSuper({receiver:_7a,super_class:objj_getClass("GSMarkupTagCollectionView").super_class},"initPlatformObject:",_7c);
objj_msgSend(_7c,"setSelectable:",objj_msgSend(_7a,"boolValueForAttribute:","selectable")==1);
objj_msgSend(_7c,"setAllowsEmptySelection:",objj_msgSend(_7a,"boolValueForAttribute:","emptySelectionAllowed")==1);
objj_msgSend(_7c,"setAllowsMultipleSelection:",objj_msgSend(_7a,"boolValueForAttribute:","multipleSelectionAllowed")!=0);
objj_msgSend(_7c,"setMaxNumberOfRows:",objj_msgSend(_7a,"intValueForAttribute:","maxRows"));
objj_msgSend(_7c,"setMaxNumberOfColumns:",objj_msgSend(_7a,"intValueForAttribute:","maxColumns"));
var _7d=objj_msgSend(_7a,"intValueForAttribute:","itemWidth");
var _7e=objj_msgSend(_7a,"intValueForAttribute:","itemHeight");
if(_7d&&_7e){
var _7f=CPMakeSize(_7d,_7e);
objj_msgSend(_7c,"setMinItemSize:",_7f);
objj_msgSend(_7c,"setMaxItemSize:",_7f);
}
var _7d=objj_msgSend(_7a,"intValueForAttribute:","minItemWidth");
var _7e=objj_msgSend(_7a,"intValueForAttribute:","minItemHeight");
if(_7d&&_7e){
objj_msgSend(_7c,"setMinItemSize:",CPMakeSize(_7d,_7e));
}
var _7d=objj_msgSend(_7a,"intValueForAttribute:","maxItemWidth");
var _7e=objj_msgSend(_7a,"intValueForAttribute:","maxItemHeight");
if(_7d&&_7e){
objj_msgSend(_7c,"setMaxItemSize:",CPMakeSize(_7d,_7e));
}
var _80=CPClassFromString(objj_msgSend(_7a,"stringValueForAttribute:","itemsClassName"));
if(!_80){
_80=objj_msgSend(CPCollectionViewItem,"class");
}
var _81=objj_msgSend(_80,"new");
var _82;
objj_msgSend(_7c,"setItemPrototype:",_81);
return _7c;
}
}),new objj_method(sel_getUid("postInitPlatformObject:"),function(_83,_84,_85){
with(_83){
_85=objj_msgSendSuper({receiver:_83,super_class:objj_getClass("GSMarkupTagCollectionView").super_class},"postInitPlatformObject:",_85);
objj_msgSend(_85,"tile");
return _85;
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("tagName"),function(_86,_87){
with(_86){
return "collectionView";
}
}),new objj_method(sel_getUid("platformObjectClass"),function(_88,_89){
with(_88){
return objj_msgSend(CPCollectionView,"class");
}
})]);
var _1=objj_allocateClassPair(GSMarkupTagView,"GSMarkupTagButtonBar"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initPlatformObject:"),function(_8a,_8b,_8c){
with(_8a){
objj_msgSend(_attributes,"setObject:forKey:","25","height");
_8c=objj_msgSendSuper({receiver:_8a,super_class:objj_getClass("GSMarkupTagButtonBar").super_class},"initPlatformObject:",_8c);
objj_msgSend(_8c,"setHasResizeControl:",objj_msgSend(_8a,"boolValueForAttribute:","resizable")==1);
var _8d=[];
var _8e;
if(_8e=objj_msgSend(_8a,"stringValueForAttribute:","plusButtonAction")){
var _8f=objj_msgSend(CPButtonBar,"plusButton");
objj_msgSend(_8f,"setAction:",CPSelectorFromString(_8e));
objj_msgSend(_8d,"addObject:",_8f);
}
if(_8e=objj_msgSend(_8a,"stringValueForAttribute:","minusButtonAction")){
var _8f=objj_msgSend(CPButtonBar,"minusButton");
objj_msgSend(_8f,"setAction:",CPSelectorFromString(_8e));
objj_msgSend(_8d,"addObject:",_8f);
}
if(objj_msgSend(_8a,"boolValueForAttribute:","actionsButton")==1){
var _90;
objj_msgSend(_8d,"addObject:",_90=objj_msgSend(CPButtonBar,"actionPopupButton"));
var i,_91=objj_msgSend(_content,"count");
for(i=0;i<_91;i++){
var _92=objj_msgSend(_content,"objectAtIndex:",i);
var _93=objj_msgSend(_92,"localizedStringValueForAttribute:","title");
if(_93==nil){
_93="";
}
objj_msgSend(_90,"addItemWithTitle:",_93);
var _94=objj_msgSend(_90,"lastItem");
_94=objj_msgSend(_92,"initPlatformObject:",_94);
objj_msgSend(_92,"setPlatformObject:",_94);
}
}
objj_msgSend(_8c,"setButtons:",_8d);
return _8c;
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("tagName"),function(_95,_96){
with(_95){
return "ButtonBar";
}
}),new objj_method(sel_getUid("platformObjectClass"),function(_97,_98){
with(_97){
return objj_msgSend(CPButtonBar,"class");
}
})]);
var _1=objj_getClass("CPButtonBar");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"CPButtonBar\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("setTarget:"),function(_99,_9a,_9b){
with(_99){
objj_msgSend(objj_msgSend(_99,"buttons"),"makeObjectsPerformSelector:withObject:",sel_getUid("setTarget:"),_9b);
}
}),new objj_method(sel_getUid("autolayoutDefaultHorizontalAlignment"),function(_9c,_9d){
with(_9c){
return GSAutoLayoutExpand;
}
})]);
p;43;Frameworks/Renaissance/GSMarkupTagControl.jt;3886;@STATIC;1.0;t;3867;
var _1=objj_allocateClassPair(GSMarkupTagView,"GSMarkupTagControl"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initPlatformObject:"),function(_3,_4,_5){
with(_3){
_5=objj_msgSend(_5,"init");
var _6=objj_msgSend(_attributes,"objectForKey:","action");
if(_6!=nil){
var _7=CPSelectorFromString(_6);
if(_7==NULL){
CPLog("Warning: <%@> has non-existing action '%@'.  Ignored.",objj_msgSend(objj_msgSend(_3,"class"),"tagName"),_6);
}else{
objj_msgSend(_5,"setAction:",_7);
}
}
var _8=objj_msgSend(_3,"boolValueForAttribute:","continuous");
if(_8==1){
objj_msgSend(_5,"setContinuous:",YES);
}else{
if(_8==0){
objj_msgSend(_5,"setContinuous:",NO);
}
}
var _9=objj_msgSend(_3,"boolValueForAttribute:","enabled");
if(_9==1){
objj_msgSend(_5,"setEnabled:",YES);
}else{
if(_9==0){
objj_msgSend(_5,"setEnabled:",NO);
}
}
var _a=objj_msgSend(_attributes,"objectForKey:","tag");
if(_a!=nil){
objj_msgSend(_5,"setTag:",objj_msgSend(_a,"intValue"));
}
var _b=objj_msgSend(_attributes,"objectForKey:","sendActionOn");
if(_b!=nil){
var _c;
var _d=-1;
_c=objj_msgSend(CPDictionary,"dictionaryWithObjectsAndKeys:",objj_msgSend(CPNumber,"numberWithInt:",CPLeftMouseDownMask),"leftMouseDown",objj_msgSend(CPNumber,"numberWithInt:",CPLeftMouseUpMask),"leftMouseUp",objj_msgSend(CPNumber,"numberWithInt:",CPRightMouseDownMask),"rightMouseDown",objj_msgSend(CPNumber,"numberWithInt:",CPRightMouseUpMask),"rightMouseUp",objj_msgSend(CPNumber,"numberWithInt:",CPMouseMovedMask),"mouseMoved",objj_msgSend(CPNumber,"numberWithInt:",CPLeftMouseDraggedMask),"leftMouseDragged",objj_msgSend(CPNumber,"numberWithInt:",CPRightMouseDraggedMask),"rightMouseDragged",objj_msgSend(CPNumber,"numberWithInt:",CPMouseEnteredMask),"mouseEntered",objj_msgSend(CPNumber,"numberWithInt:",CPMouseExitedMask),"mouseExited",objj_msgSend(CPNumber,"numberWithInt:",CPKeyDownMask),"keyDown",objj_msgSend(CPNumber,"numberWithInt:",CPKeyUpMask),"keyUp",objj_msgSend(CPNumber,"numberWithInt:",CPFlagsChangedMask),"flagsChanged",objj_msgSend(CPNumber,"numberWithInt:",CPAppKitDefinedMask),"appKeyDefined",objj_msgSend(CPNumber,"numberWithInt:",CPSystemDefinedMask),"systemDefined",objj_msgSend(CPNumber,"numberWithInt:",CPApplicationDefinedMask),"applicationDefined",objj_msgSend(CPNumber,"numberWithInt:",CPPeriodicMask),"periodic",objj_msgSend(CPNumber,"numberWithInt:",CPCursorUpdateMask),"cursorUpdate",objj_msgSend(CPNumber,"numberWithInt:",CPScrollWheelMask),"scrollWheel",objj_msgSend(CPNumber,"numberWithInt:",CPOtherMouseDownMask),"otherMouseDown",objj_msgSend(CPNumber,"numberWithInt:",CPOtherMouseUpMask),"otherMouseUp",objj_msgSend(CPNumber,"numberWithInt:",CPOtherMouseDraggedMask),"otherMouseDragged",objj_msgSend(CPNumber,"numberWithInt:",CPAnyEventMask),"anyEvent");
_d=objj_msgSend(_3,"integerMaskValueForAttribute:withMaskValuesDictionary:","sendActionOn",_c);
objj_msgSend(_5,"sendActionOn:",_d);
}
var _e=objj_msgSend(_attributes,"objectForKey:","textAlignment");
if(_e==nil){
_e=objj_msgSend(_attributes,"objectForKey:","align");
if(_e!=nil){
CPLog("The 'align' attribute has been renamed to 'textAlignment'.  Please update your gsmarkup files");
}
}
if(_e!=nil){
if(objj_msgSend(_e,"isEqualToString:","left")){
objj_msgSend(_5,"setAlignment:",CPLeftTextAlignment);
}else{
if(objj_msgSend(_e,"isEqualToString:","right")){
objj_msgSend(_5,"setAlignment:",CPRightTextAlignment);
}else{
if(objj_msgSend(_e,"isEqualToString:","center")){
objj_msgSend(_5,"setAlignment:",CPCenterTextAlignment);
}
}
}
}
var f=objj_msgSend(_3,"fontValueForAttribute:","font");
if(f!=nil){
objj_msgSend(_5,"setFont:",f);
}
return _5;
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("tagName"),function(_f,_10){
with(_f){
return "control";
}
}),new objj_method(sel_getUid("platformObjectClass"),function(_11,_12){
with(_11){
return objj_msgSend(CPControl,"class");
}
})]);
p;44;Frameworks/Renaissance/GSMarkupTagFireside.jt;5584;@STATIC;1.0;i;19;GSMarkupTagObject.jI;21;Foundation/CPObject.ji;10;Fireside.jt;5500;
objj_executeFile("GSMarkupTagObject.j",YES);
objj_executeFile("Foundation/CPObject.j",NO);
objj_executeFile("Fireside.j",YES);
var _1=objj_allocateClassPair(GSMarkupTagObject,"GSMarkupColumn"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("name"),function(_3,_4){
with(_3){
return objj_msgSend(_attributes,"objectForKey:","name");
}
}),new objj_method(sel_getUid("isPK"),function(_5,_6){
with(_5){
return objj_msgSend(_5,"boolValueForAttribute:","primaryKey")==1;
}
}),new objj_method(sel_getUid("allocPlatformObject"),function(_7,_8){
with(_7){
return nil;
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("tagName"),function(_9,_a){
with(_9){
return "column";
}
})]);
var _1=objj_allocateClassPair(GSMarkupTagObject,"GSMarkupRelationship"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("name"),function(_b,_c){
with(_b){
return objj_msgSend(_attributes,"objectForKey:","name");
}
}),new objj_method(sel_getUid("target"),function(_d,_e){
with(_d){
return objj_msgSend(_attributes,"objectForKey:","target");
}
}),new objj_method(sel_getUid("targetColumn"),function(_f,_10){
with(_f){
return objj_msgSend(_attributes,"objectForKey:","targetColumn");
}
}),new objj_method(sel_getUid("bindingColumn"),function(_11,_12){
with(_11){
return objj_msgSend(_attributes,"objectForKey:","bindingColumn");
}
}),new objj_method(sel_getUid("isToMany"),function(_13,_14){
with(_13){
return objj_msgSend(_attributes,"objectForKey:","type")=="toMany";
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("tagName"),function(_15,_16){
with(_15){
return "relationship";
}
}),new objj_method(sel_getUid("platformObjectClass"),function(_17,_18){
with(_17){
return objj_msgSend(FSRelationship,"class");
}
})]);
var _1=objj_allocateClassPair(GSMarkupTagObject,"GSMarkupEntity"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initPlatformObject:"),function(_19,_1a,_1b){
with(_19){
var _1c=objj_msgSend(_attributes,"objectForKey:","store");
var _1d=objj_msgSend(_attributes,"objectForKey:","id");
_1b=objj_msgSend(_1b,"initWithName:andStore:",_1d,_1c);
var _1e=objj_msgSend(CPMutableSet,"new");
var _1f;
var i,_20=_content.length;
for(i=0;i<_20;i++){
var v=_content[i];
if(objj_msgSend(v,"isKindOfClass:",objj_msgSend(GSMarkupColumn,"class"))){
if(objj_msgSend(v,"isPK")){
if(_1f){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,"Duplicate PK "+objj_msgSend(v,"name")+"! "+_1f+" already is PK!");
}else{
_1f=objj_msgSend(v,"name");
}
}
objj_msgSend(_1e,"addObject:",objj_msgSend(v,"name"));
}else{
if(objj_msgSend(v,"isKindOfClass:",objj_msgSend(GSMarkupRelationship,"class"))){
var rel=objj_msgSend(objj_msgSend(FSRelationship,"alloc"),"initWithName:source:andTargetEntity:",objj_msgSend(v,"name"),_1b,objj_msgSend(v,"target"));
if(objj_msgSend(v,"bindingColumn")){
objj_msgSend(rel,"setBindingColumn:",objj_msgSend(v,"bindingColumn"));
}
if(objj_msgSend(v,"targetColumn")){
objj_msgSend(rel,"setTargetColumn:",objj_msgSend(v,"targetColumn"));
}
if(objj_msgSend(v,"isToMany")){
objj_msgSend(rel,"setType:",FSRelationshipTypeToMany);
}else{
objj_msgSend(rel,"setType:",FSRelationshipTypeToOne);
}
objj_msgSend(_1b,"addRelationship:",rel);
}
}
}
objj_msgSend(_1b,"setColumns:",_1e);
if(_1f){
objj_msgSend(_1b,"setPk:",_1f);
}
return _1b;
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("tagName"),function(_21,_22){
with(_21){
return "entity";
}
}),new objj_method(sel_getUid("platformObjectClass"),function(_23,_24){
with(_23){
return objj_msgSend(FSEntity,"class");
}
})]);
var _1=objj_allocateClassPair(CPArrayController,"FSArrayController"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_entity"),new objj_ivar("_defaultDict")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("entity"),function(_25,_26){
with(_25){
return _entity;
}
}),new objj_method(sel_getUid("setEntity:"),function(_27,_28,_29){
with(_27){
_entity=_29;
}
}),new objj_method(sel_getUid("pk"),function(_2a,_2b){
with(_2a){
return objj_msgSend(_entity,"pk");
}
}),new objj_method(sel_getUid("selectedObject"),function(_2c,_2d){
with(_2c){
var s=objj_msgSend(_2c,"selectedObjects");
return objj_msgSend(s,"count")?objj_msgSend(s,"objectAtIndex:",0):nil;
}
}),new objj_method(sel_getUid("_defaultNewObject"),function(_2e,_2f){
with(_2e){
return objj_msgSend(_entity,"createObjectWithDictionary:",_defaultDict);
}
}),new objj_method(sel_getUid("setContent:"),function(_30,_31,_32){
with(_30){
if(objj_msgSend(_32,"respondsToSelector:",sel_getUid("defaults"))){
_defaultDict=objj_msgSend(_32,"defaults");
}
objj_msgSendSuper({receiver:_30,super_class:objj_getClass("FSArrayController").super_class},"setContent:",_32);
}
})]);
var _1=objj_allocateClassPair(GSMarkupTagObject,"GSMarkupArrayController"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initPlatformObject:"),function(_33,_34,_35){
with(_33){
_35=objj_msgSend(_35,"init");
objj_msgSend(_35,"setAutomaticallyRearrangesObjects:",YES);
objj_msgSend(_35,"setObjectClass:",objj_msgSend(FSObject,"class"));
objj_msgSend(_35,"setEntity:",objj_msgSend(_attributes,"objectForKey:","entity"));
return _35;
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("tagName"),function(_36,_37){
with(_36){
return "arrayController";
}
}),new objj_method(sel_getUid("platformObjectClass"),function(_38,_39){
with(_38){
return objj_msgSend(FSArrayController,"class");
}
})]);
p;40;Frameworks/Renaissance/GSMarkupTagHbox.jt;1930;@STATIC;1.0;i;17;GSMarkupTagView.ji;18;GSAutoLayoutHBox.jt;1866;
objj_executeFile("GSMarkupTagView.j",YES);
objj_executeFile("GSAutoLayoutHBox.j",YES);
var _1=objj_allocateClassPair(GSMarkupTagView,"GSMarkupTagHbox"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initPlatformObject:"),function(_3,_4,_5){
with(_3){
_5=objj_msgSend(_5,"init");
var _6=objj_msgSend(_attributes,"objectForKey:","type");
if(_6!=nil){
if(objj_msgSend(_6,"isEqualToString:","proportional")){
objj_msgSend(_5,"setBoxType:",GSAutoLayoutProportionalBox);
}
}
var i,_7=objj_msgSend(_content,"count");
for(i=0;i<_7;i++){
var v=objj_msgSend(_content,"objectAtIndex:",i);
var _8=objj_msgSend(v,"platformObject");
if(_8!=nil&&objj_msgSend(_8,"isKindOfClass:",objj_msgSend(CPView,"class"))){
objj_msgSend(_5,"addView:",_8);
var _9=objj_msgSend(v,"gsAutoLayoutHAlignment");
if(_9!=255){
objj_msgSend(_5,"setHorizontalAlignment:forView:",_9,_8);
}
var _a=objj_msgSend(v,"gsAutoLayoutVAlignment");
if(_a!=255){
objj_msgSend(_5,"setVerticalAlignment:forView:",_a,_8);
}
var _b=objj_msgSend(v,"attributes");
var _c=objj_msgSend(_b,"valueForKey:","hborder");
if(_c==nil){
_c=objj_msgSend(_b,"valueForKey:","border");
}
if(_c!=nil){
objj_msgSend(_5,"setHorizontalBorder:forView:",objj_msgSend(_c,"intValue"),_8);
}
var _d=objj_msgSend(_b,"valueForKey:","vborder");
if(_d==nil){
_d=objj_msgSend(_b,"valueForKey:","border");
}
if(_d!=nil){
objj_msgSend(_5,"setVerticalBorder:forView:",objj_msgSend(_d,"intValue"),_8);
}
var _e=objj_msgSend(_b,"valueForKey:","proportion");
if(_e!=nil){
objj_msgSend(_5,"setProportion:forView:",objj_msgSend(_e,"floatValue"),_8);
}
}
}
return _5;
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("tagName"),function(_f,_10){
with(_f){
return "hbox";
}
}),new objj_method(sel_getUid("platformObjectClass"),function(_11,_12){
with(_11){
return objj_msgSend(GSAutoLayoutHBox,"class");
}
})]);
p;42;Frameworks/Renaissance/GSMarkupTagHSpace.jt;851;@STATIC;1.0;i;17;GSMarkupTagView.ji;20;GSAutoLayoutHSpace.jt;786;
objj_executeFile("GSMarkupTagView.j",YES);
objj_executeFile("GSAutoLayoutHSpace.j",YES);
var _1=objj_allocateClassPair(GSMarkupTagView,"GSMarkupTagHspace"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_2,[new objj_method(sel_getUid("tagName"),function(_3,_4){
with(_3){
return "hspace";
}
}),new objj_method(sel_getUid("platformObjectClass"),function(_5,_6){
with(_5){
return objj_msgSend(GSAutoLayoutHSpace,"class");
}
})]);
var _1=objj_allocateClassPair(GSMarkupTagView,"GSMarkupTagVspace"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_2,[new objj_method(sel_getUid("tagName"),function(_7,_8){
with(_7){
return "vspace";
}
}),new objj_method(sel_getUid("platformObjectClass"),function(_9,_a){
with(_9){
return objj_msgSend(GSAutoLayoutVSpace,"class");
}
})]);
p;41;Frameworks/Renaissance/GSMarkupTagImage.jt;3952;@STATIC;1.0;t;3933;
var _1=objj_allocateClassPair(CPImageView,"CPImageViewProp"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("setObjectValue:"),function(_3,_4,_5){
with(_3){
var _6=objj_msgSend(_5,"size");
if(_6){
objj_msgSend(_3,"setBounds:",CPMakeRect(0,0,_6.width,_6.height));
}
objj_msgSendSuper({receiver:_3,super_class:objj_getClass("CPImageViewProp").super_class},"setObjectValue:",_5);
}
})]);
var _1=objj_allocateClassPair(GSMarkupTagControl,"GSMarkupTagImage"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initPlatformObject:"),function(_7,_8,_9){
with(_7){
_9=objj_msgSendSuper({receiver:_7,super_class:objj_getClass("GSMarkupTagImage").super_class},"initPlatformObject:",_9);
objj_msgSend(_9,"setEditable:",NO);
var _a=objj_msgSend(_7,"boolValueForAttribute:","editable");
if(_a==1){
objj_msgSend(_9,"setEditable:",YES);
}else{
if(_a==0){
objj_msgSend(_9,"setEditable:",NO);
}
}
var _b=objj_msgSend(_attributes,"objectForKey:","name");
if(_b!=nil){
objj_msgSend(_9,"setImage:",objj_msgSend(CPImage,"imageNamed:",_b));
}
var _b=objj_msgSend(_attributes,"objectForKey:","ressource");
if(_b!=nil){
objj_msgSend(_9,"setImage:",objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:",objj_msgSend(CPString,"stringWithFormat:","%@/%@",objj_msgSend(objj_msgSend(CPBundle,"mainBundle"),"resourcePath"),_b)));
}
var _c=objj_msgSend(_attributes,"objectForKey:","scaling");
if(_c!=nil&&objj_msgSend(_c,"length")>0){
switch(objj_msgSend(_c,"characterAtIndex:",0)){
case "n":
if(objj_msgSend(_c,"isEqualToString:","none")){
objj_msgSend(_9,"setImageScaling:",CPScaleNone);
}
break;
case "p":
if(objj_msgSend(_c,"isEqualToString:","proportionally")){
objj_msgSend(_9,"setImageScaling:",CPScaleProportionally);
}
break;
case "t":
if(objj_msgSend(_c,"isEqualToString:","toFit")){
objj_msgSend(_9,"setImageScaling:",CPScaleToFit);
}
break;
}
}
var _d=objj_msgSend(_attributes,"objectForKey:","imageAlignment");
if(_d==nil){
_d=objj_msgSend(_attributes,"objectForKey:","alignment");
if(_d!=nil){
CPLog("The 'alignment' attribute has been renamed to 'imageAlignment'.  Please update your gsmarkup files");
}
}
if(_d!=nil&&objj_msgSend(_d,"length")>0){
switch(objj_msgSend(_d,"characterAtIndex:",0)){
case "b":
if(objj_msgSend(_d,"isEqualToString:","bottom")){
objj_msgSend(_9,"setImageAlignment:",CPImageAlignBottom);
}else{
if(objj_msgSend(_d,"isEqualToString:","bottomLeft")){
objj_msgSend(_9,"setImageAlignment:",CPImageAlignBottomLeft);
}else{
if(objj_msgSend(_d,"isEqualToString:","bottomRight")){
objj_msgSend(_9,"setImageAlignment:",CPImageAlignBottomRight);
}
}
}
break;
case "c":
if(objj_msgSend(_d,"isEqualToString:","center")){
objj_msgSend(_9,"setImageAlignment:",CPImageAlignCenter);
}
break;
case "l":
if(objj_msgSend(_d,"isEqualToString:","left")){
objj_msgSend(_9,"setImageAlignment:",CPImageAlignLeft);
}
break;
case "r":
if(objj_msgSend(_d,"isEqualToString:","right")){
objj_msgSend(_9,"setImageAlignment:",CPImageAlignRight);
}
break;
case "t":
if(objj_msgSend(_d,"isEqualToString:","top")){
objj_msgSend(_9,"setImageAlignment:",CPImageAlignTop);
}else{
if(objj_msgSend(_d,"isEqualToString:","topLeft")){
objj_msgSend(_9,"setImageAlignment:",CPImageAlignTopLeft);
}else{
if(objj_msgSend(_d,"isEqualToString:","topRight")){
objj_msgSend(_9,"setImageAlignment:",CPImageAlignTopRight);
}
}
}
break;
}
}
var _e;
_e=objj_msgSend(_attributes,"objectForKey:","height");
if(_e==nil){
objj_msgSend(_attributes,"setObject:forKey:","100","height");
}
var _f;
_f=objj_msgSend(_attributes,"objectForKey:","width");
if(_f==nil){
objj_msgSend(_attributes,"setObject:forKey:","100","width");
}
return _9;
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("tagName"),function(_10,_11){
with(_10){
return "image";
}
}),new objj_method(sel_getUid("platformObjectClass"),function(_12,_13){
with(_12){
return objj_msgSend(CPImageViewProp,"class");
}
})]);
p;41;Frameworks/Renaissance/GSMarkupTagLabel.jt;1659;@STATIC;1.0;i;17;GSMarkupTagView.jt;1618;
objj_executeFile("GSMarkupTagView.j",YES);
var _1=objj_allocateClassPair(GSMarkupTagView,"GSMarkupTagLabel"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initPlatformObject:"),function(_3,_4,_5){
with(_3){
_5=objj_msgSendSuper({receiver:_3,super_class:objj_getClass("GSMarkupTagLabel").super_class},"initPlatformObject:",_5);
objj_msgSend(_5,"setEditable:",NO);
objj_msgSend(_5,"setBezeled:",NO);
objj_msgSend(_5,"setBordered:",NO);
var _6=objj_msgSend(_3,"boolValueForAttribute:","selectable");
if(_6==0){
objj_msgSend(_5,"setSelectable:",NO);
}else{
objj_msgSend(_5,"setSelectable:",YES);
}
var c=objj_msgSend(_3,"colorValueForAttribute:","textColor");
if(c==nil){
c=objj_msgSend(_3,"colorValueForAttribute:","color");
if(c!=nil){
CPLog("The 'color' attribute of the <label> tag is obsolete; please replace it with 'textColor'");
}
}
if(c!=nil){
objj_msgSend(_5,"setTextColor:",c);
}
var c=objj_msgSend(_3,"colorValueForAttribute:","backgroundColor");
if(c!=nil){
objj_msgSend(_5,"setBackgroundColor:",c);
objj_msgSend(_5,"setDrawsBackground:",YES);
}else{
objj_msgSend(_5,"setDrawsBackground:",NO);
}
var _7=objj_msgSend(_content,"count");
if(_7>0){
var s=objj_msgSend(_content,"objectAtIndex:",0);
if(s!=nil&&objj_msgSend(s,"isKindOfClass:",objj_msgSend(CPString,"class"))){
objj_msgSend(_5,"setStringValue:",s);
}
}
return _5;
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("tagName"),function(_8,_9){
with(_8){
return "label";
}
}),new objj_method(sel_getUid("platformObjectClass"),function(_a,_b){
with(_a){
return objj_msgSend(CPTextField,"class");
}
})]);
p;40;Frameworks/Renaissance/GSMarkupTagMenu.jt;2658;@STATIC;1.0;i;19;GSMarkupTagObject.jt;2615;
objj_executeFile("GSMarkupTagObject.j",YES);
var _1=objj_allocateClassPair(GSMarkupTagObject,"GSMarkupTagMenu"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("allocPlatformObject"),function(_3,_4){
with(_3){
var _5=nil;
var _6=objj_msgSend(_attributes,"objectForKey:","type");
if(_6!=nil){
if(objj_msgSend(_6,"isEqualToString:","font")){
_5=objj_msgSend(objj_msgSend(CPFontManager,"sharedFontManager"),"fontMenu:",YES);
}else{
if(objj_msgSend(_6,"isEqualToString:","main")){
_5=objj_msgSend(CPApp,"mainMenu");
}
}
}
if(_5==nil){
_5=objj_msgSend(CPMenu,"alloc");
}
return _5;
}
}),new objj_method(sel_getUid("initPlatformObject:"),function(_7,_8,_9){
with(_7){
var _a=objj_msgSend(_7,"localizedStringValueForAttribute:","title");
if(objj_msgSend(objj_msgSend(_attributes,"objectForKey:","type"),"isEqualToString:","font")){
if(_a!=nil){
objj_msgSend(_9,"setTitle:",_a);
}
}else{
if(_a!=nil){
_9=objj_msgSend(_9,"initWithTitle:",_a);
}else{
_9=objj_msgSend(_9,"init");
}
}
var _b=objj_msgSend(_attributes,"objectForKey:","type");
if(_b!=nil){
if(objj_msgSend(_b,"isEqualToString:","windows")){
objj_msgSend(CPApp,"setWindowsMenu:",_9);
}else{
if(objj_msgSend(_b,"isEqualToString:","services")){
objj_msgSend(CPApp,"setServicesMenu:",_9);
}else{
if(objj_msgSend(_b,"isEqualToString:","font")){
}
}
}
}
var _c=objj_msgSend(_7,"boolValueForAttribute:","autoenablesItems");
if(_c==0){
objj_msgSend(_9,"setAutoenablesItems:",NO);
}
return _9;
}
}),new objj_method(sel_getUid("postInitPlatformObject:"),function(_d,_e,_f){
with(_d){
var _10=objj_msgSend(_attributes,"objectForKey:","type");
if(_10&&objj_msgSend(_10,"isEqualToString:","main")){
objj_msgSend(CPMenu,"setMenuBarVisible:",YES);
}
var _11=objj_msgSend(_content,"count");
for(var i=0;i<_11;i++){
var tag=objj_msgSend(_content,"objectAtIndex:",i);
var _12=objj_msgSend(tag,"platformObject");
if(objj_msgSend(_12,"isKindOfClass:",objj_msgSend(CPMenu,"class"))){
var _13=_12;
_12=objj_msgSend(objj_msgSend(CPMenuItem,"alloc"),"initWithTitle:action:keyEquivalent:",objj_msgSend(_13,"title"),NULL,"");
objj_msgSend(_12,"setSubmenu:",_13);
objj_msgSend(_f,"addItem:",_12);
objj_msgSend(_f,"setSubmenu:forItem:",_13,_12);
}else{
if(_12!=nil&&objj_msgSend(_12,"isKindOfClass:",objj_msgSend(CPMenuItem,"class"))){
objj_msgSend(_f,"addItem:",_12);
}
}
}
return _f;
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("tagName"),function(_14,_15){
with(_14){
return "menu";
}
}),new objj_method(sel_getUid("localizableAttributes"),function(_16,_17){
with(_16){
return objj_msgSend(CPArray,"arrayWithObject:","title");
}
})]);
p;44;Frameworks/Renaissance/GSMarkupTagMenuItem.jt;2854;@STATIC;1.0;i;19;GSMarkupTagObject.jt;2811;
objj_executeFile("GSMarkupTagObject.j",YES);
var _1=objj_allocateClassPair(GSMarkupTagObject,"GSMarkupTagMenuItem"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("allocPlatformObject"),function(_3,_4){
with(_3){
return objj_msgSend(CPMenuItem,"alloc");
}
}),new objj_method(sel_getUid("initPlatformObject:"),function(_5,_6,_7){
with(_5){
var _8=objj_msgSend(_5,"localizedStringValueForAttribute:","title");
var _9=objj_msgSend(_attributes,"objectForKey:","keyEquivalent");
var _a=NULL;
var _b=objj_msgSend(_attributes,"objectForKey:","action");
if(_b!=nil){
_a=CPSelectorFromString(_b);
if(_a==NULL){
CPLog("Warning: <%@> has non-existing action '%@'.  Ignored.",objj_msgSend(objj_msgSend(_5,"class"),"tagName"),_b);
}
}
if(_9==nil){
_9=objj_msgSend(_attributes,"objectForKey:","key");
if(_9!=nil){
CPLog("The 'key' attribute of the <menuItem> tag is obsolete; please replace it with 'keyEquivalent'");
}
}
if(_9==nil){
_9="";
}
if(_8==nil){
_8="";
}
_7=objj_msgSend(_7,"initWithTitle:action:keyEquivalent:",_8,_a,_9);
var _c=objj_msgSend(_attributes,"objectForKey:","image");
if(_c!=nil){
objj_msgSend(_7,"setImage:",objj_msgSend(CPImage,"imageNamed:",_c));
}
var _d=objj_msgSend(_attributes,"objectForKey:","tag");
if(_d!=nil){
objj_msgSend(_7,"setTag:",objj_msgSend(_d,"intValue"));
}
var _e=objj_msgSend(_5,"boolValueForAttribute:","enabled");
if(_e==1){
objj_msgSend(_7,"setEnabled:",YES);
}else{
if(_e==0){
objj_msgSend(_7,"setEnabled:",NO);
}
}
var _f=objj_msgSend(_attributes,"objectForKey:","state");
if(_f!=nil){
if(objj_msgSend(_f,"isEqualToString:","on")){
objj_msgSend(_7,"setState:",CPOnState);
}else{
if(objj_msgSend(_f,"isEqualToString:","off")){
objj_msgSend(_7,"setState:",CPOffState);
}else{
if(objj_msgSend(_f,"isEqualToString:","mixed")){
objj_msgSend(_7,"setState:",CPMixedState);
}
}
}
}
var _10=objj_msgSend(_attributes,"objectForKey:","keyEquivalentModifierMask");
if(_10!=nil){
var _11;
var _12=-1;
_11=objj_msgSend(CPDictionary,"dictionaryWithObjectsAndKeys:",objj_msgSend(CPNumber,"numberWithInt:",0),"noKey",objj_msgSend(CPNumber,"numberWithInt:",CPControlKeyMask),"controlKey",objj_msgSend(CPNumber,"numberWithInt:",CPAlternateKeyMask),"alternateKey",objj_msgSend(CPNumber,"numberWithInt:",CPCommandKeyMask),"commandKey",objj_msgSend(CPNumber,"numberWithInt:",CPShiftKeyMask),"shiftKey",nil);
_12=objj_msgSend(_5,"integerMaskValueForAttribute:withMaskValuesDictionary:","keyEquivalentModifierMask",_11);
objj_msgSend(_7,"setKeyEquivalentModifierMask:",_12);
}
return _7;
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("tagName"),function(_13,_14){
with(_13){
return "menuItem";
}
}),new objj_method(sel_getUid("localizableAttributes"),function(_15,_16){
with(_15){
return objj_msgSend(CPArray,"arrayWithObject:","title");
}
})]);
p;42;Frameworks/Renaissance/GSMarkupTagObject.jt;6258;@STATIC;1.0;I;21;Foundation/CPBundle.ji;16;GSMarkupAwaker.jt;6192;
objj_executeFile("Foundation/CPBundle.j",NO);
objj_executeFile("GSMarkupAwaker.j",YES);
var _1=objj_getClass("CPObject");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"CPObject\"");
}
var _2=_1.isa;
class_addMethods(_2,[new objj_method(sel_getUid("isSubclassOfClass:"),function(_3,_4,_5){
with(_3){
var _6=objj_msgSend(_3,"class");
if(_6==_5){
return YES;
}else{
while(_6!=Nil){
_6=objj_msgSend(_6,"superclass");
if(_6==_5){
return YES;
}
}
return NO;
}
}
})]);
var _1=objj_allocateClassPair(CPObject,"GSMarkupTagObject"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_attributes"),new objj_ivar("_content"),new objj_ivar("_platformObject"),new objj_ivar("_localizer"),new objj_ivar("_awaker")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initWithAttributes:content:"),function(_7,_8,_9,_a){
with(_7){
_attributes=_9;
_content=_a;
return _7;
}
}),new objj_method(sel_getUid("dealloc"),function(_b,_c){
with(_b){
objj_msgSendSuper({receiver:_b,super_class:objj_getClass("GSMarkupTagObject").super_class},"dealloc");
}
}),new objj_method(sel_getUid("attributes"),function(_d,_e){
with(_d){
return _attributes;
}
}),new objj_method(sel_getUid("content"),function(_f,_10){
with(_f){
return _content;
}
}),new objj_method(sel_getUid("localizableStrings"),function(_11,_12){
with(_11){
var a=objj_msgSend(CPMutableArray,"array");
var att;
var i,_13;
_13=objj_msgSend(_content,"count");
for(i=0;i<_13;i++){
var o=objj_msgSend(_content,"objectAtIndex:",i);
if(objj_msgSend(o,"isKindOfClass:",objj_msgSend(GSMarkupTagObject,"class"))){
var k=objj_msgSend(o,"localizableStrings");
if(k!=nil){
objj_msgSend(a,"addObjectsFromArray:",k);
}
}else{
if(objj_msgSend(o,"isKindOfClass:",objj_msgSend(CPString,"class"))){
objj_msgSend(a,"addObject:",o);
}
}
}
att=objj_msgSend(objj_msgSend(_11,"class"),"localizableAttributes");
_13=objj_msgSend(att,"count");
for(i=0;i<_13;i++){
var _14=objj_msgSend(att,"objectAtIndex:",i);
var _15=objj_msgSend(_attributes,"objectForKey:",_14);
if(_15!=nil){
objj_msgSend(a,"addObject:",_15);
}
}
return a;
}
}),new objj_method(sel_getUid("setAwaker:"),function(_16,_17,_18){
with(_16){
var i,_19;
_awaker=_18;
_19=objj_msgSend(_content,"count");
for(i=0;i<_19;i++){
var o=objj_msgSend(_content,"objectAtIndex:",i);
if(objj_msgSend(o,"isKindOfClass:",objj_msgSend(GSMarkupTagObject,"class"))){
objj_msgSend(o,"setAwaker:",_18);
}
}
}
}),new objj_method(sel_getUid("setPlatformObject:"),function(_1a,_1b,_1c){
with(_1a){
if(_platformObject==_1c){
return;
}
if(_platformObject!=nil){
objj_msgSend(_awaker,"deregisterObject:",_platformObject);
}
_platformObject=_1c;
if(_1c!=nil){
objj_msgSend(_awaker,"registerObject:",_1c);
}
}
}),new objj_method(sel_getUid("platformObject"),function(_1d,_1e){
with(_1d){
if(_platformObject==nil){
var _1f=objj_msgSend(_1d,"allocPlatformObject");
_1f=objj_msgSend(_1d,"initPlatformObject:",_1f);
_1f=objj_msgSend(_1d,"postInitPlatformObject:",_1f);
objj_msgSend(_1d,"setPlatformObject:",_1f);
}
return _platformObject;
}
}),new objj_method(sel_getUid("allocPlatformObject"),function(_20,_21){
with(_20){
var _22=objj_msgSend(_20,"class");
var _23=objj_msgSend(_22,"platformObjectClass");
if(objj_msgSend(_22,"useInstanceOfAttribute")){
var _24=objj_msgSend(_attributes,"objectForKey:","instanceOf");
if(_24!=nil){
var _25=CPClassFromString(_24);
if(_25!=Nil){
if(objj_msgSend(_25,"isSubclassOfClass:",_23)){
_23=_25;
}
}
}
}
return objj_msgSend(_23,"alloc");
}
}),new objj_method(sel_getUid("initPlatformObject:"),function(_26,_27,_28){
with(_26){
return objj_msgSend(_28,"init");
}
}),new objj_method(sel_getUid("postInitPlatformObject:"),function(_29,_2a,_2b){
with(_29){
return _2b;
}
}),new objj_method(sel_getUid("description"),function(_2c,_2d){
with(_2c){
return objj_msgSend(CPString,"stringWithFormat:","%@\var attributes =%@\var content =%@\var platformObject =%@",objj_msgSendSuper({receiver:_2c,super_class:objj_getClass("GSMarkupTagObject").super_class},"description"),objj_msgSend(_attributes,"description"),objj_msgSend(_content,"description"),objj_msgSend(_platformObject,"description"));
}
}),new objj_method(sel_getUid("intValueForAttribute:"),function(_2e,_2f,_30){
with(_2e){
return parseInt(objj_msgSend(_attributes,"objectForKey:",_30));
}
}),new objj_method(sel_getUid("stringValueForAttribute:"),function(_31,_32,_33){
with(_31){
return objj_msgSend(_attributes,"objectForKey:",_33);
}
}),new objj_method(sel_getUid("boolValueForAttribute:"),function(_34,_35,_36){
with(_34){
var _37=objj_msgSend(_attributes,"objectForKey:",_36);
if(_37==nil){
return -1;
}
switch(objj_msgSend(_37,"length")){
case 1:
var a=objj_msgSend(_37,"characterAtIndex:",0);
switch(a){
case "y":
case "Y":
return 1;
case "n":
case "N":
return 0;
}
return -1;
case 2:
var a=objj_msgSend(_37,"characterAtIndex:",0);
if(a=="n"||a=="N"){
var b=objj_msgSend(_37,"characterAtIndex:",1);
if(b=="o"||b=="O"){
return 0;
}
}
return -1;
case 3:
var a=objj_msgSend(_37,"characterAtIndex:",0);
if(a=="y"||a=="Y"){
var b=objj_msgSend(_37,"characterAtIndex:",1);
if(b=="e"||b=="E"){
var c=objj_msgSend(_37,"characterAtIndex:",2);
if(c=="s"||c=="S"){
return 1;
}
}
}
return -1;
}
return -1;
}
}),new objj_method(sel_getUid("setLocalizer:"),function(_38,_39,_3a){
with(_38){
var i,_3b;
_localizer=_3a;
_3b=objj_msgSend(_content,"count");
for(i=0;i<_3b;i++){
var o=objj_msgSend(_content,"objectAtIndex:",i);
if(objj_msgSend(o,"isKindOfClass:",objj_msgSend(GSMarkupTagObject,"class"))){
objj_msgSend(o,"setLocalizer:",_3a);
}
}
}
}),new objj_method(sel_getUid("localizedStringValueForAttribute:"),function(_3c,_3d,_3e){
with(_3c){
var _3f=objj_msgSend(_attributes,"objectForKey:",_3e);
if(_3f==nil){
return nil;
}else{
return _3f;
return objj_msgSend(_localizer,"localizeString:",_3f);
}
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("tagName"),function(_40,_41){
with(_40){
return nil;
}
}),new objj_method(sel_getUid("localizableAttributes"),function(_42,_43){
with(_42){
return nil;
}
}),new objj_method(sel_getUid("platformObjectClass"),function(_44,_45){
with(_44){
return Nil;
}
}),new objj_method(sel_getUid("useInstanceOfAttribute"),function(_46,_47){
with(_46){
return NO;
}
})]);
p;51;Frameworks/Renaissance/GSMarkupTagObjectAdditions.jt;5257;@STATIC;1.0;i;19;GSMarkupTagObject.jt;5214;
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
p;47;Frameworks/Renaissance/GSMarkupTagPopUpButton.jt;3439;@STATIC;1.0;i;20;GSMarkupTagControl.ji;28;GSMarkupTagPopUpButtonItem.jt;3362;
objj_executeFile("GSMarkupTagControl.j",YES);
objj_executeFile("GSMarkupTagPopUpButtonItem.j",YES);
var _1=objj_allocateClassPair(GSMarkupTagControl,"GSMarkupTagPopUpButton"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initPlatformObject:"),function(_3,_4,_5){
with(_3){
_5=objj_msgSendSuper({receiver:_3,super_class:objj_getClass("GSMarkupTagPopUpButton").super_class},"initPlatformObject:",_5);
var _6=objj_msgSend(_3,"localizedStringValueForAttribute:","title");
if(_6!=nil){
objj_msgSend(_5,"setTitle:",_6);
}
var i,_7=objj_msgSend(_content,"count");
for(i=0;i<_7;i++){
var _8=objj_msgSend(_content,"objectAtIndex:",i);
var _6=objj_msgSend(_8,"localizedStringValueForAttribute:","title");
if(_6==nil){
_6="";
}
objj_msgSend(_5,"addItemWithTitle:",_6);
var _9=objj_msgSend(_5,"lastItem");
_9=objj_msgSend(_8,"initPlatformObject:",_9);
objj_msgSend(_8,"setPlatformObject:",_9);
}
var _a=objj_msgSend(_3,"boolValueForAttribute:","pullsDown");
if(_a==1){
objj_msgSend(_5,"setPullsDown:",YES);
}else{
if(_a==0){
objj_msgSend(_5,"setPullsDown:",NO);
}
}
var _b=objj_msgSend(_3,"boolValueForAttribute:","autoenablesItems");
if(_b==0){
objj_msgSend(_5,"setAutoenablesItems:",NO);
}
return _5;
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("tagName"),function(_c,_d){
with(_c){
return "popUpButton";
}
}),new objj_method(sel_getUid("platformObjectClass"),function(_e,_f){
with(_e){
return objj_msgSend(CPPopUpButton,"class");
}
}),new objj_method(sel_getUid("localizableAttributes"),function(_10,_11){
with(_10){
return objj_msgSend(CPArray,"arrayWithObject:","title");
}
})]);
var _1=objj_getClass("CPPopUpButton");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"CPPopUpButton\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("_consolidateItemArrayLengthToArray:"),function(_12,_13,_14){
with(_12){
var _15=objj_msgSend(_12,"itemArray");
var l=_15.length;
var l1=_14.length;
var j;
if(l==l1){
return;
}else{
if(l<l1){
for(j=0;j<(l1-l);j++){
objj_msgSend(_12,"addItemWithTitle:","");
}
}else{
var _16=l1;
for(j=0;j<(l-l1);j++){
objj_msgSend(_12,"removeItemAtIndex:",_16);
}
}
}
}
}),new objj_method(sel_getUid("setIntegerValue:"),function(_17,_18,_19){
with(_17){
objj_msgSend(_17,"selectItemWithTag:",_19);
}
}),new objj_method(sel_getUid("integerValue"),function(_1a,_1b){
with(_1a){
return objj_msgSend(objj_msgSend(_1a,"selectedItem"),"tag");
}
}),new objj_method(sel_getUid("_reverseSetBinding"),function(_1c,_1d){
with(_1c){
var _1e=objj_msgSend(objj_msgSend(_1c,"class"),"_binderClassForBinding:","integerValue"),_1f=objj_msgSend(_1e,"getBinding:forObject:","integerValue",_1c);
objj_msgSend(_1f,"reverseSetValueFor:","integerValue");
}
}),new objj_method(sel_getUid("setItemArray:"),function(_20,_21,_22){
with(_20){
var _23=objj_msgSend(_20,"itemArray");
objj_msgSend(_20,"_consolidateItemArrayLengthToArray:",_22);
var j,l1=_22.length;
for(j=0;j<l1;j++){
objj_msgSend(_23[j],"setTitle:",_22[j]);
}
}
}),new objj_method(sel_getUid("tagArray"),function(_24,_25){
with(_24){
return [];
}
}),new objj_method(sel_getUid("setTagArray:"),function(_26,_27,_28){
with(_26){
var _29=objj_msgSend(_26,"itemArray");
objj_msgSend(_26,"_consolidateItemArrayLengthToArray:",_28);
var j,l1=_28.length;
for(j=0;j<l1;j++){
objj_msgSend(_29[j],"setTag:",_28[j]);
}
}
})]);
p;51;Frameworks/Renaissance/GSMarkupTagPopUpButtonItem.jt;1403;@STATIC;1.0;i;19;GSMarkupTagObject.jt;1360;
objj_executeFile("GSMarkupTagObject.j",YES);
var _1=objj_allocateClassPair(GSMarkupTagObject,"GSMarkupTagPopUpButtonItem"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("allocPlatformObject"),function(_3,_4){
with(_3){
return nil;
}
}),new objj_method(sel_getUid("initPlatformObject:"),function(_5,_6,_7){
with(_5){
var _8=objj_msgSend(_attributes,"objectForKey:","tag");
if(_8!=nil){
objj_msgSend(_7,"setTag:",objj_msgSend(_8,"intValue"));
}
var _9=objj_msgSend(_attributes,"objectForKey:","action");
if(_9!=nil){
var _a=CPSelectorFromString(_9);
if(_a==NULL){
CPLog("Warning: <%@> has non-existing action '%@'.  Ignored.",objj_msgSend(objj_msgSend(_5,"class"),"tagName"),_9);
}else{
objj_msgSend(_7,"setAction:",_a);
}
}
var _b=objj_msgSend(_attributes,"objectForKey:","keyEquivalent");
if(_b==nil){
_b=objj_msgSend(_attributes,"objectForKey:","key");
if(_b!=nil){
CPLog("The 'key' attribute of the <popUpButtonItem> tag is obsolete; please replace it with 'keyEquivalent'");
}
}
if(_b!=nil){
objj_msgSend(_7,"setKeyEquivalent:",_b);
}
return _7;
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("tagName"),function(_c,_d){
with(_c){
return "popUpButtonItem";
}
}),new objj_method(sel_getUid("localizableAttributes"),function(_e,_f){
with(_e){
return objj_msgSend(CPArray,"arrayWithObject:","title");
}
})]);
p;46;Frameworks/Renaissance/GSMarkupTagScrollView.jt;3147;@STATIC;1.0;i;17;GSMarkupTagView.jt;3106;
objj_executeFile("GSMarkupTagView.j",YES);
var _1=objj_allocateClassPair(GSMarkupTagView,"GSMarkupTagScrollView"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initPlatformObject:"),function(_3,_4,_5){
with(_3){
_5=objj_msgSend(_5,"init");
if(objj_msgSend(_3,"boolValueForAttribute:","hasHorizontalScroller")==0){
objj_msgSend(_5,"setHasHorizontalScroller:",NO);
}else{
objj_msgSend(_5,"setHasHorizontalScroller:",YES);
}
if(objj_msgSend(_3,"boolValueForAttribute:","hasVerticalScroller")==0){
objj_msgSend(_5,"setHasVerticalScroller:",NO);
}else{
objj_msgSend(_5,"setHasVerticalScroller:",YES);
}
var _6=CPNoBorder;
var _7=objj_msgSend(_attributes,"objectForKey:","borderType");
if(_7!=nil){
if(objj_msgSend(_7,"isEqualToString:","none")==YES){
_6=CPNoBorder;
}else{
if(objj_msgSend(_7,"isEqualToString:","line")==YES){
_6=CPLineBorder;
}else{
if(objj_msgSend(_7,"isEqualToString:","bezel")==YES){
_6=CPBezelBorder;
}else{
if(objj_msgSend(_7,"isEqualToString:","groove")==YES){
_6=CPGrooveBorder;
}
}
}
}
}
objj_msgSend(_5,"setBorderType:",_6);
if(objj_msgSend(_content,"count")>0){
var _8=objj_msgSend(_content,"objectAtIndex:",0);
var v;
v=objj_msgSend(_8,"platformObject");
if(v!=nil&&objj_msgSend(v,"isKindOfClass:",objj_msgSend(CPView,"class"))){
objj_msgSend(_5,"setDocumentView:",v);
var _9=CPViewNotSizable;
if(!objj_msgSend(_5,"hasHorizontalScroller")){
_9|=CPViewWidthSizable;
var _a=objj_msgSend(objj_msgSend(_5,"contentView"),"frame");
var _b=objj_msgSend(objj_msgSend(_5,"documentView"),"frame");
_b.size.width=_a.size.width;
objj_msgSend(objj_msgSend(_5,"documentView"),"setFrame:",_b);
}
objj_msgSend(v,"setAutoresizingMask:",_9);
}
}
return _5;
}
}),new objj_method(sel_getUid("postInitPlatformObject:"),function(_c,_d,_e){
with(_c){
_e=objj_msgSendSuper({receiver:_c,super_class:objj_getClass("GSMarkupTagScrollView").super_class},"postInitPlatformObject:",_e);
if(objj_msgSend(objj_msgSend(_e,"documentView"),"isKindOfClass:",objj_msgSend(CPTextView,"class"))){
var _f=objj_msgSend(objj_msgSend(_e,"contentView"),"frame");
var tv=objj_msgSend(_e,"documentView");
objj_msgSend(tv,"setFrame:",_f);
objj_msgSend(tv,"setHorizontallyResizable:",NO);
objj_msgSend(tv,"setVerticallyResizable:",YES);
objj_msgSend(tv,"setMinSize:",CPMakeSize(0,0));
objj_msgSend(tv,"setMaxSize:",CPMakeSize(10000000,10000000));
objj_msgSend(tv,"setAutoresizingMask:",CPViewHeightSizable|CPViewWidthSizable);
objj_msgSend(objj_msgSend(tv,"textContainer"),"setContainerSize:",CPMakeSize(_f.size.width,10000000));
objj_msgSend(objj_msgSend(tv,"textContainer"),"setWidthTracksTextView:",YES);
}
var _10=objj_msgSend(_c,"intValueForAttribute:","width");
if(_10){
var _11=objj_msgSend(objj_msgSend(_e,"contentView"),"frame");
_11.size.width=_10;
objj_msgSend(objj_msgSend(_e,"contentView"),"setFrame:",_11);
}
return _e;
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("tagName"),function(_12,_13){
with(_12){
return "scrollView";
}
}),new objj_method(sel_getUid("platformObjectClass"),function(_14,_15){
with(_14){
return objj_msgSend(CPScrollView,"class");
}
})]);
p;42;Frameworks/Renaissance/GSMarkupTagSlider.jt;1367;@STATIC;1.0;i;17;GSMarkupTagView.jt;1326;
objj_executeFile("GSMarkupTagView.j",YES);
var _1=objj_allocateClassPair(GSMarkupTagControl,"GSMarkupTagSlider"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initPlatformObject:"),function(_3,_4,_5){
with(_3){
_5=objj_msgSendSuper({receiver:_3,super_class:objj_getClass("GSMarkupTagSlider").super_class},"initPlatformObject:",_5);
var _6;
var _7;
var _8;
_6=objj_msgSend(_attributes,"objectForKey:","min");
if(_6!=nil){
objj_msgSend(_5,"setMinValue:",objj_msgSend(_6,"doubleValue"));
}
_7=objj_msgSend(_attributes,"objectForKey:","max");
if(_7!=nil){
objj_msgSend(_5,"setMaxValue:",objj_msgSend(_7,"doubleValue"));
}
_8=objj_msgSend(_attributes,"objectForKey:","current");
if(_8!=nil){
objj_msgSend(_5,"setDoubleValue:",objj_msgSend(_8,"doubleValue"));
}
var _9;
_9=objj_msgSend(_attributes,"objectForKey:","height");
if(_9==nil){
objj_msgSend(_attributes,"setObject:forKey:","16","height");
}
var _a;
_a=objj_msgSend(_attributes,"objectForKey:","width");
if(_a==nil){
objj_msgSend(_attributes,"setObject:forKey:","83","width");
}
return _5;
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("tagName"),function(_b,_c){
with(_b){
return "slider";
}
}),new objj_method(sel_getUid("platformObjectClass"),function(_d,_e){
with(_d){
return objj_msgSend(CPSlider,"class");
}
})]);
p;45;Frameworks/Renaissance/GSMarkupTagSplitView.jt;1370;@STATIC;1.0;i;17;GSMarkupTagView.jt;1329;
objj_executeFile("GSMarkupTagView.j",YES);
var _1=objj_allocateClassPair(GSMarkupTagView,"GSMarkupTagSplitView"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initPlatformObject:"),function(_3,_4,_5){
with(_3){
_5=objj_msgSend(_5,"init");
if(objj_msgSend(_3,"boolValueForAttribute:","vertical")==0){
objj_msgSend(_5,"setVertical:",NO);
}else{
objj_msgSend(_5,"setVertical:",YES);
}
var _6=objj_msgSend(_content,"count");
for(var i=0;i<_6;i++){
var _7=objj_msgSend(_content,"objectAtIndex:",i);
var v;
v=objj_msgSend(_7,"platformObject");
if(v!=nil&&objj_msgSend(v,"isKindOfClass:",objj_msgSend(CPView,"class"))){
objj_msgSend(_5,"addSubview:",v);
}
}
return _5;
}
}),new objj_method(sel_getUid("postInitPlatformObject:"),function(_8,_9,_a){
with(_8){
_a=objj_msgSendSuper({receiver:_8,super_class:objj_getClass("GSMarkupTagSplitView").super_class},"postInitPlatformObject:",_a);
var _b;
if(_b=objj_msgSend(_attributes,"objectForKey:","autosaveName")){
objj_msgSend(_a,"setAutosaveName:",_b);
}
objj_msgSend(_a,"adjustSubviews");
return _a;
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("tagName"),function(_c,_d){
with(_c){
return "splitView";
}
}),new objj_method(sel_getUid("platformObjectClass"),function(_e,_f){
with(_e){
return objj_msgSend(CPSplitView,"class");
}
})]);
p;47;Frameworks/Renaissance/GSMarkupTagTableColumn.jt;1757;@STATIC;1.0;i;19;GSMarkupTagObject.jt;1714;
objj_executeFile("GSMarkupTagObject.j",YES);
var _1=objj_allocateClassPair(GSMarkupTagObject,"GSMarkupTagTableColumn"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initPlatformObject:"),function(_3,_4,_5){
with(_3){
var _6=objj_msgSend(_attributes,"objectForKey:","identifier");
if(_6!=nil){
_5=objj_msgSend(_5,"initWithIdentifier:",_6);
}else{
_5=objj_msgSend(_5,"init");
}
var _7=objj_msgSend(_3,"boolValueForAttribute:","editable");
if(_7==1){
objj_msgSend(_5,"setEditable:",YES);
}else{
if(_7==0){
objj_msgSend(_5,"setEditable:",NO);
}
}
var _8=objj_msgSend(_3,"localizedStringValueForAttribute:","title");
if(_8!=nil){
objj_msgSend(objj_msgSend(_5,"headerView"),"setStringValue:",_8);
}
var _9=objj_msgSend(_attributes,"objectForKey:","minWidth");
if(_9!=nil){
objj_msgSend(_5,"setMinWidth:",objj_msgSend(_9,"intValue"));
}
var _9=objj_msgSend(_attributes,"objectForKey:","maxWidth");
if(_9!=nil){
objj_msgSend(_5,"setMaxWidth:",objj_msgSend(_9,"intValue"));
}
var _9=objj_msgSend(_attributes,"objectForKey:","width");
if(_9!=nil){
objj_msgSend(_5,"setWidth:",objj_msgSend(_9,"intValue"));
}
var _a=objj_msgSend(_3,"boolValueForAttribute:","resizable");
if(_a==1){
objj_msgSend(_5,"setResizable:",YES);
}else{
if(_a==0){
objj_msgSend(_5,"setResizable:",NO);
}
}
return _5;
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("tagName"),function(_b,_c){
with(_b){
return "tableColumn";
}
}),new objj_method(sel_getUid("platformObjectClass"),function(_d,_e){
with(_d){
return objj_msgSend(CPTableColumn,"class");
}
}),new objj_method(sel_getUid("localizableAttributes"),function(_f,_10){
with(_f){
return objj_msgSend(CPArray,"arrayWithObject:","title");
}
})]);
p;45;Frameworks/Renaissance/GSMarkupTagTableView.jt;3947;@STATIC;1.0;i;20;GSMarkupTagControl.jt;3903;
objj_executeFile("GSMarkupTagControl.j",YES);
var _1=objj_getClass("CPTableView");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"CPTableView\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("sizeToFit"),function(_3,_4){
with(_3){
}
})]);
var _1=objj_allocateClassPair(GSMarkupTagControl,"GSMarkupTagTableView"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initPlatformObject:"),function(_5,_6,_7){
with(_5){
_7=objj_msgSendSuper({receiver:_5,super_class:objj_getClass("GSMarkupTagTableView").super_class},"initPlatformObject:",_7);
var _8=objj_msgSend(_attributes,"objectForKey:","doubleAction");
if(_8!=nil){
objj_msgSend(_7,"setDoubleAction:",CPSelectorFromString(_8));
}
var _9=objj_msgSend(_5,"boolValueForAttribute:","allowsColumnReordering");
if(_9==1){
objj_msgSend(_7,"setAllowsColumnReordering:",YES);
}else{
if(_9==0){
objj_msgSend(_7,"setAllowsColumnReordering:",NO);
}
}
var _9=objj_msgSend(_5,"boolValueForAttribute:","allowsColumnResizing");
if(_9==1){
objj_msgSend(_7,"setAllowsColumnResizing:",YES);
}else{
if(_9==0){
objj_msgSend(_7,"setAllowsColumnResizing:",NO);
}
}
var _9=objj_msgSend(_5,"boolValueForAttribute:","allowsMultipleSelection");
if(_9==1){
objj_msgSend(_7,"setAllowsMultipleSelection:",YES);
}else{
if(_9==0){
objj_msgSend(_7,"setAllowsMultipleSelection:",NO);
}
}
var _9=objj_msgSend(_5,"boolValueForAttribute:","allowsEmptySelection");
if(_9==1){
objj_msgSend(_7,"setAllowsEmptySelection:",YES);
}else{
if(_9==0){
objj_msgSend(_7,"setAllowsEmptySelection:",NO);
}
}
var _9=objj_msgSend(_5,"boolValueForAttribute:","usesAlternatingRowBackgroundColors")||objj_msgSend(_5,"boolValueForAttribute:","zebra");
if(_9==1){
objj_msgSend(_7,"setUsesAlternatingRowBackgroundColors:",YES);
}
var _9=objj_msgSend(_5,"boolValueForAttribute:","allowsColumnSelection");
if(_9==1){
objj_msgSend(_7,"setAllowsColumnSelection:",YES);
}else{
if(_9==0){
objj_msgSend(_7,"setAllowsColumnSelection:",NO);
}
}
var c=objj_msgSend(_5,"colorValueForAttribute:","backgroundColor");
if(c!=nil){
objj_msgSend(_7,"setBackgroundColor:",c);
}
var _9=objj_msgSend(_5,"boolValueForAttribute:","drawsGrid");
if(_9==1){
objj_msgSend(_7,"setDrawsGrid:",YES);
}else{
if(_9==0){
objj_msgSend(_7,"setDrawsGrid:",NO);
}
}
var c=objj_msgSend(_5,"colorValueForAttribute:","gridColor");
if(c!=nil){
objj_msgSend(_7,"setGridColor:",c);
}
var i,_a;
_a=objj_msgSend(_content,"count");
for(i=0;i<_a;i++){
var _b=objj_msgSend(_content,"objectAtIndex:",i);
if(_b!=nil&&objj_msgSend(_b,"isKindOfClass:",objj_msgSend(GSMarkupTagTableColumn,"class"))){
objj_msgSend(_7,"addTableColumn:",objj_msgSend(_b,"platformObject"));
}
}
return _7;
}
}),new objj_method(sel_getUid("postInitPlatformObject:"),function(_c,_d,_e){
with(_c){
objj_msgSend(_e,"sizeToFit");
var _f=objj_msgSend(_attributes,"objectForKey:","autosaveName");
if(_f!=nil){
objj_msgSend(_e,"setAutosaveName:",_f);
objj_msgSend(_e,"setAutosaveTableColumns:",YES);
}
return _e;
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("tagName"),function(_10,_11){
with(_10){
return "tableView";
}
}),new objj_method(sel_getUid("platformObjectClass"),function(_12,_13){
with(_12){
return objj_msgSend(CPTableView,"class");
}
})]);
var _1=objj_allocateClassPair(GSMarkupTagObject,"GSMarkupTagSortDescriptor"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initPlatformObject:"),function(_14,_15,_16){
with(_14){
_16=objj_msgSend(CPSortDescriptor,"sortDescriptorWithKey:ascending:",objj_msgSend(_14,"stringValueForAttribute:","key"),objj_msgSend(_14,"boolValueForAttribute:","ascending")!=0);
return _16;
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("tagName"),function(_17,_18){
with(_17){
return "sortDescriptor";
}
}),new objj_method(sel_getUid("platformObjectClass"),function(_19,_1a){
with(_19){
return nil;
}
})]);
p;45;Frameworks/Renaissance/GSMarkupTagTextField.jt;2083;@STATIC;1.0;i;20;GSMarkupTagControl.jt;2039;
objj_executeFile("GSMarkupTagControl.j",YES);
var _1=objj_allocateClassPair(GSMarkupTagControl,"GSMarkupTagTextField"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initPlatformObject:"),function(_3,_4,_5){
with(_3){
_5=objj_msgSendSuper({receiver:_3,super_class:objj_getClass("GSMarkupTagTextField").super_class},"initPlatformObject:",_5);
var _6=objj_msgSend(_3,"boolValueForAttribute:","editable");
if(_6==0){
objj_msgSend(_5,"setEditable:",NO);
}else{
objj_msgSend(_5,"setEditable:",YES);
}
var _7=objj_msgSend(_3,"boolValueForAttribute:","selectable");
if(_7==0){
objj_msgSend(_5,"setSelectable:",NO);
}else{
objj_msgSend(_5,"setSelectable:",YES);
}
if(objj_msgSend(_5,"respondsToSelector:",sel_getUid("setAllowsEditingTextAttributes:"))){
var _8=objj_msgSend(_3,"boolValueForAttribute:","allowsEditingTextAttributes");
if(_8==1){
objj_msgSend(_5,"setAllowsEditingTextAttributes:",YES);
}else{
objj_msgSend(_5,"setAllowsEditingTextAttributes:",NO);
}
}
if(objj_msgSend(_5,"respondsToSelector:",sel_getUid("setImportsGraphics:"))){
var _9=objj_msgSend(_3,"boolValueForAttribute:","importsGraphics");
if(_9==1){
objj_msgSend(_5,"setImportsGraphics:",YES);
}else{
objj_msgSend(_5,"setImportsGraphics:",NO);
}
}
var c=objj_msgSend(_3,"colorValueForAttribute:","textColor");
if(c!=nil){
objj_msgSend(_5,"setTextColor:",c);
}
var c=objj_msgSend(_3,"colorValueForAttribute:","backgroundColor");
if(c!=nil){
objj_msgSend(_5,"setBackgroundColor:",c);
}
var _a=objj_msgSend(_3,"boolValueForAttribute:","drawsBackground");
if(_a==1){
objj_msgSend(_5,"setDrawsBackground:",YES);
}else{
if(_a==0){
objj_msgSend(_5,"setDrawsBackground:",NO);
}
}
if(_content!=nil){
objj_msgSend(_5,"setStringValue:",_content);
}
objj_msgSend(_5,"setBezeled:",YES);
return _5;
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("tagName"),function(_b,_c){
with(_b){
return "textField";
}
}),new objj_method(sel_getUid("platformObjectClass"),function(_d,_e){
with(_d){
return objj_msgSend(CPTextField,"class");
}
})]);
p;44;Frameworks/Renaissance/GSMarkupTagTextView.jt;2354;@STATIC;1.0;i;38;../../Frameworks/TextView/CPTextView.jt;2292;
objj_executeFile("../../Frameworks/TextView/CPTextView.j",YES);
var _1=objj_allocateClassPair(GSMarkupTagView,"GSMarkupTagTextView"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initPlatformObject:"),function(_3,_4,_5){
with(_3){
_5=objj_msgSendSuper({receiver:_3,super_class:objj_getClass("GSMarkupTagTextView").super_class},"initPlatformObject:",_5);
var _6=objj_msgSend(_content,"count");
if(_6>0){
var s=objj_msgSend(_content,"objectAtIndex:",0);
if(s!=nil&&objj_msgSend(s,"isKindOfClass:",objj_msgSend(CPString,"class"))){
objj_msgSend(_5,"setString:",s);
}
}
var _7=objj_msgSend(_3,"boolValueForAttribute:","editable");
if(_7==1){
objj_msgSend(_5,"setEditable:",YES);
}else{
if(_7==0){
objj_msgSend(_5,"setEditable:",NO);
}
}
var _8=objj_msgSend(_3,"boolValueForAttribute:","selectable");
if(_8==1){
objj_msgSend(_5,"setSelectable:",YES);
}else{
if(_8==0){
objj_msgSend(_5,"setSelectable:",NO);
}
}
var _9;
_9=objj_msgSend(_3,"boolValueForAttribute:","richText");
if(_9==1){
objj_msgSend(_5,"setRichText:",YES);
}else{
if(_9==0){
objj_msgSend(_5,"setRichText:",NO);
}
}
_9=objj_msgSend(_3,"boolValueForAttribute:","usesFontPanel");
if(_9==1){
objj_msgSend(_5,"setUsesFontPanel:",YES);
}else{
if(_9==0){
objj_msgSend(_5,"setUsesFontPanel:",NO);
}
}
_9=objj_msgSend(_3,"boolValueForAttribute:","allowsUndo");
if(_9==1){
objj_msgSend(_5,"setAllowsUndo:",YES);
}else{
if(_9==0){
objj_msgSend(_5,"setAllowsUndo:",NO);
}
}
_9=objj_msgSend(_3,"boolValueForAttribute:","usesRuler");
if(_9==1){
objj_msgSend(_5,"setUsesRuler:",YES);
}else{
if(_9==0){
objj_msgSend(_5,"setUsesRuler:",NO);
}
}
_9=objj_msgSend(_3,"boolValueForAttribute:","importGraphics");
if(_9==1){
objj_msgSend(_5,"setImportsGraphics:",YES);
}else{
if(_9==0){
objj_msgSend(_5,"setImportsGraphics:",NO);
}
}
return _5;
}
}),new objj_method(sel_getUid("postInitPlatformObject:"),function(_a,_b,_c){
with(_a){
return objj_msgSendSuper({receiver:_a,super_class:objj_getClass("GSMarkupTagTextView").super_class},"postInitPlatformObject:",_c);
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("tagName"),function(_d,_e){
with(_d){
return "textView";
}
}),new objj_method(sel_getUid("platformObjectClass"),function(_f,_10){
with(_f){
return objj_msgSend(CPTextView,"class");
}
})]);
p;40;Frameworks/Renaissance/GSMarkupTagVbox.jt;1930;@STATIC;1.0;i;17;GSMarkupTagView.ji;18;GSAutoLayoutVBox.jt;1866;
objj_executeFile("GSMarkupTagView.j",YES);
objj_executeFile("GSAutoLayoutVBox.j",YES);
var _1=objj_allocateClassPair(GSMarkupTagView,"GSMarkupTagVbox"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initPlatformObject:"),function(_3,_4,_5){
with(_3){
_5=objj_msgSend(_5,"init");
var _6=objj_msgSend(_attributes,"objectForKey:","type");
if(_6!=nil){
if(objj_msgSend(_6,"isEqualToString:","proportional")){
objj_msgSend(_5,"setBoxType:",GSAutoLayoutProportionalBox);
}
}
var i,_7=objj_msgSend(_content,"count");
for(i=0;i<_7;i++){
var v=objj_msgSend(_content,"objectAtIndex:",i);
var _8=objj_msgSend(v,"platformObject");
if(_8!=nil&&objj_msgSend(_8,"isKindOfClass:",objj_msgSend(CPView,"class"))){
objj_msgSend(_5,"addView:",_8);
var _9=objj_msgSend(v,"gsAutoLayoutHAlignment");
if(_9!=255){
objj_msgSend(_5,"setHorizontalAlignment:forView:",_9,_8);
}
var _a=objj_msgSend(v,"gsAutoLayoutVAlignment");
if(_a!=255){
objj_msgSend(_5,"setVerticalAlignment:forView:",_a,_8);
}
var _b=objj_msgSend(v,"attributes");
var _c=objj_msgSend(_b,"valueForKey:","hborder");
if(_c==nil){
_c=objj_msgSend(_b,"valueForKey:","border");
}
if(_c!=nil){
objj_msgSend(_5,"setHorizontalBorder:forView:",objj_msgSend(_c,"intValue"),_8);
}
var _d=objj_msgSend(_b,"valueForKey:","vborder");
if(_d==nil){
_d=objj_msgSend(_b,"valueForKey:","border");
}
if(_d!=nil){
objj_msgSend(_5,"setVerticalBorder:forView:",objj_msgSend(_d,"intValue"),_8);
}
var _e=objj_msgSend(_b,"valueForKey:","proportion");
if(_e!=nil){
objj_msgSend(_5,"setProportion:forView:",objj_msgSend(_e,"floatValue"),_8);
}
}
}
return _5;
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("tagName"),function(_f,_10){
with(_f){
return "vbox";
}
}),new objj_method(sel_getUid("platformObjectClass"),function(_11,_12){
with(_11){
return objj_msgSend(GSAutoLayoutVBox,"class");
}
})]);
p;40;Frameworks/Renaissance/GSMarkupTagView.jt;6048;@STATIC;1.0;i;19;GSMarkupTagObject.jt;6005;
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
p;42;Frameworks/Renaissance/GSMarkupTagWindow.jt;6843;@STATIC;1.0;i;19;GSMarkupTagObject.jt;6800;
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
p;36;Frameworks/Renaissance/Renaissance.jt;2820;@STATIC;1.0;I;21;Foundation/CPObject.jI;22;Renaissance/Fireside.jI;24;Renaissance/CPViewSize.jI;31;Renaissance/GSMarkupTagObject.jI;29;Renaissance/GSMarkupTagView.jI;28;Renaissance/GSMarkupTagBox.jI;29;Renaissance/GSMarkupTagHbox.jI;29;Renaissance/GSMarkupTagVbox.jI;32;Renaissance/GSMarkupTagControl.jI;34;Renaissance/GSMarkupTagTextField.jI;35;Renaissance/GSMarkupTagScrollView.jI;31;Renaissance/GSMarkupTagSlider.jI;30;Renaissance/GSMarkupTagImage.jI;30;Renaissance/GSMarkupTagLabel.jI;33;Renaissance/GSMarkupTagTextView.jI;31;Renaissance/GSMarkupTagButton.jI;31;Renaissance/GSMarkupTagWindow.jI;40;Renaissance/GSMarkupTagObjectAdditions.jI;36;Renaissance/GSMarkupTagPopUpButton.jI;34;Renaissance/GSMarkupTagTableView.jI;36;Renaissance/GSMarkupTagTableColumn.jI;29;Renaissance/GSMarkupTagMenu.jI;33;Renaissance/GSMarkupTagMenuItem.jI;34;Renaissance/GSMarkupTagSplitView.jI;31;Renaissance/GSMarkupTagHSpace.jI;44;Renaissance/GSMarkupTagCappuccinoAdditions.jI;34;Renaissance/GSAutoLayoutDefaults.jI;33;Renaissance/GSMarkupTagFireside.jI;29;Renaissance/GSMarkupDecoder.jI;37;Renaissance/GSMarkupBundleAdditions.jt;1701;
objj_executeFile("Foundation/CPObject.j",NO);
objj_executeFile("Renaissance/Fireside.j",NO);
objj_executeFile("Renaissance/CPViewSize.j",NO);
objj_executeFile("Renaissance/GSMarkupTagObject.j",NO);
objj_executeFile("Renaissance/GSMarkupTagView.j",NO);
objj_executeFile("Renaissance/GSMarkupTagBox.j",NO);
objj_executeFile("Renaissance/GSMarkupTagHbox.j",NO);
objj_executeFile("Renaissance/GSMarkupTagVbox.j",NO);
objj_executeFile("Renaissance/GSMarkupTagControl.j",NO);
objj_executeFile("Renaissance/GSMarkupTagTextField.j",NO);
objj_executeFile("Renaissance/GSMarkupTagScrollView.j",NO);
objj_executeFile("Renaissance/GSMarkupTagSlider.j",NO);
objj_executeFile("Renaissance/GSMarkupTagImage.j",NO);
objj_executeFile("Renaissance/GSMarkupTagLabel.j",NO);
objj_executeFile("Renaissance/GSMarkupTagTextView.j",NO);
objj_executeFile("Renaissance/GSMarkupTagButton.j",NO);
objj_executeFile("Renaissance/GSMarkupTagWindow.j",NO);
objj_executeFile("Renaissance/GSMarkupTagObjectAdditions.j",NO);
objj_executeFile("Renaissance/GSMarkupTagPopUpButton.j",NO);
objj_executeFile("Renaissance/GSMarkupTagTableView.j",NO);
objj_executeFile("Renaissance/GSMarkupTagTableColumn.j",NO);
objj_executeFile("Renaissance/GSMarkupTagMenu.j",NO);
objj_executeFile("Renaissance/GSMarkupTagMenuItem.j",NO);
objj_executeFile("Renaissance/GSMarkupTagSplitView.j",NO);
objj_executeFile("Renaissance/GSMarkupTagHSpace.j",NO);
objj_executeFile("Renaissance/GSMarkupTagCappuccinoAdditions.j",NO);
objj_executeFile("Renaissance/GSAutoLayoutDefaults.j",NO);
objj_executeFile("Renaissance/GSMarkupTagFireside.j",NO);
objj_executeFile("Renaissance/GSMarkupDecoder.j",NO);
objj_executeFile("Renaissance/GSMarkupBundleAdditions.j",NO);
p;40;Frameworks/TextView/CPAttributedString.jt;12866;@STATIC;1.0;I;20;Foundation/CPArray.jI;25;Foundation/CPDictionary.jI;24;Foundation/CPException.jI;21;Foundation/CPObject.jI;20;Foundation/CPRange.jI;21;Foundation/CPString.jt;12685;
objj_executeFile("Foundation/CPArray.j",NO);
objj_executeFile("Foundation/CPDictionary.j",NO);
objj_executeFile("Foundation/CPException.j",NO);
objj_executeFile("Foundation/CPObject.j",NO);
objj_executeFile("Foundation/CPRange.j",NO);
objj_executeFile("Foundation/CPString.j",NO);
var _1=objj_allocateClassPair(CPObject,"CPAttributedString"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_string"),new objj_ivar("_rangeEntries")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initWithString:"),function(_3,_4,_5){
with(_3){
return objj_msgSend(_3,"initWithString:attributes:",_5,nil);
}
}),new objj_method(sel_getUid("initWithAttributedString:"),function(_6,_7,_8){
with(_6){
var _9=objj_msgSend(_6,"initWithString:attributes:","",nil);
objj_msgSend(_9,"setAttributedString:",_8);
return _9;
}
}),new objj_method(sel_getUid("initWithString:attributes:"),function(_a,_b,_c,_d){
with(_a){
_a=objj_msgSendSuper({receiver:_a,super_class:objj_getClass("CPAttributedString").super_class},"init");
if(_a){
if(!_d){
_d=objj_msgSend(CPDictionary,"dictionary");
}
_string=""+_c;
_rangeEntries=objj_msgSend(CPArray,"arrayWithObject:",_e(CPMakeRange(0,_string.length),_d));
}
return _a;
}
}),new objj_method(sel_getUid("string"),function(_f,_10){
with(_f){
return _string;
}
}),new objj_method(sel_getUid("mutableString"),function(_11,_12){
with(_11){
return objj_msgSend(_11,"string");
}
}),new objj_method(sel_getUid("length"),function(_13,_14){
with(_13){
return _string.length;
}
}),new objj_method(sel_getUid("_indexOfEntryWithIndex:"),function(_15,_16,_17){
with(_15){
if(_17<0||_17>_string.length||_17===undefined){
return CPNotFound;
}
var _18=function(_19,_1a){
if(CPLocationInRange(_19,_1a.range)||(!_19&&!CPMaxRange(_1a.range))){
return CPOrderedSame;
}else{
if(CPMaxRange(_1a.range)<=_19){
return CPOrderedDescending;
}else{
return CPOrderedAscending;
}
}
};
return objj_msgSend(_rangeEntries,"indexOfObject:inSortedRange:options:usingComparator:",_17,nil,0,_18);
}
}),new objj_method(sel_getUid("attributesAtIndex:effectiveRange:"),function(_1b,_1c,_1d,_1e){
with(_1b){
var _1f=objj_msgSend(_1b,"_indexOfEntryWithIndex:",_1d);
if(_1f==CPNotFound){
return nil;
}
var _20=_rangeEntries[_1f];
if(_1e){
_1e.location=_20.range.location;
_1e.length=_20.range.length;
}
return _20.attributes;
}
}),new objj_method(sel_getUid("attributesAtIndex:longestEffectiveRange:inRange:"),function(_21,_22,_23,_24,_25){
with(_21){
var _26=objj_msgSend(_21,"_indexOfEntryWithIndex:",_23);
if(_26==CPNotFound){
return nil;
}
if(!_24){
return _rangeEntries[_26].attributes;
}
if(CPRangeInRange(_rangeEntries[_26].range,_25)){
_24.location=_25.location;
_24.length=_25.length;
return _rangeEntries[_26].attributes;
}
var _27=_26-1,_28=_rangeEntries[_26],_29=_28.attributes;
while(_27>=0){
var _2a=_rangeEntries[_27];
if(CPMaxRange(_2a.range)>_25.location&&objj_msgSend(_2a.attributes,"isEqualToDictionary:",_29)){
_28=_2a;
_27--;
}else{
break;
}
}
_24.location=MAX(_28.range.location,_25.location);
_28=_rangeEntries[_26];
_27=_26+1;
while(_27<_rangeEntries.length){
var _2a=_rangeEntries[_27];
if(_2a.range.location<CPMaxRange(_25)&&objj_msgSend(_2a.attributes,"isEqualToDictionary:",_29)){
_28=_2a;
_27++;
}else{
break;
}
}
_24.length=MIN(CPMaxRange(_28.range),CPMaxRange(_25))-_24.location;
return _29;
}
}),new objj_method(sel_getUid("attribute:atIndex:effectiveRange:"),function(_2b,_2c,_2d,_2e,_2f){
with(_2b){
if(!_2d){
if(_2f){
_2f.location=0;
_2f.length=_string.length;
}
return nil;
}
return objj_msgSend(objj_msgSend(_2b,"attributesAtIndex:effectiveRange:",_2e,_2f),"valueForKey:",_2d);
}
}),new objj_method(sel_getUid("attribute:atIndex:longestEffectiveRange:inRange:"),function(_30,_31,_32,_33,_34,_35){
with(_30){
var _36=objj_msgSend(_30,"_indexOfEntryWithIndex:",_33);
if(_36==CPNotFound||!_32){
return nil;
}
if(!_34){
return objj_msgSend(_rangeEntries[_36].attributes,"objectForKey:",_32);
}
if(CPRangeInRange(_rangeEntries[_36].range,_35)){
_34.location=_35.location;
_34.length=_35.length;
return objj_msgSend(_rangeEntries[_36].attributes,"objectForKey:",_32);
}
var _37=_36-1,_38=_rangeEntries[_36],_39=objj_msgSend(_38.attributes,"objectForKey:",_32);
while(_37>=0){
var _3a=_rangeEntries[_37];
if(CPMaxRange(_3a.range)>_35.location&&_3b(_39,objj_msgSend(_3a.attributes,"objectForKey:",_32))){
_38=_3a;
_37--;
}else{
break;
}
}
_34.location=MAX(_38.range.location,_35.location);
_38=_rangeEntries[_36];
_37=_36+1;
while(_37<_rangeEntries.length){
var _3a=_rangeEntries[_37];
if(_3a.range.location<CPMaxRange(_35)&&_3b(_39,objj_msgSend(_3a.attributes,"objectForKey:",_32))){
_38=_3a;
_37++;
}else{
break;
}
}
_34.length=MIN(CPMaxRange(_38.range),CPMaxRange(_35))-_34.location;
return _39;
}
}),new objj_method(sel_getUid("isEqualToAttributedString:"),function(_3c,_3d,_3e){
with(_3c){
if(!_3e){
return NO;
}
if(_string!=objj_msgSend(_3e,"string")){
return NO;
}
var _3f=CPMakeRange(),_40=CPMakeRange(),_41=objj_msgSend(_3c,"attributesAtIndex:effectiveRange:",0,_3f),_42=objj_msgSend(_3e,"attributesAtIndex:effectiveRange:",0,_40),_43=_string.length;
while(CPMaxRange(CPUnionRange(_3f,_40))<_43){
if(CPIntersectionRange(_3f,_40).length>0&&!objj_msgSend(_41,"isEqualToDictionary:",_42)){
return NO;
}
if(CPMaxRange(_3f)<CPMaxRange(_40)){
_41=objj_msgSend(_3c,"attributesAtIndex:effectiveRange:",CPMaxRange(_3f),_3f);
}else{
_42=objj_msgSend(_3e,"attributesAtIndex:effectiveRange:",CPMaxRange(_40),_40);
}
}
return YES;
}
}),new objj_method(sel_getUid("isEqual:"),function(_44,_45,_46){
with(_44){
if(_46==_44){
return YES;
}
if(objj_msgSend(_46,"isKindOfClass:",objj_msgSend(_44,"class"))){
return objj_msgSend(_44,"isEqualToAttributedString:",_46);
}
return NO;
}
}),new objj_method(sel_getUid("attributedSubstringFromRange:"),function(_47,_48,_49){
with(_47){
if(!_49||CPMaxRange(_49)>_string.length||_49.location<0){
objj_msgSend(CPException,"raise:reason:",CPRangeException,"tried to get attributedSubstring for an invalid range: "+(_49?CPStringFromRange(_49):"nil"));
}
var _4a=objj_msgSend(objj_msgSend(CPAttributedString,"alloc"),"initWithString:",_string.substring(_49.location,CPMaxRange(_49))),_4b=objj_msgSend(_47,"_indexOfEntryWithIndex:",_49.location),_4c=_rangeEntries[_4b],_4d=CPMaxRange(_49);
_4a._rangeEntries=[];
while(_4c&&CPMaxRange(_4c.range)<_4d){
var _4e=_4f(_4c);
_4e.range.location-=_49.location;
if(_4e.range.location<0){
_4e.range.length+=_4e.range.location;
_4e.range.location=0;
}
_4a._rangeEntries.push(_4e);
_4c=_rangeEntries[++_4b];
}
if(_4c){
var _50=_4f(_4c);
_50.range.length=CPMaxRange(_49)-_50.range.location;
_50.range.location-=_49.location;
if(_50.range.location<0){
_50.range.length+=_50.range.location;
_50.range.location=0;
}
_4a._rangeEntries.push(_50);
}
return _4a;
}
}),new objj_method(sel_getUid("replaceCharactersInRange:withString:"),function(_51,_52,_53,_54){
with(_51){
if(!_54){
_54="";
}
var _55=objj_msgSend(_51,"_indexOfEntryWithIndex:",_53.location);
if(_55<0){
_55=MAX(_rangeEntries.length-1,0);
}
var _56=_rangeEntries[_55];
var _57=objj_msgSend(_51,"_indexOfEntryWithIndex:",MAX(CPMaxRange(_53)-1,0));
if(_57<0){
_57=MAX(_rangeEntries.length-1,0);
}
var _58=_rangeEntries[_57];
var _59=_54.length-_53.length;
_string=_string.substring(0,_53.location)+_54+_string.substring(CPMaxRange(_53));
if(_55==_57){
_56.range.length+=_59;
}else{
_58.range.length=CPMaxRange(_58.range)-CPMaxRange(_53);
_58.range.location=CPMaxRange(_53);
_56.range.length=CPMaxRange(_53)-_56.range.location;
_rangeEntries.splice(_55,_57-_55);
}
_57=_55+1;
while(_57<_rangeEntries.length){
_rangeEntries[_57++].range.location+=_59;
}
}
}),new objj_method(sel_getUid("deleteCharactersInRange:"),function(_5a,_5b,_5c){
with(_5a){
objj_msgSend(_5a,"replaceCharactersInRange:withString:",_5c,nil);
}
}),new objj_method(sel_getUid("setAttributes:range:"),function(_5d,_5e,_5f,_60){
with(_5d){
var _61=objj_msgSend(_5d,"_indexOfRangeEntryForIndex:splitOnMaxIndex:",_60.location,YES),_62=objj_msgSend(_5d,"_indexOfRangeEntryForIndex:splitOnMaxIndex:",CPMaxRange(_60),YES),_63=_61;
if(_62==CPNotFound){
_62=_rangeEntries.length;
}
while(_63<_62){
_rangeEntries[_63++].attributes=objj_msgSend(_5f,"copy");
}
objj_msgSend(_5d,"_coalesceRangeEntriesFromIndex:toIndex:",_61,_62);
}
}),new objj_method(sel_getUid("addAttributes:range:"),function(_64,_65,_66,_67){
with(_64){
var _68=objj_msgSend(_64,"_indexOfRangeEntryForIndex:splitOnMaxIndex:",_67.location,YES),_69=objj_msgSend(_64,"_indexOfRangeEntryForIndex:splitOnMaxIndex:",CPMaxRange(_67),YES),_6a=_68;
if(_69==CPNotFound){
_69=_rangeEntries.length;
}
while(_6a<_69){
var _6b=objj_msgSend(_66,"allKeys"),_6c=objj_msgSend(_6b,"count");
while(_6c--){
objj_msgSend(_rangeEntries[_6a].attributes,"setObject:forKey:",objj_msgSend(_66,"objectForKey:",_6b[_6c]),_6b[_6c]);
}
_6a++;
}
objj_msgSend(_64,"_coalesceRangeEntriesFromIndex:toIndex:",_68,_69);
}
}),new objj_method(sel_getUid("addAttribute:value:range:"),function(_6d,_6e,_6f,_70,_71){
with(_6d){
objj_msgSend(_6d,"addAttributes:range:",objj_msgSend(CPDictionary,"dictionaryWithObject:forKey:",_70,_6f),_71);
}
}),new objj_method(sel_getUid("removeAttribute:range:"),function(_72,_73,_74,_75){
with(_72){
var _76=objj_msgSend(_72,"_indexOfRangeEntryForIndex:splitOnMaxIndex:",_75.location,YES),_77=objj_msgSend(_72,"_indexOfRangeEntryForIndex:splitOnMaxIndex:",CPMaxRange(_75),YES),_78=_76;
if(_77==CPNotFound){
_77=_rangeEntries.length;
}
while(_78<_77){
objj_msgSend(_rangeEntries[_78++].attributes,"removeObjectForKey:",_74);
}
objj_msgSend(_72,"_coalesceRangeEntriesFromIndex:toIndex:",_76,_77);
}
}),new objj_method(sel_getUid("appendAttributedString:"),function(_79,_7a,_7b){
with(_79){
objj_msgSend(_79,"insertAttributedString:atIndex:",_7b,_string.length);
}
}),new objj_method(sel_getUid("insertAttributedString:atIndex:"),function(_7c,_7d,_7e,_7f){
with(_7c){
if(_7f<0||_7f>objj_msgSend(_7c,"length")){
objj_msgSend(CPException,"raise:reason:",CPRangeException,"tried to insert attributed string at an invalid index: "+_7f);
}
var _80=objj_msgSend(_7c,"_indexOfRangeEntryForIndex:splitOnMaxIndex:",_7f,YES),_81=_7e._rangeEntries,_82=objj_msgSend(_7e,"length");
if(_80==CPNotFound){
_80=_rangeEntries.length;
}
_string=_string.substring(0,_7f)+_7e._string+_string.substring(_7f);
var _83=_80;
while(_83<_rangeEntries.length){
_rangeEntries[_83++].range.location+=_82;
}
var _84=_81.length,_85=0;
while(_85<_84){
var _86=_4f(_81[_85++]);
_86.range.location+=_7f;
_rangeEntries.splice(_80-1+_85,0,_86);
}
}
}),new objj_method(sel_getUid("replaceCharactersInRange:withAttributedString:"),function(_87,_88,_89,_8a){
with(_87){
objj_msgSend(_87,"deleteCharactersInRange:",_89);
objj_msgSend(_87,"insertAttributedString:atIndex:",_8a,_89.location);
}
}),new objj_method(sel_getUid("setAttributedString:"),function(_8b,_8c,_8d){
with(_8b){
_string=_8d._string;
_rangeEntries=[];
var i=0,_8e=_8d._rangeEntries.length;
for(;i<_8e;i++){
_rangeEntries.push(_4f(_8d._rangeEntries[i]));
}
}
}),new objj_method(sel_getUid("_indexOfRangeEntryForIndex:splitOnMaxIndex:"),function(_8f,_90,_91,_92){
with(_8f){
var _93=objj_msgSend(_8f,"_indexOfEntryWithIndex:",_91);
if(_93<0){
return _93;
}
var _94=_rangeEntries[_93];
if(_94.range.location==_91||(CPMaxRange(_94.range)-1==_91&&!_92)){
return _93;
}
var _95=splitRangeEntryAtIndex(_94,_91);
_rangeEntries.splice(_93,1,_95[0],_95[1]);
_93++;
return _93;
}
}),new objj_method(sel_getUid("_coalesceRangeEntriesFromIndex:toIndex:"),function(_96,_97,_98,end){
with(_96){
var _99=_98;
if(end>=_rangeEntries.length){
end=_rangeEntries.length-1;
}
while(_99<end){
var a=_rangeEntries[_99],b=_rangeEntries[_99+1];
if(objj_msgSend(a.attributes,"isEqualToDictionary:",b.attributes)){
a.range.length=CPMaxRange(b.range)-a.range.location;
_rangeEntries.splice(_99+1,1);
end--;
}else{
_99++;
}
}
}
}),new objj_method(sel_getUid("beginEditing"),function(_9a,_9b){
with(_9a){
}
}),new objj_method(sel_getUid("endEditing"),function(_9c,_9d){
with(_9c){
}
})]);
var _1=objj_allocateClassPair(CPAttributedString,"CPMutableAttributedString"),_2=_1.isa;
objj_registerClassPair(_1);
var _3b=_3b=function(a,b){
if(a==b){
return YES;
}
if(objj_msgSend(a,"respondsToSelector:",sel_getUid("isEqual:"))&&objj_msgSend(a,"isEqual:",b)){
return YES;
}
return NO;
};
var _e=_e=function(_9e,_9f){
return {range:_9e,attributes:objj_msgSend(_9f,"copy")};
};
var _4f=_4f=function(_a0){
return _e(CPCopyRange(_a0.range),objj_msgSend(_a0.attributes,"copy"));
};
var _a1=splitRangeEntryAtIndex=function(_a2,_a3){
var _a4=_4f(_a2),_a5=CPMaxRange(_a2.range);
_a2.range.length=_a3-_a2.range.location;
_a4.range.location=_a3;
_a4.range.length=_a5-_a3;
_a4.attributes=objj_msgSend(_a4.attributes,"copy");
return [_a2,_a4];
};
p;38;Frameworks/TextView/CPFontDescriptor.jt;6629;@STATIC;1.0;I;21;Foundation/CPObject.jt;6584;
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
p;35;Frameworks/TextView/CPFontManager.jt;12069;@STATIC;1.0;I;21;Foundation/CPObject.jI;15;AppKit/CPFont.ji;13;CPFontPanel.ji;18;CPFontDescriptor.jt;11962;
objj_executeFile("Foundation/CPObject.j",NO);
objj_executeFile("AppKit/CPFont.j",NO);
objj_executeFile("CPFontPanel.j",YES);
objj_executeFile("CPFontDescriptor.j",YES);
CPNoFontChangeAction=0;
CPViaPanelFontAction=1;
CPAddTraitFontAction=2;
CPSizeUpFontAction=3;
CPSizeDownFontAction=4;
CPHeavierFontAction=5;
CPLighterFontAction=6;
CPRemoveTraitFontAction=7;
CPItalicFontMask=1;
CPBoldFontMask=2;
CPUnboldFontMask=4;
CPExpandedFontMask=32;
CPCompensedFontMask=64;
CPSmallCapsFontMask=128;
CPUnitalicFontMask=16777216;
var _1=nil,_2=Nil,_3=Nil;
var _4=nil,_5=nil;
var _6=objj_allocateClassPair(CPObject,"CPFontManager"),_7=_6.isa;
class_addIvars(_6,[new objj_ivar("_availableFonts"),new objj_ivar("_delegate"),new objj_ivar("_fontMenu"),new objj_ivar("_action"),new objj_ivar("_fontAction"),new objj_ivar("_currentFontTrait"),new objj_ivar("_selectedFont"),new objj_ivar("_isMultiple")]);
objj_registerClassPair(_6);
class_addMethods(_6,[new objj_method(sel_getUid("init"),function(_8,_9){
with(_8){
_8=objj_msgSendSuper({receiver:_8,super_class:objj_getClass("CPFontManager").super_class},"init");
if(_8){
_action=sel_getUid("changeFont:");
}
return _8;
}
}),new objj_method(sel_getUid("availableFonts"),function(_a,_b){
with(_a){
if(!_availableFonts){
_c=document.createElement("span");
_c.fontSize="24px";
_c.appendChild(document.createTextNode("mmmmmmmmmml"));
var _d=document.createElement("div");
_d.style.position="absolute";
_d.style.top="-1000px";
_d.appendChild(_c);
document.getElementsByTagName("body")[0].appendChild(_d);
_e=_f(["monospace","serif","sans-serif","cursive"]);
_availableFonts=[];
for(var i=0;i<_10.length;i++){
var _11=_12(_10[i]);
if(_11){
_availableFonts.push(_10[i]);
}
}
}
return _availableFonts;
}
}),new objj_method(sel_getUid("fontWithNameIsAvailable:"),function(_13,_14,_15){
with(_13){
return _12(_15);
}
}),new objj_method(sel_getUid("orderFrontFontPanel:"),function(_16,_17,_18){
with(_16){
objj_msgSend(objj_msgSend(_16,"fontPanel:",YES),"orderFront:",_18);
}
}),new objj_method(sel_getUid("addFontTrait:"),function(_19,_1a,_1b){
with(_19){
_fontAction=CPAddTraitFontAction;
_currentFontTrait=objj_msgSend(_1b,"tag");
objj_msgSend(_19,"sendAction");
if(_selectedFont){
objj_msgSend(_19,"setSelectedFont:isMultiple:",objj_msgSend(_19,"convertFont:",_selectedFont),_isMultiple);
}
}
}),new objj_method(sel_getUid("modifyFont:"),function(_1c,_1d,_1e){
with(_1c){
_fontAction=objj_msgSend(_1e,"tag");
objj_msgSend(_1c,"sendAction");
if(_selectedFont){
objj_msgSend(_1c,"setSelectedFont:isMultiple:",objj_msgSend(_1c,"convertFont:",_selectedFont),_isMultiple);
}
}
}),new objj_method(sel_getUid("modifyFontViaPanel:"),function(_1f,_20,_21){
with(_1f){
_fontAction=CPViaPanelFontAction;
objj_msgSend(_1f,"sendAction");
if(_selectedFont){
objj_msgSend(_1f,"setSelectedFont:isMultiple:",objj_msgSend(_1f,"convertFont:",_selectedFont),_isMultiple);
}
}
}),new objj_method(sel_getUid("sendAction"),function(_22,_23){
with(_22){
if(!_action){
return NO;
}
return objj_msgSend(CPApp,"sendAction:to:from:",_action,nil,_22);
}
}),new objj_method(sel_getUid("setAction:"),function(_24,_25,_26){
with(_24){
_action=_26;
}
}),new objj_method(sel_getUid("convertFont:toHaveTrait:"),function(_27,_28,_29,_2a){
with(_27){
var _2b=objj_msgSend(objj_msgSend(objj_msgSend(_29,"fontDescriptor"),"fontAttributes"),"copy"),_2c=objj_msgSend(objj_msgSend(_29,"fontDescriptor"),"symbolicTraits");
if(_2a&CPBoldFontMask){
_2c|=CPFontBoldTrait;
}
if(_2a&CPItalicFontMask){
_2c|=CPFontItalicTrait;
}
if(_2a&CPUnboldFontMask){
_2c&=~CPFontBoldTrait;
}
if(_2a&CPUnitalicFontMask){
_2c&=~CPFontItalicTrait;
}
if(_2a&CPExpandedFontMask){
_2c|=CPFontExpandedTrait;
}
if(_2a&CPCompensedFontMask){
_2c|=CPFontCondensedTrait;
}
if(_2a&CPSmallCapsFontMask){
_2c|=CPFontSmallCapsTrait;
}
if(!objj_msgSend(_2b,"containsKey:",CPFontTraitsAttribute)){
objj_msgSend(_2b,"setObject:forKey:",objj_msgSend(CPDictionary,"dictionaryWithObject:forKey:",objj_msgSend(CPNumber,"numberWithUnsignedInt:",_2c),CPFontSymbolicTrait),CPFontTraitsAttribute);
}else{
objj_msgSend(objj_msgSend(_2b,"objectForKey:",CPFontTraitsAttribute),"setObject:forKey:",objj_msgSend(CPNumber,"numberWithUnsignedInt:",_2c),CPFontSymbolicTrait);
}
return objj_msgSend(objj_msgSend(_29,"class"),"fontWithDescriptor:size:",objj_msgSend(CPFontDescriptor,"fontDescriptorWithFontAttributes:",_2b),0);
}
}),new objj_method(sel_getUid("convertFont:toNotHaveTrait:"),function(_2d,_2e,_2f,_30){
with(_2d){
var _31=objj_msgSend(objj_msgSend(objj_msgSend(_2f,"fontDescriptor"),"fontAttributes"),"copy"),_32=objj_msgSend(objj_msgSend(_2f,"fontDescriptor"),"symbolicTraits");
if((_30&CPBoldFontMask)||(_30&CPUnboldFontMask)){
_32&=~CPFontBoldTrait;
}
if((_30&CPItalicFontMask)||(_30&CPUnitalicFontMask)){
_32&=~CPFontItalicTrait;
}
if(_30&CPExpandedFontMask){
_32&=~CPFontExpandedTrait;
}
if(_30&CPCompensedFontMask){
_32&=~CPFontCondensedTrait;
}
if(_30&CPSmallCapsFontMask){
_32&=~CPFontSmallCapsTrait;
}
if(!objj_msgSend(_31,"containsKey:",CPFontTraitsAttribute)){
objj_msgSend(_31,"setObject:forKey:",objj_msgSend(CPDictionary,"dictionaryWithObject:forKey:",objj_msgSend(CPNumber,"numberWithUnsignedInt:",_32),CPFontSymbolicTrait),CPFontTraitsAttribute);
}else{
objj_msgSend(objj_msgSend(_31,"objectForKey:",CPFontTraitsAttribute),"setObject:forKey:",objj_msgSend(CPNumber,"numberWithUnsignedInt:",_32),CPFontSymbolicTrait);
}
return objj_msgSend(objj_msgSend(_2f,"class"),"fontWithDescriptor:size:",objj_msgSend(CPFontDescriptor,"fontDescriptorWithFontAttributes:",_31),0);
}
}),new objj_method(sel_getUid("convertFont:toSize:"),function(_33,_34,_35,_36){
with(_33){
return objj_msgSend(objj_msgSend(_35,"class"),"fontWithDescriptor:size:",objj_msgSend(_35,"fontDescriptor"),_36);
}
}),new objj_method(sel_getUid("convertWeight:ofFont:"),function(_37,_38,_39,_3a){
with(_37){
var _3b=objj_msgSend(objj_msgSend(_3a,"fontDescriptor"),"fontWeightCSSString");
if(!_4){
_4=["lighter","normal","bold","bolder"];
}
if(!_5){
_5=["100","200","300","400","500","600","700","800","900"];
}
CPLog.trace("FIXME: -["+objj_msgSend(_37,"className")+" "+_38+"] stub");
return _3a;
}
}),new objj_method(sel_getUid("convertFont:"),function(_3c,_3d,_3e){
with(_3c){
var _3f=nil;
switch(_fontAction){
case CPNoFontChangeAction:
_3f=_3e;
break;
case CPViaPanelFontAction:
_3f=objj_msgSend(objj_msgSend(_3c,"fontPanel:",NO),"panelConvertFont:",_3e);
break;
case CPAddTraitFontAction:
_3f=objj_msgSend(_3c,"convertFont:toHaveTrait:",_3e,_currentFontTrait);
break;
case CPSizeUpFontAction:
_3f=objj_msgSend(_3c,"convertFont:toSize:",_3e,objj_msgSend(_3e,"size")+1);
break;
case CPSizeDownFontAction:
if(objj_msgSend(_3e,"size")>1){
_3f=objj_msgSend(_3c,"convertFont:toSize:",_3e,objj_msgSend(_3e,"size")-1);
}
break;
default:
CPLog.trace("-["+objj_msgSend(_3c,"className")+" "+_3d+"] unsupporter font action: "+_fontAction+" aFont unchanged");
_3f=_3e;
break;
}
return _3f;
}
}),new objj_method(sel_getUid("setFontMenu:"),function(_40,_41,_42){
with(_40){
_fontMenu=_42;
}
}),new objj_method(sel_getUid("fontMenu:"),function(_43,_44,_45){
with(_43){
if(!_fontMenu&&_45){
_fontMenu=objj_msgSend(objj_msgSend(CPMenu,"alloc"),"initWithTitle:","Font Menu");
var _46=objj_msgSend(_fontMenu,"addItemWithTitle:action:keyEquivalent:","Show Fonts",sel_getUid("orderFrontFontPanel:"),"t");
objj_msgSend(_46,"setTarget:",_43);
_46=objj_msgSend(_fontMenu,"addItemWithTitle:action:keyEquivalent:","Italic",sel_getUid("addFontTrait:"),"i");
objj_msgSend(_46,"setTag:",CPItalicFontMask);
objj_msgSend(_46,"setTarget:",_43);
_46=objj_msgSend(_fontMenu,"addItemWithTitle:action:keyEquivalent:","Bold",sel_getUid("addFontTrait:"),"b");
objj_msgSend(_46,"setTag:",CPBoldFontMask);
objj_msgSend(_46,"setTarget:",_43);
objj_msgSend(_fontMenu,"addItemWithTitle:action:keyEquivalent:","Underline",sel_getUid("underline:"),"u");
objj_msgSend(_fontMenu,"addItem:",objj_msgSend(CPMenuItem,"separatorItem"));
_46=objj_msgSend(_fontMenu,"addItemWithTitle:action:keyEquivalent:","Bigger",sel_getUid("modifyFont:"),"+");
objj_msgSend(_46,"setTag:",CPSizeUpFontAction);
_46=objj_msgSend(_fontMenu,"addItemWithTitle:action:keyEquivalent:","Smaller",sel_getUid("modifyFont:"),"-");
objj_msgSend(_46,"setTag:",CPSizeDownFontAction);
objj_msgSend(_fontMenu,"addItem:",objj_msgSend(CPMenuItem,"separatorItem"));
objj_msgSend(_fontMenu,"addItemWithTitle:action:keyEquivalent:","Show Colors",sel_getUid("orderFrontColorPanel:"),"C");
objj_msgSend(_fontMenu,"addItem:",objj_msgSend(CPMenuItem,"separatorItem"));
_46=objj_msgSend(_fontMenu,"addItemWithTitle:action:keyEquivalent:","Copy Style",sel_getUid("copyFont:"),"C");
objj_msgSend(_46,"setKeyEquivalentModifierMask:",CPAlternateKeyMask);
_46=objj_msgSend(_fontMenu,"addItemWithTitle:action:keyEquivalent:","Paste Style",sel_getUid("pasteFont:"),"V");
objj_msgSend(_46,"setKeyEquivalentModifierMask:",CPAlternateKeyMask);
}
return _fontMenu;
}
}),new objj_method(sel_getUid("fontPanel:"),function(_47,_48,_49){
with(_47){
var _4a=nil,_4b=objj_msgSend(_3,"sharedFontPanelExists");
if((_4b)||(!_4b&&_49)){
_4a=objj_msgSend(_3,"sharedFontPanel");
}
return _4a;
}
}),new objj_method(sel_getUid("selectedFont"),function(_4c,_4d){
with(_4c){
return _selectedFont;
}
}),new objj_method(sel_getUid("setSelectedFont:isMultiple:"),function(_4e,_4f,_50,_51){
with(_4e){
_selectedFont=_50;
_isMultiple=_51;
var _52=objj_msgSend(_4e,"fontPanel:",NO);
if(_52){
objj_msgSend(_52,"setPanelFont:isMultiple:",_selectedFont,_isMultiple);
}
}
})]);
class_addMethods(_7,[new objj_method(sel_getUid("sharedFontManager"),function(_53,_54){
with(_53){
if(!_1){
_1=objj_msgSend(objj_msgSend(_2,"alloc"),"init");
}
return _1;
}
}),new objj_method(sel_getUid("setFontManagerFactory:"),function(_55,_56,_57){
with(_55){
_2=_57;
}
}),new objj_method(sel_getUid("setFontPanelFactory:"),function(_58,_59,_5a){
with(_58){
_3=_5a;
}
})]);
var _c,_e,_10=["American Typewriter","Apple Chancery","Arial","Arial Black","Arial Narrow","Arial Rounded MT Bold","Arial Unicode MS","Big Caslon","Bitstream Vera Sans","Bitstream Vera Sans Mono","Bitstream Vera Serif","Brush Script MT","Cambria","Caslon","Castellar","Cataneo BT","Centaur","Century Gothic","Century Schoolbook","Century Schoolbook L","Comic Sans","Comic Sans MS","Consolas","Constantia","Cooper Black","Copperplate","Copperplate Gothic Bold","Copperplate Gothic Light","Corbel","Courier","Courier New","Futura","Geneva","Georgia","Georgia Ref","Geeza Pro","Gigi","Gill Sans","Gill Sans MT","Gill Sans MT Condensed","Gill Sans MT Ext Condensed Bold","Gill Sans Ultra Bold","Gill Sans Ultra Bold Condensed","Helvetica","Helvetica Narrow","Helvetica Neue","Herculanum","High Tower Text","Highlight LET","Hoefler Text","Impact","Imprint MT Shadow","Lucida","Lucida Bright","Lucida Calligraphy","Lucida Console","Lucida Fax","Lucida Grande","Lucida Handwriting","Lucida Sans","Lucida Sans Typewriter","Lucida Sans Unicode","Marker Felt","Microsoft Sans Serif","Milano LET","Minion Web","MisterEarl BT","Mistral","Monaco","Monotype Corsiva","Monotype.com","New Century Schoolbook","New York","News Gothic MT","Papyrus","Tahoma","Techno","Tempus Sans ITC","Terminal","Textile","Times","Times New Roman","Tiranti Solid LET","Trebuchet MS","Verdana","Verdana Ref","Zapfino"];
var _12=function(_5b){
for(var i=0;i<_e.length;i++){
if(_5c(_e[i],_5b)){
return true;
}
}
return false;
};
var _5d={};
var _5c=function(_5e,_5f){
var a;
if(_5d[_5e]){
a=_5d[_5e];
}else{
_c.style.fontFamily="\""+_5e+"\"";
_5d[_5e]=a={w:_c.offsetWidth,h:_c.offsetHeight};
}
_c.style.fontFamily="\""+_5f+"\", \""+_5e+"\"";
var _60=_c.offsetWidth;
var _61=_c.offsetHeight;
return (a.w!=_60||a.h!=_61);
};
var _f=function(_62){
for(var i=0;i<_62.length;i++){
for(var j=0;j<i;j++){
if(_5c(_62[i],_62[j])){
return [_62[i],_62[j]];
}
}
}
return [_62[0]];
};
objj_msgSend(CPFontManager,"setFontManagerFactory:",objj_msgSend(CPFontManager,"class"));
objj_msgSend(CPFontManager,"setFontPanelFactory:",objj_msgSend(CPFontPanel,"class"));
p;33;Frameworks/TextView/CPFontPanel.jt;19409;@STATIC;1.0;I;22;AppKit/CPFontManager.jI;16;AppKit/CPPanel.ji;17;CPLayoutManager.jt;19319;
objj_executeFile("AppKit/CPFontManager.j",NO);
objj_executeFile("AppKit/CPPanel.j",NO);
objj_executeFile("CPLayoutManager.j",YES);
var _1=0,_2=1,_3=2,_4=3;
var _5=0,_6=1,_7=2,_8=3,_9=4,_a=5,_b=6,_c=7,_d=8,_e=9,_f=10,_10=11;
var _11=32,_12=6,_13=2,_14=32,_15=_11-_13;
var _16=1,_17=2;
var _18=0,_19=1,_1a=2,_1b=3,_1c=4,_1d=5,_1e=6,_1f=7;
var _20=nil;
var _21=objj_allocateClassPair(CPView,"_CPFontPanelCell"),_22=_21.isa;
class_addIvars(_21,[new objj_ivar("_label"),new objj_ivar("_highlightView")]);
objj_registerClassPair(_21);
class_addMethods(_21,[new objj_method(sel_getUid("setRepresentedObject:"),function(_23,_24,_25){
with(_23){
if(!_label){
_label=objj_msgSend(objj_msgSend(CPTextField,"alloc"),"initWithFrame:",CGRectInset(objj_msgSend(_23,"bounds"),2,2));
objj_msgSend(_label,"setFont:",objj_msgSend(CPFont,"systemFontOfSize:",12));
objj_msgSend(_23,"addSubview:",_label);
}
objj_msgSend(_label,"setStringValue:",_25);
objj_msgSend(_label,"sizeToFit");
objj_msgSend(_label,"setFrameOrigin:",CGPointMake(0,0));
}
}),new objj_method(sel_getUid("setSelected:"),function(_26,_27,_28){
with(_26){
if(!_highlightView){
_highlightView=objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",CGRectCreateCopy(objj_msgSend(_26,"bounds")));
objj_msgSend(_highlightView,"setBackgroundColor:",objj_msgSend(CPColor,"lightGrayColor"));
}
if(_28){
objj_msgSend(_26,"addSubview:positioned:relativeTo:",_highlightView,CPWindowBelow,_label);
}else{
objj_msgSend(_highlightView,"removeFromSuperview");
}
}
})]);
var _21=objj_allocateClassPair(CPView,"_CPFontPanelSampleView"),_22=_21.isa;
class_addIvars(_21,[new objj_ivar("_layoutManager"),new objj_ivar("_textStorage"),new objj_ivar("_textContainer")]);
objj_registerClassPair(_21);
class_addMethods(_21,[new objj_method(sel_getUid("initWithFrame:"),function(_29,_2a,_2b){
with(_29){
_29=objj_msgSendSuper({receiver:_29,super_class:objj_getClass("_CPFontPanelSampleView").super_class},"initWithFrame:",_2b);
if(_29){
_textStorage=objj_msgSend(objj_msgSend(CPTextStorage,"alloc"),"init");
_layoutManager=objj_msgSend(objj_msgSend(CPLayoutManager,"alloc"),"init");
_textContainer=objj_msgSend(objj_msgSend(CPTextContainer,"alloc"),"init");
objj_msgSend(_layoutManager,"addTextContainer:",_textContainer);
objj_msgSend(_textStorage,"addLayoutManager:",_layoutManager);
}
return _29;
}
}),new objj_method(sel_getUid("setAttributedString:"),function(_2c,_2d,_2e){
with(_2c){
objj_msgSend(_textStorage,"replaceCharactersInRange:withAttributedString:",CPMakeRange(0,objj_msgSend(_textStorage,"length")),_2e);
objj_msgSend(_2c,"setNeedsDisplay:",YES);
}
}),new objj_method(sel_getUid("drawRect:"),function(_2f,_30,_31){
with(_2f){
var ctx=objj_msgSend(objj_msgSend(CPGraphicsContext,"currentContext"),"graphicsPort"),_32=objj_msgSend(_layoutManager,"glyphRangeForTextContainer:",_textContainer),_33=objj_msgSend(_layoutManager,"usedRectForTextContainer:",_textContainer),_34=objj_msgSend(_2f,"bounds"),pos=CPMakePoint((_34.size.width-_33.size.width)/2,(_34.size.height-_33.size.height)/2);
CGContextSaveGState(ctx);
CGContextSetFillColor(ctx,objj_msgSend(CPColor,"whiteColor"));
CGContextFillRect(ctx,_34);
CGContextRestoreGState(ctx);
objj_msgSend(_layoutManager,"drawGlyphsForGlyphRange:atPoint:",_32,pos);
}
})]);
var _21=objj_allocateClassPair(CPPanel,"CPFontPanel"),_22=_21.isa;
class_addIvars(_21,[new objj_ivar("_toolbarView"),new objj_ivar("_fontNameCollectionView"),new objj_ivar("_typefaceCollectionView"),new objj_ivar("_sizeField"),new objj_ivar("_sizeCollectionView"),new objj_ivar("_sampleView"),new objj_ivar("_availableFonts"),new objj_ivar("_textColorButton"),new objj_ivar("_backgroundColorButton"),new objj_ivar("_textColor"),new objj_ivar("_backgroundColor"),new objj_ivar("_currentColorButtonTag"),new objj_ivar("_setupDone"),new objj_ivar("_fontChanges")]);
objj_registerClassPair(_21);
class_addMethods(_21,[new objj_method(sel_getUid("init"),function(_35,_36){
with(_35){
_35=objj_msgSendSuper({receiver:_35,super_class:objj_getClass("CPFontPanel").super_class},"initWithContentRect:styleMask:",CGRectMake(100,50,378,394),(CPTitledWindowMask|CPClosableWindowMask));
if(_35){
objj_msgSend(objj_msgSend(_35,"contentView"),"setBackgroundColor:",objj_msgSend(CPColor,"colorWithWhite:alpha:",0.95,1));
objj_msgSend(_35,"setTitle:","Font Panel");
objj_msgSend(_35,"setLevel:",CPFloatingWindowLevel);
objj_msgSend(_35,"setFloatingPanel:",YES);
objj_msgSend(_35,"setBecomesKeyOnlyIfNeeded:",YES);
objj_msgSend(_35,"setMinSize:",CGSizeMake(378,394));
_availableFonts=objj_msgSend(objj_msgSend(CPFontManager,"sharedFontManager"),"availableFonts");
_textColor=objj_msgSend(CPColor,"blackColor");
_backgroundColor=objj_msgSend(CPColor,"whiteColor");
_setupDone=NO;
_fontChanges=_18;
}
return _35;
}
}),new objj_method(sel_getUid("_setupCollectionView:withScrollerFrame:"),function(_37,_38,_39,_3a){
with(_37){
var _3b=objj_msgSend(objj_msgSend(CPScrollView,"alloc"),"initWithFrame:",_3a);
objj_msgSend(_3b,"setAutohidesScrollers:",YES);
var _3c=objj_msgSend(objj_msgSend(CPCollectionViewItem,"alloc"),"init");
objj_msgSend(_3c,"setView:",objj_msgSend(objj_msgSend(_CPFontPanelCell,"alloc"),"initWithFrame:",CGRectMakeZero()));
objj_msgSend(_39,"setDelegate:",_37);
objj_msgSend(_39,"setItemPrototype:",_3c);
objj_msgSend(_39,"setMinItemSize:",CGSizeMake(20,16));
objj_msgSend(_39,"setMaxItemSize:",CGSizeMake(1000,16));
objj_msgSend(_39,"setMaxNumberOfColumns:",1);
objj_msgSend(_39,"setVerticalMargin:",0);
objj_msgSend(_39,"setAutoresizingMask:",CPViewWidthSizable|CPViewHeightSizable);
objj_msgSend(_3b,"setDocumentView:",_39);
return _3b;
}
}),new objj_method(sel_getUid("_setupToolbarView"),function(_3d,_3e){
with(_3d){
_toolbarView=objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",CGRectMake(0,_12,CGRectGetWidth(objj_msgSend(_3d,"frame")),_11));
objj_msgSend(_toolbarView,"setAutoresizingMask:",CPViewWidthSizable);
var _3f=0;
_textColorButton=objj_msgSend(objj_msgSend(CPButton,"alloc"),"initWithFrame:",CGRectMake(0,0,_14,_15));
objj_msgSend(_textColorButton,"setTag:",_16);
objj_msgSend(_textColorButton,"setAction:",sel_getUid("orderFrontColorPanel:"));
objj_msgSend(_textColorButton,"setTarget:",_3d);
objj_msgSend(_textColorButton,"setImage:",objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:",objj_msgSend(objj_msgSend(CPBundle,"bundleForClass:",objj_msgSend(CPFontPanel,"class")),"pathForResource:","CPFontPanel/CPFontPanelTextColor.png")));
objj_msgSend(_textColorButton,"setBackgroundColor:",_textColor);
objj_msgSend(_textColorButton,"setAutoresizingMask:",CPViewMinXMargin|CPViewMaxXMargin);
objj_msgSend(_textColorButton,"setBezelStyle:",CPSmallSquareBezelStyle);
objj_msgSend(_textColorButton,"setBordered:",NO);
objj_msgSend(_toolbarView,"addSubview:",_textColorButton);
_3f+=_14+_12;
_40+=(_14+_12);
_backgroundColorButton=objj_msgSend(objj_msgSend(CPButton,"alloc"),"initWithFrame:",CGRectMake(0,0,_14,_15));
objj_msgSend(_backgroundColorButton,"setTag:",_17);
objj_msgSend(_backgroundColorButton,"setAction:",sel_getUid("orderFrontColorPanel:"));
objj_msgSend(_backgroundColorButton,"setTarget:",_3d);
objj_msgSend(_backgroundColorButton,"setImage:",objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:",objj_msgSend(objj_msgSend(CPBundle,"bundleForClass:",objj_msgSend(CPFontPanel,"class")),"pathForResource:","CPFontPanel/CPFontPanelBackgroundColor.png")));
objj_msgSend(_backgroundColorButton,"setBackgroundColor:",_backgroundColor);
objj_msgSend(_backgroundColorButton,"setAutoresizingMask:",CPViewMinXMargin|CPViewMaxXMargin);
objj_msgSend(_backgroundColorButton,"setBezelStyle:",CPSmallSquareBezelStyle);
objj_msgSend(_backgroundColorButton,"setBordered:",NO);
objj_msgSend(_toolbarView,"addSubview:",_backgroundColorButton);
_3f+=_14+_12;
button=objj_msgSend(objj_msgSend(CPPopUpButton,"alloc"),"initWithFrame:",CGRectMake(0,0,_14,_15));
objj_msgSend(button,"addItemsWithTitles:",["none","underline","overline","line-through"]);
objj_msgSend(button,"sizeToFit");
objj_msgSend(button,"setBordered:",NO);
objj_msgSend(button,"setAutoresizingMask:",CPViewMinXMargin|CPViewMaxXMargin);
objj_msgSend(_toolbarView,"addSubview:",button);
_3f+=CGRectGetWidth(objj_msgSend(button,"bounds"))+_12;
button=objj_msgSend(objj_msgSend(CPPopUpButton,"alloc"),"initWithFrame:",CGRectMake(0,0,_14,_15));
objj_msgSend(button,"addItemsWithTitles:",["normal","bold","bolder","lighter"]);
objj_msgSend(button,"sizeToFit");
objj_msgSend(button,"setBordered:",NO);
objj_msgSend(button,"setAutoresizingMask:",CPViewMinXMargin|CPViewMaxXMargin);
objj_msgSend(_toolbarView,"addSubview:",button);
_3f+=CGRectGetWidth(objj_msgSend(button,"bounds"));
var _40=(CGRectGetWidth(objj_msgSend(_toolbarView,"bounds"))-_3f)/2,_41=objj_msgSend(_toolbarView,"subviews"),c=objj_msgSend(_41,"count");
for(var i=0;i<c;i++){
objj_msgSend(_41[i],"setFrameOrigin:",CPPointMake(_40,0));
_40+=CGRectGetWidth(objj_msgSend(_41[i],"bounds"))+_12;
}
}
}),new objj_method(sel_getUid("_setupContents"),function(_42,_43){
with(_42){
if(_setupDone){
return;
}
_setupDone=YES;
objj_msgSend(_42,"_setupToolbarView");
var _44=objj_msgSend(_42,"contentView"),_45=objj_msgSend(CPTextField,"labelWithTitle:","Font name"),_46=objj_msgSend(_44,"bounds"),_47=objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",CGRectMake(0,0,CGRectGetWidth(_46),CGRectGetHeight(_46)-(_12+_11+_13)));
objj_msgSend(_44,"addSubview:",_toolbarView);
objj_msgSend(_45,"setFrameOrigin:",CPPointMake(_12,0));
objj_msgSend(_47,"addSubview:",_45);
_fontNameCollectionView=objj_msgSend(objj_msgSend(CPCollectionView,"alloc"),"initWithFrame:",CGRectMake(0,0,200,300));
var y=CGRectGetHeight(objj_msgSend(_45,"frame"))+_13;
var _48=CGRectGetHeight(objj_msgSend(_47,"bounds"))-y-_13,_49=objj_msgSend(_42,"_setupCollectionView:withScrollerFrame:",_fontNameCollectionView,CGRectMake(_12,y,200,_48));
objj_msgSend(_49,"setAutoresizingMask:",CPViewWidthSizable|CPViewHeightSizable);
objj_msgSend(_47,"addSubview:",_49);
objj_msgSend(_fontNameCollectionView,"setContent:",_availableFonts);
var _4a=_12+200+_13;
_45=objj_msgSend(CPTextField,"labelWithTitle:","Typeface");
objj_msgSend(_45,"setFrameOrigin:",CPPointMake(_4a,0));
objj_msgSend(_45,"setAutoresizingMask:",CPViewMaxXMargin);
objj_msgSend(_47,"addSubview:",_45);
_typefaceCollectionView=objj_msgSend(objj_msgSend(CPCollectionView,"alloc"),"initWithFrame:",CGRectMake(0,0,80,300));
y=CGRectGetHeight(objj_msgSend(_45,"frame"))+_13;
_49=objj_msgSend(_42,"_setupCollectionView:withScrollerFrame:",_typefaceCollectionView,CGRectMake(_4a,y,80,_48));
objj_msgSend(_49,"setAutoresizingMask:",CPViewHeightSizable|CPViewMaxXMargin);
objj_msgSend(_47,"addSubview:",_49);
objj_msgSend(_typefaceCollectionView,"setContent:",["Normal","Italic","Bold","Bold Italic"]);
_4a+=80+_13;
_45=objj_msgSend(CPTextField,"labelWithTitle:","Size");
objj_msgSend(_45,"setFrameOrigin:",CPPointMake(_4a,0));
objj_msgSend(_45,"setAutoresizingMask:",CPViewMaxXMargin);
objj_msgSend(_47,"addSubview:",_45);
y=CGRectGetHeight(objj_msgSend(_45,"frame"))+_13;
_sizeField=objj_msgSend(objj_msgSend(CPTextField,"alloc"),"initWithFrame:",CGRectMake(_4a,y,40,30));
objj_msgSend(_sizeField,"setEditable:",YES);
objj_msgSend(_sizeField,"setBordered:",YES);
objj_msgSend(_sizeField,"setBezeled:",YES);
objj_msgSend(_sizeField,"setDelegate:",_42);
objj_msgSend(_sizeField,"setAutoresizingMask:",CPViewMaxXMargin);
objj_msgSend(_47,"addSubview:",_sizeField);
y+=CGRectGetHeight(objj_msgSend(_sizeField,"frame"))+_13;
_48=CGRectGetHeight(objj_msgSend(_47,"bounds"))-y-_13;
_sizeCollectionView=objj_msgSend(objj_msgSend(CPCollectionView,"alloc"),"initWithFrame:",CGRectMake(0,0,80,300));
_49=objj_msgSend(_42,"_setupCollectionView:withScrollerFrame:",_sizeCollectionView,CGRectMake(_4a,y,80,_48));
objj_msgSend(_49,"setAutoresizingMask:",CPViewHeightSizable|CPViewMaxXMargin);
objj_msgSend(_47,"addSubview:",_49);
objj_msgSend(_sizeCollectionView,"setContent:",["9","10","11","12","13","14","18","24","36","48","72","96"]);
y+=_48+_13;
var _4b=CGRectMake(0,_12+_11+_13,CGRectGetWidth(_46),CGRectGetHeight(objj_msgSend(_47,"bounds")));
var _4c=objj_msgSend(objj_msgSend(CPSplitView,"alloc"),"initWithFrame:",_4b);
objj_msgSend(_4c,"setAutoresizingMask:",CPViewWidthSizable|CPViewMaxYMargin);
objj_msgSend(_4c,"setVertical:",NO);
objj_msgSend(_4c,"addSubview:",_47);
_sampleView=objj_msgSend(objj_msgSend(_CPFontPanelSampleView,"alloc"),"initWithFrame:",CGRectMake(0,0,CGRectGetWidth(_46),0));
objj_msgSend(_sampleView,"setBackgroundColor:",objj_msgSend(CPColor,"whiteColor"));
objj_msgSend(_4c,"addSubview:",_sampleView);
objj_msgSend(_44,"addSubview:",_4c);
}
}),new objj_method(sel_getUid("orderFront:"),function(_4d,_4e,_4f){
with(_4d){
objj_msgSend(_4d,"_setupContents");
objj_msgSendSuper({receiver:_4d,super_class:objj_getClass("CPFontPanel").super_class},"orderFront:",_4f);
}
}),new objj_method(sel_getUid("reloadDefaultFontFamilies"),function(_50,_51){
with(_50){
_availableFonts=objj_msgSend(objj_msgSend(CPFontManager,"sharedFontManager"),"availableFonts");
objj_msgSend(_fontNameCollectionView,"setContent:",_availableFonts);
}
}),new objj_method(sel_getUid("worksWhenModal"),function(_52,_53){
with(_52){
return YES;
}
}),new objj_method(sel_getUid("panelConvertFont:"),function(_54,_55,_56){
with(_54){
var _57=_56,_58=0;
switch(_fontChanges){
case _19:
_58=objj_msgSend(objj_msgSend(_fontNameCollectionView,"selectionIndexes"),"firstIndex");
if(_58!=CPNotFound){
_57=objj_msgSend(CPFont,"fontWithDescriptor:size:",objj_msgSend(objj_msgSend(_56,"fontDescriptor"),"fontDescriptorByAddingAttributes:",objj_msgSend(CPDictionary,"dictionaryWithObject:forKey:",objj_msgSend(_availableFonts,"objectAtIndex:",_58),CPFontNameAttribute)),0);
}
break;
case _1a:
_58=objj_msgSend(objj_msgSend(_typefaceCollectionView,"selectionIndexes"),"firstIndex");
if(_58==_4){
_57=objj_msgSend(objj_msgSend(CPFontManager,"sharedFontManager"),"convertFont:toHaveTrait:",_56,CPBoldFontMask|CPItalicFontMask);
}else{
if(_58==_3){
_57=objj_msgSend(objj_msgSend(CPFontManager,"sharedFontManager"),"convertFont:toHaveTrait:",_56,CPBoldFontMask);
}else{
if(_58==_2){
_57=objj_msgSend(objj_msgSend(CPFontManager,"sharedFontManager"),"convertFont:toHaveTrait:",_56,CPItalicFontMask);
}else{
_57=objj_msgSend(objj_msgSend(CPFontManager,"sharedFontManager"),"convertFont:toNotHaveTrait:",_56,CPBoldFontMask|CPItalicFontMask);
}
}
}
break;
case _1b:
_57=objj_msgSend(objj_msgSend(CPFontManager,"sharedFontManager"),"convertFont:toSize:",_56,objj_msgSend(_sizeField,"floatValue"));
break;
case _18:
break;
default:
CPLog.trace("FIXME: -["+objj_msgSend(_54,"className")+" "+_55+"] unhandled _fontChanges: "+_fontChanges);
break;
}
return _57;
}
}),new objj_method(sel_getUid("setPanelFont:isMultiple:"),function(_59,_5a,_5b,_5c){
with(_59){
objj_msgSend(_59,"_setupContents");
var _5d=objj_msgSend(objj_msgSend(_fontNameCollectionView,"selectionIndexes"),"firstIndex");
if(_5d!=CPNotFound&&objj_msgSend(_availableFonts,"objectAtIndex:",_5d)!==objj_msgSend(_5b,"familyName")){
objj_msgSend(_fontNameCollectionView,"setSelectionIndexes:",objj_msgSend(CPIndexSet,"indexSetWithIndex:",objj_msgSend(_availableFonts,"indexOfObject:",objj_msgSend(_5b,"familyName"))));
}
if(objj_msgSend(_sizeField,"floatValue")!=objj_msgSend(_5b,"size")){
objj_msgSend(_sizeCollectionView,"setSelectionIndexes:",objj_msgSend(CPIndexSet,"indexSetWithIndex:",objj_msgSend(_59,"_sizeCollectionIndexWithSize:",objj_msgSend(_5b,"size"))));
objj_msgSend(_sizeField,"setIntValue:",objj_msgSend(_5b,"size"));
}
var _5e=_1,_5f=objj_msgSend(objj_msgSend(_5b,"fontDescriptor"),"symbolicTraits");
if((_5f&CPFontItalicTrait)&&(_5f&CPFontBoldTrait)){
_5e=_4;
}else{
if(_5f&CPFontItalicTrait){
_5e=_2;
}else{
if(_5f&CPFontBoldTrait){
_5e=_3;
}
}
}
_5d=objj_msgSend(objj_msgSend(_typefaceCollectionView,"selectionIndexes"),"firstIndex");
if(_5d!=CPNotFound&&_5d!=_5e){
objj_msgSend(_typefaceCollectionView,"setSelectionIndexes:",objj_msgSend(CPIndexSet,"indexSetWithIndex:",_5e));
}
objj_msgSend(_sampleView,"setAttributedString:",objj_msgSend(objj_msgSend(CPAttributedString,"alloc"),"initWithString:attributes:",objj_msgSend(_5b,"familyName"),objj_msgSend(CPDictionary,"dictionaryWithObjects:forKeys:",[_5b,objj_msgSend(CPColor,"blackColor")],[CPFontAttributeName,CPForegroundColorAttributeName])));
_fontChanges=_18;
}
}),new objj_method(sel_getUid("_sizeCollectionIndexWithSize:"),function(_60,_61,_62){
with(_60){
switch(_62){
case 9:
return _5;
case 10:
return _6;
case 11:
return _7;
case 12:
return _8;
case 13:
return _9;
case 14:
return _a;
case 18:
return _b;
case 24:
return _c;
case 36:
return _d;
case 48:
return _e;
case 72:
return _f;
case 96:
return _10;
}
return CPNotFound;
}
}),new objj_method(sel_getUid("_sizeFromSizeCollectionIndex:"),function(_63,_64,_65){
with(_63){
switch(_65){
case _5:
return 9;
case _6:
return 10;
case _7:
return 11;
case _8:
return 12;
case _9:
return 13;
case _a:
return 14;
case _b:
return 18;
case _c:
return 24;
case _d:
return 36;
case _e:
return 48;
case _f:
return 72;
case _10:
return 96;
}
return CPNotFound;
}
}),new objj_method(sel_getUid("collectionViewDidChangeSelection:"),function(_66,_67,_68){
with(_66){
var _69=objj_msgSend(objj_msgSend(_68,"selectionIndexes"),"firstIndex");
if(_68===_fontNameCollectionView){
_fontChanges=_19;
objj_msgSend(objj_msgSend(CPFontManager,"sharedFontManager"),"modifyFontViaPanel:",_66);
}else{
if(_68===_typefaceCollectionView){
_fontChanges=_1a;
objj_msgSend(objj_msgSend(CPFontManager,"sharedFontManager"),"modifyFontViaPanel:",_66);
}else{
if(_68===_sizeCollectionView){
var _6a=objj_msgSend(_66,"_sizeFromSizeCollectionIndex:",_69);
if(_6a!=CPNotFound){
objj_msgSend(_sizeField,"setIntValue:",_6a);
}
if(_fontChanges==_18){
_fontChanges=_1b;
objj_msgSend(objj_msgSend(CPFontManager,"sharedFontManager"),"modifyFontViaPanel:",_66);
}
}
}
}
}
}),new objj_method(sel_getUid("controlTextDidChange:"),function(_6b,_6c,_6d){
with(_6b){
_fontChanges=_1b;
objj_msgSend(_sizeCollectionView,"setSelectionIndexes:",objj_msgSend(CPIndexSet,"indexSetWithIndex:",objj_msgSend(_6b,"_sizeCollectionIndexWithSize:",objj_msgSend(_sizeField,"intValue"))));
objj_msgSend(objj_msgSend(CPFontManager,"sharedFontManager"),"modifyFontViaPanel:",_6b);
}
}),new objj_method(sel_getUid("orderFrontColorPanel:"),function(_6e,_6f,_70){
with(_6e){
_currentColorButtonTag=objj_msgSend(_70,"tag");
var _71=objj_msgSend(CPColorPanel,"sharedColorPanel");
objj_msgSend(_71,"setTarget:",_6e);
objj_msgSend(_71,"setAction:",sel_getUid("changeColor:"));
objj_msgSend(_71,"orderFront:",_6e);
}
}),new objj_method(sel_getUid("changeColor:"),function(_72,_73,_74){
with(_72){
if(_currentColorButtonTag==_16){
_textColor=objj_msgSend(_74,"color");
_fontChanges=_1c;
objj_msgSend(_textColorButton,"setBackgroundColor:",_textColor);
}else{
_backgroundColor=objj_msgSend(_74,"color");
_fontChanges=_1d;
objj_msgSend(_backgroundColorButton,"setBackgroundColor:",_backgroundColor);
}
objj_msgSend(objj_msgSend(CPFontManager,"sharedFontManager"),"modifyFontViaPanel:",_72);
}
})]);
class_addMethods(_22,[new objj_method(sel_getUid("sharedFontPanelExists"),function(_75,_76){
with(_75){
return _20!==nil;
}
}),new objj_method(sel_getUid("sharedFontPanel"),function(_77,_78){
with(_77){
if(!_20){
_20=objj_msgSend(objj_msgSend(CPFontPanel,"alloc"),"init");
}
return _20;
}
})]);
p;37;Frameworks/TextView/CPLayoutManager.jt;32453;@STATIC;1.0;i;15;CPTextStorage.ji;17;CPTextContainer.ji;14;CPTypesetter.jt;32372;
objj_executeFile("CPTextStorage.j",YES);
objj_executeFile("CPTextContainer.j",YES);
objj_executeFile("CPTypesetter.j",YES);
CGContextSetFont=function(_1,_2){
_1.font=objj_msgSend(_2,"cssString");
};
CGContextSelectFont=function(_3,_4,_5,_6){
_3.font=objj_msgSend(objj_msgSend(CPFont,"fontWithName:size:",_4,_5),"cssString");
};
CGContextShowTextAtPoint=function(_7,x,y,_8,_9){
_7.fillText(_8,x,y);
};
var _a=objj_getClass("CPArray");
if(!_a){
throw new SyntaxError("*** Could not find definition for class \"CPArray\"");
}
var _b=_a.isa;
class_addMethods(_a,[new objj_method(sel_getUid("indexOfObject:sortedByFunction:context:"),function(_c,_d,_e,_f,_10){
with(_c){
var _11=objj_msgSend(_c,"_indexOfObject:sortedByFunction:context:",_e,_f,_10);
return _11>=0?_11:CPNotFound;
}
}),new objj_method(sel_getUid("_indexOfObject:sortedByFunction:context:"),function(_12,_13,_14,_15,_16){
with(_12){
if(!_15){
return CPNotFound;
}
if(length===0){
return -1;
}
var mid,c,_17=0,_18=length-1;
while(_17<=_18){
mid=FLOOR((_17+_18)/2);
c=_15(_14,_12[mid],_16);
if(c>0){
_17=mid+1;
}else{
if(c<0){
_18=mid-1;
}else{
while(mid<length-1&&_15(_14,_12[mid+1],_16)==CPOrderedSame){
mid++;
}
return mid;
}
}
}
return -_17-1;
}
})]);
var _19=function(_1a,_1b){
if(CPLocationInRange(_1a,_1b._range)){
return CPOrderedSame;
}else{
if(CPMaxRange(_1b._range)<=_1a){
return CPOrderedDescending;
}else{
return CPOrderedAscending;
}
}
};
var _1c=function(_1d,_1e){
var _1f=objj_msgSend(_1d,"indexOfObject:sortedByFunction:context:",_1e,_19,nil);
if(_1f!=CPNotFound){
return _1d[_1f];
}
return nil;
};
var _20=function(_21,_22){
var _23=[],c=_21.length,_24=_22.location;
for(var i=0;i<c;i++){
if(CPLocationInRange(_24,_21[i]._range)){
_23.push(_21[i]);
if(CPMaxRange(_21[i]._range)<=CPMaxRange(_22)){
_24=CPMaxRange(_21[i]._range);
}else{
break;
}
}else{
if(CPLocationInRange(CPMaxRange(_22),_21[i]._range)){
_23.push(_21[i]);
break;
}else{
if(CPRangeInRange(_22,_21[i]._range)){
_23.push(_21[i]);
}
}
}
}
return _23;
};
var _a=objj_allocateClassPair(CPObject,"_CPLineFragment"),_b=_a.isa;
class_addIvars(_a,[new objj_ivar("_fragmentRect"),new objj_ivar("_usedRect"),new objj_ivar("_location"),new objj_ivar("_range"),new objj_ivar("_textContainer"),new objj_ivar("_isInvalid"),new objj_ivar("_runs"),new objj_ivar("_glyphsFrames")]);
objj_registerClassPair(_a);
class_addMethods(_a,[new objj_method(sel_getUid("boundingSizeForGlyph:andFont:"),function(_25,_26,_27,_28){
with(_25){
return objj_msgSend(_27,"sizeWithFont:",_28);
}
}),new objj_method(sel_getUid("advancementForGlyph:andFont:"),function(_29,_2a,_2b,_2c){
with(_29){
var r=objj_msgSend(_29,"boundingSizeForGlyph:andFont:",_2b,_2c);
return r.width;
}
}),new objj_method(sel_getUid("getAdvancements:forGlyphs:font:"),function(_2d,_2e,_2f,_30,_31){
with(_2d){
for(var i=0;i<_30.length;i++){
_2f.push(objj_msgSend(_2d,"advancementForGlyph:andFont:",objj_msgSend(_30,"substringWithRange:",CPMakeRange(i,1)),_31));
}
}
}),new objj_method(sel_getUid("initWithRange:textContainer:textStorage:"),function(_32,_33,_34,_35,_36){
with(_32){
_32=objj_msgSendSuper({receiver:_32,super_class:objj_getClass("_CPLineFragment").super_class},"init");
if(_32){
_fragmentRect=CPRectMakeZero();
_usedRect=CPRectMakeZero();
_location=CPPointMakeZero();
_range=CPCopyRange(_34);
_textContainer=_35;
_isInvalid=NO;
_runs=objj_msgSend(objj_msgSend(CPMutableArray,"alloc"),"init");
var _37=CPMakeRange(0,0),_38=_34.location;
do{
var _39=objj_msgSend(_36,"attributesAtIndex:effectiveRange:",_38,_37);
_37.length=Math.min(CPMaxRange(_37)-_37.location,CPMaxRange(_34)-_34.location);
_37.location=_38;
var run={_range:CPCopyRange(_37),string:objj_msgSend(_36._string,"substringWithRange:",_37)};
if(objj_msgSend(_39,"containsKey:",CPForegroundColorAttributeName)){
run.textColor=objj_msgSend(_39,"objectForKey:",CPForegroundColorAttributeName);
}else{
if(objj_msgSend(_36,"foregroundColor")){
run.textColor=objj_msgSend(_36,"foregroundColor");
}else{
run.textColor=objj_msgSend(CPColor,"blackColor");
}
}
if(objj_msgSend(_39,"containsKey:",CPFontAttributeName)){
run.font=objj_msgSend(_39,"objectForKey:",CPFontAttributeName);
}else{
if(objj_msgSend(_36,"font")){
run.font=objj_msgSend(_36,"font");
}else{
run.font=objj_msgSend(CPFont,"systemFontOfSize:",12);
}
}
if(objj_msgSend(_39,"containsKey:",CPBackgroundColorAttributeName)){
run.backgroundColor=objj_msgSend(_39,"objectForKey:",CPBackgroundColorAttributeName);
}else{
run.backgroundColor=objj_msgSend(CPColor,"clearColor");
}
if(objj_msgSend(_39,"containsKey:",CPUnderlineStyleAttributeName)){
run.underline=objj_msgSend(_39,"objectForKey:",CPUnderlineStyleAttributeName);
}else{
run.underline=nil;
}
run.advancements=[];
objj_msgSend(_32,"getAdvancements:forGlyphs:font:",run.advancements,run.string,run.font);
_runs.push(run);
_38=CPMaxRange(_37);
}while(_38<CPMaxRange(_34));
}
return _32;
}
}),new objj_method(sel_getUid("description"),function(_3a,_3b){
with(_3a){
return objj_msgSendSuper({receiver:_3a,super_class:objj_getClass("_CPLineFragment").super_class},"description")+"\n\t_fragmentRect="+CPStringFromRect(_fragmentRect)+"\n\t_usedRect="+CPStringFromRect(_usedRect)+"\n\t_location="+CPStringFromPoint(_location)+"\n\t_range="+CPStringFromRange(_range);
}
}),new objj_method(sel_getUid("glyphFrames"),function(_3c,_3d){
with(_3c){
if(!_glyphsFrames){
_glyphsFrames=[];
var _3e=_runs.length,_3f=CPPointMake(_fragmentRect.origin.x,_fragmentRect.origin.y);
for(var i=0;i<_3e;i++){
var run=_runs[i];
var j,c=run.string.length;
for(j=0;j<c;j++){
var _40=objj_msgSend(_3c,"boundingSizeForGlyph:andFont:",run.string.charAt(j),run.font);
_glyphsFrames.push(CPRectMake(_3f.x,_3f.y,_40.width,_usedRect.size.height));
_3f.x+=_40.width;
}
}
}
return _glyphsFrames;
}
}),new objj_method(sel_getUid("drawUnderlineForGlyphRange:underlineType:baselineOffset:containerOrigin:"),function(_41,_42,_43,_44,_45,_46){
with(_41){
var _47=_20(_runs,_43),i,j,_48=0,_49=CPPointMake(_location.x+_fragmentRect.origin.x+_46.x,_location.y+_fragmentRect.origin.y+_46.y+_45);
var _4a=objj_msgSend(_runs,"indexOfObject:sortedByFunction:context:",_47[0]._range.location,_19,nil);
if(_4a>0){
for(i=0;i<_4a;i++){
for(j=0;j<_runs[i].advancements.length;j++){
_49.x+=_runs[i].advancements[j].width;
}
}
}
var _4b=objj_msgSend(objj_msgSend(CPGraphicsContext,"currentContext"),"graphicsPort"),c=_47.length;
for(i=0;i<c;i++){
var run=_47[i];
if(_43.location<run._range.location){
_48=run._range.location;
}else{
_48=_43.location;
}
var _4c=_48-run._range.location,_4d=0;
for(j=0;j<_4c;j++){
_49.x+=run.advancements[j].width;
}
_4c+=Math.min(run._range.length,_43.length);
for(;j<_4c;j++){
_4d+=run.advancements[j].width;
}
var _4e=objj_msgSend(run.font,"underlinePosition");
CGContextSaveGState(_4b);
CGContextSetStrokeColor(_4b,run.textColor);
CGContextSetLineWidth(_4b,1);
CGContextMoveToPoint(_4b,_49.x,_49.y-_4e);
CGContextAddLineToPoint(_4b,_49.x+_4d,_49.y-_4e);
CGContextStrokePath(_4b);
CGContextRestoreGState(_4b);
}
}
}),new objj_method(sel_getUid("drawInContext:atPoint:forRange:"),function(_4f,_50,_51,_52,_53){
with(_4f){
var _54=_20(_runs,_53),c=_54.length,_55=0,_56=CPNotFound,_57=0,_58=CPPointMake(_location.x+_fragmentRect.origin.x,_location.y+_fragmentRect.origin.y);
_58.x+=_52.x;
_58.y+=_52.y;
for(var i=0;i<c;i++){
var run=_54[i];
var _59=Math.min(run._range.length,_53.length);
_55+=_59;
if(_53.location<run._range.location){
_57=run._range.location;
}else{
_57=_53.location;
}
if(_56==CPNotFound){
_56=_57;
}
var loc=_57-run._range.location,_5a=objj_msgSend(run.string,"substringWithRange:",CPMakeRange(loc,_59));
for(var j=0;j<loc;j++){
_58.x+=run.advancements[j].width;
}
CGContextSaveGState(_51);
CGContextSetFillColor(_51,run.textColor);
CGContextSetFont(_51,run.font);
CGContextShowTextAtPoint(_51,_58.x,_58.y,_5a,_5a.length);
CGContextRestoreGState(_51);
if(run.underline){
objj_msgSend(objj_msgSend(_textContainer,"layoutManager"),"underlineGlyphRange:underlineType:lineFragmentRect:lineFragmentGlyphRange:containerOrigin:",CPCopyRange(run._range),objj_msgSend(run.underline,"intValue"),_fragmentRect,_range,_52);
}
for(var j=loc;j<run.advancements.length;j++){
_58.x+=run.advancements[j].width;
}
}
_53.location=_56;
_53.length=_55;
}
}),new objj_method(sel_getUid("backgroundColorForGlyphAtIndex:"),function(_5b,_5c,_5d){
with(_5b){
var run=_1c(_runs,_5d);
if(run){
return run.backgroundColor;
}
return objj_msgSend(CPColor,"clearColor");
}
})]);
var _a=objj_allocateClassPair(CPObject,"_CPTemporaryAttributes"),_b=_a.isa;
class_addIvars(_a,[new objj_ivar("_attributes"),new objj_ivar("_range")]);
objj_registerClassPair(_a);
class_addMethods(_a,[new objj_method(sel_getUid("initWithRange:attributes:"),function(_5e,_5f,_60,_61){
with(_5e){
_5e=objj_msgSendSuper({receiver:_5e,super_class:objj_getClass("_CPTemporaryAttributes").super_class},"init");
if(_5e){
_attributes=_61;
_range=CPCopyRange(_60);
}
return _5e;
}
}),new objj_method(sel_getUid("description"),function(_62,_63){
with(_62){
return objj_msgSendSuper({receiver:_62,super_class:objj_getClass("_CPTemporaryAttributes").super_class},"description")+"\n\t_range="+CPStringFromRange(_range)+"\n\t_attributes="+objj_msgSend(_attributes,"description");
}
})]);
var _a=objj_allocateClassPair(CPObject,"CPLayoutManager"),_b=_a.isa;
class_addIvars(_a,[new objj_ivar("_textStorage"),new objj_ivar("_delegate"),new objj_ivar("_textContainers"),new objj_ivar("_typesetter"),new objj_ivar("_lineFragments"),new objj_ivar("_extraLineFragment"),new objj_ivar("_lineFragmentFactory"),new objj_ivar("_temporaryAttributes"),new objj_ivar("_isValidatingLayoutAndGlyphs"),new objj_ivar("_removeInvalidLineFragmentsRange")]);
objj_registerClassPair(_a);
class_addMethods(_a,[new objj_method(sel_getUid("init"),function(_64,_65){
with(_64){
_64=objj_msgSendSuper({receiver:_64,super_class:objj_getClass("CPLayoutManager").super_class},"init");
if(_64){
_textContainers=objj_msgSend(objj_msgSend(CPMutableArray,"alloc"),"init");
_lineFragments=objj_msgSend(objj_msgSend(CPMutableArray,"alloc"),"init");
_typesetter=objj_msgSend(CPTypesetter,"sharedSystemTypesetter");
_isValidatingLayoutAndGlyphs=NO;
_lineFragmentFactory=objj_msgSend(_CPLineFragment,"class");
}
return _64;
}
}),new objj_method(sel_getUid("setTextStorage:"),function(_66,_67,_68){
with(_66){
if(_textStorage===_68){
return;
}
_textStorage=_68;
}
}),new objj_method(sel_getUid("textStorage"),function(_69,_6a){
with(_69){
return _textStorage;
}
}),new objj_method(sel_getUid("insertTextContainer:atIndex:"),function(_6b,_6c,_6d,_6e){
with(_6b){
objj_msgSend(_textContainers,"insertObject:atIndex:",_6d,_6e);
objj_msgSend(_6d,"setLayoutManager:",_6b);
}
}),new objj_method(sel_getUid("addTextContainer:"),function(_6f,_70,_71){
with(_6f){
objj_msgSend(_textContainers,"addObject:",_71);
objj_msgSend(_71,"setLayoutManager:",_6f);
}
}),new objj_method(sel_getUid("removeTextContainerAtIndex:"),function(_72,_73,_74){
with(_72){
var _75=objj_msgSend(_textContainers,"objectAtIndex:",_74);
objj_msgSend(_75,"setLayoutManager:",nil);
objj_msgSend(_textContainers,"removeObjectAtIndex:",_74);
}
}),new objj_method(sel_getUid("textContainers"),function(_76,_77){
with(_76){
return _textContainers;
}
}),new objj_method(sel_getUid("numberOfGlyphs"),function(_78,_79){
with(_78){
return objj_msgSend(_textStorage,"length");
}
}),new objj_method(sel_getUid("firstTextView"),function(_7a,_7b){
with(_7a){
return objj_msgSend(_textContainers[0],"textView");
}
}),new objj_method(sel_getUid("textViewForBeginningOfSelection"),function(_7c,_7d){
with(_7c){
return objj_msgSend(objj_msgSend(_textContainers,"objectAtIndex:",0),"textView");
}
}),new objj_method(sel_getUid("layoutManagerOwnsFirstResponderInWindow:"),function(_7e,_7f,_80){
with(_7e){
var _81=objj_msgSend(_80,"firstResponder"),c=objj_msgSend(_textContainers,"count");
for(var i=0;i<c;i++){
if(objj_msgSend(_textContainers[i],"textView")===_81){
return YES;
}
}
return NO;
}
}),new objj_method(sel_getUid("boundingRectForGlyphRange:inTextContainer:"),function(_82,_83,_84,_85){
with(_82){
objj_msgSend(_82,"_validateLayoutAndGlyphs");
var _86=_20(_lineFragments,_84),_87=nil,c=objj_msgSend(_86,"count");
for(var i=0;i<c;i++){
var _88=_86[i];
if(_88._textContainer===_85){
var _89=objj_msgSend(_88,"glyphFrames");
for(var j=0;j<_89.length;j++){
if(CPLocationInRange(_88._range.location+j,_84)){
if(!_87){
_87=CPRectCreateCopy(_89[j]);
}else{
_87=CPRectUnion(_87,_89[j]);
}
}
}
}
}
return (_87)?_87:CPRectMakeZero();
}
}),new objj_method(sel_getUid("glyphRangeForTextContainer:"),function(_8a,_8b,_8c){
with(_8a){
objj_msgSend(_8a,"_validateLayoutAndGlyphs");
var _8d=nil,c=objj_msgSend(_lineFragments,"count");
for(var i=0;i<c;i++){
var _8e=_lineFragments[i];
if(_8e._textContainer===_8c){
if(!_8d){
_8d=CPCopyRange(_8e._range);
}else{
_8d=CPUnionRange(_8d,_8e._range);
}
}
}
return (_8d)?_8d:CPMakeRange(CPNotFound,0);
}
}),new objj_method(sel_getUid("_validateLayoutAndGlyphs0"),function(_8f,_90){
with(_8f){
if(_isValidatingLayoutAndGlyphs){
return;
}
_isValidatingLayoutAndGlyphs=YES;
objj_msgSend(_8f,"setExtraLineFragmentRect:usedRect:textContainer:",CPRectMake(0,0),CPRectMake(0,0),nil);
objj_msgSend(_typesetter,"layoutGlyphsInLayoutManager:startingAtGlyphIndex:maxNumberOfLineFragments:nextGlyphIndex:",_8f,0,-1,nil);
_isValidatingLayoutAndGlyphs=NO;
}
}),new objj_method(sel_getUid("_removeInvalidLineFragments"),function(_91,_92){
with(_91){
if(_removeInvalidLineFragmentsRange&&_removeInvalidLineFragmentsRange.length&&_lineFragments.length){
objj_msgSend(_lineFragments,"removeObjectsInRange:",_removeInvalidLineFragmentsRange);
}
}
}),new objj_method(sel_getUid("_validateLayoutAndGlyphs"),function(_93,_94){
with(_93){
if(_isValidatingLayoutAndGlyphs){
return;
}
_isValidatingLayoutAndGlyphs=YES;
var _95=CPNotFound,_96=CPMakeRange(0,0);
var l=_lineFragments.length;
if(l){
for(var i=0;i<l;i++){
if(_lineFragments[i]._isInvalid){
_95=_lineFragments[i]._range.location;
_96.location=i;
_96.length=l-i;
break;
}
}
if(_95==CPNotFound&&CPMaxRange(_lineFragments[l-1]._range)<objj_msgSend(_textStorage,"length")){
_95=CPMaxRange(_lineFragments[l-1]._range);
}
}else{
_95=0;
}
if(_95==CPNotFound){
_isValidatingLayoutAndGlyphs=NO;
return;
}
if(_96.length){
_removeInvalidLineFragmentsRange=CPCopyRange(_96);
}
if(!_95){
objj_msgSend(_93,"setExtraLineFragmentRect:usedRect:textContainer:",CPRectMake(0,0),CPRectMake(0,0),nil);
}
document.title=_95;
objj_msgSend(_typesetter,"layoutGlyphsInLayoutManager:startingAtGlyphIndex:maxNumberOfLineFragments:nextGlyphIndex:",_93,_95,-1,nil);
_isValidatingLayoutAndGlyphs=NO;
}
}),new objj_method(sel_getUid("invalidateDisplayForGlyphRange:"),function(_97,_98,_99){
with(_97){
var _9a=_20(_lineFragments,_99);
for(var i=0;i<_9a.length;i++){
objj_msgSend(objj_msgSend(_9a[i]._textContainer,"textView"),"setNeedsDisplayInRect:",_9a[i]._fragmentRect);
}
}
}),new objj_method(sel_getUid("invalidateLayoutForCharacterRange:isSoft:actualCharacterRange:"),function(_9b,_9c,_9d,_9e,_9f){
with(_9b){
var _a0=_lineFragments.length?objj_msgSend(_lineFragments,"indexOfObject:sortedByFunction:context:",_9d.location,_19,nil):CPNotFound;
if(_a0==CPNotFound){
if(_lineFragments.length){
_a0=_lineFragments.length-1;
}else{
if(_9f){
_9f.length=_9d.length;
_9f.location=0;
}
return;
}
}
var _a1=_lineFragments[_a0],_a2=CPCopyRange(_a1._range);
_a1._isInvalid=YES;
for(i=_a0+1;i<_lineFragments.length;i++){
_lineFragments[i]._isInvalid=YES;
_a2=CPUnionRange(_a2,_lineFragments[i]._range);
}
if(CPMaxRange(_a2)<CPMaxRange(_9d)){
_a2=CPUnionRange(_a2,_9d);
}
if(_9f){
_9f.length=_a2.length;
_9f.location=_a2.location;
}
}
}),new objj_method(sel_getUid("textStorage:edited:range:changeInLength:invalidatedRange:"),function(_a3,_a4,_a5,_a6,_a7,_a8,_a9){
with(_a3){
var _aa=CPMakeRange(CPNotFound,0);
objj_msgSend(_a3,"invalidateLayoutForCharacterRange:isSoft:actualCharacterRange:",_a9,NO,_aa);
objj_msgSend(_a3,"invalidateDisplayForGlyphRange:",_aa);
}
}),new objj_method(sel_getUid("glyphRangeForBoundingRect:inTextContainer:"),function(_ab,_ac,_ad,_ae){
with(_ab){
objj_msgSend(_ab,"_validateLayoutAndGlyphs");
var _af=nil,i,c=objj_msgSend(_lineFragments,"count");
for(i=0;i<c;i++){
var _b0=_lineFragments[i];
if(_b0._textContainer===_ae){
if(CPRectContainsRect(_ad,_b0._usedRect)){
if(!_af){
_af=CPCopyRange(_b0._range);
}else{
_af=CPUnionRange(_af,_b0._range);
}
}else{
var _b1=CPMakeRange(CPNotFound,0),_b2=objj_msgSend(_b0,"glyphFrames");
for(var j=0;j<_b2.length;j++){
if(CPRectIntersectsRect(_ad,_b2[j])){
if(_b1.location==CPNotFound){
_b1.location=_b0._range.location+j;
}else{
_b1.length++;
}
}
}
if(_b1.location!=CPNotFound){
if(!_af){
_af=CPCopyRange(_b1);
}else{
_af=CPUnionRange(_af,_b1);
}
}
}
}
}
return (_af)?_af:CPMakeRange(0,0);
}
}),new objj_method(sel_getUid("drawBackgroundForGlyphRange:atPoint:"),function(_b3,_b4,_b5,_b6){
with(_b3){
objj_msgSend(_b3,"_validateLayoutAndGlyphs");
var _b7=_20(_lineFragments,_b5);
if(!_b7.length){
return;
}
var ctx=objj_msgSend(objj_msgSend(CPGraphicsContext,"currentContext"),"graphicsPort"),_b8=0,_b9=0,_ba=_b7[_b9],_bb=objj_msgSend(_ba,"glyphFrames"),_bc=Math.min(_ba._range.length,_b5.length),_bd=CPMakeRange(0,0);
while(_b8!=_b5.length){
_bd.location=_b5.location+_b8;
_bd.length=_bc;
var _be=(_temporaryAttributes)?_20(_temporaryAttributes,_bd):nil;
CGContextSaveGState(ctx);
for(var i=0;i<_bc;i++){
var _bf=NO;
if(_be){
for(var j=0;j<_be.length;j++){
if(CPLocationInRange(_bd.location+i,_be[j]._range)){
if(objj_msgSend(_be[j]._attributes,"containsKey:",CPBackgroundColorAttributeName)){
CGContextSetFillColor(ctx,objj_msgSend(_be[j]._attributes,"objectForKey:",CPBackgroundColorAttributeName));
_bf=YES;
}
break;
}
}
}
if(!_bf){
CGContextSetFillColor(ctx,objj_msgSend(_ba,"backgroundColorForGlyphAtIndex:",i));
}
CGContextFillRect(ctx,CPRectMake(_b6.x+_bb[i].origin.x,_b6.y+_bb[i].origin.y,_bb[i].size.width,_bb[i].size.height));
}
CGContextRestoreGState(ctx);
_b8+=_bc;
_b9++;
if(_b9<_b7.length){
_ba=_b7[_b9];
_bb=objj_msgSend(_ba,"glyphFrames");
_bc=Math.min(_ba._range.length,_b5.length);
}else{
break;
}
}
}
}),new objj_method(sel_getUid("drawUnderlineForGlyphRange:underlineType:baselineOffset:lineFragmentRect:lineFragmentGlyphRange:containerOrigin:"),function(_c0,_c1,_c2,_c3,_c4,_c5,_c6,_c7){
with(_c0){
var _c8=_1c(_lineFragments,_c2.location);
if(_c8){
objj_msgSend(_c8,"drawUnderlineForGlyphRange:underlineType:baselineOffset:containerOrigin:",_c2,_c3,_c4,_c7);
}
}
}),new objj_method(sel_getUid("underlineGlyphRange:underlineType:lineFragmentRect:lineFragmentGlyphRange:containerOrigin:"),function(_c9,_ca,_cb,_cc,_cd,_ce,_cf){
with(_c9){
objj_msgSend(_c9,"drawUnderlineForGlyphRange:underlineType:baselineOffset:lineFragmentRect:lineFragmentGlyphRange:containerOrigin:",_cb,_cc,0,_cd,_ce,_cf);
}
}),new objj_method(sel_getUid("drawGlyphsForGlyphRange:atPoint:"),function(_d0,_d1,_d2,_d3){
with(_d0){
objj_msgSend(_d0,"_validateLayoutAndGlyphs");
var _d4=_20(_lineFragments,_d2);
if(!_d4.length){
return;
}
var ctx=objj_msgSend(objj_msgSend(CPGraphicsContext,"currentContext"),"graphicsPort"),_d5=CPCopyRange(_d2),_d6=0,_d7=_d4[_d6];
do{
_d5.length=_d2.length;
objj_msgSend(_d7,"drawInContext:atPoint:forRange:",ctx,_d3,_d5);
_d6++;
if(_d6<_d4.length){
_d7=_d4[_d6];
}else{
break;
}
}while(CPMaxRange(_d5)!=CPMaxRange(_d2));
}
}),new objj_method(sel_getUid("glyphIndexForPoint:inTextContainer:fractionOfDistanceThroughGlyph:"),function(_d8,_d9,_da,_db,_dc){
with(_d8){
objj_msgSend(_d8,"_validateLayoutAndGlyphs");
var c=objj_msgSend(_lineFragments,"count");
for(var i=0;i<c;i++){
var _dd=_lineFragments[i];
if(_dd._textContainer===_db){
var _de=objj_msgSend(_dd,"glyphFrames");
for(var j=0;j<_de.length;j++){
if(CPRectContainsPoint(_de[j],_da)){
if(_dc){
_dc[0]=(_da.x-_de[j].origin.x)/_de[j].size.width;
}
return _dd._range.location+j;
}
}
}
}
return CPNotFound;
}
}),new objj_method(sel_getUid("glyphIndexForPoint:inTextContainer:"),function(_df,_e0,_e1,_e2){
with(_df){
return objj_msgSend(_df,"glyphIndexForPoint:inTextContainer:fractionOfDistanceThroughGlyph:",_e1,_e2,nil);
}
}),new objj_method(sel_getUid("_setAttributes:toTemporaryAttributes:"),function(_e3,_e4,_e5,_e6){
with(_e3){
_e6._attributes=_e5;
}
}),new objj_method(sel_getUid("_addAttributes:toTemporaryAttributes:"),function(_e7,_e8,_e9,_ea){
with(_e7){
objj_msgSend(_ea._attributes,"addEntriesFromDictionary:",_e9);
}
}),new objj_method(sel_getUid("_handleTemporaryAttributes:forCharacterRange:withSelector:"),function(_eb,_ec,_ed,_ee,_ef){
with(_eb){
if(!_temporaryAttributes){
_temporaryAttributes=objj_msgSend(objj_msgSend(CPMutableArray,"alloc"),"init");
}
var _f0=_ee.location,_f1=0,_f2=nil;
do{
var _f3=objj_msgSend(_temporaryAttributes,"indexOfObject:sortedByFunction:context:",_f0,_19,nil);
if(_f3!=CPNotFound){
var _f4=_temporaryAttributes[_f3];
if(CPRangeInRange(_ee,_f4._range)){
objj_msgSend(_eb,"performSelector:withObject:withObject:",_ef,_ed,_f4);
_f2=(_f2)?CPUnionRange(_f2,_f4._range):CPCopyRange(_f4._range);
_f0+=_f4._range.length;
_f1+=_f4._range.length;
}else{
if(_f0==_f4._range.location&&CPMaxRange(_f4._range)>CPMaxRange(_ee)){
var _f5=CPMaxRange(_ee),_f6=objj_msgSend(objj_msgSend(_CPTemporaryAttributes,"alloc"),"initWithRange:attributes:",CPMakeRange(_f5,CPMaxRange(_f4._range)-_f5),objj_msgSend(_f4._attributes,"copy"));
if(objj_msgSend(_temporaryAttributes,"count")==_f3+1){
objj_msgSend(_temporaryAttributes,"addObject:",_f6);
}else{
objj_msgSend(_temporaryAttributes,"insertObject:atIndex:",_f6,_f3+1);
}
_f4._range=CPMakeRange(_f4._range.location,_f5-_f4._range.location);
objj_msgSend(_eb,"performSelector:withObject:withObject:",_ef,_ed,_f4);
_f0+=_f4._range.length;
_f1+=_f4._range.length;
_f2=(_f2)?CPUnionRange(_f2,_f4._range):CPCopyRange(_f4._range);
_f2=CPUnionRange(_f2,_f6._range);
}else{
var _f6=objj_msgSend(objj_msgSend(_CPTemporaryAttributes,"alloc"),"initWithRange:attributes:",CPMakeRange(_f0,CPMaxRange(_f4._range)-_f0),objj_msgSend(_f4._attributes,"copy"));
if(objj_msgSend(_temporaryAttributes,"count")==_f3+1){
objj_msgSend(_temporaryAttributes,"addObject:",_f6);
}else{
objj_msgSend(_temporaryAttributes,"insertObject:atIndex:",_f6,_f3+1);
}
_f4._range=CPMakeRange(_f4._range.location,_f0-_f4._range.location);
_f2=(_f2)?CPUnionRange(_f2,_f4._range):CPCopyRange(_f4._range);
_f2=CPUnionRange(_f2,_f6._range);
if(_f6._range.length<=_ee.length){
_f0+=_f6._range.length;
_f1+=_f6._range.length;
}else{
var _f7=_f0+_ee.length,_f8=objj_msgSend(objj_msgSend(_CPTemporaryAttributes,"alloc"),"initWithRange:attributes:",CPMakeRange(_f7,CPMaxRange(_f6._range)-_f7),objj_msgSend(_f4._attributes,"copy"));
_f6._range=CPMakeRange(_f6._range.location,_f7-_f6._range.location);
var _f9=objj_msgSend(_temporaryAttributes,"indexOfObject:",_f6);
if(objj_msgSend(_temporaryAttributes,"count")==_f9+1){
objj_msgSend(_temporaryAttributes,"addObject:",_f8);
}else{
objj_msgSend(_temporaryAttributes,"insertObject:atIndex:",_f8,_f9+1);
}
_f1=_ee.length;
}
objj_msgSend(_eb,"performSelector:withObject:withObject:",_ef,_ed,_f6);
}
}
}else{
objj_msgSend(_temporaryAttributes,"addObject:",objj_msgSend(objj_msgSend(_CPTemporaryAttributes,"alloc"),"initWithRange:attributes:",_ee,_ed));
_f2=CPCopyRange(_ee);
break;
}
}while(_f1!=_ee.length);
if(_f2){
objj_msgSend(_eb,"invalidateDisplayForGlyphRange:",_f2);
}
}
}),new objj_method(sel_getUid("setTemporaryAttributes:forCharacterRange:"),function(_fa,_fb,_fc,_fd){
with(_fa){
objj_msgSend(_fa,"_handleTemporaryAttributes:forCharacterRange:withSelector:",_fc,_fd,sel_getUid("_setAttributes:toTemporaryAttributes:"));
}
}),new objj_method(sel_getUid("addTemporaryAttributes:forCharacterRange:"),function(_fe,_ff,_100,_101){
with(_fe){
objj_msgSend(_fe,"_handleTemporaryAttributes:forCharacterRange:withSelector:",_100,_101,sel_getUid("_addAttributes:toTemporaryAttributes:"));
}
}),new objj_method(sel_getUid("removeTemporaryAttribute:forCharacterRange:"),function(self,_102,_103,_104){
with(self){
if(!_temporaryAttributes){
return;
}
var _105=_104.location,_106=0,_107=nil;
do{
var _108=objj_msgSend(_temporaryAttributes,"indexOfObject:sortedByFunction:context:",_105,_19,nil);
if(_108!=CPNotFound){
var _109=_temporaryAttributes[_108];
if(CPRangeInRange(_104,_109._range)){
_105+=_109._range.length;
_106+=_109._range.length;
_107=(_107)?CPUnionRange(_107,_109._range):CPCopyRange(_109._range);
objj_msgSend(_109._attributes,"removeObjectForKey:",_103);
if(objj_msgSend(objj_msgSend(_109._attributes,"allKeys"),"count")==0){
objj_msgSend(_temporaryAttributes,"removeObjectAtIndex:",_108);
}
}else{
if(_105==_109._range.location&&CPMaxRange(_109._range)>CPMaxRange(_104)){
var _10a=CPMaxRange(_104),_10b=objj_msgSend(objj_msgSend(_CPTemporaryAttributes,"alloc"),"initWithRange:attributes:",CPMakeRange(_10a,CPMaxRange(_109._range)-_10a),objj_msgSend(_109._attributes,"copy"));
if(objj_msgSend(_temporaryAttributes,"count")==_108+1){
objj_msgSend(_temporaryAttributes,"addObject:",_10b);
}else{
objj_msgSend(_temporaryAttributes,"insertObject:atIndex:",_10b,_108+1);
}
_109._range=CPMakeRange(_109._range.location,_10a-_109._range.location);
_105+=_109._range.length;
_106+=_109._range.length;
objj_msgSend(_109._attributes,"removeObjectForKey:",_103);
if(objj_msgSend(objj_msgSend(_109._attributes,"allKeys"),"count")==0){
objj_msgSend(_temporaryAttributes,"removeObjectAtIndex:",_108);
}
_107=(_107)?CPUnionRange(_107,_109._range):CPCopyRange(_109._range);
_107=CPUnionRange(_107,_10b._range);
}else{
var _10b=objj_msgSend(objj_msgSend(_CPTemporaryAttributes,"alloc"),"initWithRange:attributes:",CPMakeRange(_105,CPMaxRange(_109._range)-_105),objj_msgSend(_109._attributes,"copy"));
if(objj_msgSend(_temporaryAttributes,"count")==_108+1){
objj_msgSend(_temporaryAttributes,"addObject:",_10b);
}else{
objj_msgSend(_temporaryAttributes,"insertObject:atIndex:",_10b,_108+1);
}
_109._range=CPMakeRange(_109._range.location,_105-_109._range.location);
_107=(_107)?CPUnionRange(_107,_109._range):CPCopyRange(_109._range);
_107=CPUnionRange(_107,_10b._range);
if(_10b._range.length<_104.length){
_105+=_10b._range.length;
_106+=_10b._range.length;
}else{
var _10c=_105+_104.length,_10d=objj_msgSend(objj_msgSend(_CPTemporaryAttributes,"alloc"),"initWithRange:attributes:",CPMakeRange(_10c,CPMaxRange(_10b._range)-_10c),objj_msgSend(_109._attributes,"copy"));
_10b._range=CPMakeRange(_10b._range.location,_10c-_10b._range.location);
var _10e=objj_msgSend(_temporaryAttributes,"indexOfObject:",_10b);
if(objj_msgSend(_temporaryAttributes,"count")==_10e+1){
objj_msgSend(_temporaryAttributes,"addObject:",_10d);
}else{
objj_msgSend(_temporaryAttributes,"insertObject:atIndex:",_10d,_10e+1);
}
_106=_104.length;
}
objj_msgSend(_10b._attributes,"removeObjectForKey:",_103);
if(objj_msgSend(objj_msgSend(_10b._attributes,"allKeys"),"count")==0){
objj_msgSend(_temporaryAttributes,"removeObject:",_10b);
}
}
}
}else{
break;
}
}while(_106!=_104.length);
if(_107){
objj_msgSend(self,"invalidateDisplayForGlyphRange:",_107);
}
}
}),new objj_method(sel_getUid("temporaryAttributesAtCharacterIndex:effectiveRange:"),function(self,_10f,_110,_111){
with(self){
alert("came here to wild guess");
var _112=_1c(_runs,_110);
if(!_112){
return nil;
}
if(_111){
_111.location=_112._range.location;
_111.length=_112._range.length;
}
return _112._attributes;
}
}),new objj_method(sel_getUid("textContainerChangedTextView:"),function(self,_113,_114){
with(self){
}
}),new objj_method(sel_getUid("typesetter"),function(self,_115){
with(self){
return _typesetter;
}
}),new objj_method(sel_getUid("setTypesetter:"),function(self,_116,_117){
with(self){
_typesetter=_117;
}
}),new objj_method(sel_getUid("setTextContainer:forGlyphRange:"),function(self,_118,_119,_11a){
with(self){
var _11b=objj_msgSend(objj_msgSend(_lineFragmentFactory,"alloc"),"initWithRange:textContainer:textStorage:",_11a,_119,_textStorage);
_lineFragments.push(_11b);
}
}),new objj_method(sel_getUid("setLineFragmentRect:forGlyphRange:usedRect:"),function(self,_11c,_11d,_11e,_11f){
with(self){
var _120=_1c(_lineFragments,_11e.location);
if(_120){
_120._fragmentRect=CPRectCreateCopy(_11d);
_120._usedRect=CPRectCreateCopy(_11f);
}
}
}),new objj_method(sel_getUid("setLocation:forStartOfGlyphRange:"),function(self,_121,_122,_123){
with(self){
var _124=_1c(_lineFragments,_123.location);
if(_124){
_124._location=CPPointCreateCopy(_122);
}
}
}),new objj_method(sel_getUid("extraLineFragmentRect"),function(self,_125){
with(self){
if(_extraLineFragment){
return CPRectCreateCopy(_extraLineFragment._fragmentRect);
}
return CPRectMakeZero();
}
}),new objj_method(sel_getUid("extraLineFragmentTextContainer"),function(self,_126){
with(self){
if(_extraLineFragment){
return _extraLineFragment._textContainer;
}
return nil;
}
}),new objj_method(sel_getUid("extraLineFragmentUsedRect"),function(self,_127){
with(self){
if(_extraLineFragment){
return CPRectCreateCopy(_extraLineFragment._usedRect);
}
return CPRectMakeZero();
}
}),new objj_method(sel_getUid("setExtraLineFragmentRect:usedRect:textContainer:"),function(self,_128,rect,_129,_12a){
with(self){
if(_12a){
_extraLineFragment={};
_extraLineFragment._fragmentRect=CPRectCreateCopy(rect);
_extraLineFragment._usedRect=CPRectCreateCopy(_129);
_extraLineFragment._textContainer=_12a;
}else{
_extraLineFragment=nil;
}
}
}),new objj_method(sel_getUid("usedRectForTextContainer:"),function(self,_12b,_12c){
with(self){
var rect=nil;
for(var i=0;i<_lineFragments.length;i++){
if(_lineFragments[i]._textContainer===_12c){
if(rect){
rect=CPRectUnion(rect,_lineFragments[i]._usedRect);
}else{
rect=CPRectCreateCopy(_lineFragments[i]._usedRect);
}
}
}
return (rect)?rect:CPRectMakeZero();
}
}),new objj_method(sel_getUid("lineFragmentRectForGlyphAtIndex:effectiveRange:"),function(self,_12d,_12e,_12f){
with(self){
objj_msgSend(self,"_validateLayoutAndGlyphs");
var _130=_1c(_lineFragments,_12e);
if(!_130){
return CPRectMakeZero();
}
if(_12f){
_12f.location=_130._range.location;
_12f.length=_130._range.length;
}
return CPRectCreateCopy(_130._fragmentRect);
}
}),new objj_method(sel_getUid("lineFragmentUsedRectForGlyphAtIndex:effectiveRange:"),function(self,_131,_132,_133){
with(self){
objj_msgSend(self,"_validateLayoutAndGlyphs");
var _134=_1c(_lineFragments,_132);
if(!_134){
return CPRectMakeZero();
}
if(_133){
_133.location=_134._range.location;
_133.length=_134._range.length;
}
return CPRectCreateCopy(_134._usedRect);
}
}),new objj_method(sel_getUid("locationForGlyphAtIndex:"),function(self,_135,_136){
with(self){
objj_msgSend(self,"_validateLayoutAndGlyphs");
var _137=_1c(_lineFragments,_136);
if(_137){
if(_136==_137._range.location){
return CPPointCreateCopy(_137._location);
}
var _138=objj_msgSend(_137,"glyphFrames");
return CPPointCreateCopy(_138[_136-_137._range.location].origin);
}
return CPPointMakeZero();
}
}),new objj_method(sel_getUid("textContainerForGlyphAtIndex:effectiveRange:withoutAdditionalLayout:"),function(self,_139,_13a,_13b,flag){
with(self){
if(!flag){
objj_msgSend(self,"_validateLayoutAndGlyphs");
}
var _13c=_1c(_lineFragments,_13a);
if(_13c){
if(_13b){
_13b.location=_13c._range.location;
_13b.length=_13c._range.length;
}
return _13c._textContainer;
}
return nil;
}
}),new objj_method(sel_getUid("textContainerForGlyphAtIndex:effectiveRange:"),function(self,_13d,_13e,_13f){
with(self){
return objj_msgSend(self,"textContainerForGlyphAtIndex:effectiveRange:withoutAdditionalLayout:",_13e,_13f,NO);
}
}),new objj_method(sel_getUid("characterRangeForGlyphRange:actualGlyphRange:"),function(self,_140,_141,_142){
with(self){
return _141;
}
}),new objj_method(sel_getUid("characterIndexForGlyphAtIndex:"),function(self,_143,_144){
with(self){
return _144;
}
}),new objj_method(sel_getUid("setLineFragmentFactory:"),function(self,_145,_146){
with(self){
_lineFragmentFactory=_146;
}
}),new objj_method(sel_getUid("rectArrayForCharacterRange:withinSelectedCharacterRange:inTextContainer:rectCount:"),function(self,_147,_148,_149,_14a,_14b){
with(self){
objj_msgSend(self,"_validateLayoutAndGlyphs");
var _14c=objj_msgSend(CPArray,"array");
var _14d=_20(_lineFragments,_149);
if(!_14d.length){
return _14c;
}
for(var i=0;i<_14d.length;i++){
var _14e=_14d[i];
if(_14e._textContainer===_14a){
var _14f=objj_msgSend(_14e,"glyphFrames"),rect=nil;
for(var j=0;j<_14f.length;j++){
if(CPLocationInRange(_14e._range.location+j,_149)){
if(!rect){
rect=CPRectCreateCopy(_14f[j]);
}else{
rect=CPRectUnion(rect,_14f[j]);
}
}
}
if(rect){
_14c.push(rect);
}
}
}
return _14c;
}
})]);
p;40;Frameworks/TextView/CPSimpleTypesetter.jt;4715;@STATIC;1.0;i;14;CPTypesetter.ji;8;CPText.jt;4665;
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
p;28;Frameworks/TextView/CPText.jt;5379;@STATIC;1.0;I;15;AppKit/CPView.jt;5340;
objj_executeFile("AppKit/CPView.j",NO);
CPTextDidBeginEditingNotification="CPTextDidBeginEditingNotification";
CPTextDidChangeNotification="CPTextDidChangeNotification";
CPTextDidEndEditingNotification="CPTextDidEndEditingNotification";
CPParagraphSeparatorCharacter=8233;
CPLineSeparatorCharacter=8232;
CPTabCharacter=9;
CPFormFeedCharacter=12;
CPNewlineCharacter=10;
CPCarriageReturnCharacter=13;
CPEnterCharacter=3;
CPBackspaceCharacter=8;
CPBackTabCharacter=25;
CPDeleteCharacter=127;
var _1=objj_allocateClassPair(CPView,"CPText"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("changeFont:"),function(_3,_4,_5){
with(_3){
CPLog.error("-[CPText "+_4+"] subclass responsibility");
}
}),new objj_method(sel_getUid("copy:"),function(_6,_7,_8){
with(_6){
var _9=objj_msgSend(_6,"selectedRange");
if(_9.length<1){
return;
}
var _a=objj_msgSend(CPPasteboard,"generalPasteboard"),_b=objj_msgSend(_stringValue,"substringWithRange:",_9);
objj_msgSend(_a,"declareTypes:owner:",[CPStringPboardType],nil);
objj_msgSend(_a,"setString:forType:",_b,CPStringPboardType);
}
}),new objj_method(sel_getUid("copyFont:"),function(_c,_d,_e){
with(_c){
CPLog.error("-[CPText "+_d+"] subclass responsibility");
}
}),new objj_method(sel_getUid("cut:"),function(_f,_10,_11){
with(_f){
objj_msgSend(_f,"copy:",_11);
objj_msgSend(_f,"replaceCharactersInRange:withString:",objj_msgSend(_f,"selectedRange"),"");
}
}),new objj_method(sel_getUid("delete:"),function(_12,_13,_14){
with(_12){
CPLog.error("-[CPText "+_13+"] subclass responsibility");
}
}),new objj_method(sel_getUid("font:"),function(_15,_16,_17){
with(_15){
CPLog.error("-[CPText "+_16+"] subclass responsibility");
return nil;
}
}),new objj_method(sel_getUid("isHorizontallyResizable"),function(_18,_19){
with(_18){
CPLog.error("-[CPText "+_19+"] subclass responsibility");
return NO;
}
}),new objj_method(sel_getUid("isRichText"),function(_1a,_1b){
with(_1a){
CPLog.error("-[CPText "+_1b+"] subclass responsibility");
return NO;
}
}),new objj_method(sel_getUid("isRulerVisible"),function(_1c,_1d){
with(_1c){
CPLog.error("-[CPText "+_1d+"] subclass responsibility");
return NO;
}
}),new objj_method(sel_getUid("isVerticallyResizable"),function(_1e,_1f){
with(_1e){
CPLog.error("-[CPText "+_1f+"] subclass responsibility");
return NO;
}
}),new objj_method(sel_getUid("maxSize"),function(_20,_21){
with(_20){
CPLog.error("-[CPText "+_21+"] subclass responsibility");
return CPMakeSize(0,0);
}
}),new objj_method(sel_getUid("minSize"),function(_22,_23){
with(_22){
CPLog.error("-[CPText "+_23+"] subclass responsibility");
return CPMakeSize(0,0);
}
}),new objj_method(sel_getUid("paste:"),function(_24,_25,_26){
with(_24){
var _27=objj_msgSend(CPPasteboard,"generalPasteboard"),_28=objj_msgSend(_27,"stringForType:",CPStringPboardType);
if(_28){
objj_msgSend(_24,"replaceCharactersInRange:withString:",objj_msgSend(_24,"selectedRange"),_28);
}
}
}),new objj_method(sel_getUid("pasteFont:"),function(_29,_2a,_2b){
with(_29){
CPLog.error("-[CPText "+_2a+"] subclass responsibility");
}
}),new objj_method(sel_getUid("replaceCharactersInRange:withString:"),function(_2c,_2d,_2e,_2f){
with(_2c){
CPLog.error("-[CPText "+_2d+"] subclass responsibility");
}
}),new objj_method(sel_getUid("scrollRangeToVisible:"),function(_30,_31,_32){
with(_30){
CPLog.error("-[CPText "+_31+"] subclass responsibility");
}
}),new objj_method(sel_getUid("selectedAll:"),function(_33,_34,_35){
with(_33){
CPLog.error("-[CPText "+_34+"] subclass responsibility");
}
}),new objj_method(sel_getUid("selectedRange"),function(_36,_37){
with(_36){
CPLog.error("-[CPText "+_37+"] subclass responsibility");
return CPMakeRange(CPNotFound,0);
}
}),new objj_method(sel_getUid("setFont:"),function(_38,_39,_3a){
with(_38){
CPLog.error("-[CPText "+_39+"] subclass responsibility");
}
}),new objj_method(sel_getUid("setFont:rang:"),function(_3b,_3c,_3d,_3e){
with(_3b){
CPLog.error("-[CPText "+_3c+"] subclass responsibility");
}
}),new objj_method(sel_getUid("setHorizontallyResizable:"),function(_3f,_40,_41){
with(_3f){
CPLog.error("-[CPText "+_40+"] subclass responsibility");
}
}),new objj_method(sel_getUid("setMaxSize:"),function(_42,_43,_44){
with(_42){
CPLog.error("-[CPText "+_43+"] subclass responsibility");
}
}),new objj_method(sel_getUid("setMinSize:"),function(_45,_46,_47){
with(_45){
CPLog.error("-[CPText "+_46+"] subclass responsibility");
}
}),new objj_method(sel_getUid("setString:"),function(_48,_49,_4a){
with(_48){
objj_msgSend(_48,"replaceCharactersInRange:withString:",CPMakeRange(0,objj_msgSend(objj_msgSend(_48,"string"),"length")),_4a);
}
}),new objj_method(sel_getUid("setUsesFontPanel:"),function(_4b,_4c,_4d){
with(_4b){
CPLog.error("-[CPText "+_4c+"] subclass responsibility");
}
}),new objj_method(sel_getUid("setVerticallyResizable:"),function(_4e,_4f,_50){
with(_4e){
CPLog.error("-[CPText "+_4f+"] subclass responsibility");
}
}),new objj_method(sel_getUid("string"),function(_51,_52){
with(_51){
CPLog.error("-[CPText "+_52+"] subclass responsibility");
return nil;
}
}),new objj_method(sel_getUid("underline:"),function(_53,_54,_55){
with(_53){
CPLog.error("-[CPText "+_54+"] subclass responsibility");
}
}),new objj_method(sel_getUid("usesFontPanel"),function(_56,_57){
with(_56){
CPLog.error("-[CPText "+_57+"] subclass responsibility");
return NO;
}
})]);
p;37;Frameworks/TextView/CPTextContainer.jt;3243;@STATIC;1.0;i;17;CPLayoutManager.jt;3202;
objj_executeFile("CPLayoutManager.j",YES);
CPLineSweepLeft=0;
CPLineSweepRight=1;
CPLineSweepDown=2;
CPLineSweepUp=3;
CPLineDoesntMoves=0;
CPLineMovesLeft=1;
CPLineMovesRight=2;
CPLineMovesDown=3;
CPLineMovesUp=4;
var _1=objj_allocateClassPair(CPObject,"CPTextContainer"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_size"),new objj_ivar("_textView"),new objj_ivar("_layoutManager"),new objj_ivar("_lineFragmentPadding")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initWithContainerSize:"),function(_3,_4,_5){
with(_3){
_3=objj_msgSendSuper({receiver:_3,super_class:objj_getClass("CPTextContainer").super_class},"init");
if(_3){
_size=_5;
_lineFragmentPadding=0;
}
return _3;
}
}),new objj_method(sel_getUid("init"),function(_6,_7){
with(_6){
return objj_msgSend(_6,"initWithContainerSize:",CPMakeSize(10000000,10000000));
}
}),new objj_method(sel_getUid("containerSize"),function(_8,_9){
with(_8){
return _size;
}
}),new objj_method(sel_getUid("setContainerSize:"),function(_a,_b,_c){
with(_a){
var _d=_size;
_size=_c;
if(_d.width!=_size.width){
objj_msgSend(_layoutManager,"invalidateLayoutForCharacterRange:isSoft:actualCharacterRange:",CPMakeRange(0,objj_msgSend(objj_msgSend(_layoutManager,"textStorage"),"length")),NO,NULL);
}
}
}),new objj_method(sel_getUid("setWidthTracksTextView:"),function(_e,_f,_10){
with(_e){
}
}),new objj_method(sel_getUid("setTextView:"),function(_11,_12,_13){
with(_11){
if(_textView){
objj_msgSend(_11,"_removeAllLines");
objj_msgSend(_textView,"setTextContainer:",nil);
}
_textView=_13;
if(_textView!=nil){
objj_msgSend(_textView,"setTextContainer:",_11);
}
objj_msgSend(_layoutManager,"textContainerChangedTextView:",_11);
}
}),new objj_method(sel_getUid("textView"),function(_14,_15){
with(_14){
return _textView;
}
}),new objj_method(sel_getUid("setLayoutManager:"),function(_16,_17,_18){
with(_16){
if(_layoutManager===_18){
return;
}
_layoutManager=_18;
}
}),new objj_method(sel_getUid("layoutManager"),function(_19,_1a){
with(_19){
return _layoutManager;
}
}),new objj_method(sel_getUid("setLineFragmentPadding:"),function(_1b,_1c,_1d){
with(_1b){
_lineFragmentPadding=_1d;
}
}),new objj_method(sel_getUid("lineFragmentPadding"),function(_1e,_1f){
with(_1e){
return _lineFragmentPadding;
}
}),new objj_method(sel_getUid("containsPoint:"),function(_20,_21,_22){
with(_20){
return CPRectContainsPoint(CPRectMake(0,0,_size.width,_size.height),_22);
}
}),new objj_method(sel_getUid("isSimpleRectangularTextContainer"),function(_23,_24){
with(_23){
return YES;
}
}),new objj_method(sel_getUid("lineFragmentRectForProposedRect:sweepDirection:movementDirection:remainingRect:"),function(_25,_26,_27,_28,_29,_2a){
with(_25){
var _2b=CPRectCreateCopy(_27);
if(_28!=CPLineSweepRight||_29!=CPLineMovesDown){
CPLog.trace("FIXME: unsupported sweep ("+_28+") or movement ("+_29+")");
return CPRectMakeZero();
}
if(_2b.origin.x+_2b.size.width>_size.width){
_2b.size.width=_size.width-_2b.origin.x;
}
if(_2b.size.width<0){
_2b=CPRectMakeZero();
}
if(_2a){
_2a.origin.x=_2b.origin.x+_2b.size.width;
_2a.origin.y=_2b.origin.y;
_2a.size.height=_2b.size.height;
_2a.size.width=_size.width-(_2b.origin.x+_2b.size.width);
}
return _2b;
}
})]);
p;35;Frameworks/TextView/CPTextStorage.jt;7661;@STATIC;1.0;i;20;CPAttributedString.ji;17;CPLayoutManager.jt;7595;
objj_executeFile("CPAttributedString.j",YES);
objj_executeFile("CPLayoutManager.j",YES);
CPTextStorageEditedAttributes=1;
CPTextStorageEditedCharacters=2;
CPTextStorageWillProcessEditingNotification="CPTextStorageWillProcessEditingNotification";
CPTextStorageDidProcessEditingNotification="CPTextStorageDidProcessEditingNotification";
CPFontAttributeName="CPFontAttributeName";
CPForegroundColorAttributeName="CPForegroundColorAttributeName";
CPBackgroundColorAttributeName="CPBackgroundColorAttributeName";
CPShadowAttributeName="CPShadowAttributeName";
CPUnderlineStyleAttributeName="CPUnderlineStyleAttributeName";
var _1=objj_allocateClassPair(CPAttributedString,"CPTextStorage"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_layoutManagers"),new objj_ivar("_delegate"),new objj_ivar("_changeInLength"),new objj_ivar("_editedMask"),new objj_ivar("_editedRange"),new objj_ivar("_editCount"),new objj_ivar("_font"),new objj_ivar("_foregroundColor")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initWithString:attributes:"),function(_3,_4,_5,_6){
with(_3){
_3=objj_msgSendSuper({receiver:_3,super_class:objj_getClass("CPTextStorage").super_class},"initWithString:attributes:",_5,_6);
if(_3){
_layoutManagers=objj_msgSend(objj_msgSend(CPMutableArray,"alloc"),"init");
_editedRange=CPMakeRange(CPNotFound,0);
_changeInLength=0;
_editedMask=0;
}
return _3;
}
}),new objj_method(sel_getUid("initWithString:"),function(_7,_8,_9){
with(_7){
return objj_msgSend(_7,"initWithString:attributes:",_9,nil);
}
}),new objj_method(sel_getUid("init"),function(_a,_b){
with(_a){
return objj_msgSend(_a,"initWithString:attributes:","",nil);
}
}),new objj_method(sel_getUid("delegate"),function(_c,_d){
with(_c){
return _delegate;
}
}),new objj_method(sel_getUid("setDelegate:"),function(_e,_f,_10){
with(_e){
if(_delegate===_10){
return;
}
var _11=objj_msgSend(CPNotificationCenter,"defaultCenter");
if(_delegate&&_10===nil){
objj_msgSend(_11,"removeObserver:name:object:",_delegate,CPTextStorageWillProcessEditingNotification,_e);
objj_msgSend(_11,"removeObserver:name:object:",_delegate,CPTextStorageDidProcessEditingNotification,_e);
}
_delegate=_10;
if(_delegate){
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("textStorageWillProcessEditing:"))){
objj_msgSend(_11,"addObserver:selector:name:object:",_delegate,sel_getUid("textStorageWillProcessEditing:"),CPTextStorageWillProcessEditingNotification,_e);
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("textStorageDidProcessEditing:"))){
objj_msgSend(_11,"addObserver:selector:name:object:",_delegate,sel_getUid("textStorageDidProcessEditing:"),CPTextStorageDidProcessEditingNotification,_e);
}
}
}
}),new objj_method(sel_getUid("addLayoutManager:"),function(_12,_13,_14){
with(_12){
if(!objj_msgSend(_layoutManagers,"containsObject:",_14)){
objj_msgSend(_14,"setTextStorage:",_12);
objj_msgSend(_layoutManagers,"addObject:",_14);
}
}
}),new objj_method(sel_getUid("removeLayoutManager:"),function(_15,_16,_17){
with(_15){
if(objj_msgSend(_layoutManagers,"containsObject:",_17)){
objj_msgSend(_17,"setTextStorage:",nil);
objj_msgSend(_layoutManagers,"removeObject:",_17);
}
}
}),new objj_method(sel_getUid("layoutManagers"),function(_18,_19){
with(_18){
return _layoutManagers;
}
}),new objj_method(sel_getUid("editedRange"),function(_1a,_1b){
with(_1a){
return _editedRange;
}
}),new objj_method(sel_getUid("changeInLength"),function(_1c,_1d){
with(_1c){
return _changeInLength;
}
}),new objj_method(sel_getUid("editedMask"),function(_1e,_1f){
with(_1e){
return _editedMask;
}
}),new objj_method(sel_getUid("invalidateAttributesInRange:"),function(_20,_21,_22){
with(_20){
}
}),new objj_method(sel_getUid("processEditing"),function(_23,_24){
with(_23){
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:",CPTextStorageWillProcessEditingNotification,_23);
objj_msgSend(_23,"invalidateAttributesInRange:",objj_msgSend(_23,"editedRange"));
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:",CPTextStorageDidProcessEditingNotification,_23);
var c=objj_msgSend(_layoutManagers,"count");
for(var i=0;i<c;i++){
objj_msgSend(objj_msgSend(_layoutManagers,"objectAtIndex:",i),"textStorage:edited:range:changeInLength:invalidatedRange:",_23,_editedMask,_editedRange,_changeInLength,_editedRange);
}
_editedRange.location=CPNotFound;
_editedMask=0;
_changeInLength=0;
}
}),new objj_method(sel_getUid("beginEditing"),function(_25,_26){
with(_25){
if(_editCount==0){
_editedRange=CPMakeRange(CPNotFound,0);
}
_editCount++;
}
}),new objj_method(sel_getUid("endEditing"),function(_27,_28){
with(_27){
_editCount--;
if(_editCount==0){
objj_msgSend(_27,"processEditing");
}
}
}),new objj_method(sel_getUid("edited:range:changeInLength:"),function(_29,_2a,_2b,_2c,_2d){
with(_29){
if(_editCount==0){
_editedMask=_2b;
_changeInLength=_2d;
_2c.length+=_2d;
_editedRange=_2c;
objj_msgSend(_29,"processEditing");
}else{
_editedMask|=_2b;
_changeInLength+=_2d;
_2c.length+=_2d;
if(_editedRange.location==CPNotFound){
_editedRange=_2c;
}else{
_editedRange=CPUnionRange(_editedRange,_2c);
}
}
}
}),new objj_method(sel_getUid("removeAttribute:range:"),function(_2e,_2f,_30,_31){
with(_2e){
objj_msgSend(_2e,"beginEditing");
objj_msgSendSuper({receiver:_2e,super_class:objj_getClass("CPTextStorage").super_class},"removeAttribute:range:",_30,_31);
objj_msgSend(_2e,"edited:range:changeInLength:",CPTextStorageEditedAttributes,_31,0);
objj_msgSend(_2e,"endEditing");
}
}),new objj_method(sel_getUid("addAttributes:range:"),function(_32,_33,_34,_35){
with(_32){
objj_msgSend(_32,"beginEditing");
objj_msgSendSuper({receiver:_32,super_class:objj_getClass("CPTextStorage").super_class},"addAttributes:range:",_34,_35);
objj_msgSend(_32,"edited:range:changeInLength:",CPTextStorageEditedAttributes,_35,0);
objj_msgSend(_32,"endEditing");
}
}),new objj_method(sel_getUid("deleteCharactersInRange:"),function(_36,_37,_38){
with(_36){
objj_msgSend(_36,"beginEditing");
objj_msgSendSuper({receiver:_36,super_class:objj_getClass("CPTextStorage").super_class},"deleteCharactersInRange:",_38);
objj_msgSend(_36,"edited:range:changeInLength:",CPTextStorageEditedCharacters,_38,-_38.length);
objj_msgSend(_36,"endEditing");
}
}),new objj_method(sel_getUid("replaceCharactersInRange:withString:"),function(_39,_3a,_3b,_3c){
with(_39){
objj_msgSend(_39,"beginEditing");
objj_msgSendSuper({receiver:_39,super_class:objj_getClass("CPTextStorage").super_class},"replaceCharactersInRange:withString:",_3b,_3c);
objj_msgSend(_39,"edited:range:changeInLength:",CPTextStorageEditedCharacters,_3b,(objj_msgSend(_3c,"length")-_3b.length));
objj_msgSend(_39,"endEditing");
}
}),new objj_method(sel_getUid("replaceCharactersInRange:withAttributedString:"),function(_3d,_3e,_3f,_40){
with(_3d){
objj_msgSend(_3d,"beginEditing");
objj_msgSendSuper({receiver:_3d,super_class:objj_getClass("CPTextStorage").super_class},"replaceCharactersInRange:withAttributedString:",_3f,_40);
objj_msgSend(_3d,"edited:range:changeInLength:",(CPTextStorageEditedAttributes|CPTextStorageEditedCharacters),_3f,(objj_msgSend(_40,"length")-_3f.length));
objj_msgSend(_3d,"endEditing");
}
}),new objj_method(sel_getUid("setFont:"),function(_41,_42,_43){
with(_41){
_font=_43;
}
}),new objj_method(sel_getUid("font"),function(_44,_45){
with(_44){
return _font;
}
}),new objj_method(sel_getUid("setForegroundColor:"),function(_46,_47,_48){
with(_46){
_foregroundColor=_48;
}
}),new objj_method(sel_getUid("foregroundColor"),function(_49,_4a){
with(_49){
return _foregroundColor;
}
})]);
p;32;Frameworks/TextView/CPTextView.jt;30970;@STATIC;1.0;i;8;CPText.ji;15;CPTextStorage.ji;17;CPTextContainer.ji;17;CPLayoutManager.ji;15;CPFontManager.jt;30854;
objj_executeFile("CPText.j",YES);
objj_executeFile("CPTextStorage.j",YES);
objj_executeFile("CPTextContainer.j",YES);
objj_executeFile("CPLayoutManager.j",YES);
objj_executeFile("CPFontManager.j",YES);
MakeRangeFromAbs=function(a1,a2){
if(a1<a2){
return CPMakeRange(a1,a2-a1);
}else{
return CPMakeRange(a2,a1-a2);
}
};
var _1=objj_getClass("CPColor");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"CPColor\"");
}
var _2=_1.isa;
class_addMethods(_2,[new objj_method(sel_getUid("selectedTextBackgroundColor"),function(_3,_4){
with(_3){
return objj_msgSend(objj_msgSend(CPColor,"alloc"),"_initWithRGBA:",[0.38,0.85,1,1]);
}
})]);
CPTextViewDidChangeSelectionNotification="CPTextViewDidChangeSelectionNotification";
CPTextViewDidChangeTypingAttributesNotification="CPTextViewDidChangeTypingAttributesNotification";
CPSelectByCharacter=0;
CPSelectByWord=1;
CPSelectByParagraph=2;
var _5=1,_6=2,_7=4,_8=8,_9=16;
var _1=objj_allocateClassPair(CPText,"CPTextView"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_textStorage"),new objj_ivar("_textContainer"),new objj_ivar("_layoutManager"),new objj_ivar("_delegate"),new objj_ivar("_delegateRespondsToSelectorMask"),new objj_ivar("_textContainerInset"),new objj_ivar("_textContainerOrigin"),new objj_ivar("_startTrackingLocation"),new objj_ivar("_selectionRange"),new objj_ivar("_selectedTextAttributes"),new objj_ivar("_selectionGranularity"),new objj_ivar("_insertionPointColor"),new objj_ivar("_typingAttributes"),new objj_ivar("_isFirstResponder"),new objj_ivar("_isEditable"),new objj_ivar("_isSelectable"),new objj_ivar("_drawCarret"),new objj_ivar("_carretTimer"),new objj_ivar("_carretRect"),new objj_ivar("_font"),new objj_ivar("_textColor"),new objj_ivar("_minSize"),new objj_ivar("_maxSize"),new objj_ivar("_scrollingDownward"),new objj_ivar("_isRichText"),new objj_ivar("_usesFontPanel"),new objj_ivar("_allowsUndo"),new objj_ivar("_isHorizontallyResizable"),new objj_ivar("_isVerticallyResizable")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initWithFrame:textContainer:"),function(_a,_b,_c,_d){
with(_a){
_a=objj_msgSendSuper({receiver:_a,super_class:objj_getClass("CPTextView").super_class},"initWithFrame:",_c);
if(_a){
_textContainerInset=CPSizeMake(2,0);
_textContainerOrigin=CPPointMake(_bounds.origin.x,_bounds.origin.y);
objj_msgSend(_d,"setTextView:",_a);
_isEditable=YES;
_isSelectable=YES;
_isFirstResponder=NO;
_delegate=nil;
_delegateRespondsToSelectorMask=0;
_selectionRange=CPMakeRange(0,0);
_selectionGranularity=CPSelectByCharacter;
_selectedTextAttributes=objj_msgSend(CPDictionary,"dictionaryWithObject:forKey:",objj_msgSend(CPColor,"selectedTextBackgroundColor"),CPBackgroundColorAttributeName);
_insertionPointColor=objj_msgSend(CPColor,"blackColor");
_textColor=objj_msgSend(CPColor,"blackColor");
_font=objj_msgSend(CPFont,"fontWithName:size:","Helvetica",12);
_typingAttributes=objj_msgSend(objj_msgSend(CPDictionary,"alloc"),"initWithObjects:forKeys:",[_font,_textColor],[CPFontAttributeName,CPForegroundColorAttributeName]);
_minSize=CPSizeCreateCopy(_c.size);
_maxSize=CPSizeMake(_c.size.width,10000000);
_isRichText=YES;
_usesFontPanel=YES;
_allowsUndo=NO;
_isVerticallyResizable=YES;
_isHorizontallyResizable=NO;
_carretRect=CPRectMake(0,0,1,12);
}
return _a;
}
}),new objj_method(sel_getUid("initWithFrame:"),function(_e,_f,_10){
with(_e){
var _11=objj_msgSend(objj_msgSend(CPLayoutManager,"alloc"),"init"),_12=objj_msgSend(objj_msgSend(CPTextStorage,"alloc"),"init"),_13=objj_msgSend(objj_msgSend(CPTextContainer,"alloc"),"initWithContainerSize:",CPSizeMake(_10.size.width,10000000));
objj_msgSend(_12,"addLayoutManager:",_11);
objj_msgSend(_11,"addTextContainer:",_13);
return objj_msgSend(_e,"initWithFrame:textContainer:",_10,_13);
}
}),new objj_method(sel_getUid("setDelegate:"),function(_14,_15,_16){
with(_14){
_delegateRespondsToSelectorMask=0;
if(_delegate){
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"removeObserver:name:object:",_delegate,nil,_14);
}
_delegate=_16;
if(_delegate){
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("textDidChange:"))){
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"addObserver:selector:name:object:",_delegate,sel_getUid("textDidChange:"),CPTextDidChangeNotification,_14);
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("textViewDidChangeSelection:"))){
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"addObserver:selector:name:object:",_delegate,sel_getUid("textViewDidChangeSelection:"),CPTextViewDidChangeSelectionNotification,_14);
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("textViewDidChangeTypingAttributes:"))){
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"addObserver:selector:name:object:",_delegate,sel_getUid("textViewDidChangeTypingAttributes:"),CPTextViewDidChangeTypingAttributesNotification,_14);
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("textView:doCommandBySelector:"))){
_delegateRespondsToSelectorMask|=_6;
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("textShouldBeginEditing:"))){
_delegateRespondsToSelectorMask|=_5;
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("textView:willChangeSelectionFromCharacterRange:toCharacterRange:"))){
_delegateRespondsToSelectorMask|=_7;
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("textView:shouldChangeTextInRange:replacementString:"))){
_delegateRespondsToSelectorMask|=_8;
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("textView:shouldChangeTypingAttributes:toAttributes:"))){
_delegateRespondsToSelectorMask|=_9;
}
}
}
}),new objj_method(sel_getUid("string"),function(_17,_18){
with(_17){
return objj_msgSend(_textStorage,"string");
}
}),new objj_method(sel_getUid("setString:"),function(_19,_1a,_1b){
with(_19){
objj_msgSend(_textStorage,"replaceCharactersInRange:withString:",CPMakeRange(0,objj_msgSend(objj_msgSend(_19,"string"),"length")),_1b);
objj_msgSend(_19,"didChangeText");
objj_msgSend(_19,"sizeToFit");
objj_msgSend(_19,"scrollRangeToVisible:",_selectionRange);
}
}),new objj_method(sel_getUid("setTextContainer:"),function(_1c,_1d,_1e){
with(_1c){
_textContainer=_1e;
_layoutManager=objj_msgSend(_textContainer,"layoutManager");
_textStorage=objj_msgSend(_layoutManager,"textStorage");
objj_msgSend(_textStorage,"setFont:",_font);
objj_msgSend(_textStorage,"setForegroundColor:",_textColor);
objj_msgSend(_1c,"invalidateTextContainerOrigin");
}
}),new objj_method(sel_getUid("textStorage"),function(_1f,_20){
with(_1f){
return _textStorage;
}
}),new objj_method(sel_getUid("textContainer"),function(_21,_22){
with(_21){
return _textContainer;
}
}),new objj_method(sel_getUid("layoutManager"),function(_23,_24){
with(_23){
return _layoutManager;
}
}),new objj_method(sel_getUid("setTextContainerInset:"),function(_25,_26,_27){
with(_25){
_textContainerInset=_27;
objj_msgSend(_25,"invalidateTextContainerOrigin");
}
}),new objj_method(sel_getUid("textContainerInset"),function(_28,_29){
with(_28){
return _textContainerInset;
}
}),new objj_method(sel_getUid("textContainerOrigin"),function(_2a,_2b){
with(_2a){
return _textContainerOrigin;
}
}),new objj_method(sel_getUid("invalidateTextContainerOrigin"),function(_2c,_2d){
with(_2c){
_textContainerOrigin.x=_bounds.origin.x;
_textContainerOrigin.x+=_textContainerInset.width;
_textContainerOrigin.y=_bounds.origin.y;
_textContainerOrigin.y+=_textContainerInset.height;
}
}),new objj_method(sel_getUid("isEditable"),function(_2e,_2f){
with(_2e){
return _isEditable;
}
}),new objj_method(sel_getUid("setEditable:"),function(_30,_31,_32){
with(_30){
_isEditable=_32;
if(_32){
_isSelectable=_32;
}
}
}),new objj_method(sel_getUid("isSelectable"),function(_33,_34){
with(_33){
return _isSelectable;
}
}),new objj_method(sel_getUid("setSelectable:"),function(_35,_36,_37){
with(_35){
_isSelectable=_37;
if(_37){
_isEditable=_37;
}
}
}),new objj_method(sel_getUid("doCommandBySelector:"),function(_38,_39,_3a){
with(_38){
var _3b=NO;
if(_delegateRespondsToSelectorMask&_6){
_3b=objj_msgSend(_delegate,"textView:doCommandBySelector:",_38,_3a);
}
if(!_3b){
objj_msgSendSuper({receiver:_38,super_class:objj_getClass("CPTextView").super_class},"doCommandBySelector:",_3a);
}
}
}),new objj_method(sel_getUid("didChangeText"),function(_3c,_3d){
with(_3c){
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:",CPTextDidChangeNotification,_3c);
}
}),new objj_method(sel_getUid("shouldChangeTextInRange:replacementString:"),function(_3e,_3f,_40,_41){
with(_3e){
if(!_isEditable){
return NO;
}
var _42=YES;
if(_delegateRespondsToSelectorMask&_5){
_42=objj_msgSend(_delegate,"textShouldBeginEditing:",_3e);
}
if(_42&&(_delegateRespondsToSelectorMask&_8)){
_42=objj_msgSend(_delegate,"textView:shouldChangeTextInRange:replacementString:",_3e,_40,_41);
}
return _42;
}
}),new objj_method(sel_getUid("insertText:"),function(_43,_44,_45){
with(_43){
var _46=objj_msgSend(_45,"isKindOfClass:",CPAttributedString),_47=(_46)?objj_msgSend(_45,"string"):_45;
if(!objj_msgSend(_43,"shouldChangeTextInRange:replacementString:",CPCopyRange(_selectionRange),_47)){
return;
}
if(_46){
objj_msgSend(_textStorage,"replaceCharactersInRange:withAttributedString:",CPCopyRange(_selectionRange),_45);
}else{
objj_msgSend(_textStorage,"replaceCharactersInRange:withString:",CPCopyRange(_selectionRange),_45);
}
objj_msgSend(_43,"setSelectedRange:",CPMakeRange(_selectionRange.location+objj_msgSend(_47,"length"),0));
objj_msgSend(_43,"didChangeText");
objj_msgSend(_43,"sizeToFit");
objj_msgSend(_43,"scrollRangeToVisible:",_selectionRange);
}
}),new objj_method(sel_getUid("_blinkCarret:"),function(_48,_49,_4a){
with(_48){
_drawCarret=!_drawCarret;
objj_msgSend(_48,"setNeedsDisplayInRect:",_carretRect);
}
}),new objj_method(sel_getUid("drawRect:"),function(_4b,_4c,_4d){
with(_4b){
var ctx=objj_msgSend(objj_msgSend(CPGraphicsContext,"currentContext"),"graphicsPort");
CGContextClearRect(ctx,_4d);
var _4e=objj_msgSend(_layoutManager,"glyphRangeForBoundingRect:inTextContainer:",_4d,_textContainer);
if(_4e.length){
objj_msgSend(_layoutManager,"drawBackgroundForGlyphRange:atPoint:",_4e,_textContainerOrigin);
}
if(_selectionRange.length){
var _4f=objj_msgSend(_layoutManager,"rectArrayForCharacterRange:withinSelectedCharacterRange:inTextContainer:rectCount:",_selectionRange,_selectionRange,_textContainer,nil);
CGContextSaveGState(ctx);
CGContextSetFillColor(ctx,objj_msgSend(_selectedTextAttributes,"objectForKey:",CPBackgroundColorAttributeName));
for(var i=0;i<_4f.length;i++){
_4f[i].origin.x+=_textContainerOrigin.x;
_4f[i].origin.y+=_textContainerOrigin.y;
CGContextFillRect(ctx,_4f[i]);
}
CGContextRestoreGState(ctx);
}
if(_4e.length){
objj_msgSend(_layoutManager,"drawGlyphsForGlyphRange:atPoint:",_4e,_textContainerOrigin);
}
if(objj_msgSend(_4b,"shouldDrawInsertionPoint")){
objj_msgSend(_4b,"updateInsertionPointStateAndRestartTimer:",NO);
objj_msgSend(_4b,"drawInsertionPointInRect:color:turnedOn:",_carretRect,_insertionPointColor,_drawCarret);
}
}
}),new objj_method(sel_getUid("setSelectedRange:"),function(_50,_51,_52){
with(_50){
objj_msgSend(_50,"setSelectedRange:affinity:stillSelecting:",_52,0,NO);
}
}),new objj_method(sel_getUid("setSelectedRange:affinity:stillSelecting:"),function(_53,_54,_55,_56,_57){
with(_53){
if(!_57&&(_delegateRespondsToSelectorMask&_7)){
_selectionRange=objj_msgSend(_delegate,"textView:willChangeSelectionFromCharacterRange:toCharacterRange:",_53,_selectionRange,_55);
}else{
_selectionRange=CPCopyRange(_55);
_selectionRange=objj_msgSend(_53,"selectionRangeForProposedRange:granularity:",_selectionRange,objj_msgSend(_53,"selectionGranularity"));
}
if(_selectionRange.length){
objj_msgSend(_layoutManager,"invalidateDisplayForGlyphRange:",_selectionRange);
}else{
objj_msgSend(_53,"setNeedsDisplay:",YES);
}
if(!_57){
if(_isFirstResponder){
objj_msgSend(_53,"updateInsertionPointStateAndRestartTimer:",((_selectionRange.length===0)&&!objj_msgSend(_carretTimer,"isValid")));
}
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:",CPTextViewDidChangeSelectionNotification,_53);
var _58=objj_msgSend(_textStorage,"attributesAtIndex:effectiveRange:",_selectionRange.location,nil);
objj_msgSend(_53,"setTypingAttributes:",_58);
if(_usesFontPanel){
var _59=objj_msgSend(_58,"objectForKey:",CPFontAttributeName);
objj_msgSend(objj_msgSend(CPFontManager,"sharedFontManager"),"setSelectedFont:isMultiple:",(_59)?_59:objj_msgSend(_53,"font"),NO);
}
}
}
}),new objj_method(sel_getUid("selectedRanges"),function(_5a,_5b){
with(_5a){
return [_selectionRange];
}
}),new objj_method(sel_getUid("keyDown:"),function(_5c,_5d,_5e){
with(_5c){
objj_msgSend(_5c,"interpretKeyEvents:",[_5e]);
}
}),new objj_method(sel_getUid("mouseDown:"),function(_5f,_60,_61){
with(_5f){
var _62=[],_63=objj_msgSend(_5f,"convertPoint:fromView:",objj_msgSend(_61,"locationInWindow"),nil);
objj_msgSend(_carretTimer,"invalidate");
_carretTimer=nil;
_63.x-=_textContainerOrigin.x;
_63.y-=_textContainerOrigin.y;
_startTrackingLocation=objj_msgSend(_layoutManager,"glyphIndexForPoint:inTextContainer:fractionOfDistanceThroughGlyph:",_63,_textContainer,_62);
if(_startTrackingLocation==CPNotFound){
_startTrackingLocation=objj_msgSend(_textStorage,"length");
}
var _64=[-1,CPSelectByCharacter,CPSelectByWord,CPSelectByParagraph];
objj_msgSend(_5f,"setSelectionGranularity:",_64[objj_msgSend(_61,"clickCount")]);
objj_msgSend(_5f,"setSelectedRange:affinity:stillSelecting:",CPMakeRange(_startTrackingLocation,0),0,YES);
}
}),new objj_method(sel_getUid("_clearRange:"),function(_65,_66,_67){
with(_65){
var _68=objj_msgSend(_layoutManager,"rectArrayForCharacterRange:withinSelectedCharacterRange:inTextContainer:rectCount:",nil,_67,_textContainer,nil);
var l=_68.length;
for(var i=0;i<l;i++){
_68[i].origin.x+=_textContainerOrigin.x;
_68[i].origin.y+=_textContainerOrigin.y;
objj_msgSend(_65,"setNeedsDisplayInRect:",_68[i]);
}
}
}),new objj_method(sel_getUid("mouseDragged:"),function(_69,_6a,_6b){
with(_69){
var _6c=[],_6d=objj_msgSend(_69,"convertPoint:fromView:",objj_msgSend(_6b,"locationInWindow"),nil);
_6d.x-=_textContainerOrigin.x;
_6d.y-=_textContainerOrigin.y;
var _6e=objj_msgSend(_69,"selectedRange");
var _6f=objj_msgSend(_layoutManager,"glyphIndexForPoint:inTextContainer:fractionOfDistanceThroughGlyph:",_6d,_textContainer,_6c);
if(_6f==CPNotFound){
_6f=_scrollingDownward?CPMaxRange(_6e):_6e.location;
}
if(_6f>_6e.location){
objj_msgSend(_69,"_clearRange:",MakeRangeFromAbs(_6e.location,_6f));
_scrollingDownward=YES;
}
if(_6f<CPMaxRange(_6e)){
objj_msgSend(_69,"_clearRange:",MakeRangeFromAbs(_6f,CPMaxRange(_6e)));
_scrollingDownward=NO;
}
if(_6f<_startTrackingLocation){
objj_msgSend(_69,"setSelectedRange:affinity:stillSelecting:",CPMakeRange(_6f,_startTrackingLocation-_6f),0,YES);
}else{
objj_msgSend(_69,"setSelectedRange:affinity:stillSelecting:",CPMakeRange(_startTrackingLocation,_6f-_startTrackingLocation),0,YES);
}
objj_msgSend(_69,"scrollRangeToVisible:",CPMakeRange(_6f,0));
}
}),new objj_method(sel_getUid("mouseUp:"),function(_70,_71,_72){
with(_70){
objj_msgSend(_70,"setSelectedRange:affinity:stillSelecting:",objj_msgSend(_70,"selectedRange"),0,NO);
}
}),new objj_method(sel_getUid("moveDown:"),function(_73,_74,_75){
with(_73){
if(_isSelectable){
var _76=[];
var _77=CPMaxRange(objj_msgSend(_73,"selectedRange"));
var _78=objj_msgSend(_layoutManager,"locationForGlyphAtIndex:",_77);
var _79=objj_msgSend(_layoutManager,"lineFragmentRectForGlyphAtIndex:effectiveRange:",_77,NULL);
_78.y+=2+_79.size.height;
_78.x+=2;
var _7a=objj_msgSend(_layoutManager,"glyphIndexForPoint:inTextContainer:fractionOfDistanceThroughGlyph:",_78,_textContainer,_76);
objj_msgSend(_73,"setSelectedRange:",CPMakeRange(_7a,0));
objj_msgSend(_73,"scrollRangeToVisible:",CPMakeRange(_7a,0));
}
}
}),new objj_method(sel_getUid("moveUp:"),function(_7b,_7c,_7d){
with(_7b){
if(_isSelectable){
var _7e=[];
var _7f=objj_msgSend(_7b,"selectedRange").location;
var _80=objj_msgSend(_layoutManager,"locationForGlyphAtIndex:",_7f);
_80.y-=2;
_80.x+=2;
var _81=objj_msgSend(_layoutManager,"glyphIndexForPoint:inTextContainer:fractionOfDistanceThroughGlyph:",_80,_textContainer,_7e);
objj_msgSend(_7b,"setSelectedRange:",CPMakeRange(_81,0));
objj_msgSend(_7b,"scrollRangeToVisible:",CPMakeRange(_81,0));
}
}
}),new objj_method(sel_getUid("moveLeft:"),function(_82,_83,_84){
with(_82){
if(_isSelectable){
if(_selectionRange.location>0){
objj_msgSend(_82,"setSelectedRange:",CPMakeRange(_selectionRange.location-1,0));
}
}
}
}),new objj_method(sel_getUid("moveRight:"),function(_85,_86,_87){
with(_85){
if(_isSelectable){
if(_selectionRange.location<objj_msgSend(_textStorage,"length")){
objj_msgSend(_85,"setSelectedRange:",CPMakeRange(_selectionRange.location+1,0));
}
}
}
}),new objj_method(sel_getUid("selectAll:"),function(_88,_89,_8a){
with(_88){
if(_isSelectable){
if(_carretTimer){
objj_msgSend(_carretTimer,"invalidate");
_carretTimer=nil;
}
objj_msgSend(_88,"setSelectedRange:",CPMakeRange(0,objj_msgSend(_textStorage,"length")));
}
}
}),new objj_method(sel_getUid("deleteBackward:"),function(_8b,_8c,_8d){
with(_8b){
var _8e=nil;
if(CPEmptyRange(_selectionRange)&&_selectionRange.location>0){
_8e=CPMakeRange(_selectionRange.location-1,1);
}else{
_8e=_selectionRange;
}
if(!objj_msgSend(_8b,"shouldChangeTextInRange:replacementString:",_8e,"")){
return;
}
objj_msgSend(_textStorage,"deleteCharactersInRange:",CPCopyRange(_8e));
objj_msgSend(_8b,"setSelectionGranularity:",CPSelectByCharacter);
objj_msgSend(_8b,"setSelectedRange:",CPMakeRange(_8e.location,0));
objj_msgSend(_8b,"didChangeText");
objj_msgSend(_8b,"sizeToFit");
}
}),new objj_method(sel_getUid("insertLineBreak:"),function(_8f,_90,_91){
with(_8f){
objj_msgSend(_8f,"insertText:","\n");
}
}),new objj_method(sel_getUid("acceptsFirstResponder"),function(_92,_93){
with(_92){
if(_isSelectable){
return YES;
}
return NO;
}
}),new objj_method(sel_getUid("becomeFirstResponder"),function(_94,_95){
with(_94){
_isFirstResponder=YES;
objj_msgSend(_94,"updateInsertionPointStateAndRestartTimer:",YES);
objj_msgSend(objj_msgSend(CPFontManager,"sharedFontManager"),"setSelectedFont:isMultiple:",objj_msgSend(_94,"font"),NO);
return YES;
}
}),new objj_method(sel_getUid("resignFirstResponder"),function(_96,_97){
with(_96){
objj_msgSend(_carretTimer,"invalidate");
_carretTimer=nil;
_isFirstResponder=NO;
return YES;
}
}),new objj_method(sel_getUid("setTypingAttributes:"),function(_98,_99,_9a){
with(_98){
if(!_9a){
_9a=objj_msgSend(CPDictionary,"dictionary");
}
if(_delegateRespondsToSelectorMask&_9){
_typingAttributes=objj_msgSend(_delegate,"textView:shouldChangeTypingAttributes:toAttributes:",_98,_typingAttributes,_9a);
}else{
_typingAttributes=objj_msgSend(_9a,"copy");
if(!objj_msgSend(_typingAttributes,"containsKey:",CPFontAttributeName)){
objj_msgSend(_typingAttributes,"setObject:forKey:",objj_msgSend(_98,"font"),CPFontAttributeName);
}
if(!objj_msgSend(_typingAttributes,"containsKey:",CPForegroundColorAttributeName)){
objj_msgSend(_typingAttributes,"setObject:forKey:",objj_msgSend(_98,"textColor"),CPForegroundColorAttributeName);
}
}
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:",CPTextViewDidChangeTypingAttributesNotification,_98);
}
}),new objj_method(sel_getUid("typingAttributes"),function(_9b,_9c){
with(_9b){
return _typingAttributes;
}
}),new objj_method(sel_getUid("setSelectedTextAttributes:"),function(_9d,_9e,_9f){
with(_9d){
_selectedTextAttributes=_9f;
}
}),new objj_method(sel_getUid("selectedTextAttributes"),function(_a0,_a1){
with(_a0){
return _selectedTextAttributes;
}
}),new objj_method(sel_getUid("delete:"),function(_a2,_a3,_a4){
with(_a2){
objj_msgSend(_a2,"deleteBackward:",_a4);
}
}),new objj_method(sel_getUid("setFont:"),function(_a5,_a6,_a7){
with(_a5){
_font=_a7;
var _a8=objj_msgSend(_textStorage,"length");
objj_msgSend(_textStorage,"addAttribute:value:range:",CPFontAttributeName,_font,CPMakeRange(0,_a8));
objj_msgSend(_textStorage,"setFont:",_font);
objj_msgSend(_a5,"scrollRangeToVisible:",CPMakeRange(_a8,0));
}
}),new objj_method(sel_getUid("setFont:range:"),function(_a9,_aa,_ab,_ac){
with(_a9){
if(!_isRichText){
return;
}
if(CPMaxRange(_ac)>=objj_msgSend(_textStorage,"length")){
_font=_ab;
objj_msgSend(_textStorage,"setFont:",_font);
}
objj_msgSend(_textStorage,"addAttribute:value:range:",CPFontAttributeName,_ab,CPCopyRange(_ac));
objj_msgSend(_a9,"scrollRangeToVisible:",CPMakeRange(CPMaxRange(_ac),0));
}
}),new objj_method(sel_getUid("font"),function(_ad,_ae){
with(_ad){
return _font;
}
}),new objj_method(sel_getUid("changeColor:"),function(_af,_b0,_b1){
with(_af){
objj_msgSend(_af,"setTextColor:range:",objj_msgSend(_b1,"color"),_selectionRange);
}
}),new objj_method(sel_getUid("changeFont:"),function(_b2,_b3,_b4){
with(_b2){
var _b5=objj_msgSend(_textStorage,"attributesAtIndex:effectiveRange:",_selectionRange.location,nil),_b6=objj_msgSend(_b5,"objectForKey:",CPFontAttributeName);
if(!_b6){
_b6=objj_msgSend(_b2,"font");
}
if(objj_msgSend(_b2,"isRichText")){
objj_msgSend(_b2,"setFont:range:",objj_msgSend(_b4,"convertFont:",_b6),_selectionRange);
objj_msgSend(_b2,"scrollRangeToVisible:",CPMakeRange(CPMaxRange(_selectionRange),0));
}else{
var _b7=objj_msgSend(_textStorage,"length");
objj_msgSend(_b2,"setFont:range:",objj_msgSend(_b4,"convertFont:",_b6),CPMakeRange(0,_b7));
objj_msgSend(_b2,"scrollRangeToVisible:",CPMakeRange(_b7,0));
}
}
}),new objj_method(sel_getUid("underline:"),function(_b8,_b9,_ba){
with(_b8){
if(!objj_msgSend(_b8,"shouldChangeTextInRange:replacementString:",_selectionRange,nil)){
return;
}
if(!CPEmptyRange(_selectionRange)){
var _bb=objj_msgSend(_textStorage,"attributesAtIndex:effectiveRange:",_selectionRange.location,nil);
if(objj_msgSend(_bb,"containsKey:",CPUnderlineStyleAttributeName)&&objj_msgSend(objj_msgSend(_bb,"objectForKey:",CPUnderlineStyleAttributeName),"intValue")){
objj_msgSend(_textStorage,"removeAttribute:range:",CPUnderlineStyleAttributeName,_selectionRange);
}else{
objj_msgSend(_textStorage,"addAttribute:value:range:",CPUnderlineStyleAttributeName,objj_msgSend(CPNumber,"numberWithInt:",1),CPCopyRange(_selectionRange));
}
}
}
}),new objj_method(sel_getUid("selectionAffinity"),function(_bc,_bd){
with(_bc){
return 0;
}
}),new objj_method(sel_getUid("setUsesFontPanel:"),function(_be,_bf,_c0){
with(_be){
_usesFontPanel=flags;
}
}),new objj_method(sel_getUid("usesFontPanel"),function(_c1,_c2){
with(_c1){
return _usesFontPanel;
}
}),new objj_method(sel_getUid("setTextColor:"),function(_c3,_c4,_c5){
with(_c3){
_textColor=_c5;
if(_textColor){
objj_msgSend(_textStorage,"addAttribute:value:range:",CPForegroundColorAttributeName,_textColor,CPMakeRange(0,objj_msgSend(_textStorage,"length")));
}else{
objj_msgSend(_textStorage,"removeAttribute:range:",CPForegroundColorAttributeName,CPMakeRange(0,objj_msgSend(_textStorage,"length")));
}
objj_msgSend(_c3,"scrollRangeToVisible:",CPMakeRange(objj_msgSend(_textStorage,"length"),0));
}
}),new objj_method(sel_getUid("setTextColor:range:"),function(_c6,_c7,_c8,_c9){
with(_c6){
if(!_isRichText){
return;
}
if(CPMaxRange(_c9)>=objj_msgSend(_textStorage,"length")){
_textColor=_c8;
objj_msgSend(_textStorage,"setForegroundColor:",_textColor);
}
if(_c8){
objj_msgSend(_textStorage,"addAttribute:value:range:",CPForegroundColorAttributeName,_c8,CPCopyRange(_c9));
}else{
objj_msgSend(_textStorage,"removeAttribute:range:",CPForegroundColorAttributeName,CPCopyRange(_c9));
}
objj_msgSend(_c6,"scrollRangeToVisible:",CPMakeRange(CPMaxRange(_c9),0));
}
}),new objj_method(sel_getUid("textColor"),function(_ca,_cb){
with(_ca){
return _textColor;
}
}),new objj_method(sel_getUid("isRichText"),function(_cc,_cd){
with(_cc){
return _isRichText;
}
}),new objj_method(sel_getUid("isRulerVisible"),function(_ce,_cf){
with(_ce){
return NO;
}
}),new objj_method(sel_getUid("allowsUndo"),function(_d0,_d1){
with(_d0){
return _allowsUndo;
}
}),new objj_method(sel_getUid("selectedRange"),function(_d2,_d3){
with(_d2){
return _selectionRange;
}
}),new objj_method(sel_getUid("replaceCharactersInRange:withString:"),function(_d4,_d5,_d6,_d7){
with(_d4){
objj_msgSend(_textStorage,"replaceCharactersInRange:withString:",_d6,_d7);
}
}),new objj_method(sel_getUid("string"),function(_d8,_d9){
with(_d8){
return objj_msgSend(_textStorage,"string");
}
}),new objj_method(sel_getUid("isHorizontallyResizable"),function(_da,_db){
with(_da){
return _isHorizontallyResizable;
}
}),new objj_method(sel_getUid("setHorizontallyResizable:"),function(_dc,_dd,_de){
with(_dc){
_isHorizontallyResizable=_de;
}
}),new objj_method(sel_getUid("isVerticallyResizable"),function(_df,_e0){
with(_df){
return _isVerticallyResizable;
}
}),new objj_method(sel_getUid("setVerticallyResizable:"),function(_e1,_e2,_e3){
with(_e1){
_isVerticallyResizable=_e3;
}
}),new objj_method(sel_getUid("maxSize"),function(_e4,_e5){
with(_e4){
return _maxSize;
}
}),new objj_method(sel_getUid("minSize"),function(_e6,_e7){
with(_e6){
return _minSize;
}
}),new objj_method(sel_getUid("setMaxSize:"),function(_e8,_e9,_ea){
with(_e8){
_maxSize=_ea;
}
}),new objj_method(sel_getUid("setMinSize:"),function(_eb,_ec,_ed){
with(_eb){
_minSize=_ed;
}
}),new objj_method(sel_getUid("setConstrainedFrameSize:"),function(_ee,_ef,_f0){
with(_ee){
objj_msgSend(_ee,"setFrameSize:",_f0);
}
}),new objj_method(sel_getUid("sizeToFit"),function(_f1,_f2){
with(_f1){
objj_msgSend(_f1,"setFrameSize:",objj_msgSend(_f1,"frameSize"));
}
}),new objj_method(sel_getUid("setFrameSize:"),function(_f3,_f4,_f5){
with(_f3){
objj_msgSend(_textContainer,"setContainerSize:",_f5);
var _f6=objj_msgSend(_f3,"minSize"),_f7=objj_msgSend(_f3,"maxSize");
var _f8=_f5,_f9=objj_msgSend(_layoutManager,"boundingRectForGlyphRange:inTextContainer:",CPMakeRange(0,objj_msgSend(_textStorage,"length")),_textContainer);
if(objj_msgSend(_layoutManager,"extraLineFragmentTextContainer")===_textContainer){
_f9=CPRectUnion(_f9,objj_msgSend(_layoutManager,"extraLineFragmentRect"));
}
if(_isHorizontallyResizable){
_f8.width=_f9.size.width+2*_textContainerInset.width;
if(_f8.width<_f6.width){
_f8.width=_f6.width;
}else{
if(_f8.width>_f7.width){
_f8.width=_f7.width;
}
}
}
if(_isVerticallyResizable){
_f8.height=_f9.size.height+2*_textContainerInset.height;
if(_f8.height<_f6.height){
_f8.height=_f6.height;
}else{
if(_f8.height>_f7.height){
_f8.height=_f7.height;
}
}
}
objj_msgSendSuper({receiver:_f3,super_class:objj_getClass("CPTextView").super_class},"setFrameSize:",_f8);
}
}),new objj_method(sel_getUid("scrollRangeToVisible:"),function(_fa,_fb,_fc){
with(_fa){
var _fd;
if(CPEmptyRange(_fc)){
if(_fc.location>=objj_msgSend(_textStorage,"length")){
_fd=objj_msgSend(_layoutManager,"extraLineFragmentRect");
}else{
_fd=objj_msgSend(_layoutManager,"lineFragmentRectForGlyphAtIndex:effectiveRange:",_fc.location,nil);
}
}else{
_fd=objj_msgSend(_layoutManager,"boundingRectForGlyphRange:inTextContainer:",_fc,_textContainer);
}
_fd.origin.x+=_textContainerOrigin.x;
_fd.origin.y+=_textContainerOrigin.y;
objj_msgSend(_fa,"scrollRectToVisible:",_fd);
}
}),new objj_method(sel_getUid("_characterRangeForWordAtIndex:inString:"),function(_fe,_ff,_100,_101){
with(_fe){
var _102=[" ","\n","\t",",",";",".","!","?","'","\"","-",":"],_103=CPMakeRange(0,0),_104=CPNotFound,_105=0;
if((_102.join("")).indexOf(_101.charAt(_100))!=CPNotFound){
_103.location=_100;
_103.length=1;
return _103;
}
do{
_104=_101.lastIndexOf(_102[_105++],_100);
}while(_105<_102.length&&_104==CPNotFound);
if(_104!=CPNotFound){
_103.location=_104+1;
}
_104=CPNotFound;
_105=0;
do{
_104=_101.indexOf(_102[_105++],_100);
}while(_105<_102.length&&_104==CPNotFound);
if(_104!=CPNotFound){
_103.length=_104-_103.location;
}else{
_103.length=_101.length-_103.location;
}
return _103;
}
}),new objj_method(sel_getUid("selectionRangeForProposedRange:granularity:"),function(self,_106,_107,_108){
with(self){
var _109=objj_msgSend(_textStorage,"length");
if(_109==0){
return CPMakeRange(0,0);
}
if(_107.location>=_109){
return CPMakeRange(_109,0);
}
if(CPMaxRange(_107)>_109){
_107.length=_109-_107.location;
}
switch(_108){
case CPSelectByWord:
var _10a=objj_msgSend(_textStorage,"string"),_10b=objj_msgSend(self,"_characterRangeForWordAtIndex:inString:",_107.location,_10a);
if(_107.length){
_10b=CPUnionRange(_10b,objj_msgSend(self,"_characterRangeForWordAtIndex:inString:",CPMaxRange(_107),_10a));
}
return _10b;
break;
case CPSelectByParagraph:
CPLog.error(_106+" CPSelectByParagraph granularity unimplemented");
case CPSelectByCharacter:
default:
return _107;
}
}
}),new objj_method(sel_getUid("setSelectionGranularity:"),function(self,_10c,_10d){
with(self){
_selectionGranularity=_10d;
}
}),new objj_method(sel_getUid("selectionGranularity"),function(self,_10e){
with(self){
return _selectionGranularity;
}
}),new objj_method(sel_getUid("insertionPointColor"),function(self,_10f){
with(self){
return _insertionPointColor;
}
}),new objj_method(sel_getUid("setInsertionPointColor:"),function(self,_110,_111){
with(self){
_insertionPointColor=_111;
}
}),new objj_method(sel_getUid("shouldDrawInsertionPoint"),function(self,_112){
with(self){
return (_isFirstResponder&&_selectionRange.length===0);
}
}),new objj_method(sel_getUid("drawInsertionPointInRect:color:turnedOn:"),function(self,_113,_114,_115,flag){
with(self){
if(flag){
var ctx=objj_msgSend(objj_msgSend(CPGraphicsContext,"currentContext"),"graphicsPort");
CGContextSaveGState(ctx);
CGContextSetLineWidth(ctx,1);
CGContextSetFillColor(ctx,_115);
CGContextFillRect(ctx,_114);
CGContextRestoreGState(ctx);
}
}
}),new objj_method(sel_getUid("updateInsertionPointStateAndRestartTimer:"),function(self,_116,flag){
with(self){
if(_selectionRange.location==objj_msgSend(_textStorage,"length")){
if(objj_msgSend(_layoutManager,"extraLineFragmentTextContainer")===_textContainer){
_carretRect=objj_msgSend(_layoutManager,"extraLineFragmentUsedRect");
if(objj_msgSend(objj_msgSend(_textStorage,"string"),"characterAtIndex:",_selectionRange.location-1)==="\n"){
_carretRect.origin.y+=_carretRect.size.height;
}
}else{
_carretRect=objj_msgSend(_layoutManager,"boundingRectForGlyphRange:inTextContainer:",CPMakeRange(_selectionRange.location-1,1),_textContainer);
_carretRect.origin.x+=_carretRect.size.width;
}
}else{
_carretRect=objj_msgSend(_layoutManager,"boundingRectForGlyphRange:inTextContainer:",CPMakeRange(_selectionRange.location,1),_textContainer);
}
_carretRect.origin.x+=_textContainerOrigin.x;
_carretRect.origin.y+=_textContainerOrigin.y;
_carretRect.size.width=1;
if(_carretRect.size.height==0){
_carretRect.size.height=objj_msgSend(objj_msgSend(self,"font"),"size");
}
if(flag){
_drawCarret=flag;
_carretTimer=objj_msgSend(CPTimer,"scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:",0.5,self,sel_getUid("_blinkCarret:"),nil,YES);
}
}
})]);
p;34;Frameworks/TextView/CPTypesetter.jt;1791;@STATIC;1.0;I;21;Foundation/CPObject.ji;20;CPSimpleTypesetter.jt;1721;
objj_executeFile("Foundation/CPObject.j",NO);
CPTypesetterZeroAdvancementAction=(1<<0);
CPTypesetterWhitespaceAction=(1<<1);
CPSTypesetterHorizontalTabAction=(1<<2);
CPTypesetterLineBreakAction=(1<<3);
CPTypesetterParagraphBreakAction=(1<<4);
CPTypesetterContainerBreakAction=(1<<5);
var _1=Nil;
var _2=objj_allocateClassPair(CPObject,"CPTypesetter"),_3=_2.isa;
objj_registerClassPair(_2);
class_addMethods(_2,[new objj_method(sel_getUid("actionForControlCharacterAtIndex:"),function(_4,_5,_6){
with(_4){
CPLog.error("-[CPTypesetter "+cmd+"] subclass responsability");
return CPTypesetterZeroAdvancementAction;
}
}),new objj_method(sel_getUid("layoutManager"),function(_7,_8){
with(_7){
CPLog.error("-[CPTypesetter "+cmd+"] subclass responsability");
return nil;
}
}),new objj_method(sel_getUid("currentTextContainer"),function(_9,_a){
with(_9){
CPLog.error("-[CPTypesetter "+cmd+"] subclass responsability");
return nil;
}
}),new objj_method(sel_getUid("textContainers"),function(_b,_c){
with(_b){
CPLog.error("-[CPTypesetter "+cmd+"] subclass responsability");
return nil;
}
}),new objj_method(sel_getUid("layoutGlyphsInLayoutManager:startingAtGlyphIndex:maxNumberOfLineFragments:nextGlyphIndex:"),function(_d,_e,_f,_10,_11,_12){
with(_d){
CPLog.error("-[CPTypesetter "+cmd+"] subclass responsability");
}
})]);
class_addMethods(_3,[new objj_method(sel_getUid("sharedSystemTypesetter"),function(_13,_14){
with(_13){
return objj_msgSend(_1,"sharedInstance");
}
}),new objj_method(sel_getUid("_setSystemTypesetterFactory:"),function(_15,_16,_17){
with(_15){
_1=_17;
}
})]);
objj_executeFile("CPSimpleTypesetter.j",YES);
objj_msgSend(CPTypesetter,"_setSystemTypesetterFactory:",objj_msgSend(CPSimpleTypesetter,"class"));
e;