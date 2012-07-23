@STATIC;1.0;i;17;GSMarkupTagView.jt;16245;
objj_executeFile("GSMarkupTagView.j",YES);
var _1=objj_allocateClassPair(GSMarkupTagView,"GSMarkupTagFlashView"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initPlatformObject:"),function(_3,_4,_5){
with(_3){
_5=objj_msgSendSuper({receiver:_3,super_class:objj_getClass("GSMarkupTagFlashView").super_class},"initPlatformObject:",_5);
var _6=objj_msgSend(_attributes,"objectForKey:","ressource");
if(_6!=nil){
objj_msgSend(_5,"setFlashMovie:",objj_msgSend(CPFlashMovie,"flashMovieWithFile:",objj_msgSend(CPString,"stringWithFormat:","%@/%@",objj_msgSend(objj_msgSend(CPBundle,"mainBundle"),"resourcePath"),_6)));
}
return _5;
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("tagName"),function(_7,_8){
with(_7){
return "flashView";
}
}),new objj_method(sel_getUid("platformObjectClass"),function(_9,_a){
with(_9){
return objj_msgSend(CPFlashView,"class");
}
})]);
var _1=objj_allocateClassPair(GSMarkupTagControl,"GSMarkupTagLevelIndicator"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initPlatformObject:"),function(_b,_c,_d){
with(_b){
_d=objj_msgSendSuper({receiver:_b,super_class:objj_getClass("GSMarkupTagLevelIndicator").super_class},"initPlatformObject:",_d);
var _e;
var _f;
var _10;
var _11;
var _12;
_e=objj_msgSend(_attributes,"objectForKey:","min");
if(_e!=nil){
objj_msgSend(_d,"setMinValue:",objj_msgSend(_e,"doubleValue"));
}
_f=objj_msgSend(_attributes,"objectForKey:","max");
if(_f!=nil){
objj_msgSend(_d,"setMaxValue:",objj_msgSend(_f,"doubleValue"));
}
_10=objj_msgSend(_attributes,"objectForKey:","warning");
if(_10!=nil){
objj_msgSend(_d,"setWarningValue:",objj_msgSend(_10,"doubleValue"));
}
_11=objj_msgSend(_attributes,"objectForKey:","critical");
if(_11!=nil){
objj_msgSend(_d,"setCriticalValue:",objj_msgSend(_11,"doubleValue"));
}
var _13;
_13=objj_msgSend(_attributes,"objectForKey:","height");
if(_13==nil){
objj_msgSend(_attributes,"setObject:forKey:","25","height");
}
var _14;
_14=objj_msgSend(_attributes,"objectForKey:","width");
if(_14==nil){
objj_msgSend(_attributes,"setObject:forKey:","250","width");
}
return _d;
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("tagName"),function(_15,_16){
with(_15){
return "levelIndicator";
}
}),new objj_method(sel_getUid("platformObjectClass"),function(_17,_18){
with(_17){
return objj_msgSend(CPLevelIndicator,"class");
}
})]);
var _1=objj_allocateClassPair(GSMarkupTagObject,"GSMarkupOperator"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("content"),function(_19,_1a){
with(_19){
return _content;
}
}),new objj_method(sel_getUid("allocPlatformObject"),function(_1b,_1c){
with(_1b){
return nil;
}
}),new objj_method(sel_getUid("operator"),function(_1d,_1e){
with(_1d){
var _1f=objj_msgSend(_attributes,"objectForKey:","type");
if(_1f=="equal"){
return objj_msgSend(CPNumber,"numberWithInt:",CPEqualToPredicateOperatorType);
}else{
if(_1f=="begins"){
return objj_msgSend(CPNumber,"numberWithInt:",CPBeginsWithPredicateOperatorType);
}else{
if(_1f=="ends"){
return objj_msgSend(CPNumber,"numberWithInt:",CPEndsWithPredicateOperatorType);
}
}
}
return nil;
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("tagName"),function(_20,_21){
with(_20){
return "operator";
}
})]);
var _1=objj_allocateClassPair(GSMarkupTagObject,"GSMarkupLexpression"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("content"),function(_22,_23){
with(_22){
return _content;
}
}),new objj_method(sel_getUid("allocPlatformObject"),function(_24,_25){
with(_24){
return nil;
}
}),new objj_method(sel_getUid("keyPath"),function(_26,_27){
with(_26){
return objj_msgSend(_attributes,"objectForKey:","keyPath");
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("tagName"),function(_28,_29){
with(_28){
return "lexpression";
}
})]);
var _1=objj_allocateClassPair(GSMarkupTagObject,"GSMarkupRexpression"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("content"),function(_2a,_2b){
with(_2a){
return _content;
}
}),new objj_method(sel_getUid("allocPlatformObject"),function(_2c,_2d){
with(_2c){
return nil;
}
}),new objj_method(sel_getUid("keyPath"),function(_2e,_2f){
with(_2e){
return objj_msgSend(_attributes,"objectForKey:","keyPath");
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("tagName"),function(_30,_31){
with(_30){
return "rexpression";
}
})]);
var _1=objj_allocateClassPair(GSMarkupTagObject,"GSMarkupRowTemplate"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("allocPlatformObject"),function(_32,_33){
with(_32){
return nil;
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("tagName"),function(_34,_35){
with(_34){
return "rowTemplate";
}
})]);
var _1=objj_getClass("CPPredicateEditor");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"CPPredicateEditor\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("sizeToFit"),function(_36,_37){
with(_36){
}
})]);
var _1=objj_allocateClassPair(GSMarkupTagView,"GSMarkupTagPredicateEditor"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initPlatformObject:"),function(_38,_39,_3a){
with(_38){
_3a=objj_msgSendSuper({receiver:_38,super_class:objj_getClass("GSMarkupTagPredicateEditor").super_class},"initPlatformObject:",_3a);
var _3b=objj_msgSend(CPMutableArray,"new");
var i,_3c=_content.length;
for(i=0;i<_3c;i++){
var v=_content[i];
if(objj_msgSend(v,"isKindOfClass:",objj_msgSend(GSMarkupRowTemplate,"class"))){
var _3d=objj_msgSend(v,"content");
var j,l1=_3d.length;
var _3e=objj_msgSend(CPMutableArray,"new");
var ops=objj_msgSend(CPMutableArray,"new");
for(j=0;j<l1;j++){
var _3f=_3d[j];
if(objj_msgSend(_3f,"isKindOfClass:",objj_msgSend(GSMarkupLexpression,"class"))){
objj_msgSend(_3e,"addObject:",objj_msgSend(CPExpression,"expressionForKeyPath:",objj_msgSend(_3f,"keyPath")));
}else{
if(objj_msgSend(_3f,"isKindOfClass:",objj_msgSend(GSMarkupOperator,"class"))){
if(objj_msgSend(_3f,"operator")){
objj_msgSend(ops,"addObject:",objj_msgSend(_3f,"operator"));
}
}
}
}
var _40=objj_msgSend(objj_msgSend(CPPredicateEditorRowTemplate,"alloc"),"initWithLeftExpressions:rightExpressionAttributeType:modifier:operators:options:",_3e,CPStringAttributeType,0,ops,0);
objj_msgSend(_3b,"addObject:",_40);
}
}
objj_msgSend(_3a,"setNestingMode:",CPRuleEditorNestingModeCompound);
objj_msgSend(_3b,"addObject:",objj_msgSend(objj_msgSend(CPPredicateEditorRowTemplate,"alloc"),"initWithCompoundTypes:",objj_msgSend(CPArray,"arrayWithObjects:",objj_msgSend(CPNumber,"numberWithInt:",CPAndPredicateType),objj_msgSend(CPNumber,"numberWithInt:",CPOrPredicateType),objj_msgSend(CPNumber,"numberWithInt:",CPNotPredicateType))));
objj_msgSend(_3a,"setRowTemplates:",_3b);
objj_msgSend(_3a,"setFormattingStringsFilename:",nil);
return _3a;
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("tagName"),function(_41,_42){
with(_41){
return "predicateEditor";
}
}),new objj_method(sel_getUid("platformObjectClass"),function(_43,_44){
with(_43){
return objj_msgSend(CPPredicateEditor,"class");
}
})]);
var _1=objj_allocateClassPair(GSMarkupTagObject,"GSMarkupTagPredicate"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initPlatformObject:"),function(_45,_46,_47){
with(_45){
_47=objj_msgSend(CPPredicate,"predicateWithFormat:argumentArray:",objj_msgSend(_attributes,"objectForKey:","format"),nil);
return _47;
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("tagName"),function(_48,_49){
with(_48){
return "predicate";
}
}),new objj_method(sel_getUid("platformObjectClass"),function(_4a,_4b){
with(_4a){
return nil;
}
})]);
var _1=objj_allocateClassPair(GSMarkupTagObject,"GSMarkupTagTabViewItem"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("title"),function(_4c,_4d){
with(_4c){
return objj_msgSend(_attributes,"objectForKey:","title");
}
}),new objj_method(sel_getUid("initPlatformObject:"),function(_4e,_4f,_50){
with(_4e){
_50=objj_msgSend(objj_msgSend(CPTabViewItem,"alloc"),"initWithIdentifier:",objj_msgSend(_4e,"title"));
return _50;
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("tagName"),function(_51,_52){
with(_51){
return "tabViewItem";
}
}),new objj_method(sel_getUid("platformObjectClass"),function(_53,_54){
with(_53){
return nil;
}
})]);
var _1=objj_allocateClassPair(GSMarkupTagView,"GSMarkupTagTabView"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("type"),function(_55,_56){
with(_55){
if(objj_msgSend(_attributes,"objectForKey:","type")=="topBezel"){
return CPTopTabsBezelBorder;
}
return CPNoTabsBezelBorder;
}
}),new objj_method(sel_getUid("initPlatformObject:"),function(_57,_58,_59){
with(_57){
_59=objj_msgSendSuper({receiver:_57,super_class:objj_getClass("GSMarkupTagTabView").super_class},"initPlatformObject:",_59);
objj_msgSend(_59,"setTabViewType:",objj_msgSend(_57,"type"));
var i,_5a=_content.length;
for(i=0;i<_5a;i++){
var _5b=objj_msgSend(_content[i],"platformObject");
objj_msgSend(_5b,"setView:",objj_msgSend(objj_msgSend(_content[i],"content")[0],"platformObject"));
objj_msgSend(_5b,"setLabel:",objj_msgSend(_content[i],"title"));
objj_msgSend(_59,"addTabViewItem:",_5b);
}
return _59;
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("tagName"),function(_5c,_5d){
with(_5c){
return "tabView";
}
}),new objj_method(sel_getUid("platformObjectClass"),function(_5e,_5f){
with(_5e){
return objj_msgSend(CPTabView,"class");
}
})]);
var _1=objj_getClass("CPTabView");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"CPTabView\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("autolayoutDefaultVerticalAlignment"),function(_60,_61){
with(_60){
return GSAutoLayoutExpand;
}
}),new objj_method(sel_getUid("autolayoutDefaultHorizontalAlignment"),function(_62,_63){
with(_62){
return GSAutoLayoutExpand;
}
})]);
var _1=objj_allocateClassPair(GSMarkupTagControl,"GSMarkupTagCheckBox"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initPlatformObject:"),function(_64,_65,_66){
with(_64){
_66=objj_msgSendSuper({receiver:_64,super_class:objj_getClass("GSMarkupTagCheckBox").super_class},"initPlatformObject:",_66);
objj_msgSend(_66,"setTitle:",objj_msgSend(_attributes,"objectForKey:","title"));
return _66;
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("tagName"),function(_67,_68){
with(_67){
return "checkBox";
}
}),new objj_method(sel_getUid("platformObjectClass"),function(_69,_6a){
with(_69){
return objj_msgSend(CPCheckBox,"class");
}
})]);
var _1=objj_getClass("CPCollectionView");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"CPCollectionView\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("setObjectValue:"),function(_6b,_6c,_6d){
with(_6b){
objj_msgSend(_6b,"setContent:",_6d);
}
}),new objj_method(sel_getUid("value"),function(_6e,_6f){
with(_6e){
return objj_msgSend(_6e,"content");
}
}),new objj_method(sel_getUid("setValue:"),function(_70,_71,_72){
with(_70){
return objj_msgSend(_70,"setObjectValue:",_72);
}
}),new objj_method(sel_getUid("autolayoutDefaultVerticalAlignment"),function(_73,_74){
with(_73){
return GSAutoLayoutExpand;
}
}),new objj_method(sel_getUid("autolayoutDefaultHorizontalAlignment"),function(_75,_76){
with(_75){
return GSAutoLayoutExpand;
}
}),new objj_method(sel_getUid("performDragOperation:"),function(_77,_78,_79){
with(_77){
objj_msgSend(_delegate,"performDragOperation:",_79);
}
})]);
var _1=objj_allocateClassPair(GSMarkupTagView,"GSMarkupTagCollectionView"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initPlatformObject:"),function(_7a,_7b,_7c){
with(_7a){
_7c=objj_msgSendSuper({receiver:_7a,super_class:objj_getClass("GSMarkupTagCollectionView").super_class},"initPlatformObject:",_7c);
objj_msgSend(_7c,"setSelectable:",objj_msgSend(_7a,"boolValueForAttribute:","selectable")==1);
objj_msgSend(_7c,"setAllowsEmptySelection:",objj_msgSend(_7a,"boolValueForAttribute:","emptySelectionAllowed")==1);
objj_msgSend(_7c,"setAllowsMultipleSelection:",objj_msgSend(_7a,"boolValueForAttribute:","multipleSelectionAllowed")!=0);
objj_msgSend(_7c,"setMaxNumberOfRows:",objj_msgSend(_7a,"intValueForAttribute:","maxRows"));
objj_msgSend(_7c,"setMaxNumberOfColumns:",objj_msgSend(_7a,"intValueForAttribute:","maxColumns"));
var _7d=objj_msgSend(_7a,"intValueForAttribute:","itemWidth");
var _7e=objj_msgSend(_7a,"intValueForAttribute:","itemHeight");
if(_7d&&_7e){
var _7f=CPMakeSize(_7d,_7e);
objj_msgSend(_7c,"setMinItemSize:",_7f);
objj_msgSend(_7c,"setMaxItemSize:",_7f);
}
var _7d=objj_msgSend(_7a,"intValueForAttribute:","minItemWidth");
var _7e=objj_msgSend(_7a,"intValueForAttribute:","minItemHeight");
if(_7d&&_7e){
objj_msgSend(_7c,"setMinItemSize:",CPMakeSize(_7d,_7e));
}
var _7d=objj_msgSend(_7a,"intValueForAttribute:","maxItemWidth");
var _7e=objj_msgSend(_7a,"intValueForAttribute:","maxItemHeight");
if(_7d&&_7e){
objj_msgSend(_7c,"setMaxItemSize:",CPMakeSize(_7d,_7e));
}
var _80=CPClassFromString(objj_msgSend(_7a,"stringValueForAttribute:","itemsClassName"));
if(!_80){
_80=objj_msgSend(CPCollectionViewItem,"class");
}
var _81=objj_msgSend(_80,"new");
var _82;
objj_msgSend(_7c,"setItemPrototype:",_81);
return _7c;
}
}),new objj_method(sel_getUid("postInitPlatformObject:"),function(_83,_84,_85){
with(_83){
_85=objj_msgSendSuper({receiver:_83,super_class:objj_getClass("GSMarkupTagCollectionView").super_class},"postInitPlatformObject:",_85);
objj_msgSend(_85,"tile");
return _85;
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("tagName"),function(_86,_87){
with(_86){
return "collectionView";
}
}),new objj_method(sel_getUid("platformObjectClass"),function(_88,_89){
with(_88){
return objj_msgSend(CPCollectionView,"class");
}
})]);
var _1=objj_allocateClassPair(GSMarkupTagView,"GSMarkupTagButtonBar"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initPlatformObject:"),function(_8a,_8b,_8c){
with(_8a){
objj_msgSend(_attributes,"setObject:forKey:","25","height");
_8c=objj_msgSendSuper({receiver:_8a,super_class:objj_getClass("GSMarkupTagButtonBar").super_class},"initPlatformObject:",_8c);
objj_msgSend(_8c,"setHasResizeControl:",objj_msgSend(_8a,"boolValueForAttribute:","resizable")==1);
var _8d=[];
var _8e;
if(_8e=objj_msgSend(_8a,"stringValueForAttribute:","plusButtonAction")){
var _8f=objj_msgSend(CPButtonBar,"plusButton");
objj_msgSend(_8f,"setAction:",CPSelectorFromString(_8e));
objj_msgSend(_8d,"addObject:",_8f);
}
if(_8e=objj_msgSend(_8a,"stringValueForAttribute:","minusButtonAction")){
var _8f=objj_msgSend(CPButtonBar,"minusButton");
objj_msgSend(_8f,"setAction:",CPSelectorFromString(_8e));
objj_msgSend(_8d,"addObject:",_8f);
}
if(objj_msgSend(_8a,"boolValueForAttribute:","actionsButton")==1){
var _90;
objj_msgSend(_8d,"addObject:",_90=objj_msgSend(CPButtonBar,"actionPopupButton"));
var i,_91=objj_msgSend(_content,"count");
for(i=0;i<_91;i++){
var _92=objj_msgSend(_content,"objectAtIndex:",i);
var _93=objj_msgSend(_92,"localizedStringValueForAttribute:","title");
if(_93==nil){
_93="";
}
objj_msgSend(_90,"addItemWithTitle:",_93);
var _94=objj_msgSend(_90,"lastItem");
_94=objj_msgSend(_92,"initPlatformObject:",_94);
objj_msgSend(_92,"setPlatformObject:",_94);
}
}
objj_msgSend(_8c,"setButtons:",_8d);
return _8c;
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("tagName"),function(_95,_96){
with(_95){
return "ButtonBar";
}
}),new objj_method(sel_getUid("platformObjectClass"),function(_97,_98){
with(_97){
return objj_msgSend(CPButtonBar,"class");
}
})]);
var _1=objj_getClass("CPButtonBar");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"CPButtonBar\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("setTarget:"),function(_99,_9a,_9b){
with(_99){
objj_msgSend(objj_msgSend(_99,"buttons"),"makeObjectsPerformSelector:withObject:",sel_getUid("setTarget:"),_9b);
}
}),new objj_method(sel_getUid("autolayoutDefaultHorizontalAlignment"),function(_9c,_9d){
with(_9c){
return GSAutoLayoutExpand;
}
})]);
