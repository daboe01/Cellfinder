@STATIC;1.0;t;1236;
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
