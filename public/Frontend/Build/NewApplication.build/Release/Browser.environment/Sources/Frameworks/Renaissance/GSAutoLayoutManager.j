@STATIC;1.0;t;12294;
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
