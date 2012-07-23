@STATIC;1.0;i;21;GSAutoLayoutManager.ji;29;GSAutoLayoutStandardManager.ji;33;GSAutoLayoutProportionalManager.jt;14292;
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
