@STATIC;1.0;i;15;CPTextStorage.ji;17;CPTextContainer.ji;14;CPTypesetter.jt;32372;
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
