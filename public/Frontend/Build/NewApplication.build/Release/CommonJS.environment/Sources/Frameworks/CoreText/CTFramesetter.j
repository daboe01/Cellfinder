@STATIC;1.0;i;9;CTFrame.ji;14;CTTypesetter.jt;1714;
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
