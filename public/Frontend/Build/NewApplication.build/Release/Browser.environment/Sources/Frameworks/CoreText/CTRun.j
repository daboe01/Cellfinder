@STATIC;1.0;t;3992;
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
