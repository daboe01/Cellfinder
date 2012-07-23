@STATIC;1.0;i;8;CTLine.jt;2716;
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
