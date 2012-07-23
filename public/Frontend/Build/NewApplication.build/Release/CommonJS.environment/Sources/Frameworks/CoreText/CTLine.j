@STATIC;1.0;i;7;CTRun.jt;3398;
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
