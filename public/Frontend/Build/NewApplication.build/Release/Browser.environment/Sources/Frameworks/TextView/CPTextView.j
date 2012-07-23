@STATIC;1.0;i;8;CPText.ji;15;CPTextStorage.ji;17;CPTextContainer.ji;17;CPLayoutManager.ji;15;CPFontManager.jt;30854;
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
