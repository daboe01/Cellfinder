@STATIC;1.0;i;20;CPAttributedString.ji;17;CPLayoutManager.jt;7595;
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
