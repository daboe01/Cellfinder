@STATIC;1.0;p;6;main.jt;267;@STATIC;1.0;I;23;Foundation/Foundation.jI;15;AppKit/AppKit.ji;15;AppController.jt;181;
objj_executeFile("Foundation/Foundation.j",NO);
objj_executeFile("AppKit/AppKit.j",NO);
objj_executeFile("AppController.j",YES);
main=function(_1,_2){
CPApplicationMain(_1,_2);
};
p;15;AppController.jt;14667;@STATIC;1.0;I;21;Foundation/CPObject.jI;25;Renaissance/Renaissance.ji;17;CompoController.ji;17;ImageController.jt;14547;
objj_executeFile("Foundation/CPObject.j",NO);
objj_executeFile("Renaissance/Renaissance.j",NO);
objj_executeFile("CompoController.j",YES);
objj_executeFile("ImageController.j",YES);
var _1="http://localhost/cellfinder_image/";
var _2=objj_getClass("CPObject");
if(!_2){
throw new SyntaxError("*** Could not find definition for class \"CPObject\"");
}
var _3=_2.isa;
class_addMethods(_2,[new objj_method(sel_getUid("_cellfinderImageFromID"),function(_4,_5){
with(_4){
var _6=_1+objj_msgSend(_4,"valueForKey:","id")+"?width=10000";
var _7=objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:",_6);
objj_msgSend(_7,"setDelegate:",_4);
return _7;
}
}),new objj_method(sel_getUid("provideImageForCollectionViewItem:"),function(_8,_9,_a){
with(_8){
var _b=Math.floor(Math.random()*100000);
var _c=_1+objj_msgSend(_8,"valueForKey:","idimage")+"?rnd="+_b;
if(objj_msgSend(_8,"respondsToSelector:",sel_getUid("entity"))){
var _d=objj_msgSend(_8,"entity");
var _e=objj_msgSend(_a,"compoID");
if(_e){
_c+=("&cmp="+parseInt(_e));
}
if(objj_msgSend(objj_msgSend(_d,"columns"),"containsObject:","idmontage")){
var _f=objj_msgSend(_8,"valueForKey:","parameter");
if(_f){
_c+=("&handover_params="+_f);
}
}
}
var _10=objj_msgSend(_a,"size");
if(!_10){
_10=10000;
}
_c+="&width="+_10;
var img=objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:",_c);
return img;
}
})]);
var _2=objj_allocateClassPair(CPCollectionViewItem,"SimpleImageViewCollectionItem"),_3=_2.isa;
class_addIvars(_2,[new objj_ivar("_img"),new objj_ivar("_imgv"),new objj_ivar("_size"),new objj_ivar("_compoID")]);
objj_registerClassPair(_2);
class_addMethods(_2,[new objj_method(sel_getUid("size"),function(_11,_12){
with(_11){
return _size;
}
}),new objj_method(sel_getUid("setSize:"),function(_13,_14,_15){
with(_13){
_size=_15;
}
}),new objj_method(sel_getUid("compoID"),function(_16,_17){
with(_16){
return _compoID;
}
}),new objj_method(sel_getUid("setCompoID:"),function(_18,_19,_1a){
with(_18){
_compoID=_1a;
}
}),new objj_method(sel_getUid("setSize:"),function(_1b,_1c,_1d){
with(_1b){
_size=_1d*_1d;
_img=objj_msgSend(_representedObject,"provideImageForCollectionViewItem:",_1b);
objj_msgSend(_img,"setDelegate:",_1b);
}
}),new objj_method(sel_getUid("setCompoID:"),function(_1e,_1f,_20){
with(_1e){
_compoID=_20;
_img=objj_msgSend(_representedObject,"provideImageForCollectionViewItem:",_1e);
objj_msgSend(_img,"setDelegate:",_1e);
}
}),new objj_method(sel_getUid("imageDidLoad:"),function(_21,_22,_23){
with(_21){
objj_msgSend(_imgv,"setImage:",_23);
var _24=objj_msgSend(_imgv,"frame");
var _25=objj_msgSend(_23,"size");
objj_msgSend(_imgv,"setFrame:",CPMakeRect(_24.origin.x,_24.origin.y,_25.width,_25.height));
}
}),new objj_method(sel_getUid("loadView"),function(_26,_27){
with(_26){
_imgv=objj_msgSend(CPImageView,"new");
objj_msgSend(_imgv,"setImageScaling:",CPScaleProportionally);
var _28=objj_msgSend(CPBox,"new");
var _29=objj_msgSend(_representedObject,"valueForKeyPath:","image.name");
objj_msgSend(_28,"setTitle:",_29);
objj_msgSend(_28,"setTitlePosition:",CPBelowBottom);
objj_msgSend(_28,"setBorderType:",CPLineBorder);
objj_msgSend(_28,"setBorderWidth:",2);
objj_msgSend(_28,"setContentView:",_imgv);
objj_msgSend(_26,"setView:",_28);
_img=objj_msgSend(_representedObject,"provideImageForCollectionViewItem:",_26);
objj_msgSend(_img,"setDelegate:",_26);
return _28;
}
}),new objj_method(sel_getUid("setRepresentedObject:"),function(_2a,_2b,_2c){
with(_2a){
objj_msgSendSuper({receiver:_2a,super_class:objj_getClass("SimpleImageViewCollectionItem").super_class},"setRepresentedObject:",_2c);
objj_msgSend(_2a,"loadView");
}
}),new objj_method(sel_getUid("setSelected:"),function(_2d,_2e,_2f){
with(_2d){
objj_msgSend(objj_msgSend(_2d,"view"),"setBorderColor:",_2f?objj_msgSend(CPColor,"yellowColor"):objj_msgSend(CPColor,"blackColor"));
}
})]);
var _2=objj_allocateClassPair(CPObject,"FlickerController"),_3=_2.isa;
class_addIvars(_2,[new objj_ivar("myAppController"),new objj_ivar("flickerSuperview"),new objj_ivar("imageView"),new objj_ivar("slider"),new objj_ivar("imageArray"),new objj_ivar("_imageIndex")]);
objj_registerClassPair(_2);
class_addMethods(_2,[new objj_method(sel_getUid("initWithImageArray:andAppController:"),function(_30,_31,_32,_33){
with(_30){
if(_30=objj_msgSend(_30,"init")){
myAppController=_33;
objj_msgSend(CPBundle,"loadRessourceNamed:owner:","flicker.gsmarkup",_30);
imageArray=_32;
objj_msgSend(slider,"setMaxValue:",objj_msgSend(imageArray,"count")-1);
objj_msgSend(_30,"setImageIndex:",0);
}
return _30;
}
}),new objj_method(sel_getUid("setImageIndex:"),function(_34,_35,_36){
with(_34){
_imageIndex=Math.floor(_36);
_imageIndex=Math.min(_imageIndex,objj_msgSend(imageArray,"count")-1);
var _37=objj_msgSend(imageArray,"objectAtIndex:",_imageIndex);
var _38=objj_msgSend(_37,"size");
var _39=objj_msgSend(imageView,"frame");
objj_msgSend(imageView,"setFrame:",CPMakeRect(_39.origin.x,_39.origin.y,_38.width,_38.height));
objj_msgSend(imageView,"setObjectValue:",_37);
}
}),new objj_method(sel_getUid("imageIndex"),function(_3a,_3b){
with(_3a){
return _imageIndex;
}
})]);
PhotoDragType="PhotoDragType";
var _2=objj_allocateClassPair(CPObject,"StacksController"),_3=_2.isa;
class_addIvars(_2,[new objj_ivar("myAppController"),new objj_ivar("stacksCollectionView"),new objj_ivar("stacksWindow"),new objj_ivar("_viewingCompo"),new objj_ivar("stacksettingswindow"),new objj_ivar("_itemSize")]);
objj_registerClassPair(_2);
class_addMethods(_2,[new objj_method(sel_getUid("initWithTrial:andAppController:"),function(_3c,_3d,_3e,_3f){
with(_3c){
if(_3c=objj_msgSend(_3c,"init")){
myAppController=_3f;
objj_msgSend(CPBundle,"loadRessourceNamed:owner:","stacks.gsmarkup",_3c);
objj_msgSend(stacksCollectionView,"registerForDraggedTypes:",[PhotoDragType]);
_itemSize=10000;
}
}
}),new objj_method(sel_getUid("setItemSize:"),function(_40,_41,_42){
with(_40){
_itemSize=_42;
objj_msgSend(objj_msgSend(stacksCollectionView,"items"),"makeObjectsPerformSelector:withObject:",sel_getUid("setSize:"),_itemSize);
objj_msgSend(stacksCollectionView,"setMinItemSize:",CPMakeSize(_itemSize,_itemSize));
}
}),new objj_method(sel_getUid("itemSize"),function(_43,_44){
with(_43){
return _itemSize;
}
}),new objj_method(sel_getUid("newStack:"),function(_45,_46,_47){
with(_45){
objj_msgSend(myAppController.stacksController,"addObject:",objj_msgSend(CPDictionary,"dictionaryWithObject:forKey:","NewStack","name"));
objj_msgSend(_45,"runSetting:",_45);
}
}),new objj_method(sel_getUid("deleteStack:"),function(_48,_49,_4a){
with(_48){
objj_msgSend(myAppController.stacksController,"delete:",_48);
}
}),new objj_method(sel_getUid("runSettings:"),function(_4b,_4c,_4d){
with(_4b){
objj_msgSend(CPApp,"beginSheet:modalForWindow:modalDelegate:didEndSelector:contextInfo:",stacksettingswindow,stacksWindow,_4b,sel_getUid("didEndSheet:returnCode:contextInfo:"),nil);
}
}),new objj_method(sel_getUid("setViewingCompo:"),function(_4e,_4f,_50){
with(_4e){
_viewingCompo=_50;
objj_msgSend(objj_msgSend(stacksCollectionView,"items"),"makeObjectsPerformSelector:withObject:",sel_getUid("setCompoID:"),_viewingCompo);
}
}),new objj_method(sel_getUid("viewingCompo"),function(_51,_52){
with(_51){
return _viewingCompo;
}
}),new objj_method(sel_getUid("runFlicker:"),function(_53,_54,_55){
with(_53){
var _56=objj_msgSend(stacksCollectionView,"selectionIndexes");
var _57=objj_msgSend(_56,"count")?objj_msgSend(objj_msgSend(stacksCollectionView,"items"),"objectsAtIndexes:",_56):objj_msgSend(stacksCollectionView,"items");
var _58=objj_msgSend(CPMutableArray,"new");
var i,n=objj_msgSend(_57,"count");
for(i=0;i<n;i++){
var o=objj_msgSend(_57,"objectAtIndex:",i);
objj_msgSend(_58,"addObject:",o._img);
}
objj_msgSend(objj_msgSend(FlickerController,"alloc"),"initWithImageArray:andAppController:",_58,myAppController);
}
}),new objj_method(sel_getUid("applyMerge:"),function(_59,_5a,_5b){
with(_59){
}
}),new objj_method(sel_getUid("performBurnIn:"),function(_5c,_5d,_5e){
with(_5c){
}
}),new objj_method(sel_getUid("performDragOperation:"),function(_5f,_60,_61){
with(_5f){
var _62=objj_msgSend(objj_msgSend(_61,"draggingPasteboard"),"dataForType:",PhotoDragType);
var o=objj_msgSend(CPKeyedUnarchiver,"unarchiveObjectWithData:",_62);
objj_msgSend(myAppController.stacksContentController,"addObject:",objj_msgSend(CPDictionary,"dictionaryWithObjects:forKeys:",[objj_msgSend(o,"objectForKey:","idimage")],["idimage"]));
}
}),new objj_method(sel_getUid("closeSheet:"),function(_63,_64,_65){
with(_63){
objj_msgSend(CPApp,"endSheet:returnCode:",stacksettingswindow,objj_msgSend(_65,"tag"));
}
}),new objj_method(sel_getUid("didEndSheet:returnCode:contextInfo:"),function(_66,_67,_68,_69,_6a){
with(_66){
}
})]);
var _2=objj_allocateClassPair(CPObject,"AppController"),_3=_2.isa;
class_addIvars(_2,[new objj_ivar("store"),new objj_ivar("trialsController"),new objj_ivar("trialsWindow"),new objj_ivar("stacksController"),new objj_ivar("stacksContentController"),new objj_ivar("folderContentController"),new objj_ivar("folderCollectionView"),new objj_ivar("_itemSize"),new objj_ivar("_viewingCompoID"),new objj_ivar("analysesController"),new objj_ivar("resultsController"),new objj_ivar("filterPredicate"),new objj_ivar("_imageControllers"),new objj_ivar("trialsettingswindow"),new objj_ivar("displayfilters_ac"),new objj_ivar("uploadfilters_ac"),new objj_ivar("fixupfilters_ac"),new objj_ivar("overlayfilters_ac"),new objj_ivar("analyticsfilters_ac"),new objj_ivar("perlfilters_ac"),new objj_ivar("javascriptfilters_ac")]);
objj_registerClassPair(_2);
class_addMethods(_2,[new objj_method(sel_getUid("store"),function(_6b,_6c){
with(_6b){
return store;
}
}),new objj_method(sel_getUid("setStore:"),function(_6d,_6e,_6f){
with(_6d){
store=_6f;
}
}),new objj_method(sel_getUid("viewingCompoID"),function(_70,_71){
with(_70){
return _viewingCompoID;
}
}),new objj_method(sel_getUid("setViewingCompoID:"),function(_72,_73,_74){
with(_72){
_viewingCompoID=_74;
}
}),new objj_method(sel_getUid("setViewingCompoID:"),function(_75,_76,_77){
with(_75){
_viewingCompoID=_77;
objj_msgSend(objj_msgSend(folderCollectionView,"items"),"makeObjectsPerformSelector:withObject:",sel_getUid("setCompoID:"),_viewingCompoID);
}
}),new objj_method(sel_getUid("setItemSize:"),function(_78,_79,_7a){
with(_78){
_itemSize=_7a;
objj_msgSend(objj_msgSend(folderCollectionView,"items"),"makeObjectsPerformSelector:withObject:",sel_getUid("setSize:"),_itemSize);
objj_msgSend(folderCollectionView,"setMinItemSize:",CPMakeSize(_itemSize,_itemSize));
}
}),new objj_method(sel_getUid("itemSize"),function(_7b,_7c){
with(_7b){
return _itemSize;
}
}),new objj_method(sel_getUid("baseImageURL"),function(_7d,_7e){
with(_7d){
return _1;
}
}),new objj_method(sel_getUid("imageControllersForIDTrial:"),function(_7f,_80,_81){
with(_7f){
var all=objj_msgSend(_imageControllers,"allObjects");
var i,l=all.length;
var ret=objj_msgSend(CPMutableArray,"new");
for(i=0;i<l;i++){
if(objj_msgSend(all[i],"idtrial")==_81){
objj_msgSend(ret,"addObject:",all[i]);
}
}
return ret;
}
}),new objj_method(sel_getUid("applicationDidFinishLaunching:"),function(_82,_83,_84){
with(_82){
store=objj_msgSend(objj_msgSend(FSStore,"alloc"),"initWithBaseURL:","http://127.0.0.1:3000");
_itemSize=100;
objj_msgSend(CPBundle,"loadRessourceNamed:owner:","gui.gsmarkup",_82);
}
}),new objj_method(sel_getUid("configureIC:forTrial:"),function(_85,_86,_87,_88){
with(_85){
var _89=objj_msgSend(CPURLRequest,"requestWithURL:",_1+"0?cmp="+objj_msgSend(_88,"valueForKey:","composition_for_javascript"));
var _8a=objj_msgSend(objj_msgSend(CPURLConnection,"sendSynchronousRequest:returningResponse:",_89,nil),"rawString");
var arr=JSON.parse(_8a);
var i,l=arr.length;
for(i=0;i<l;i++){
var m=arr[i];
if(objj_msgSend(m,"characterAtIndex:",0)=="<"){
next;
}
var sel=CPSelectorFromString(m);
if(sel){
objj_msgSend(_87,"performSelector:",sel);
}
}
}
}),new objj_method(sel_getUid("loadImage:"),function(_8b,_8c,_8d){
with(_8b){
var o=objj_msgSend(objj_msgSend(folderContentController,"arrangedObjects"),"objectAtIndex:",objj_msgSend(_8d,"selectedRow"));
if(o){
if(!_imageControllers){
_imageControllers=objj_msgSend(CPMutableSet,"new");
}
var ic=objj_msgSend(objj_msgSend(ImageController,"alloc"),"initWithImageID:appController:",objj_msgSend(o,"valueForKey:","idimage"),_8b);
objj_msgSend(_8b,"configureIC:forTrial:",ic,objj_msgSend(trialsController,"selectedObject"));
objj_msgSend(_imageControllers,"addObject:",ic);
}
}
}),new objj_method(sel_getUid("loadAnalysis:"),function(_8e,_8f,_90){
with(_8e){
var o=objj_msgSend(objj_msgSend(analysesController,"arrangedObjects"),"objectAtIndex:",objj_msgSend(_90,"selectedRow"));
if(o){
objj_msgSend(objj_msgSend(AnalysesController,"alloc"),"initWithAnalysis:andAppController:",o,_8e);
}
}
}),new objj_method(sel_getUid("runStacks:"),function(_91,_92,_93){
with(_91){
var o=objj_msgSend(trialsController,"valueForKeyPath:","selection");
if(o){
objj_msgSend(objj_msgSend(StacksController,"alloc"),"initWithTrial:andAppController:",o,_91);
}
}
}),new objj_method(sel_getUid("delete:"),function(_94,_95,_96){
with(_94){
objj_msgSend(objj_msgSend(objj_msgSend(CPApp,"keyWindow"),"delegate"),"delete:",_96);
}
}),new objj_method(sel_getUid("collectionView:didDoubleClickOnItemAtIndex:"),function(_97,_98,_99,_9a){
with(_97){
var o=objj_msgSend(objj_msgSend(_99,"itemAtIndex:",_9a),"representedObject");
var ic=objj_msgSend(objj_msgSend(ImageController,"alloc"),"initWithImageID:appController:",objj_msgSend(o,"valueForKey:","idimage"),_97);
objj_msgSend(_imageControllers,"addObject:",ic);
}
}),new objj_method(sel_getUid("collectionView:dragTypesForItemsAtIndexes:"),function(_9b,_9c,_9d,_9e){
with(_9b){
return [PhotoDragType];
}
}),new objj_method(sel_getUid("collectionView:dataForItemsAtIndexes:forType:"),function(_9f,_a0,_a1,_a2,_a3){
with(_9f){
var _a4=objj_msgSend(_a2,"firstIndex");
return objj_msgSend(CPKeyedArchiver,"archivedDataWithRootObject:",objj_msgSend(objj_msgSend(_a1,"itemAtIndex:",_a4),"representedObject"));
}
}),new objj_method(sel_getUid("closeSheet:"),function(_a5,_a6,_a7){
with(_a5){
objj_msgSend(CPApp,"endSheet:returnCode:",trialsettingswindow,objj_msgSend(_a7,"tag"));
}
}),new objj_method(sel_getUid("didEndSheet:returnCode:contextInfo:"),function(_a8,_a9,_aa,_ab,_ac){
with(_a8){
}
}),new objj_method(sel_getUid("runSettings:"),function(_ad,_ae,_af){
with(_ad){
objj_msgSend(CPApp,"beginSheet:modalForWindow:modalDelegate:didEndSelector:contextInfo:",trialsettingswindow,trialsWindow,_ad,sel_getUid("didEndSheet:returnCode:contextInfo:"),nil);
}
})]);
p;36;Frameworks/Renaissance/Renaissance.jt;2389;@STATIC;1.0;I;21;Foundation/CPObject.jI;22;Renaissance/Fireside.jI;31;Renaissance/GSMarkupTagObject.jI;29;Renaissance/GSMarkupTagView.jI;32;Renaissance/GSMarkupTagControl.jI;31;Renaissance/GSMarkupTagSlider.jI;34;Renaissance/GSAutoLayoutDefaults.jI;33;Renaissance/GSMarkupTagFireside.jt;2097;
objj_executeFile("Foundation/CPObject.j",NO);
objj_executeFile("Renaissance/Fireside.j",NO);
/* objj_executeFile("Renaissance/CPViewSize.j",NO) */ (undefined);
objj_executeFile("Renaissance/GSMarkupTagObject.j",NO);
objj_executeFile("Renaissance/GSMarkupTagView.j",NO);
/* objj_executeFile("Renaissance/GSMarkupTagBox.j",NO) */ (undefined);
/* objj_executeFile("Renaissance/GSMarkupTagHbox.j",NO) */ (undefined);
/* objj_executeFile("Renaissance/GSMarkupTagVbox.j",NO) */ (undefined);
objj_executeFile("Renaissance/GSMarkupTagControl.j",NO);
/* objj_executeFile("Renaissance/GSMarkupTagTextField.j",NO) */ (undefined);
/* objj_executeFile("Renaissance/GSMarkupTagScrollView.j",NO) */ (undefined);
objj_executeFile("Renaissance/GSMarkupTagSlider.j",NO);
/* objj_executeFile("Renaissance/GSMarkupTagImage.j",NO) */ (undefined);
/* objj_executeFile("Renaissance/GSMarkupTagLabel.j",NO) */ (undefined);
/* objj_executeFile("Renaissance/GSMarkupTagTextView.j",NO) */ (undefined);
/* objj_executeFile("Renaissance/GSMarkupTagButton.j",NO) */ (undefined);
/* objj_executeFile("Renaissance/GSMarkupTagWindow.j",NO) */ (undefined);
/* objj_executeFile("Renaissance/GSMarkupTagObjectAdditions.j",NO) */ (undefined);
/* objj_executeFile("Renaissance/GSMarkupTagPopUpButton.j",NO) */ (undefined);
/* objj_executeFile("Renaissance/GSMarkupTagTableView.j",NO) */ (undefined);
/* objj_executeFile("Renaissance/GSMarkupTagTableColumn.j",NO) */ (undefined);
/* objj_executeFile("Renaissance/GSMarkupTagMenu.j",NO) */ (undefined);
/* objj_executeFile("Renaissance/GSMarkupTagMenuItem.j",NO) */ (undefined);
/* objj_executeFile("Renaissance/GSMarkupTagSplitView.j",NO) */ (undefined);
/* objj_executeFile("Renaissance/GSMarkupTagHSpace.j",NO) */ (undefined);
/* objj_executeFile("Renaissance/GSMarkupTagCappuccinoAdditions.j",NO) */ (undefined);
objj_executeFile("Renaissance/GSAutoLayoutDefaults.j",NO);
objj_executeFile("Renaissance/GSMarkupTagFireside.j",NO);
/* objj_executeFile("Renaissance/GSMarkupDecoder.j",NO) */ (undefined);
/* objj_executeFile("Renaissance/GSMarkupBundleAdditions.j",NO) */ (undefined);
p;17;CompoController.jt;10197;@STATIC;1.0;I;21;Foundation/CPObject.jI;25;Renaissance/Renaissance.jt;10121;
objj_executeFile("Foundation/CPObject.j",NO);
objj_executeFile("Renaissance/Renaissance.j",NO);
var _1=objj_getClass("FSObject");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"FSObject\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("unpercentedValueForKey:"),function(_3,_4,_5){
with(_3){
var r=objj_msgSend(_3,"valueForKey:",_5);
return objj_msgSend(r,"stringByReplacingOccurrencesOfString:withString:","%","");
}
})]);
var _1=objj_allocateClassPair(CPFormatter,"ReversePercentageFormatter"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("stringForObjectValue:"),function(_6,_7,_8){
with(_6){
return objj_msgSend(_8,"stringByReplacingOccurrencesOfString:withString:","%","");
}
}),new objj_method(sel_getUid("objectValueForString:error:"),function(_9,_a,_b,_c){
with(_9){
if(!objj_msgSend(_b,"isKindOfClass:",objj_msgSend(CPString,"class"))){
_b=objj_msgSend(_b,"stringValue");
}
return objj_msgSend(_b,"stringByAppendingString:","%");
}
})]);
var _1=objj_allocateClassPair(CPSlider,"OptionSlider"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("mouseDown:"),function(_d,_e,_f){
with(_d){
if(objj_msgSend(_f,"modifierFlags")){
objj_msgSend(_d,"setContinuous:",YES);
}else{
objj_msgSend(_d,"setContinuous:",NO);
}
objj_msgSendSuper({receiver:_d,super_class:objj_getClass("OptionSlider").super_class},"mouseDown:",_f);
}
})]);
var _1=objj_allocateClassPair(CPControl,"DualPercentageSlider"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("slider1"),new objj_ivar("slider2")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("setFrame:"),function(_10,_11,_12){
with(_10){
objj_msgSendSuper({receiver:_10,super_class:objj_getClass("DualPercentageSlider").super_class},"setFrame:",_12);
objj_msgSend(slider1,"setFrame:",CPMakeRect(0,0,_12.size.width,32));
objj_msgSend(slider2,"setFrame:",CPMakeRect(0,32,_12.size.width,32));
}
}),new objj_method(sel_getUid("_newSlider"),function(_13,_14){
with(_13){
var _15=objj_msgSend(objj_msgSend(OptionSlider,"alloc"),"initWithFrame:",CPRectMakeZero());
objj_msgSend(_15,"setMinValue:",0);
objj_msgSend(_15,"setMaxValue:",100);
objj_msgSend(_15,"setTarget:",_13);
objj_msgSend(_15,"setAction:",sel_getUid("_sliderChanged:"));
objj_msgSend(_15,"setContinuous:",NO);
objj_msgSend(_13,"addSubview:",_15);
return _15;
}
}),new objj_method(sel_getUid("_sliderChanged:"),function(_16,_17,_18){
with(_16){
objj_msgSend(_16,"_reverseSetBinding");
}
}),new objj_method(sel_getUid("initWithFrame:"),function(_19,_1a,_1b){
with(_19){
if(_19=objj_msgSendSuper({receiver:_19,super_class:objj_getClass("DualPercentageSlider").super_class},"initWithFrame:",_1b)){
slider1=objj_msgSend(_19,"_newSlider");
slider2=objj_msgSend(_19,"_newSlider");
}
return _19;
}
}),new objj_method(sel_getUid("setObjectValue:"),function(_1c,_1d,_1e){
with(_1c){
objj_msgSendSuper({receiver:_1c,super_class:objj_getClass("DualPercentageSlider").super_class},"setObjectValue:",_1e);
var re=new RegExp("^([0-9]+)%s*x([0-9]+)%");
var _1f=_1e.match(re);
objj_msgSend(slider1,"setIntValue:",_1f[1]);
objj_msgSend(slider2,"setIntValue:",_1f[2]);
}
}),new objj_method(sel_getUid("objectValue"),function(_20,_21){
with(_20){
return objj_msgSend(CPString,"stringWithFormat:","%sx%s",objj_msgSend(slider1,"intValue")+"%",objj_msgSend(slider2,"intValue")+"%");
}
}),new objj_method(sel_getUid("autolayoutDefaultHorizontalAlignment"),function(_22,_23){
with(_22){
return GSAutoLayoutExpand;
}
})]);
var _1=objj_allocateClassPair(GSMarkupTagSlider,"GSMarkupTagOptionSlider"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_2,[new objj_method(sel_getUid("tagName"),function(_24,_25){
with(_24){
return "optionSlider";
}
}),new objj_method(sel_getUid("platformObjectClass"),function(_26,_27){
with(_26){
return objj_msgSend(OptionSlider,"class");
}
})]);
var _1=objj_allocateClassPair(GSMarkupTagControl,"GSMarkupTagDualSlider"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initPlatformObject:"),function(_28,_29,_2a){
with(_28){
_2a=objj_msgSendSuper({receiver:_28,super_class:objj_getClass("GSMarkupTagDualSlider").super_class},"initPlatformObject:",_2a);
objj_msgSend(_attributes,"setObject:forKey:","64","height");
objj_msgSend(_attributes,"setObject:forKey:","83","width");
return _2a;
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("tagName"),function(_2b,_2c){
with(_2b){
return "dualSlider";
}
}),new objj_method(sel_getUid("platformObjectClass"),function(_2d,_2e){
with(_2d){
return objj_msgSend(DualPercentageSlider,"class");
}
})]);
var _1=objj_allocateClassPair(CPObject,"CompoController"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_panel"),new objj_ivar("_myAppController"),new objj_ivar("_myNameTable")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("observeValueForKeyPath:ofObject:change:context:"),function(_2f,_30,_31,_32,_33,_34){
with(_2f){
var _35=objj_msgSend(_myAppController,"imageControllersForIDTrial:",_34);
objj_msgSend(_35,"makeObjectsPerformSelector:withObject:",sel_getUid("reload:"),_2f);
}
}),new objj_method(sel_getUid("initWithCompo:andAppController:"),function(_36,_37,_38,_39){
with(_36){
_myAppController=_39;
var _3a=objj_msgSend(_myAppController,"store");
var _3b=objj_msgSend(objj_msgSend(FSEntity,"alloc"),"initWithName:andStore:","parameter_lists",_3a);
objj_msgSend(_3b,"setColumns:",objj_msgSend(CPArray,"arrayWithObjects:","id","idpatch_parameter","value"));
objj_msgSend(_3b,"setPk:","id");
var _3c=objj_msgSend(_38,"valueForKey:","inputParams");
_myNameTable=objj_msgSend(CPMutableDictionary,"new");
var i,l=objj_msgSend(_3c,"count");
var _3d="<gsmarkup><objects><window id=\"panel\" title=\"Inspector\" HUD=\"yes\" closable=\"yes\" x=\"600\" y=\"30\" width=\"200\">";
_3d+="<vbox id=\"toplevel_container\">";
for(i=0;i<l;i++){
var _3e=objj_msgSend(_3c,"objectAtIndex:",i);
switch(objj_msgSend(_3e,"valueForKey:","type")){
case "1":
var _3f="";
if(objj_msgSend(objj_msgSend(_3e,"valueForKey:","range2"),"hasSuffix:","%")){
objj_msgSend(_3e,"setFormatter:forColumnName:",objj_msgSend(ReversePercentageFormatter,"new"),"value");
}
var _40=objj_msgSend(_3e,"unpercentedValueForKey:","range1");
var _41=objj_msgSend(_3e,"unpercentedValueForKey:","range2");
var _42=objj_msgSend(_3e,"unpercentedValueForKey:","value");
_3d+="<hbox><label textColor=\"white\" valign=\"center\" halign=\"min\" width=\"100\">"+objj_msgSend(_3e,"valueForKey:","patch")+"("+objj_msgSend(_3e,"valueForKey:","name")+")"+"</label><label textColor=\"white\" valign=\"center\" halign=\"min\" width=\"20\">"+objj_msgSend(_3e,"valueForKey:","range1")+"</label>"+"<optionSlider continuous=\"NO\" id=\"_connectme1_"+i+"\" valign=\"center\" halign=\"expand\"  min=\""+_40+"\" max=\""+_41+"\" current=\""+_42+"\" /><label textColor=\"white\" valign=\"center\" halign=\"min\" width=\"20\">"+objj_msgSend(_3e,"valueForKey:","range2")+"</label><textField width=\"50\" valign=\"center\" halign=\"center\" id=\"_connectme2_"+i+"\"></textField></hbox>";
break;
case "5":
var _43="_popconnectme"+objj_msgSend(_3e,"valueForKey:","idparameter");
_3d+="<hbox><label textColor=\"white\" valign=\"center\" halign=\"min\" width=\"100\">"+objj_msgSend(_3e,"valueForKey:","patch")+"("+objj_msgSend(_3e,"valueForKey:","name")+")"+"</label><popUpButton id=\"_popupcntme_"+i+"\" valign=\"center\" halign=\"expand\" itemsBinding=\"#CPOwner._myNameTable."+_43+".arrangedObjects.value\" "+"valueBinding=\"#CPOwner._myNameTable."+_43+".selection.id\"/></hbox>";
var ac=objj_msgSend(FSArrayController,"new");
var _44=objj_msgSend(CPPredicate,"predicateWithFormat:argumentArray:","idpatch_parameter=='"+objj_msgSend(_3e,"valueForKey:","idparameter")+"'",nil);
objj_msgSend(ac,"setContent:",objj_msgSend(objj_msgSend(_3b,"allObjects"),"filteredArrayUsingPredicate:",_44));
objj_msgSend(_myNameTable,"setObject:forKey:",ac,_43);
objj_msgSend(ac,"setEntity:",_3b);
break;
default:
var _42=objj_msgSend(_3e,"valueForKey:","value");
var re=new RegExp("^([0-9%]+)s*x([0-9%]+)");
var _45=_42.match(re);
if(_45){
_3d+="<hbox><label textColor=\"white\" valign=\"center\" halign=\"min\" width=\"100\">"+objj_msgSend(_3e,"valueForKey:","patch")+"("+objj_msgSend(_3e,"valueForKey:","name")+")"+"</label><dualSlider id=\"_connectme1_"+i+"\"/><textField width=\"50\" valign=\"center\" halign=\"expand\" id=\"_connectme2_"+i+"\"></textField></hbox>";
}else{
_3d+="<hbox><label textColor=\"white\" valign=\"center\" halign=\"min\" width=\"100\">"+objj_msgSend(_3e,"valueForKey:","patch")+"("+objj_msgSend(_3e,"valueForKey:","name")+")"+"</label> <textField width=\"50\" valign=\"center\" halign=\"expand\" id=\"_connectme2_"+i+"\"></textField></hbox>";
}
}
}
_3d+="</vbox></window></objects><connectors>"+"<outlet source=\"#CPOwner\" target =\"panel\" label =\"_panel\"/></connectors></gsmarkup>";
var _46=objj_msgSend(CPBundle,"loadGSMarkupData:externalNameTable:localizableStringsTable:inBundle:tagMapping:",objj_msgSend(CPData,"dataWithRawString:",_3d),objj_msgSend(CPDictionary,"dictionaryWithObject:forKey:",_36,"CPOwner"),nil,nil,nil);
var _47=objj_msgSend(objj_msgSend(_46,"nameTable"),"allValues");
var i,l=objj_msgSend(_47,"count");
for(i=0;i<l;i++){
var _3e=objj_msgSend(_47,"objectAtIndex:",i);
var _48;
if(_48=objj_msgSend(objj_msgSend(_3e,"attributes"),"objectForKey:","id")){
var po=objj_msgSend(_3e,"platformObject");
var cip;
if(objj_msgSend(_48,"hasPrefix:","_connectme")){
var idx=parseInt(objj_msgSend(_48,"substringFromIndex:",12));
cip=objj_msgSend(_3c,"objectAtIndex:",idx);
objj_msgSend(po,"bind:toObject:withKeyPath:options:",CPValueBinding,cip,"value",nil);
}else{
if(objj_msgSend(_48,"hasPrefix:","_popupcntme")){
var idx=parseInt(objj_msgSend(_48,"substringFromIndex:",12));
cip=objj_msgSend(_3c,"objectAtIndex:",idx);
objj_msgSend(po,"bind:toObject:withKeyPath:options:","integerValue",cip,"value",nil);
}
}
if(cip){
objj_msgSend(cip,"addObserver:forKeyPath:options:context:",_36,"value",CPKeyValueObservingOptionNew,objj_msgSend(_38,"valueForKeyPath:","trial.id"));
}
}
}
}
})]);
p;28;Frameworks/TextView/CPText.jt;5379;@STATIC;1.0;I;15;AppKit/CPView.jt;5340;
objj_executeFile("AppKit/CPView.j",NO);
CPTextDidBeginEditingNotification="CPTextDidBeginEditingNotification";
CPTextDidChangeNotification="CPTextDidChangeNotification";
CPTextDidEndEditingNotification="CPTextDidEndEditingNotification";
CPParagraphSeparatorCharacter=8233;
CPLineSeparatorCharacter=8232;
CPTabCharacter=9;
CPFormFeedCharacter=12;
CPNewlineCharacter=10;
CPCarriageReturnCharacter=13;
CPEnterCharacter=3;
CPBackspaceCharacter=8;
CPBackTabCharacter=25;
CPDeleteCharacter=127;
var _1=objj_allocateClassPair(CPView,"CPText"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("changeFont:"),function(_3,_4,_5){
with(_3){
CPLog.error("-[CPText "+_4+"] subclass responsibility");
}
}),new objj_method(sel_getUid("copy:"),function(_6,_7,_8){
with(_6){
var _9=objj_msgSend(_6,"selectedRange");
if(_9.length<1){
return;
}
var _a=objj_msgSend(CPPasteboard,"generalPasteboard"),_b=objj_msgSend(_stringValue,"substringWithRange:",_9);
objj_msgSend(_a,"declareTypes:owner:",[CPStringPboardType],nil);
objj_msgSend(_a,"setString:forType:",_b,CPStringPboardType);
}
}),new objj_method(sel_getUid("copyFont:"),function(_c,_d,_e){
with(_c){
CPLog.error("-[CPText "+_d+"] subclass responsibility");
}
}),new objj_method(sel_getUid("cut:"),function(_f,_10,_11){
with(_f){
objj_msgSend(_f,"copy:",_11);
objj_msgSend(_f,"replaceCharactersInRange:withString:",objj_msgSend(_f,"selectedRange"),"");
}
}),new objj_method(sel_getUid("delete:"),function(_12,_13,_14){
with(_12){
CPLog.error("-[CPText "+_13+"] subclass responsibility");
}
}),new objj_method(sel_getUid("font:"),function(_15,_16,_17){
with(_15){
CPLog.error("-[CPText "+_16+"] subclass responsibility");
return nil;
}
}),new objj_method(sel_getUid("isHorizontallyResizable"),function(_18,_19){
with(_18){
CPLog.error("-[CPText "+_19+"] subclass responsibility");
return NO;
}
}),new objj_method(sel_getUid("isRichText"),function(_1a,_1b){
with(_1a){
CPLog.error("-[CPText "+_1b+"] subclass responsibility");
return NO;
}
}),new objj_method(sel_getUid("isRulerVisible"),function(_1c,_1d){
with(_1c){
CPLog.error("-[CPText "+_1d+"] subclass responsibility");
return NO;
}
}),new objj_method(sel_getUid("isVerticallyResizable"),function(_1e,_1f){
with(_1e){
CPLog.error("-[CPText "+_1f+"] subclass responsibility");
return NO;
}
}),new objj_method(sel_getUid("maxSize"),function(_20,_21){
with(_20){
CPLog.error("-[CPText "+_21+"] subclass responsibility");
return CPMakeSize(0,0);
}
}),new objj_method(sel_getUid("minSize"),function(_22,_23){
with(_22){
CPLog.error("-[CPText "+_23+"] subclass responsibility");
return CPMakeSize(0,0);
}
}),new objj_method(sel_getUid("paste:"),function(_24,_25,_26){
with(_24){
var _27=objj_msgSend(CPPasteboard,"generalPasteboard"),_28=objj_msgSend(_27,"stringForType:",CPStringPboardType);
if(_28){
objj_msgSend(_24,"replaceCharactersInRange:withString:",objj_msgSend(_24,"selectedRange"),_28);
}
}
}),new objj_method(sel_getUid("pasteFont:"),function(_29,_2a,_2b){
with(_29){
CPLog.error("-[CPText "+_2a+"] subclass responsibility");
}
}),new objj_method(sel_getUid("replaceCharactersInRange:withString:"),function(_2c,_2d,_2e,_2f){
with(_2c){
CPLog.error("-[CPText "+_2d+"] subclass responsibility");
}
}),new objj_method(sel_getUid("scrollRangeToVisible:"),function(_30,_31,_32){
with(_30){
CPLog.error("-[CPText "+_31+"] subclass responsibility");
}
}),new objj_method(sel_getUid("selectedAll:"),function(_33,_34,_35){
with(_33){
CPLog.error("-[CPText "+_34+"] subclass responsibility");
}
}),new objj_method(sel_getUid("selectedRange"),function(_36,_37){
with(_36){
CPLog.error("-[CPText "+_37+"] subclass responsibility");
return CPMakeRange(CPNotFound,0);
}
}),new objj_method(sel_getUid("setFont:"),function(_38,_39,_3a){
with(_38){
CPLog.error("-[CPText "+_39+"] subclass responsibility");
}
}),new objj_method(sel_getUid("setFont:rang:"),function(_3b,_3c,_3d,_3e){
with(_3b){
CPLog.error("-[CPText "+_3c+"] subclass responsibility");
}
}),new objj_method(sel_getUid("setHorizontallyResizable:"),function(_3f,_40,_41){
with(_3f){
CPLog.error("-[CPText "+_40+"] subclass responsibility");
}
}),new objj_method(sel_getUid("setMaxSize:"),function(_42,_43,_44){
with(_42){
CPLog.error("-[CPText "+_43+"] subclass responsibility");
}
}),new objj_method(sel_getUid("setMinSize:"),function(_45,_46,_47){
with(_45){
CPLog.error("-[CPText "+_46+"] subclass responsibility");
}
}),new objj_method(sel_getUid("setString:"),function(_48,_49,_4a){
with(_48){
objj_msgSend(_48,"replaceCharactersInRange:withString:",CPMakeRange(0,objj_msgSend(objj_msgSend(_48,"string"),"length")),_4a);
}
}),new objj_method(sel_getUid("setUsesFontPanel:"),function(_4b,_4c,_4d){
with(_4b){
CPLog.error("-[CPText "+_4c+"] subclass responsibility");
}
}),new objj_method(sel_getUid("setVerticallyResizable:"),function(_4e,_4f,_50){
with(_4e){
CPLog.error("-[CPText "+_4f+"] subclass responsibility");
}
}),new objj_method(sel_getUid("string"),function(_51,_52){
with(_51){
CPLog.error("-[CPText "+_52+"] subclass responsibility");
return nil;
}
}),new objj_method(sel_getUid("underline:"),function(_53,_54,_55){
with(_53){
CPLog.error("-[CPText "+_54+"] subclass responsibility");
}
}),new objj_method(sel_getUid("usesFontPanel"),function(_56,_57){
with(_56){
CPLog.error("-[CPText "+_57+"] subclass responsibility");
return NO;
}
})]);
p;35;Frameworks/CoreText/CGContextText.jt;1255;@STATIC;1.0;t;1236;
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
p;37;Frameworks/TextView/CPLayoutManager.jt;32453;@STATIC;1.0;i;15;CPTextStorage.ji;17;CPTextContainer.ji;14;CPTypesetter.jt;32372;
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
p;35;Frameworks/TextView/CPTextStorage.jt;7661;@STATIC;1.0;i;20;CPAttributedString.ji;17;CPLayoutManager.jt;7595;
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
p;40;Frameworks/TextView/CPAttributedString.jt;12866;@STATIC;1.0;I;20;Foundation/CPArray.jI;25;Foundation/CPDictionary.jI;24;Foundation/CPException.jI;21;Foundation/CPObject.jI;20;Foundation/CPRange.jI;21;Foundation/CPString.jt;12685;
objj_executeFile("Foundation/CPArray.j",NO);
objj_executeFile("Foundation/CPDictionary.j",NO);
objj_executeFile("Foundation/CPException.j",NO);
objj_executeFile("Foundation/CPObject.j",NO);
objj_executeFile("Foundation/CPRange.j",NO);
objj_executeFile("Foundation/CPString.j",NO);
var _1=objj_allocateClassPair(CPObject,"CPAttributedString"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_string"),new objj_ivar("_rangeEntries")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initWithString:"),function(_3,_4,_5){
with(_3){
return objj_msgSend(_3,"initWithString:attributes:",_5,nil);
}
}),new objj_method(sel_getUid("initWithAttributedString:"),function(_6,_7,_8){
with(_6){
var _9=objj_msgSend(_6,"initWithString:attributes:","",nil);
objj_msgSend(_9,"setAttributedString:",_8);
return _9;
}
}),new objj_method(sel_getUid("initWithString:attributes:"),function(_a,_b,_c,_d){
with(_a){
_a=objj_msgSendSuper({receiver:_a,super_class:objj_getClass("CPAttributedString").super_class},"init");
if(_a){
if(!_d){
_d=objj_msgSend(CPDictionary,"dictionary");
}
_string=""+_c;
_rangeEntries=objj_msgSend(CPArray,"arrayWithObject:",_e(CPMakeRange(0,_string.length),_d));
}
return _a;
}
}),new objj_method(sel_getUid("string"),function(_f,_10){
with(_f){
return _string;
}
}),new objj_method(sel_getUid("mutableString"),function(_11,_12){
with(_11){
return objj_msgSend(_11,"string");
}
}),new objj_method(sel_getUid("length"),function(_13,_14){
with(_13){
return _string.length;
}
}),new objj_method(sel_getUid("_indexOfEntryWithIndex:"),function(_15,_16,_17){
with(_15){
if(_17<0||_17>_string.length||_17===undefined){
return CPNotFound;
}
var _18=function(_19,_1a){
if(CPLocationInRange(_19,_1a.range)||(!_19&&!CPMaxRange(_1a.range))){
return CPOrderedSame;
}else{
if(CPMaxRange(_1a.range)<=_19){
return CPOrderedDescending;
}else{
return CPOrderedAscending;
}
}
};
return objj_msgSend(_rangeEntries,"indexOfObject:inSortedRange:options:usingComparator:",_17,nil,0,_18);
}
}),new objj_method(sel_getUid("attributesAtIndex:effectiveRange:"),function(_1b,_1c,_1d,_1e){
with(_1b){
var _1f=objj_msgSend(_1b,"_indexOfEntryWithIndex:",_1d);
if(_1f==CPNotFound){
return nil;
}
var _20=_rangeEntries[_1f];
if(_1e){
_1e.location=_20.range.location;
_1e.length=_20.range.length;
}
return _20.attributes;
}
}),new objj_method(sel_getUid("attributesAtIndex:longestEffectiveRange:inRange:"),function(_21,_22,_23,_24,_25){
with(_21){
var _26=objj_msgSend(_21,"_indexOfEntryWithIndex:",_23);
if(_26==CPNotFound){
return nil;
}
if(!_24){
return _rangeEntries[_26].attributes;
}
if(CPRangeInRange(_rangeEntries[_26].range,_25)){
_24.location=_25.location;
_24.length=_25.length;
return _rangeEntries[_26].attributes;
}
var _27=_26-1,_28=_rangeEntries[_26],_29=_28.attributes;
while(_27>=0){
var _2a=_rangeEntries[_27];
if(CPMaxRange(_2a.range)>_25.location&&objj_msgSend(_2a.attributes,"isEqualToDictionary:",_29)){
_28=_2a;
_27--;
}else{
break;
}
}
_24.location=MAX(_28.range.location,_25.location);
_28=_rangeEntries[_26];
_27=_26+1;
while(_27<_rangeEntries.length){
var _2a=_rangeEntries[_27];
if(_2a.range.location<CPMaxRange(_25)&&objj_msgSend(_2a.attributes,"isEqualToDictionary:",_29)){
_28=_2a;
_27++;
}else{
break;
}
}
_24.length=MIN(CPMaxRange(_28.range),CPMaxRange(_25))-_24.location;
return _29;
}
}),new objj_method(sel_getUid("attribute:atIndex:effectiveRange:"),function(_2b,_2c,_2d,_2e,_2f){
with(_2b){
if(!_2d){
if(_2f){
_2f.location=0;
_2f.length=_string.length;
}
return nil;
}
return objj_msgSend(objj_msgSend(_2b,"attributesAtIndex:effectiveRange:",_2e,_2f),"valueForKey:",_2d);
}
}),new objj_method(sel_getUid("attribute:atIndex:longestEffectiveRange:inRange:"),function(_30,_31,_32,_33,_34,_35){
with(_30){
var _36=objj_msgSend(_30,"_indexOfEntryWithIndex:",_33);
if(_36==CPNotFound||!_32){
return nil;
}
if(!_34){
return objj_msgSend(_rangeEntries[_36].attributes,"objectForKey:",_32);
}
if(CPRangeInRange(_rangeEntries[_36].range,_35)){
_34.location=_35.location;
_34.length=_35.length;
return objj_msgSend(_rangeEntries[_36].attributes,"objectForKey:",_32);
}
var _37=_36-1,_38=_rangeEntries[_36],_39=objj_msgSend(_38.attributes,"objectForKey:",_32);
while(_37>=0){
var _3a=_rangeEntries[_37];
if(CPMaxRange(_3a.range)>_35.location&&_3b(_39,objj_msgSend(_3a.attributes,"objectForKey:",_32))){
_38=_3a;
_37--;
}else{
break;
}
}
_34.location=MAX(_38.range.location,_35.location);
_38=_rangeEntries[_36];
_37=_36+1;
while(_37<_rangeEntries.length){
var _3a=_rangeEntries[_37];
if(_3a.range.location<CPMaxRange(_35)&&_3b(_39,objj_msgSend(_3a.attributes,"objectForKey:",_32))){
_38=_3a;
_37++;
}else{
break;
}
}
_34.length=MIN(CPMaxRange(_38.range),CPMaxRange(_35))-_34.location;
return _39;
}
}),new objj_method(sel_getUid("isEqualToAttributedString:"),function(_3c,_3d,_3e){
with(_3c){
if(!_3e){
return NO;
}
if(_string!=objj_msgSend(_3e,"string")){
return NO;
}
var _3f=CPMakeRange(),_40=CPMakeRange(),_41=objj_msgSend(_3c,"attributesAtIndex:effectiveRange:",0,_3f),_42=objj_msgSend(_3e,"attributesAtIndex:effectiveRange:",0,_40),_43=_string.length;
while(CPMaxRange(CPUnionRange(_3f,_40))<_43){
if(CPIntersectionRange(_3f,_40).length>0&&!objj_msgSend(_41,"isEqualToDictionary:",_42)){
return NO;
}
if(CPMaxRange(_3f)<CPMaxRange(_40)){
_41=objj_msgSend(_3c,"attributesAtIndex:effectiveRange:",CPMaxRange(_3f),_3f);
}else{
_42=objj_msgSend(_3e,"attributesAtIndex:effectiveRange:",CPMaxRange(_40),_40);
}
}
return YES;
}
}),new objj_method(sel_getUid("isEqual:"),function(_44,_45,_46){
with(_44){
if(_46==_44){
return YES;
}
if(objj_msgSend(_46,"isKindOfClass:",objj_msgSend(_44,"class"))){
return objj_msgSend(_44,"isEqualToAttributedString:",_46);
}
return NO;
}
}),new objj_method(sel_getUid("attributedSubstringFromRange:"),function(_47,_48,_49){
with(_47){
if(!_49||CPMaxRange(_49)>_string.length||_49.location<0){
objj_msgSend(CPException,"raise:reason:",CPRangeException,"tried to get attributedSubstring for an invalid range: "+(_49?CPStringFromRange(_49):"nil"));
}
var _4a=objj_msgSend(objj_msgSend(CPAttributedString,"alloc"),"initWithString:",_string.substring(_49.location,CPMaxRange(_49))),_4b=objj_msgSend(_47,"_indexOfEntryWithIndex:",_49.location),_4c=_rangeEntries[_4b],_4d=CPMaxRange(_49);
_4a._rangeEntries=[];
while(_4c&&CPMaxRange(_4c.range)<_4d){
var _4e=_4f(_4c);
_4e.range.location-=_49.location;
if(_4e.range.location<0){
_4e.range.length+=_4e.range.location;
_4e.range.location=0;
}
_4a._rangeEntries.push(_4e);
_4c=_rangeEntries[++_4b];
}
if(_4c){
var _50=_4f(_4c);
_50.range.length=CPMaxRange(_49)-_50.range.location;
_50.range.location-=_49.location;
if(_50.range.location<0){
_50.range.length+=_50.range.location;
_50.range.location=0;
}
_4a._rangeEntries.push(_50);
}
return _4a;
}
}),new objj_method(sel_getUid("replaceCharactersInRange:withString:"),function(_51,_52,_53,_54){
with(_51){
if(!_54){
_54="";
}
var _55=objj_msgSend(_51,"_indexOfEntryWithIndex:",_53.location);
if(_55<0){
_55=MAX(_rangeEntries.length-1,0);
}
var _56=_rangeEntries[_55];
var _57=objj_msgSend(_51,"_indexOfEntryWithIndex:",MAX(CPMaxRange(_53)-1,0));
if(_57<0){
_57=MAX(_rangeEntries.length-1,0);
}
var _58=_rangeEntries[_57];
var _59=_54.length-_53.length;
_string=_string.substring(0,_53.location)+_54+_string.substring(CPMaxRange(_53));
if(_55==_57){
_56.range.length+=_59;
}else{
_58.range.length=CPMaxRange(_58.range)-CPMaxRange(_53);
_58.range.location=CPMaxRange(_53);
_56.range.length=CPMaxRange(_53)-_56.range.location;
_rangeEntries.splice(_55,_57-_55);
}
_57=_55+1;
while(_57<_rangeEntries.length){
_rangeEntries[_57++].range.location+=_59;
}
}
}),new objj_method(sel_getUid("deleteCharactersInRange:"),function(_5a,_5b,_5c){
with(_5a){
objj_msgSend(_5a,"replaceCharactersInRange:withString:",_5c,nil);
}
}),new objj_method(sel_getUid("setAttributes:range:"),function(_5d,_5e,_5f,_60){
with(_5d){
var _61=objj_msgSend(_5d,"_indexOfRangeEntryForIndex:splitOnMaxIndex:",_60.location,YES),_62=objj_msgSend(_5d,"_indexOfRangeEntryForIndex:splitOnMaxIndex:",CPMaxRange(_60),YES),_63=_61;
if(_62==CPNotFound){
_62=_rangeEntries.length;
}
while(_63<_62){
_rangeEntries[_63++].attributes=objj_msgSend(_5f,"copy");
}
objj_msgSend(_5d,"_coalesceRangeEntriesFromIndex:toIndex:",_61,_62);
}
}),new objj_method(sel_getUid("addAttributes:range:"),function(_64,_65,_66,_67){
with(_64){
var _68=objj_msgSend(_64,"_indexOfRangeEntryForIndex:splitOnMaxIndex:",_67.location,YES),_69=objj_msgSend(_64,"_indexOfRangeEntryForIndex:splitOnMaxIndex:",CPMaxRange(_67),YES),_6a=_68;
if(_69==CPNotFound){
_69=_rangeEntries.length;
}
while(_6a<_69){
var _6b=objj_msgSend(_66,"allKeys"),_6c=objj_msgSend(_6b,"count");
while(_6c--){
objj_msgSend(_rangeEntries[_6a].attributes,"setObject:forKey:",objj_msgSend(_66,"objectForKey:",_6b[_6c]),_6b[_6c]);
}
_6a++;
}
objj_msgSend(_64,"_coalesceRangeEntriesFromIndex:toIndex:",_68,_69);
}
}),new objj_method(sel_getUid("addAttribute:value:range:"),function(_6d,_6e,_6f,_70,_71){
with(_6d){
objj_msgSend(_6d,"addAttributes:range:",objj_msgSend(CPDictionary,"dictionaryWithObject:forKey:",_70,_6f),_71);
}
}),new objj_method(sel_getUid("removeAttribute:range:"),function(_72,_73,_74,_75){
with(_72){
var _76=objj_msgSend(_72,"_indexOfRangeEntryForIndex:splitOnMaxIndex:",_75.location,YES),_77=objj_msgSend(_72,"_indexOfRangeEntryForIndex:splitOnMaxIndex:",CPMaxRange(_75),YES),_78=_76;
if(_77==CPNotFound){
_77=_rangeEntries.length;
}
while(_78<_77){
objj_msgSend(_rangeEntries[_78++].attributes,"removeObjectForKey:",_74);
}
objj_msgSend(_72,"_coalesceRangeEntriesFromIndex:toIndex:",_76,_77);
}
}),new objj_method(sel_getUid("appendAttributedString:"),function(_79,_7a,_7b){
with(_79){
objj_msgSend(_79,"insertAttributedString:atIndex:",_7b,_string.length);
}
}),new objj_method(sel_getUid("insertAttributedString:atIndex:"),function(_7c,_7d,_7e,_7f){
with(_7c){
if(_7f<0||_7f>objj_msgSend(_7c,"length")){
objj_msgSend(CPException,"raise:reason:",CPRangeException,"tried to insert attributed string at an invalid index: "+_7f);
}
var _80=objj_msgSend(_7c,"_indexOfRangeEntryForIndex:splitOnMaxIndex:",_7f,YES),_81=_7e._rangeEntries,_82=objj_msgSend(_7e,"length");
if(_80==CPNotFound){
_80=_rangeEntries.length;
}
_string=_string.substring(0,_7f)+_7e._string+_string.substring(_7f);
var _83=_80;
while(_83<_rangeEntries.length){
_rangeEntries[_83++].range.location+=_82;
}
var _84=_81.length,_85=0;
while(_85<_84){
var _86=_4f(_81[_85++]);
_86.range.location+=_7f;
_rangeEntries.splice(_80-1+_85,0,_86);
}
}
}),new objj_method(sel_getUid("replaceCharactersInRange:withAttributedString:"),function(_87,_88,_89,_8a){
with(_87){
objj_msgSend(_87,"deleteCharactersInRange:",_89);
objj_msgSend(_87,"insertAttributedString:atIndex:",_8a,_89.location);
}
}),new objj_method(sel_getUid("setAttributedString:"),function(_8b,_8c,_8d){
with(_8b){
_string=_8d._string;
_rangeEntries=[];
var i=0,_8e=_8d._rangeEntries.length;
for(;i<_8e;i++){
_rangeEntries.push(_4f(_8d._rangeEntries[i]));
}
}
}),new objj_method(sel_getUid("_indexOfRangeEntryForIndex:splitOnMaxIndex:"),function(_8f,_90,_91,_92){
with(_8f){
var _93=objj_msgSend(_8f,"_indexOfEntryWithIndex:",_91);
if(_93<0){
return _93;
}
var _94=_rangeEntries[_93];
if(_94.range.location==_91||(CPMaxRange(_94.range)-1==_91&&!_92)){
return _93;
}
var _95=splitRangeEntryAtIndex(_94,_91);
_rangeEntries.splice(_93,1,_95[0],_95[1]);
_93++;
return _93;
}
}),new objj_method(sel_getUid("_coalesceRangeEntriesFromIndex:toIndex:"),function(_96,_97,_98,end){
with(_96){
var _99=_98;
if(end>=_rangeEntries.length){
end=_rangeEntries.length-1;
}
while(_99<end){
var a=_rangeEntries[_99],b=_rangeEntries[_99+1];
if(objj_msgSend(a.attributes,"isEqualToDictionary:",b.attributes)){
a.range.length=CPMaxRange(b.range)-a.range.location;
_rangeEntries.splice(_99+1,1);
end--;
}else{
_99++;
}
}
}
}),new objj_method(sel_getUid("beginEditing"),function(_9a,_9b){
with(_9a){
}
}),new objj_method(sel_getUid("endEditing"),function(_9c,_9d){
with(_9c){
}
})]);
var _1=objj_allocateClassPair(CPAttributedString,"CPMutableAttributedString"),_2=_1.isa;
objj_registerClassPair(_1);
var _3b=_3b=function(a,b){
if(a==b){
return YES;
}
if(objj_msgSend(a,"respondsToSelector:",sel_getUid("isEqual:"))&&objj_msgSend(a,"isEqual:",b)){
return YES;
}
return NO;
};
var _e=_e=function(_9e,_9f){
return {range:_9e,attributes:objj_msgSend(_9f,"copy")};
};
var _4f=_4f=function(_a0){
return _e(CPCopyRange(_a0.range),objj_msgSend(_a0.attributes,"copy"));
};
var _a1=splitRangeEntryAtIndex=function(_a2,_a3){
var _a4=_4f(_a2),_a5=CPMaxRange(_a2.range);
_a2.range.length=_a3-_a2.range.location;
_a4.range.location=_a3;
_a4.range.length=_a5-_a3;
_a4.attributes=objj_msgSend(_a4.attributes,"copy");
return [_a2,_a4];
};
p;37;Frameworks/TextView/CPTextContainer.jt;3243;@STATIC;1.0;i;17;CPLayoutManager.jt;3202;
objj_executeFile("CPLayoutManager.j",YES);
CPLineSweepLeft=0;
CPLineSweepRight=1;
CPLineSweepDown=2;
CPLineSweepUp=3;
CPLineDoesntMoves=0;
CPLineMovesLeft=1;
CPLineMovesRight=2;
CPLineMovesDown=3;
CPLineMovesUp=4;
var _1=objj_allocateClassPair(CPObject,"CPTextContainer"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_size"),new objj_ivar("_textView"),new objj_ivar("_layoutManager"),new objj_ivar("_lineFragmentPadding")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initWithContainerSize:"),function(_3,_4,_5){
with(_3){
_3=objj_msgSendSuper({receiver:_3,super_class:objj_getClass("CPTextContainer").super_class},"init");
if(_3){
_size=_5;
_lineFragmentPadding=0;
}
return _3;
}
}),new objj_method(sel_getUid("init"),function(_6,_7){
with(_6){
return objj_msgSend(_6,"initWithContainerSize:",CPMakeSize(10000000,10000000));
}
}),new objj_method(sel_getUid("containerSize"),function(_8,_9){
with(_8){
return _size;
}
}),new objj_method(sel_getUid("setContainerSize:"),function(_a,_b,_c){
with(_a){
var _d=_size;
_size=_c;
if(_d.width!=_size.width){
objj_msgSend(_layoutManager,"invalidateLayoutForCharacterRange:isSoft:actualCharacterRange:",CPMakeRange(0,objj_msgSend(objj_msgSend(_layoutManager,"textStorage"),"length")),NO,NULL);
}
}
}),new objj_method(sel_getUid("setWidthTracksTextView:"),function(_e,_f,_10){
with(_e){
}
}),new objj_method(sel_getUid("setTextView:"),function(_11,_12,_13){
with(_11){
if(_textView){
objj_msgSend(_11,"_removeAllLines");
objj_msgSend(_textView,"setTextContainer:",nil);
}
_textView=_13;
if(_textView!=nil){
objj_msgSend(_textView,"setTextContainer:",_11);
}
objj_msgSend(_layoutManager,"textContainerChangedTextView:",_11);
}
}),new objj_method(sel_getUid("textView"),function(_14,_15){
with(_14){
return _textView;
}
}),new objj_method(sel_getUid("setLayoutManager:"),function(_16,_17,_18){
with(_16){
if(_layoutManager===_18){
return;
}
_layoutManager=_18;
}
}),new objj_method(sel_getUid("layoutManager"),function(_19,_1a){
with(_19){
return _layoutManager;
}
}),new objj_method(sel_getUid("setLineFragmentPadding:"),function(_1b,_1c,_1d){
with(_1b){
_lineFragmentPadding=_1d;
}
}),new objj_method(sel_getUid("lineFragmentPadding"),function(_1e,_1f){
with(_1e){
return _lineFragmentPadding;
}
}),new objj_method(sel_getUid("containsPoint:"),function(_20,_21,_22){
with(_20){
return CPRectContainsPoint(CPRectMake(0,0,_size.width,_size.height),_22);
}
}),new objj_method(sel_getUid("isSimpleRectangularTextContainer"),function(_23,_24){
with(_23){
return YES;
}
}),new objj_method(sel_getUid("lineFragmentRectForProposedRect:sweepDirection:movementDirection:remainingRect:"),function(_25,_26,_27,_28,_29,_2a){
with(_25){
var _2b=CPRectCreateCopy(_27);
if(_28!=CPLineSweepRight||_29!=CPLineMovesDown){
CPLog.trace("FIXME: unsupported sweep ("+_28+") or movement ("+_29+")");
return CPRectMakeZero();
}
if(_2b.origin.x+_2b.size.width>_size.width){
_2b.size.width=_size.width-_2b.origin.x;
}
if(_2b.size.width<0){
_2b=CPRectMakeZero();
}
if(_2a){
_2a.origin.x=_2b.origin.x+_2b.size.width;
_2a.origin.y=_2b.origin.y;
_2a.size.height=_2b.size.height;
_2a.size.width=_size.width-(_2b.origin.x+_2b.size.width);
}
return _2b;
}
})]);
p;34;Frameworks/TextView/CPTypesetter.jt;1791;@STATIC;1.0;I;21;Foundation/CPObject.ji;20;CPSimpleTypesetter.jt;1721;
objj_executeFile("Foundation/CPObject.j",NO);
CPTypesetterZeroAdvancementAction=(1<<0);
CPTypesetterWhitespaceAction=(1<<1);
CPSTypesetterHorizontalTabAction=(1<<2);
CPTypesetterLineBreakAction=(1<<3);
CPTypesetterParagraphBreakAction=(1<<4);
CPTypesetterContainerBreakAction=(1<<5);
var _1=Nil;
var _2=objj_allocateClassPair(CPObject,"CPTypesetter"),_3=_2.isa;
objj_registerClassPair(_2);
class_addMethods(_2,[new objj_method(sel_getUid("actionForControlCharacterAtIndex:"),function(_4,_5,_6){
with(_4){
CPLog.error("-[CPTypesetter "+cmd+"] subclass responsability");
return CPTypesetterZeroAdvancementAction;
}
}),new objj_method(sel_getUid("layoutManager"),function(_7,_8){
with(_7){
CPLog.error("-[CPTypesetter "+cmd+"] subclass responsability");
return nil;
}
}),new objj_method(sel_getUid("currentTextContainer"),function(_9,_a){
with(_9){
CPLog.error("-[CPTypesetter "+cmd+"] subclass responsability");
return nil;
}
}),new objj_method(sel_getUid("textContainers"),function(_b,_c){
with(_b){
CPLog.error("-[CPTypesetter "+cmd+"] subclass responsability");
return nil;
}
}),new objj_method(sel_getUid("layoutGlyphsInLayoutManager:startingAtGlyphIndex:maxNumberOfLineFragments:nextGlyphIndex:"),function(_d,_e,_f,_10,_11,_12){
with(_d){
CPLog.error("-[CPTypesetter "+cmd+"] subclass responsability");
}
})]);
class_addMethods(_3,[new objj_method(sel_getUid("sharedSystemTypesetter"),function(_13,_14){
with(_13){
return objj_msgSend(_1,"sharedInstance");
}
}),new objj_method(sel_getUid("_setSystemTypesetterFactory:"),function(_15,_16,_17){
with(_15){
_1=_17;
}
})]);
objj_executeFile("CPSimpleTypesetter.j",YES);
objj_msgSend(CPTypesetter,"_setSystemTypesetterFactory:",objj_msgSend(CPSimpleTypesetter,"class"));
p;40;Frameworks/TextView/CPSimpleTypesetter.jt;4715;@STATIC;1.0;i;14;CPTypesetter.ji;8;CPText.jt;4665;
objj_executeFile("CPTypesetter.j",YES);
objj_executeFile("CPText.j",YES);
var _1=objj_getClass("CPFont");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"CPFont\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("ascender"),function(_3,_4){
with(_3){
return 10;
}
})]);
var _5=nil;
var _1=objj_allocateClassPair(CPTypesetter,"CPSimpleTypesetter"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_layoutManager"),new objj_ivar("_currentTextContainer"),new objj_ivar("_textStorage"),new objj_ivar("_attributesRange"),new objj_ivar("_currentAttributes"),new objj_ivar("_currentFont"),new objj_ivar("_lineHeight"),new objj_ivar("_lineBase")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("layoutManager"),function(_6,_7){
with(_6){
return _layoutManager;
}
}),new objj_method(sel_getUid("currentTextContainer"),function(_8,_9){
with(_8){
return _currentTextContainer;
}
}),new objj_method(sel_getUid("textContainers"),function(_a,_b){
with(_a){
return objj_msgSend(_layoutManager,"textContainers");
}
}),new objj_method(sel_getUid("layoutGlyphsInLayoutManager:startingAtGlyphIndex:maxNumberOfLineFragments:nextGlyphIndex:"),function(_c,_d,_e,_f,_10,_11){
with(_c){
_layoutManager=_e;
_textStorage=objj_msgSend(_layoutManager,"textStorage");
_currentTextContainer=objj_msgSend(objj_msgSend(_layoutManager,"textContainers"),"objectAtIndex:",0);
_attributesRange=CPMakeRange(0,0);
_lineHeight=0;
_lineBase=0;
var _12=objj_msgSend(_currentTextContainer,"containerSize"),_13=CPMakeRange(_f,0),_14=CPMakeRange(0,0),_15=0,_16=NO,_17=NO;
var _18=0,_19=0,_1a=objj_msgSend(_textStorage,"string"),_1b,_1c,_1d;
if(_f>0){
_1b=CPPointCreateCopy(objj_msgSend(_layoutManager,"lineFragmentRectForGlyphAtIndex:effectiveRange:",_f,nil).origin);
}else{
if(objj_msgSend(_layoutManager,"extraLineFragmentTextContainer")){
_1b=CPPointMake(0,objj_msgSend(_layoutManager,"extraLineFragmentUsedRect").origin.y);
}else{
_1b=CPPointMake(0,0);
}
}
objj_msgSend(_layoutManager,"_removeInvalidLineFragments");
if(!objj_msgSend(_textStorage,"length")){
return;
}
objj_msgSend(_layoutManager,"setExtraLineFragmentRect:usedRect:textContainer:",CPRectMake(0,0),CPRectMake(0,0),nil);
do{
if(!CPLocationInRange(_f,_attributesRange)){
_currentAttributes=objj_msgSend(_textStorage,"attributesAtIndex:effectiveRange:",_f,_attributesRange);
_currentFont=objj_msgSend(_currentAttributes,"objectForKey:",CPFontAttributeName);
if(!_currentFont){
_currentFont=objj_msgSend(_textStorage,"font");
}
_1c=13;
_1d=0;
leading=(_1c-_1d)*0.2;
}
var _1e=objj_msgSend(_1a,"characterAtIndex:",_f),_1f=objj_msgSend(objj_msgSend(_1a,"substringWithRange:",CPMakeRange(_f,1)),"sizeWithFont:",_currentFont);
_13.length++;
if(_1e==" "){
_14=CPCopyRange(_13);
_15=_19;
}else{
if(_1e=="\n"){
_16=YES;
}
}
if(_1b.x+_19+_1f.width>_12.width){
if(_15){
_13=_14;
_19=_15;
}
_16=YES;
_17=YES;
_f=CPMaxRange(_13)-1;
}
_19+=_1f.width;
_lineHeight=Math.max(_lineHeight,_1c-_1d+leading);
_lineBase=Math.max(_lineBase,_1c);
if(_16){
objj_msgSend(_layoutManager,"setTextContainer:forGlyphRange:",_currentTextContainer,_13);
var _20=CPRectMake(_1b.x,_1b.y,_19,_lineHeight);
objj_msgSend(_layoutManager,"setLineFragmentRect:forGlyphRange:usedRect:",_20,_13,_20);
objj_msgSend(_layoutManager,"setLocation:forStartOfGlyphRange:",CPMakePoint(0,_lineBase),_13);
_1b.x=0;
if(_f+1==objj_msgSend(_textStorage,"length")){
_20=CPRectMake(_1b.x,_1b.y,_12.width,_lineHeight);
objj_msgSend(_layoutManager,"setExtraLineFragmentRect:usedRect:textContainer:",_20,_20,_currentTextContainer);
}else{
_20=CPRectMake(_1b.x,_1b.y+_lineHeight,_12.width,_lineHeight);
objj_msgSend(_layoutManager,"setExtraLineFragmentRect:usedRect:textContainer:",_20,_20,_currentTextContainer);
}
_1b.y+=_lineHeight;
_lineHeight=0;
_19=0;
_lineBase=0;
_18++;
_13=CPMakeRange(_f+1,0);
_14=CPMakeRange(0,0);
_15=0;
_16=NO;
_17=NO;
}
_f++;
}while(_18!=_10&&_f<objj_msgSend(_textStorage,"length"));
if(_13.length){
objj_msgSend(_layoutManager,"setTextContainer:forGlyphRange:",_currentTextContainer,_13);
var _20=CPRectMake(_1b.x,_1b.y,_19,_lineHeight);
objj_msgSend(_layoutManager,"setLineFragmentRect:forGlyphRange:usedRect:",_20,_13,_20);
objj_msgSend(_layoutManager,"setLocation:forStartOfGlyphRange:",CPMakePoint(0,_lineBase),_13);
_20=CPRectMake(_1b.x+_19,_1b.y,_12.width-_19,_lineHeight);
objj_msgSend(_layoutManager,"setExtraLineFragmentRect:usedRect:textContainer:",_20,_20,_currentTextContainer);
}
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("sharedInstance"),function(_21,_22){
with(_21){
if(_5===nil){
_5=objj_msgSend(objj_msgSend(CPSimpleTypesetter,"alloc"),"init");
}
return _5;
}
})]);
p;45;Frameworks/Renaissance/GSAutoLayoutDefaults.jt;4338;@STATIC;1.0;t;4319;
GSAutoLayoutExpand=0;
GSAutoLayoutWeakExpand=1;
GSAutoLayoutAlignMin=2;
GSAutoLayoutAlignCenter=3;
GSAutoLayoutAlignMax=4;
var _1=objj_getClass("CPView");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"CPView\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("autolayoutDefaultHorizontalAlignment"),function(_3,_4){
with(_3){
return GSAutoLayoutAlignCenter;
}
}),new objj_method(sel_getUid("autolayoutDefaultVerticalAlignment"),function(_5,_6){
with(_5){
return GSAutoLayoutAlignCenter;
}
}),new objj_method(sel_getUid("autolayoutDefaultHorizontalBorder"),function(_7,_8){
with(_7){
return 4;
}
}),new objj_method(sel_getUid("autolayoutDefaultVerticalBorder"),function(_9,_a){
with(_9){
return 4;
}
})]);
var _1=objj_getClass("CPTextField");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"CPTextField\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("autolayoutDefaultHorizontalAlignment"),function(_b,_c){
with(_b){
if(0&&objj_msgSend(_b,"isBezeled")||objj_msgSend(_b,"isEditable")){
return GSAutoLayoutExpand;
}
return GSAutoLayoutAlignCenter;
}
}),new objj_method(sel_getUid("autolayoutDefaultVerticalAlignment"),function(_d,_e){
with(_d){
return GSAutoLayoutAlignMin;
}
})]);
var _1=objj_getClass("CPScrollView");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"CPScrollView\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("autolayoutDefaultHorizontalAlignment"),function(_f,_10){
with(_f){
return GSAutoLayoutExpand;
}
}),new objj_method(sel_getUid("autolayoutDefaultVerticalAlignment"),function(_11,_12){
with(_11){
return GSAutoLayoutExpand;
}
})]);
var _1=objj_getClass("CPSplitView");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"CPSplitView\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("autolayoutDefaultHorizontalAlignment"),function(_13,_14){
with(_13){
return GSAutoLayoutExpand;
}
}),new objj_method(sel_getUid("autolayoutDefaultVerticalAlignment"),function(_15,_16){
with(_15){
return GSAutoLayoutExpand;
}
})]);
var _1=objj_getClass("CPBox");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"CPBox\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("autolayoutDefaultHorizontalAlignment"),function(_17,_18){
with(_17){
var _19=objj_msgSend(_17,"contentView");
var _1a;
_1a=objj_msgSend(_19,"autolayoutDefaultHorizontalAlignment");
if(_1a==GSAutoLayoutExpand||_1a==GSAutoLayoutWeakExpand){
return _1a;
}
return GSAutoLayoutAlignCenter;
}
}),new objj_method(sel_getUid("autolayoutDefaultVerticalAlignment"),function(_1b,_1c){
with(_1b){
var _1d=objj_msgSend(_1b,"contentView");
var _1e;
_1e=objj_msgSend(_1d,"autolayoutDefaultVerticalAlignment");
if(_1e==GSAutoLayoutExpand||_1e==GSAutoLayoutWeakExpand){
return _1e;
}
return GSAutoLayoutAlignCenter;
}
})]);
var _1=objj_getClass("CPButton");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"CPButton\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("autolayoutDefaultHorizontalBorder"),function(_1f,_20){
with(_1f){
if(objj_msgSend(_1f,"isBordered")&&objj_msgSend(_1f,"bezelStyle")==CPRoundedBezelStyle){
return 0;
}else{
return 4;
}
}
}),new objj_method(sel_getUid("autolayoutDefaultVerticalBorder"),function(_21,_22){
with(_21){
if(objj_msgSend(_21,"isBordered")&&objj_msgSend(_21,"bezelStyle")==CPRoundedBezelStyle){
return 1;
}else{
return 4;
}
}
})]);
var _1=objj_getClass("CPView");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"CPView\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("setDisplayAutoLayoutContainers:"),function(_23,_24,_25){
with(_23){
var _26=objj_msgSend(_23,"subviews");
var i,_27=objj_msgSend(_26,"count");
for(i=0;i<_27;i++){
var _28=objj_msgSend(_26,"objectAtIndex:",i);
objj_msgSend(_28,"setDisplayAutoLayoutContainers:",_25);
}
}
})]);
var _1=objj_getClass("CPWindow");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"CPWindow\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("setDisplayAutoLayoutContainers:"),function(_29,_2a,_2b){
with(_29){
objj_msgSend(objj_msgSend(_29,"contentView"),"setDisplayAutoLayoutContainers:",_2b);
}
})]);
p;42;Frameworks/Renaissance/GSMarkupTagSlider.jt;1367;@STATIC;1.0;i;17;GSMarkupTagView.jt;1326;
objj_executeFile("GSMarkupTagView.j",YES);
var _1=objj_allocateClassPair(GSMarkupTagControl,"GSMarkupTagSlider"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initPlatformObject:"),function(_3,_4,_5){
with(_3){
_5=objj_msgSendSuper({receiver:_3,super_class:objj_getClass("GSMarkupTagSlider").super_class},"initPlatformObject:",_5);
var _6;
var _7;
var _8;
_6=objj_msgSend(_attributes,"objectForKey:","min");
if(_6!=nil){
objj_msgSend(_5,"setMinValue:",objj_msgSend(_6,"doubleValue"));
}
_7=objj_msgSend(_attributes,"objectForKey:","max");
if(_7!=nil){
objj_msgSend(_5,"setMaxValue:",objj_msgSend(_7,"doubleValue"));
}
_8=objj_msgSend(_attributes,"objectForKey:","current");
if(_8!=nil){
objj_msgSend(_5,"setDoubleValue:",objj_msgSend(_8,"doubleValue"));
}
var _9;
_9=objj_msgSend(_attributes,"objectForKey:","height");
if(_9==nil){
objj_msgSend(_attributes,"setObject:forKey:","16","height");
}
var _a;
_a=objj_msgSend(_attributes,"objectForKey:","width");
if(_a==nil){
objj_msgSend(_attributes,"setObject:forKey:","83","width");
}
return _5;
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("tagName"),function(_b,_c){
with(_b){
return "slider";
}
}),new objj_method(sel_getUid("platformObjectClass"),function(_d,_e){
with(_d){
return objj_msgSend(CPSlider,"class");
}
})]);
p;40;Frameworks/Renaissance/GSMarkupTagView.jt;6048;@STATIC;1.0;i;19;GSMarkupTagObject.jt;6005;
objj_executeFile("GSMarkupTagObject.j",YES);
var _1=objj_allocateClassPair(GSMarkupTagObject,"GSMarkupTagView"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initPlatformObject:"),function(_3,_4,_5){
with(_3){
var _6=CPMakeRect(0,0,100,100);
var _7;
var _8;
_7=objj_msgSend(_attributes,"objectForKey:","width");
if(_7!=nil){
var w=objj_msgSend(_7,"floatValue");
if(w>0){
_6.size.width=w;
}
}
_8=objj_msgSend(_attributes,"objectForKey:","height");
if(_8!=nil){
var h=objj_msgSend(_8,"floatValue");
if(h>0){
_6.size.height=h;
}
}
_5=objj_msgSend(_5,"initWithFrame:",_6);
return _5;
}
}),new objj_method(sel_getUid("postInitPlatformObject:"),function(_9,_a,_b){
with(_9){
if((objj_msgSend(_attributes,"objectForKey:","width")==nil)||(objj_msgSend(_attributes,"objectForKey:","height")==nil)){
objj_msgSend(_b,"sizeToFitContent");
}
var _c=objj_msgSend(_b,"frame");
var x,y,_d,_e;
var _f=NO;
x=objj_msgSend(_attributes,"objectForKey:","x");
if(x!=nil){
_c.origin.x=objj_msgSend(x,"floatValue");
_f=YES;
}
y=objj_msgSend(_attributes,"objectForKey:","y");
if(y!=nil){
_c.origin.y=objj_msgSend(y,"floatValue");
_f=YES;
}
_d=objj_msgSend(_attributes,"objectForKey:","width");
if(_d!=nil){
var w=objj_msgSend(_d,"floatValue");
if(w>0){
_c.size.width=w;
_f=YES;
}
}
_e=objj_msgSend(_attributes,"objectForKey:","height");
if(_e!=nil){
var h=objj_msgSend(_e,"floatValue");
if(h>0){
_c.size.height=h;
_f=YES;
}
}
if(_f){
objj_msgSend(_b,"setFrame:",_c);
}
var _10=0;
var _11=0;
_11=objj_msgSend(_9,"gsAutoLayoutHAlignment");
if(_11==255){
_11=objj_msgSend(_b,"autolayoutDefaultHorizontalAlignment");
}
switch(_11){
case GSAutoLayoutExpand:
case GSAutoLayoutWeakExpand:
_10|=CPViewWidthSizable;
break;
case GSAutoLayoutAlignMin:
_10|=CPViewMaxXMargin;
break;
case GSAutoLayoutAlignCenter:
_10|=CPViewMaxXMargin|CPViewMinXMargin;
break;
case GSAutoLayoutAlignMax:
_10|=CPViewMinXMargin;
break;
}
var _12=0;
_12=objj_msgSend(_9,"gsAutoLayoutVAlignment");
if(_12==255){
_12=objj_msgSend(_b,"autolayoutDefaultVerticalAlignment");
}
switch(_12){
case GSAutoLayoutExpand:
case GSAutoLayoutWeakExpand:
_10|=CPViewHeightSizable;
break;
case GSAutoLayoutAlignMin:
_10|=CPViewMaxYMargin;
break;
case GSAutoLayoutAlignCenter:
_10|=CPViewMaxYMargin|CPViewMinYMargin;
break;
case GSAutoLayoutAlignMax:
_10|=CPViewMinYMargin;
break;
}
objj_msgSend(_b,"setAutoresizingMask:",_10);
var _13=objj_msgSend(_attributes,"objectForKey:","autoresizingMask");
if(_13!=nil){
var i,_14=objj_msgSend(_13,"length");
var _15=0;
for(i=0;i<_14;i++){
var c=objj_msgSend(_13,"characterAtIndex:",i);
switch(c){
case "h":
_15|=CPViewHeightSizable;
break;
case "w":
_15|=CPViewWidthSizable;
break;
case "x":
_15|=CPViewMinXMargin;
break;
case "X":
_15|=CPViewMaxXMargin;
break;
case "y":
_15|=CPViewMinYMargin;
break;
case "Y":
_15|=CPViewMaxYMargin;
break;
default:
break;
}
}
if(_15!=objj_msgSend(_b,"autoresizingMask")){
objj_msgSend(_b,"setAutoresizingMask:",_15);
}
}
var _16=objj_msgSend(_9,"boolValueForAttribute:","autoresizesSubviews");
if(_16==0){
objj_msgSend(_b,"setAutoresizesSubviews:",NO);
}else{
if(_16==1){
objj_msgSend(_b,"setAutoresizesSubviews:",YES);
}
}
if(objj_msgSend(_9,"boolValueForAttribute:","hidden")==1){
objj_msgSend(_b,"setHidden:",YES);
}
var _17=objj_msgSend(_9,"localizedStringValueForAttribute:","toolTip");
if(_17!=nil){
objj_msgSend(_b,"setToolTip:",_17);
}
if((objj_msgSend(_9,"class")==objj_msgSend(GSMarkupTagView,"class"))||objj_msgSend(_9,"shouldTreatContentAsSubviews")){
var i,_14=objj_msgSend(_content,"count");
for(i=0;i<_14;i++){
var v=objj_msgSend(_content,"objectAtIndex:",i);
var _18=objj_msgSend(v,"platformObject");
if(_18!=nil&&objj_msgSend(_18,"isKindOfClass:",objj_msgSend(CPView,"class"))){
objj_msgSend(_b,"addSubview:",_18);
}
}
}
return _b;
}
}),new objj_method(sel_getUid("shouldTreatContentAsSubviews"),function(_19,_1a){
with(_19){
return NO;
}
}),new objj_method(sel_getUid("gsAutoLayoutHAlignment"),function(_1b,_1c){
with(_1b){
var _1d;
if(objj_msgSend(_1b,"boolValueForAttribute:","hexpand")==1){
return GSAutoLayoutExpand;
}
_1d=objj_msgSend(_attributes,"objectForKey:","halign");
if(_1d!=nil){
if(objj_msgSend(_1d,"isEqualToString:","expand")){
return GSAutoLayoutExpand;
}else{
if(objj_msgSend(_1d,"isEqualToString:","wexpand")){
return GSAutoLayoutWeakExpand;
}else{
if(objj_msgSend(_1d,"isEqualToString:","min")){
return GSAutoLayoutAlignMin;
}else{
if(objj_msgSend(_1d,"isEqualToString:","left")){
return GSAutoLayoutAlignMin;
}else{
if(objj_msgSend(_1d,"isEqualToString:","center")){
return GSAutoLayoutAlignCenter;
}else{
if(objj_msgSend(_1d,"isEqualToString:","max")){
return GSAutoLayoutAlignMax;
}else{
if(objj_msgSend(_1d,"isEqualToString:","right")){
return GSAutoLayoutAlignMax;
}
}
}
}
}
}
}
}
return 255;
}
}),new objj_method(sel_getUid("gsAutoLayoutVAlignment"),function(_1e,_1f){
with(_1e){
var _20;
if(objj_msgSend(_1e,"boolValueForAttribute:","vexpand")==1){
return GSAutoLayoutExpand;
}
_20=objj_msgSend(_attributes,"objectForKey:","valign");
if(_20!=nil){
if(objj_msgSend(_20,"isEqualToString:","expand")){
return GSAutoLayoutExpand;
}else{
if(objj_msgSend(_20,"isEqualToString:","wexpand")){
return GSAutoLayoutWeakExpand;
}else{
if(objj_msgSend(_20,"isEqualToString:","min")){
return GSAutoLayoutAlignMin;
}else{
if(objj_msgSend(_20,"isEqualToString:","bottom")){
return GSAutoLayoutAlignMin;
}else{
if(objj_msgSend(_20,"isEqualToString:","center")){
return GSAutoLayoutAlignCenter;
}else{
if(objj_msgSend(_20,"isEqualToString:","max")){
return GSAutoLayoutAlignMax;
}else{
if(objj_msgSend(_20,"isEqualToString:","top")){
return GSAutoLayoutAlignMax;
}
}
}
}
}
}
}
}
return 255;
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("tagName"),function(_21,_22){
with(_21){
return "view";
}
}),new objj_method(sel_getUid("platformObjectClass"),function(_23,_24){
with(_23){
return objj_msgSend(CPView,"class");
}
}),new objj_method(sel_getUid("useInstanceOfAttribute"),function(_25,_26){
with(_25){
return YES;
}
})]);
p;42;Frameworks/Renaissance/GSMarkupTagObject.jt;6258;@STATIC;1.0;I;21;Foundation/CPBundle.ji;16;GSMarkupAwaker.jt;6192;
objj_executeFile("Foundation/CPBundle.j",NO);
objj_executeFile("GSMarkupAwaker.j",YES);
var _1=objj_getClass("CPObject");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"CPObject\"");
}
var _2=_1.isa;
class_addMethods(_2,[new objj_method(sel_getUid("isSubclassOfClass:"),function(_3,_4,_5){
with(_3){
var _6=objj_msgSend(_3,"class");
if(_6==_5){
return YES;
}else{
while(_6!=Nil){
_6=objj_msgSend(_6,"superclass");
if(_6==_5){
return YES;
}
}
return NO;
}
}
})]);
var _1=objj_allocateClassPair(CPObject,"GSMarkupTagObject"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_attributes"),new objj_ivar("_content"),new objj_ivar("_platformObject"),new objj_ivar("_localizer"),new objj_ivar("_awaker")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initWithAttributes:content:"),function(_7,_8,_9,_a){
with(_7){
_attributes=_9;
_content=_a;
return _7;
}
}),new objj_method(sel_getUid("dealloc"),function(_b,_c){
with(_b){
objj_msgSendSuper({receiver:_b,super_class:objj_getClass("GSMarkupTagObject").super_class},"dealloc");
}
}),new objj_method(sel_getUid("attributes"),function(_d,_e){
with(_d){
return _attributes;
}
}),new objj_method(sel_getUid("content"),function(_f,_10){
with(_f){
return _content;
}
}),new objj_method(sel_getUid("localizableStrings"),function(_11,_12){
with(_11){
var a=objj_msgSend(CPMutableArray,"array");
var att;
var i,_13;
_13=objj_msgSend(_content,"count");
for(i=0;i<_13;i++){
var o=objj_msgSend(_content,"objectAtIndex:",i);
if(objj_msgSend(o,"isKindOfClass:",objj_msgSend(GSMarkupTagObject,"class"))){
var k=objj_msgSend(o,"localizableStrings");
if(k!=nil){
objj_msgSend(a,"addObjectsFromArray:",k);
}
}else{
if(objj_msgSend(o,"isKindOfClass:",objj_msgSend(CPString,"class"))){
objj_msgSend(a,"addObject:",o);
}
}
}
att=objj_msgSend(objj_msgSend(_11,"class"),"localizableAttributes");
_13=objj_msgSend(att,"count");
for(i=0;i<_13;i++){
var _14=objj_msgSend(att,"objectAtIndex:",i);
var _15=objj_msgSend(_attributes,"objectForKey:",_14);
if(_15!=nil){
objj_msgSend(a,"addObject:",_15);
}
}
return a;
}
}),new objj_method(sel_getUid("setAwaker:"),function(_16,_17,_18){
with(_16){
var i,_19;
_awaker=_18;
_19=objj_msgSend(_content,"count");
for(i=0;i<_19;i++){
var o=objj_msgSend(_content,"objectAtIndex:",i);
if(objj_msgSend(o,"isKindOfClass:",objj_msgSend(GSMarkupTagObject,"class"))){
objj_msgSend(o,"setAwaker:",_18);
}
}
}
}),new objj_method(sel_getUid("setPlatformObject:"),function(_1a,_1b,_1c){
with(_1a){
if(_platformObject==_1c){
return;
}
if(_platformObject!=nil){
objj_msgSend(_awaker,"deregisterObject:",_platformObject);
}
_platformObject=_1c;
if(_1c!=nil){
objj_msgSend(_awaker,"registerObject:",_1c);
}
}
}),new objj_method(sel_getUid("platformObject"),function(_1d,_1e){
with(_1d){
if(_platformObject==nil){
var _1f=objj_msgSend(_1d,"allocPlatformObject");
_1f=objj_msgSend(_1d,"initPlatformObject:",_1f);
_1f=objj_msgSend(_1d,"postInitPlatformObject:",_1f);
objj_msgSend(_1d,"setPlatformObject:",_1f);
}
return _platformObject;
}
}),new objj_method(sel_getUid("allocPlatformObject"),function(_20,_21){
with(_20){
var _22=objj_msgSend(_20,"class");
var _23=objj_msgSend(_22,"platformObjectClass");
if(objj_msgSend(_22,"useInstanceOfAttribute")){
var _24=objj_msgSend(_attributes,"objectForKey:","instanceOf");
if(_24!=nil){
var _25=CPClassFromString(_24);
if(_25!=Nil){
if(objj_msgSend(_25,"isSubclassOfClass:",_23)){
_23=_25;
}
}
}
}
return objj_msgSend(_23,"alloc");
}
}),new objj_method(sel_getUid("initPlatformObject:"),function(_26,_27,_28){
with(_26){
return objj_msgSend(_28,"init");
}
}),new objj_method(sel_getUid("postInitPlatformObject:"),function(_29,_2a,_2b){
with(_29){
return _2b;
}
}),new objj_method(sel_getUid("description"),function(_2c,_2d){
with(_2c){
return objj_msgSend(CPString,"stringWithFormat:","%@\var attributes =%@\var content =%@\var platformObject =%@",objj_msgSendSuper({receiver:_2c,super_class:objj_getClass("GSMarkupTagObject").super_class},"description"),objj_msgSend(_attributes,"description"),objj_msgSend(_content,"description"),objj_msgSend(_platformObject,"description"));
}
}),new objj_method(sel_getUid("intValueForAttribute:"),function(_2e,_2f,_30){
with(_2e){
return parseInt(objj_msgSend(_attributes,"objectForKey:",_30));
}
}),new objj_method(sel_getUid("stringValueForAttribute:"),function(_31,_32,_33){
with(_31){
return objj_msgSend(_attributes,"objectForKey:",_33);
}
}),new objj_method(sel_getUid("boolValueForAttribute:"),function(_34,_35,_36){
with(_34){
var _37=objj_msgSend(_attributes,"objectForKey:",_36);
if(_37==nil){
return -1;
}
switch(objj_msgSend(_37,"length")){
case 1:
var a=objj_msgSend(_37,"characterAtIndex:",0);
switch(a){
case "y":
case "Y":
return 1;
case "n":
case "N":
return 0;
}
return -1;
case 2:
var a=objj_msgSend(_37,"characterAtIndex:",0);
if(a=="n"||a=="N"){
var b=objj_msgSend(_37,"characterAtIndex:",1);
if(b=="o"||b=="O"){
return 0;
}
}
return -1;
case 3:
var a=objj_msgSend(_37,"characterAtIndex:",0);
if(a=="y"||a=="Y"){
var b=objj_msgSend(_37,"characterAtIndex:",1);
if(b=="e"||b=="E"){
var c=objj_msgSend(_37,"characterAtIndex:",2);
if(c=="s"||c=="S"){
return 1;
}
}
}
return -1;
}
return -1;
}
}),new objj_method(sel_getUid("setLocalizer:"),function(_38,_39,_3a){
with(_38){
var i,_3b;
_localizer=_3a;
_3b=objj_msgSend(_content,"count");
for(i=0;i<_3b;i++){
var o=objj_msgSend(_content,"objectAtIndex:",i);
if(objj_msgSend(o,"isKindOfClass:",objj_msgSend(GSMarkupTagObject,"class"))){
objj_msgSend(o,"setLocalizer:",_3a);
}
}
}
}),new objj_method(sel_getUid("localizedStringValueForAttribute:"),function(_3c,_3d,_3e){
with(_3c){
var _3f=objj_msgSend(_attributes,"objectForKey:",_3e);
if(_3f==nil){
return nil;
}else{
return _3f;
return objj_msgSend(_localizer,"localizeString:",_3f);
}
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("tagName"),function(_40,_41){
with(_40){
return nil;
}
}),new objj_method(sel_getUid("localizableAttributes"),function(_42,_43){
with(_42){
return nil;
}
}),new objj_method(sel_getUid("platformObjectClass"),function(_44,_45){
with(_44){
return Nil;
}
}),new objj_method(sel_getUid("useInstanceOfAttribute"),function(_46,_47){
with(_46){
return NO;
}
})]);
p;39;Frameworks/Renaissance/GSMarkupAwaker.jt;1047;@STATIC;1.0;I;21;Foundation/CPObject.jt;1002;
objj_executeFile("Foundation/CPObject.j",NO);
var _1=objj_allocateClassPair(CPObject,"GSMarkupAwaker"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("init"),function(_3,_4){
with(_3){
_objects=objj_msgSend(CPMutableSet,"new");
return _3;
}
}),new objj_method(sel_getUid("dealloc"),function(_5,_6){
with(_5){
objj_msgSendSuper({receiver:_5,super_class:objj_getClass("GSMarkupAwaker").super_class},"dealloc");
}
}),new objj_method(sel_getUid("registerObject:"),function(_7,_8,_9){
with(_7){
objj_msgSend(_objects,"addObject:",_9);
}
}),new objj_method(sel_getUid("deregisterObject:"),function(_a,_b,_c){
with(_a){
objj_msgSend(_objects,"removeObject:",_c);
}
}),new objj_method(sel_getUid("awakeObjects"),function(_d,_e){
with(_d){
var e=objj_msgSend(_objects,"objectEnumerator");
var _f;
while((_f=objj_msgSend(e,"nextObject"))!=nil){
if(objj_msgSend(_f,"respondsToSelector:",sel_getUid("awakeFromGSMarkup"))){
objj_msgSend(_f,"awakeFromGSMarkup");
}
}
}
})]);
p;43;Frameworks/Renaissance/GSMarkupTagControl.jt;3886;@STATIC;1.0;t;3867;
var _1=objj_allocateClassPair(GSMarkupTagView,"GSMarkupTagControl"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initPlatformObject:"),function(_3,_4,_5){
with(_3){
_5=objj_msgSend(_5,"init");
var _6=objj_msgSend(_attributes,"objectForKey:","action");
if(_6!=nil){
var _7=CPSelectorFromString(_6);
if(_7==NULL){
CPLog("Warning: <%@> has non-existing action '%@'.  Ignored.",objj_msgSend(objj_msgSend(_3,"class"),"tagName"),_6);
}else{
objj_msgSend(_5,"setAction:",_7);
}
}
var _8=objj_msgSend(_3,"boolValueForAttribute:","continuous");
if(_8==1){
objj_msgSend(_5,"setContinuous:",YES);
}else{
if(_8==0){
objj_msgSend(_5,"setContinuous:",NO);
}
}
var _9=objj_msgSend(_3,"boolValueForAttribute:","enabled");
if(_9==1){
objj_msgSend(_5,"setEnabled:",YES);
}else{
if(_9==0){
objj_msgSend(_5,"setEnabled:",NO);
}
}
var _a=objj_msgSend(_attributes,"objectForKey:","tag");
if(_a!=nil){
objj_msgSend(_5,"setTag:",objj_msgSend(_a,"intValue"));
}
var _b=objj_msgSend(_attributes,"objectForKey:","sendActionOn");
if(_b!=nil){
var _c;
var _d=-1;
_c=objj_msgSend(CPDictionary,"dictionaryWithObjectsAndKeys:",objj_msgSend(CPNumber,"numberWithInt:",CPLeftMouseDownMask),"leftMouseDown",objj_msgSend(CPNumber,"numberWithInt:",CPLeftMouseUpMask),"leftMouseUp",objj_msgSend(CPNumber,"numberWithInt:",CPRightMouseDownMask),"rightMouseDown",objj_msgSend(CPNumber,"numberWithInt:",CPRightMouseUpMask),"rightMouseUp",objj_msgSend(CPNumber,"numberWithInt:",CPMouseMovedMask),"mouseMoved",objj_msgSend(CPNumber,"numberWithInt:",CPLeftMouseDraggedMask),"leftMouseDragged",objj_msgSend(CPNumber,"numberWithInt:",CPRightMouseDraggedMask),"rightMouseDragged",objj_msgSend(CPNumber,"numberWithInt:",CPMouseEnteredMask),"mouseEntered",objj_msgSend(CPNumber,"numberWithInt:",CPMouseExitedMask),"mouseExited",objj_msgSend(CPNumber,"numberWithInt:",CPKeyDownMask),"keyDown",objj_msgSend(CPNumber,"numberWithInt:",CPKeyUpMask),"keyUp",objj_msgSend(CPNumber,"numberWithInt:",CPFlagsChangedMask),"flagsChanged",objj_msgSend(CPNumber,"numberWithInt:",CPAppKitDefinedMask),"appKeyDefined",objj_msgSend(CPNumber,"numberWithInt:",CPSystemDefinedMask),"systemDefined",objj_msgSend(CPNumber,"numberWithInt:",CPApplicationDefinedMask),"applicationDefined",objj_msgSend(CPNumber,"numberWithInt:",CPPeriodicMask),"periodic",objj_msgSend(CPNumber,"numberWithInt:",CPCursorUpdateMask),"cursorUpdate",objj_msgSend(CPNumber,"numberWithInt:",CPScrollWheelMask),"scrollWheel",objj_msgSend(CPNumber,"numberWithInt:",CPOtherMouseDownMask),"otherMouseDown",objj_msgSend(CPNumber,"numberWithInt:",CPOtherMouseUpMask),"otherMouseUp",objj_msgSend(CPNumber,"numberWithInt:",CPOtherMouseDraggedMask),"otherMouseDragged",objj_msgSend(CPNumber,"numberWithInt:",CPAnyEventMask),"anyEvent");
_d=objj_msgSend(_3,"integerMaskValueForAttribute:withMaskValuesDictionary:","sendActionOn",_c);
objj_msgSend(_5,"sendActionOn:",_d);
}
var _e=objj_msgSend(_attributes,"objectForKey:","textAlignment");
if(_e==nil){
_e=objj_msgSend(_attributes,"objectForKey:","align");
if(_e!=nil){
CPLog("The 'align' attribute has been renamed to 'textAlignment'.  Please update your gsmarkup files");
}
}
if(_e!=nil){
if(objj_msgSend(_e,"isEqualToString:","left")){
objj_msgSend(_5,"setAlignment:",CPLeftTextAlignment);
}else{
if(objj_msgSend(_e,"isEqualToString:","right")){
objj_msgSend(_5,"setAlignment:",CPRightTextAlignment);
}else{
if(objj_msgSend(_e,"isEqualToString:","center")){
objj_msgSend(_5,"setAlignment:",CPCenterTextAlignment);
}
}
}
}
var f=objj_msgSend(_3,"fontValueForAttribute:","font");
if(f!=nil){
objj_msgSend(_5,"setFont:",f);
}
return _5;
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("tagName"),function(_f,_10){
with(_f){
return "control";
}
}),new objj_method(sel_getUid("platformObjectClass"),function(_11,_12){
with(_11){
return objj_msgSend(CPControl,"class");
}
})]);
p;44;Frameworks/Renaissance/GSAutoLayoutManager.jt;12314;@STATIC;1.0;t;12294;
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
p;33;Frameworks/Renaissance/Fireside.jt;18513;@STATIC;1.0;I;21;Foundation/CPObject.ji;16;FSMutableArray.jt;18446;
objj_executeFile("Foundation/CPObject.j",NO);
objj_executeFile("FSMutableArray.j",YES);
var _1=objj_getClass("CPArray");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"CPArray\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("allObjects"),function(_3,_4){
with(_3){
return _3;
}
})]);
var _1=objj_getClass("CPDictionary");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"CPDictionary\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("toJSON"),function(_5,_6){
with(_5){
var _7=objj_msgSend(_5,"allKeys");
var i,l=_7.length;
var o={};
for(i=0;i<l;i++){
var _8=_7[i];
o[_8]=objj_msgSend(_5,"objectForKey:",_8);
}
return JSON.stringify(o);
}
})]);
var _9;
var _1=objj_allocateClassPair(CPObject,"FSEntity"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_name"),new objj_ivar("_pk"),new objj_ivar("_columns"),new objj_ivar("_relations"),new objj_ivar("_store"),new objj_ivar("_pkcache"),new objj_ivar("_formatters")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("name"),function(_a,_b){
with(_a){
return _name;
}
}),new objj_method(sel_getUid("setName:"),function(_c,_d,_e){
with(_c){
_name=_e;
}
}),new objj_method(sel_getUid("pk"),function(_f,_10){
with(_f){
return _pk;
}
}),new objj_method(sel_getUid("setPk:"),function(_11,_12,_13){
with(_11){
_pk=_13;
}
}),new objj_method(sel_getUid("columns"),function(_14,_15){
with(_14){
return _columns;
}
}),new objj_method(sel_getUid("setColumns:"),function(_16,_17,_18){
with(_16){
_columns=_18;
}
}),new objj_method(sel_getUid("store"),function(_19,_1a){
with(_19){
return _store;
}
}),new objj_method(sel_getUid("setStore:"),function(_1b,_1c,_1d){
with(_1b){
_store=_1d;
}
}),new objj_method(sel_getUid("initWithName:andStore:"),function(_1e,_1f,_20,_21){
with(_1e){
_1e=objj_msgSendSuper({receiver:_1e,super_class:objj_getClass("FSEntity").super_class},"init");
if(_1e){
_store=_21;
_name=_20;
}
return _1e;
}
}),new objj_method(sel_getUid("init"),function(_22,_23){
with(_22){
return objj_msgSend(_22,"initWithName:andStore:",nil,nil);
}
}),new objj_method(sel_getUid("createObject"),function(_24,_25){
with(_24){
return objj_msgSend(_24,"createObjectWithDictionary:",nil);
}
}),new objj_method(sel_getUid("createObjectWithDictionary:"),function(_26,_27,_28){
with(_26){
var r=objj_msgSend(objj_msgSend(FSObject,"alloc"),"initWithEntity:",_26);
if(_28){
r._changes=_28;
var _29=objj_msgSend(_28,"allKeys");
var i,l=objj_msgSend(_29,"count");
for(i=0;i<l;i++){
var _2a=objj_msgSend(_29,"objectAtIndex:",i);
var _2b=objj_msgSend(_28,"objectForKey:",_2a);
var _2c;
if(_2c=objj_msgSend(_26,"formatterForColumnName:",_2a)){
_2b=objj_msgSend(_2c,"objectValueForString:error:",_2b,nil);
objj_msgSend(_28,"setObject:forKey:",_2b,_2a);
}
}
}
return r;
}
}),new objj_method(sel_getUid("insertObject:"),function(_2d,_2e,_2f){
with(_2d){
if(objj_msgSend(_2f,"isKindOfClass:",objj_msgSend(CPDictionary,"class"))){
_2f=objj_msgSend(_2d,"createObjectWithDictionary:",_2f);
}else{
if(!objj_msgSend(_2f,"isKindOfClass:",objj_msgSend(FSObject,"class"))){
}
}
objj_msgSend(objj_msgSend(_2d,"store"),"insertObject:",_2f);
return _2f;
}
}),new objj_method(sel_getUid("deleteObject:"),function(_30,_31,_32){
with(_30){
objj_msgSend(objj_msgSend(_30,"store"),"deleteObject:",_32);
}
}),new objj_method(sel_getUid("setFormatter:forColumnName:"),function(_33,_34,_35,_36){
with(_33){
if(!_formatters){
_formatters=objj_msgSend(CPMutableDictionary,"new");
}
objj_msgSend(_formatters,"setObject:forKey:",_35,_36);
}
}),new objj_method(sel_getUid("formatterForColumnName:"),function(_37,_38,_39){
with(_37){
if(!_formatters){
return nil;
}
return objj_msgSend(_formatters,"objectForKey:",_39);
}
}),new objj_method(sel_getUid("objectWithPK:"),function(_3a,_3b,_3c){
with(_3a){
var a=objj_msgSend(objj_msgSend(_3a,"store"),"fetchObjectsWithKey:equallingValue:inEntity:",objj_msgSend(_3a,"pk"),_3c,_3a);
if(objj_msgSend(a,"count")==1){
return objj_msgSend(a,"objectAtIndex:",0);
}
return nil;
}
}),new objj_method(sel_getUid("relationOfName:"),function(_3d,_3e,_3f){
with(_3d){
var _40=objj_msgSend(_relations,"allObjects");
var i,l=objj_msgSend(_40,"count");
for(i=0;i<l;i++){
var r=_40[i];
if(objj_msgSend(r,"name")==_3f){
return r;
}
}
return nil;
}
}),new objj_method(sel_getUid("relationships"),function(_41,_42){
with(_41){
return objj_msgSend(_relations,"allObjects");
}
}),new objj_method(sel_getUid("addRelationship:"),function(_43,_44,_45){
with(_43){
if(!_relations){
_relations=objj_msgSend(CPSet,"setWithObject:",_45);
}else{
objj_msgSend(_relations,"addObject:",_45);
}
}
}),new objj_method(sel_getUid("allObjects"),function(_46,_47){
with(_46){
return objj_msgSend(_store,"fetchAllObjectsInEntity:",_46);
}
}),new objj_method(sel_getUid("_registerObjectInPKCache:"),function(_48,_49,_4a){
with(_48){
if(!_pkcache){
_pkcache=objj_msgSend(CPMutableArray,"new");
}
_pkcache[objj_msgSend(_4a,"valueForKey:",_pk)]=_4a;
}
}),new objj_method(sel_getUid("_registeredObjectForPK:"),function(_4b,_4c,_4d){
with(_4b){
if(!_pkcache){
return nil;
}
return _pkcache[_4d];
}
}),new objj_method(sel_getUid("_hasCaches"),function(_4e,_4f){
with(_4e){
var _50=objj_msgSend(_relations,"allObjects");
var i,l=objj_msgSend(_50,"count");
for(i=0;i<l;i++){
var r=objj_msgSend(_50,"objectAtIndex:",i);
if(r._target_cache&&objj_msgSend(r._target_cache,"count")){
return YES;
}
}
return NO;
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("relationshipsWithTargetProperty:"),function(_51,_52,_53){
with(_51){
var ret=[];
if(!_9){
return ret;
}
var i,l=_9.length;
for(i=0;i<l;i++){
var r=_9[i];
if(objj_msgSend(r,"targetColumn")==_53){
objj_msgSend(ret,"addObject:",r);
}
}
return ret;
}
}),new objj_method(sel_getUid("_registerRelationship:"),function(_54,_55,_56){
with(_54){
if(!_9){
_9=objj_msgSend(CPMutableArray,"new");
}
return objj_msgSend(_9,"addObject:",_56);
}
})]);
FSRelationshipTypeToOne=0;
FSRelationshipTypeToMany=1;
var _1=objj_allocateClassPair(CPObject,"FSRelationship"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_name"),new objj_ivar("_source"),new objj_ivar("_target"),new objj_ivar("_bindingColumn"),new objj_ivar("_targetColumn"),new objj_ivar("_type"),new objj_ivar("_target_cache")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("name"),function(_57,_58){
with(_57){
return _name;
}
}),new objj_method(sel_getUid("setName:"),function(_59,_5a,_5b){
with(_59){
_name=_5b;
}
}),new objj_method(sel_getUid("source"),function(_5c,_5d){
with(_5c){
return _source;
}
}),new objj_method(sel_getUid("setSource:"),function(_5e,_5f,_60){
with(_5e){
_source=_60;
}
}),new objj_method(sel_getUid("target"),function(_61,_62){
with(_61){
return _target;
}
}),new objj_method(sel_getUid("setTarget:"),function(_63,_64,_65){
with(_63){
_target=_65;
}
}),new objj_method(sel_getUid("bindingColumn"),function(_66,_67){
with(_66){
return _bindingColumn;
}
}),new objj_method(sel_getUid("setBindingColumn:"),function(_68,_69,_6a){
with(_68){
_bindingColumn=_6a;
}
}),new objj_method(sel_getUid("_targetColumn"),function(_6b,_6c){
with(_6b){
return _targetColumn;
}
}),new objj_method(sel_getUid("setTargetColumn:"),function(_6d,_6e,_6f){
with(_6d){
_targetColumn=_6f;
}
}),new objj_method(sel_getUid("type"),function(_70,_71){
with(_70){
return _type;
}
}),new objj_method(sel_getUid("setType:"),function(_72,_73,_74){
with(_72){
_type=_74;
}
}),new objj_method(sel_getUid("initWithName:source:andTargetEntity:"),function(_75,_76,_77,_78,_79){
with(_75){
_75=objj_msgSendSuper({receiver:_75,super_class:objj_getClass("FSRelationship").super_class},"init");
if(_75){
_target=_79;
_name=_77;
_source=_78;
_type=FSRelationshipTypeToOne;
}
objj_msgSend(FSEntity,"_registerRelationship:",_75);
return _75;
}
}),new objj_method(sel_getUid("init"),function(_7a,_7b){
with(_7a){
return objj_msgSend(_7a,"initWithName:source:andTargetEntity:",nil,nil,nil);
}
}),new objj_method(sel_getUid("targetColumn"),function(_7c,_7d){
with(_7c){
if(_targetColumn&&_targetColumn.length){
return _targetColumn;
}
return objj_msgSend(_target,"pk");
}
}),new objj_method(sel_getUid("fetchObjectsForKey:"),function(_7e,_7f,_80){
with(_7e){
if(!_80){
return nil;
}
var _81;
if(!_target_cache){
_target_cache=[];
}
if(_81=_target_cache[_80]){
return _81;
}
var res=objj_msgSend(objj_msgSend(_target,"store"),"fetchObjectsWithKey:equallingValue:inEntity:",objj_msgSend(_7e,"targetColumn"),_80,_target);
_target_cache[_80]=res;
return res;
}
}),new objj_method(sel_getUid("_invalidateCache"),function(_82,_83){
with(_82){
_target_cache=[];
}
})]);
var _1=objj_allocateClassPair(CPObject,"FSObject"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_data"),new objj_ivar("_changes"),new objj_ivar("_formatters"),new objj_ivar("_entity")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("entity"),function(_84,_85){
with(_84){
return _entity;
}
}),new objj_method(sel_getUid("setEntity:"),function(_86,_87,_88){
with(_86){
_entity=_88;
}
}),new objj_method(sel_getUid("initWithEntity:"),function(_89,_8a,_8b){
with(_89){
_89=objj_msgSendSuper({receiver:_89,super_class:objj_getClass("FSObject").super_class},"init");
if(_89){
_entity=_8b;
}
return _89;
}
}),new objj_method(sel_getUid("_setDataFromJSONObject:"),function(_8c,_8d,o){
with(_8c){
_data=objj_msgSend(CPMutableDictionary,"dictionary");
var _8e=objj_msgSend(objj_msgSend(_entity,"columns"),"allObjects");
var i,l=_8e.length;
for(i=0;i<l;i++){
var _8f=_8e[i];
objj_msgSend(_data,"setObject:forKey:",o[_8f],_8f);
}
}
}),new objj_method(sel_getUid("setFormatter:forColumnName:"),function(_90,_91,_92,_93){
with(_90){
if(!_formatters){
_formatters=objj_msgSend(CPMutableDictionary,"new");
}
objj_msgSend(_formatters,"setObject:forKey:",_92,_93);
}
}),new objj_method(sel_getUid("formatterForColumnName:"),function(_94,_95,_96){
with(_94){
if(!_formatters){
return nil;
}
return objj_msgSend(_formatters,"objectForKey:",_96);
}
}),new objj_method(sel_getUid("description"),function(_97,_98){
with(_97){
return objj_msgSend(_data,"description");
}
}),new objj_method(sel_getUid("typeOfKey:"),function(_99,_9a,_9b){
with(_99){
if(objj_msgSend(objj_msgSend(_entity,"columns"),"containsObject:",_9b)){
return 0;
}
if(objj_msgSend(_entity,"relationOfName:",_9b)){
return 1;
}
return CPNotFound;
}
}),new objj_method(sel_getUid("valueForKey:"),function(_9c,_9d,_9e){
with(_9c){
var _9f=objj_msgSend(_9c,"typeOfKey:",_9e);
if(_9f==0){
if(!_data){
}
var o=objj_msgSend(_changes,"objectForKey:",_9e);
if(!o){
o=objj_msgSend(_data,"objectForKey:",_9e);
}
if(o){
if(!objj_msgSend(o,"isKindOfClass:",objj_msgSend(CPString,"class"))){
o=objj_msgSend(o,"stringValue");
}
}
var _a0=objj_msgSend(_9c,"formatterForColumnName:",_9e);
if(_a0||(_a0=objj_msgSend(_entity,"formatterForColumnName:",_9e))){
return objj_msgSend(_a0,"stringForObjectValue:",o);
}else{
return o;
}
}else{
if(_9f==1){
var rel=objj_msgSend(_entity,"relationOfName:",_9e);
var _a1=objj_msgSend(rel,"bindingColumn");
if(!_a1){
_a1=objj_msgSend(_entity,"pk");
}
var _a2=(objj_msgSend(rel,"type")==FSRelationshipTypeToMany);
var _a3=objj_msgSend(rel,"fetchObjectsForKey:",objj_msgSend(_9c,"valueForKey:",_a1));
if(_a2){
var r=objj_msgSend(objj_msgSend(FSMutableArray,"alloc"),"initWithArray:ofEntity:",_a3,objj_msgSend(rel,"target"));
var _a4=objj_msgSend(CPDictionary,"dictionaryWithObject:forKey:",objj_msgSend(_9c,"valueForKey:",_a1),rel._targetColumn);
objj_msgSend(r,"setDefaults:",_a4);
return r;
}else{
return (_a3&&_a3.length)?objj_msgSend(_a3,"objectAtIndex:",0):nil;
}
}else{
var _a5=sel_getName(_9e);
if(_a5&&objj_msgSend(_9c,"respondsToSelector:",_a5)){
return objj_msgSend(_9c,"performSelector:",_a5);
}else{
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,"Key "+_9e+" is not a column in entity "+objj_msgSend(_entity,"name"));
}
}
}
}
}),new objj_method(sel_getUid("setValue:forKey:"),function(_a6,_a7,_a8,_a9){
with(_a6){
var _aa=objj_msgSend(_a6,"typeOfKey:",_a9);
var _ab=objj_msgSend(_a6,"valueForKey:",_a9);
if(_ab===_a8){
return;
}
if(_aa==0){
if(!_changes){
_changes=objj_msgSend(CPMutableDictionary,"dictionary");
}
objj_msgSend(_a6,"willChangeValueForKey:",_a9);
var _ac=objj_msgSend(_a6,"formatterForColumnName:",_a9);
if(_ac||(_ac=objj_msgSend(_entity,"formatterForColumnName:",_a9))){
_a8=objj_msgSend(_ac,"objectValueForString:error:",_a8,nil);
}
objj_msgSend(_changes,"setObject:forKey:",_a8,_a9);
objj_msgSend(_a6,"didChangeValueForKey:",_a9);
objj_msgSend(objj_msgSend(_entity,"store"),"writeChangesInObject:",_a6);
var _ad=objj_msgSend(FSEntity,"relationshipsWithTargetProperty:",_a9);
if(_ad){
var i,l=_ad.length;
for(i=0;i<l;i++){
var rel=_ad[i];
if(objj_msgSend(rel,"type")==FSRelationshipTypeToMany){
objj_msgSend(rel,"_invalidateCache");
var _ae=objj_msgSend(objj_msgSend(rel,"source"),"objectWithPK:",_ab);
var _af=objj_msgSend(rel,"fetchObjectsForKey:",_ab);
objj_msgSend(_ae,"willChangeValueForKey:",objj_msgSend(rel,"name"));
objj_msgSend(_ae,"setValue:forKey:",_af,objj_msgSend(rel,"name"));
objj_msgSend(_ae,"didChangeValueForKey:",objj_msgSend(rel,"name"));
}
}
}
}else{
if(_aa==1){
}else{
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,"Key "+_a9+" is not a column");
}
}
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_b0,_b1,_b2){
with(_b0){
objj_msgSendSuper({receiver:_b0,super_class:objj_getClass("FSObject").super_class},"encodeWithCoder:",_b2);
var _b3=objj_msgSend(_data,"copy");
if(_changes){
objj_msgSend(_b3,"addEntriesFromDictionary:",_changes);
}
objj_msgSend(_b2,"_encodeDictionaryOfObjects:forKey:",_b3,"FS.objects");
}
}),new objj_method(sel_getUid("initWithCoder:"),function(_b4,_b5,_b6){
with(_b4){
_b4=objj_msgSendSuper({receiver:_b4,super_class:objj_getClass("FSObject").super_class},"initWithCoder:",_b6);
if(_b4){
_changes=objj_msgSend(_b6,"_decodeDictionaryOfObjectsForKey:","FS.objects");
}
return _b4;
}
})]);
var _1=objj_allocateClassPair(CPObject,"FSStore"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_baseURL"),new objj_ivar("_fetchLimit")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("baseURL"),function(_b7,_b8){
with(_b7){
return _baseURL;
}
}),new objj_method(sel_getUid("setBaseURL:"),function(_b9,_ba,_bb){
with(_b9){
_baseURL=_bb;
}
}),new objj_method(sel_getUid("fetchLimit"),function(_bc,_bd){
with(_bc){
return _fetchLimit;
}
}),new objj_method(sel_getUid("setFetchLimit:"),function(_be,_bf,_c0){
with(_be){
_fetchLimit=_c0;
}
}),new objj_method(sel_getUid("requestForAddressingObjectsWithKey:equallingValue:inEntity:"),function(_c1,_c2,_c3,_c4,_c5){
with(_c1){
var _c6=objj_msgSend(CPURLRequest,"requestWithURL:",objj_msgSend(_c1,"baseURL")+"/"+objj_msgSend(_c5,"name")+"/"+_c3+"/"+_c4);
return _c6;
}
}),new objj_method(sel_getUid("requestForAddressingAllObjectsInEntity:"),function(_c7,_c8,_c9){
with(_c7){
return objj_msgSend(CPURLRequest,"requestWithURL:",objj_msgSend(_c7,"baseURL")+"/"+objj_msgSend(_c9,"name"));
}
}),new objj_method(sel_getUid("initWithBaseURL:"),function(_ca,_cb,_cc){
with(_ca){
_ca=objj_msgSendSuper({receiver:_ca,super_class:objj_getClass("FSStore").super_class},"init");
if(_ca){
_baseURL=_cc;
}
return _ca;
}
}),new objj_method(sel_getUid("fetchObjectsForURLRequest:inEntity:"),function(_cd,_ce,_cf,_d0){
with(_cd){
var _d1=objj_msgSend(CPURLConnection,"sendSynchronousRequest:returningResponse:",_cf,nil);
var j=JSON.parse(objj_msgSend(_d1,"rawString"));
var a=objj_msgSend(CPMutableArray,"new");
var i,l=j.length;
for(i=0;i<l;i++){
var pk=j[i][objj_msgSend(_d0,"pk")];
var _d2;
if(_d2=objj_msgSend(_d0,"_registeredObjectForPK:",pk)){
objj_msgSend(a,"addObject:",_d2);
}else{
var t=objj_msgSend(objj_msgSend(FSObject,"alloc"),"initWithEntity:",_d0);
objj_msgSend(t,"_setDataFromJSONObject:",j[i]);
objj_msgSend(_d0,"_registerObjectInPKCache:",t);
objj_msgSend(a,"addObject:",t);
}
}
return a;
}
}),new objj_method(sel_getUid("fetchAllObjectsInEntity:"),function(_d3,_d4,_d5){
with(_d3){
return objj_msgSend(_d3,"fetchObjectsForURLRequest:inEntity:",objj_msgSend(_d3,"requestForAddressingAllObjectsInEntity:",_d5),_d5);
}
}),new objj_method(sel_getUid("fetchObjectsWithKey:equallingValue:inEntity:"),function(_d6,_d7,_d8,_d9,_da){
with(_d6){
if(_d8==objj_msgSend(_da,"pk")){
var _db;
if(_db=objj_msgSend(_da,"_registeredObjectForPK:",_d9)){
return objj_msgSend(CPArray,"arrayWithObject:",_db);
}
}
var _dc=objj_msgSend(_d6,"requestForAddressingObjectsWithKey:equallingValue:inEntity:",_d8,_d9,_da);
return objj_msgSend(_d6,"fetchObjectsForURLRequest:inEntity:",_dc,_da);
}
}),new objj_method(sel_getUid("writeChangesInObject:"),function(_dd,_de,obj){
with(_dd){
if(objj_msgSend(objj_msgSend(obj,"entity"),"pk")===undefined){
return;
}
if(!obj._changes){
return;
}
var _df=objj_msgSend(_dd,"requestForAddressingObjectsWithKey:equallingValue:inEntity:",objj_msgSend(objj_msgSend(obj,"entity"),"pk"),objj_msgSend(obj,"valueForKey:",objj_msgSend(objj_msgSend(obj,"entity"),"pk")),objj_msgSend(obj,"entity"));
objj_msgSend(_df,"setHTTPMethod:","PUT");
objj_msgSend(_df,"setHTTPBody:",objj_msgSend(obj._changes,"toJSON"));
objj_msgSend(CPURLConnection,"sendSynchronousRequest:returningResponse:",_df,nil);
}
}),new objj_method(sel_getUid("insertObject:"),function(_e0,_e1,_e2){
with(_e0){
var _e3=objj_msgSend(_e2,"entity");
var _e4=objj_msgSend(CPURLRequest,"requestWithURL:",objj_msgSend(_e0,"baseURL")+"/"+objj_msgSend(_e3,"name")+"/"+objj_msgSend(_e3,"pk"));
objj_msgSend(_e4,"setHTTPMethod:","POST");
objj_msgSend(_e4,"setHTTPBody:",objj_msgSend(_e2._changes,"toJSON"));
var _e5=objj_msgSend(CPURLConnection,"sendSynchronousRequest:returningResponse:",_e4,nil);
var j=JSON.parse(objj_msgSend(_e5,"rawString"));
var pk=j["pk"];
objj_msgSend(_e2,"willChangeValueForKey:",objj_msgSend(_e3,"pk"));
if(!_e2._data){
_e2._data=objj_msgSend(CPMutableDictionary,"new");
}
objj_msgSend(_e2._data,"setObject:forKey:",pk,objj_msgSend(_e3,"pk"));
objj_msgSend(_e2,"didChangeValueForKey:",objj_msgSend(_e3,"pk"));
}
}),new objj_method(sel_getUid("deleteObject:"),function(_e6,_e7,obj){
with(_e6){
var _e8=objj_msgSend(_e6,"requestForAddressingObjectsWithKey:equallingValue:inEntity:",objj_msgSend(objj_msgSend(obj,"entity"),"pk"),objj_msgSend(obj,"valueForKey:",objj_msgSend(objj_msgSend(obj,"entity"),"pk")),objj_msgSend(obj,"entity"));
objj_msgSend(_e8,"setHTTPMethod:","DELETE");
objj_msgSend(CPURLConnection,"sendSynchronousRequest:returningResponse:",_e8,nil);
}
})]);
p;39;Frameworks/Renaissance/FSMutableArray.jt;7133;@STATIC;1.0;I;21;Foundation/CPObject.jt;7088;
objj_executeFile("Foundation/CPObject.j",NO);
var _1=objj_allocateClassPair(CPMutableArray,"FSMutableArray"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_entity"),new objj_ivar("_proxyObject"),new objj_ivar("_defaults")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("entity"),function(_3,_4){
with(_3){
return _entity;
}
}),new objj_method(sel_getUid("setEntity:"),function(_5,_6,_7){
with(_5){
_entity=_7;
}
}),new objj_method(sel_getUid("defaults"),function(_8,_9){
with(_8){
return _defaults;
}
}),new objj_method(sel_getUid("setDefaults:"),function(_a,_b,_c){
with(_a){
_defaults=_c;
}
}),new objj_method(sel_getUid("initWithArray:ofEntity:"),function(_d,_e,_f,_10){
with(_d){
_d=objj_msgSendSuper({receiver:_d,super_class:objj_getClass("FSMutableArray").super_class},"init");
_proxyObject=_f;
_entity=_10;
return _d;
}
}),new objj_method(sel_getUid("copy"),function(_11,_12){
with(_11){
var i=0,_13=[],_14=objj_msgSend(_11,"count");
for(;i<_14;i++){
objj_msgSend(_13,"addObject:",objj_msgSend(_11,"objectAtIndex:",i));
}
return _13;
}
}),new objj_method(sel_getUid("_representedObject"),function(_15,_16){
with(_15){
return _proxyObject;
}
}),new objj_method(sel_getUid("_setRepresentedObject:"),function(_17,_18,_19){
with(_17){
objj_msgSend(_proxyObject,"setArray:",_19);
}
}),new objj_method(sel_getUid("count"),function(_1a,_1b){
with(_1a){
return objj_msgSend(objj_msgSend(_1a,"_representedObject"),"count");
}
}),new objj_method(sel_getUid("indexOfObject:inRange:"),function(_1c,_1d,_1e,_1f){
with(_1c){
var _20=_1f.location,_21=_1f.length,_22=!!_1e.isa;
for(;_20<_21;++_20){
var _23=objj_msgSend(_1c,"objectAtIndex:",_20);
if(_1e===_23||_22&&!!_23.isa&&objj_msgSend(_1e,"isEqual:",_23)){
return _20;
}
}
return CPNotFound;
}
}),new objj_method(sel_getUid("indexOfObject:"),function(_24,_25,_26){
with(_24){
return objj_msgSend(_24,"indexOfObject:inRange:",_26,CPMakeRange(0,objj_msgSend(_24,"count")));
}
}),new objj_method(sel_getUid("indexOfObjectIdenticalTo:inRange:"),function(_27,_28,_29,_2a){
with(_27){
var _2b=_2a.location,_2c=_2a.length;
for(;_2b<_2c;++_2b){
if(_29===objj_msgSend(_27,"objectAtIndex:",_2b)){
return _2b;
}
}
return CPNotFound;
}
}),new objj_method(sel_getUid("indexOfObjectIdenticalTo:"),function(_2d,_2e,_2f){
with(_2d){
return objj_msgSend(_2d,"indexOfObjectIdenticalTo:inRange:",_2f,CPMakeRange(0,objj_msgSend(_2d,"count")));
}
}),new objj_method(sel_getUid("objectAtIndex:"),function(_30,_31,_32){
with(_30){
return objj_msgSend(objj_msgSend(_30,"objectsAtIndexes:",objj_msgSend(CPIndexSet,"indexSetWithIndex:",_32)),"firstObject");
}
}),new objj_method(sel_getUid("objectsAtIndexes:"),function(_33,_34,_35){
with(_33){
return objj_msgSend(objj_msgSend(_33,"_representedObject"),"objectsAtIndexes:",_35);
}
}),new objj_method(sel_getUid("_addToDBObject:"),function(_36,_37,_38){
with(_36){
if(_defaults){
if(objj_msgSend(_38,"isKindOfClass:",objj_msgSend(CPDictionary,"class"))){
objj_msgSend(_38,"addEntriesFromDictionary:",_defaults);
}else{
if(objj_msgSend(_38,"isKindOfClass:",objj_msgSend(FSObject,"class"))){
if(!_38._changes){
_38._changes=objj_msgSend(CPMutableDictionary,"dictionary");
}
objj_msgSend(_38._changes,"addEntriesFromDictionary:",_defaults);
}
}
}
return objj_msgSend(_entity,"insertObject:",_38);
}
}),new objj_method(sel_getUid("addObject:"),function(_39,_3a,_3b){
with(_39){
objj_msgSend(_39,"insertObject:atIndex:",_3b,objj_msgSend(_39,"count"));
}
}),new objj_method(sel_getUid("addObjectsFromArray:"),function(_3c,_3d,_3e){
with(_3c){
var _3f=0,_40=objj_msgSend(_3e,"count");
objj_msgSend(_3c,"insertObjects:atIndexes:",_3e,objj_msgSend(CPIndexSet,"indexSetWithIndexesInRange:",CPMakeRange(objj_msgSend(_3c,"count"),_40)));
}
}),new objj_method(sel_getUid("insertObject:atIndex:"),function(_41,_42,_43,_44){
with(_41){
objj_msgSend(_41,"insertObjects:atIndexes:",[_43],objj_msgSend(CPIndexSet,"indexSetWithIndex:",_44));
}
}),new objj_method(sel_getUid("insertObjects:atIndexes:"),function(_45,_46,_47,_48){
with(_45){
var _49=objj_msgSend(objj_msgSend(_45,"_representedObject"),"copy");
var _4a=[];
var l=objj_msgSend(_47,"count");
for(var i=0;i<l;i++){
var o=objj_msgSend(_47,"objectAtIndex:",i);
if(_entity){
o=objj_msgSend(_45,"_addToDBObject:",o);
}
objj_msgSend(_4a,"addObject:",o);
}
objj_msgSend(_49,"insertObjects:atIndexes:",_4a,_48);
objj_msgSend(_45,"_setRepresentedObject:",_49);
}
}),new objj_method(sel_getUid("removeObject:"),function(_4b,_4c,_4d){
with(_4b){
objj_msgSend(_4b,"removeObject:inRange:",_4d,CPMakeRange(0,objj_msgSend(_4b,"count")));
}
}),new objj_method(sel_getUid("removeObjectsInArray:"),function(_4e,_4f,_50){
with(_4e){
var l=objj_msgSend(_50,"count");
for(var i=0;i<l;i++){
objj_msgSend(_entity,"deleteObject:",objj_msgSend(_50,"objectAtIndex:",i));
}
var _51=objj_msgSend(objj_msgSend(_4e,"_representedObject"),"copy");
objj_msgSend(_51,"removeObjectsInArray:",_50);
objj_msgSend(_4e,"_setRepresentedObject:",_51);
}
}),new objj_method(sel_getUid("removeObject:inRange:"),function(_52,_53,_54,_55){
with(_52){
var _56;
while((_56=objj_msgSend(_52,"indexOfObject:inRange:",_54,_55))!==CPNotFound){
objj_msgSend(_entity,"deleteObject:",objj_msgSend(_52,"objectAtIndex:",_56));
objj_msgSend(_52,"removeObjectAtIndex:",_56);
_55=CPIntersectionRange(CPMakeRange(_56,length-_56),_55);
}
}
}),new objj_method(sel_getUid("removeLastObject"),function(_57,_58){
with(_57){
objj_msgSend(_57,"removeObjectsAtIndexes:",objj_msgSend(CPIndexSet,"indexSetWithIndex:",objj_msgSend(_57,"count")-1));
}
}),new objj_method(sel_getUid("removeObjectAtIndex:"),function(_59,_5a,_5b){
with(_59){
objj_msgSend(_59,"removeObjectsAtIndexes:",objj_msgSend(CPIndexSet,"indexSetWithIndex:",_5b));
}
}),new objj_method(sel_getUid("removeObjectsAtIndexes:"),function(_5c,_5d,_5e){
with(_5c){
var _5f=objj_msgSend(objj_msgSend(_5c,"_representedObject"),"copy");
var _60=objj_msgSend(objj_msgSend(_5c,"_representedObject"),"objectsAtIndexes:",_5e);
var l=objj_msgSend(_60,"count");
for(var i=0;i<l;i++){
objj_msgSend(_entity,"deleteObject:",objj_msgSend(_60,"objectAtIndex:",i));
}
objj_msgSend(_5f,"removeObjectsAtIndexes:",_5e);
objj_msgSend(_5c,"_setRepresentedObject:",_5f);
}
}),new objj_method(sel_getUid("replaceObjectAtIndex:withObject:"),function(_61,_62,_63,_64){
with(_61){
objj_msgSend(_61,"replaceObjectsAtIndexes:withObjects:",objj_msgSend(CPIndexSet,"indexSetWithIndex:",_63),[_64]);
}
}),new objj_method(sel_getUid("replaceObjectsAtIndexes:withObjects:"),function(_65,_66,_67,_68){
with(_65){
var _69=objj_msgSend(objj_msgSend(_65,"_representedObject"),"copy");
objj_msgSend(_69,"replaceObjectsAtIndexes:withObjects:",_67,_68);
objj_msgSend(_65,"_setRepresentedObject:",_69);
}
}),new objj_method(sel_getUid("description"),function(_6a,_6b){
with(_6a){
return objj_msgSend(objj_msgSend(_6a,"_representedObject"),"description");
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("alloc"),function(_6c,_6d){
with(_6c){
var _6e=[];
_6e.isa=_6c;
var _6f=class_copyIvarList(_6c),_70=_6f.length;
while(_70--){
_6e[ivar_getName(_6f[_70])]=nil;
}
return _6e;
}
})]);
p;44;Frameworks/Renaissance/GSMarkupTagFireside.jt;5584;@STATIC;1.0;i;19;GSMarkupTagObject.jI;21;Foundation/CPObject.ji;10;Fireside.jt;5500;
objj_executeFile("GSMarkupTagObject.j",YES);
objj_executeFile("Foundation/CPObject.j",NO);
objj_executeFile("Fireside.j",YES);
var _1=objj_allocateClassPair(GSMarkupTagObject,"GSMarkupColumn"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("name"),function(_3,_4){
with(_3){
return objj_msgSend(_attributes,"objectForKey:","name");
}
}),new objj_method(sel_getUid("isPK"),function(_5,_6){
with(_5){
return objj_msgSend(_5,"boolValueForAttribute:","primaryKey")==1;
}
}),new objj_method(sel_getUid("allocPlatformObject"),function(_7,_8){
with(_7){
return nil;
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("tagName"),function(_9,_a){
with(_9){
return "column";
}
})]);
var _1=objj_allocateClassPair(GSMarkupTagObject,"GSMarkupRelationship"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("name"),function(_b,_c){
with(_b){
return objj_msgSend(_attributes,"objectForKey:","name");
}
}),new objj_method(sel_getUid("target"),function(_d,_e){
with(_d){
return objj_msgSend(_attributes,"objectForKey:","target");
}
}),new objj_method(sel_getUid("targetColumn"),function(_f,_10){
with(_f){
return objj_msgSend(_attributes,"objectForKey:","targetColumn");
}
}),new objj_method(sel_getUid("bindingColumn"),function(_11,_12){
with(_11){
return objj_msgSend(_attributes,"objectForKey:","bindingColumn");
}
}),new objj_method(sel_getUid("isToMany"),function(_13,_14){
with(_13){
return objj_msgSend(_attributes,"objectForKey:","type")=="toMany";
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("tagName"),function(_15,_16){
with(_15){
return "relationship";
}
}),new objj_method(sel_getUid("platformObjectClass"),function(_17,_18){
with(_17){
return objj_msgSend(FSRelationship,"class");
}
})]);
var _1=objj_allocateClassPair(GSMarkupTagObject,"GSMarkupEntity"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initPlatformObject:"),function(_19,_1a,_1b){
with(_19){
var _1c=objj_msgSend(_attributes,"objectForKey:","store");
var _1d=objj_msgSend(_attributes,"objectForKey:","id");
_1b=objj_msgSend(_1b,"initWithName:andStore:",_1d,_1c);
var _1e=objj_msgSend(CPMutableSet,"new");
var _1f;
var i,_20=_content.length;
for(i=0;i<_20;i++){
var v=_content[i];
if(objj_msgSend(v,"isKindOfClass:",objj_msgSend(GSMarkupColumn,"class"))){
if(objj_msgSend(v,"isPK")){
if(_1f){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,"Duplicate PK "+objj_msgSend(v,"name")+"! "+_1f+" already is PK!");
}else{
_1f=objj_msgSend(v,"name");
}
}
objj_msgSend(_1e,"addObject:",objj_msgSend(v,"name"));
}else{
if(objj_msgSend(v,"isKindOfClass:",objj_msgSend(GSMarkupRelationship,"class"))){
var rel=objj_msgSend(objj_msgSend(FSRelationship,"alloc"),"initWithName:source:andTargetEntity:",objj_msgSend(v,"name"),_1b,objj_msgSend(v,"target"));
if(objj_msgSend(v,"bindingColumn")){
objj_msgSend(rel,"setBindingColumn:",objj_msgSend(v,"bindingColumn"));
}
if(objj_msgSend(v,"targetColumn")){
objj_msgSend(rel,"setTargetColumn:",objj_msgSend(v,"targetColumn"));
}
if(objj_msgSend(v,"isToMany")){
objj_msgSend(rel,"setType:",FSRelationshipTypeToMany);
}else{
objj_msgSend(rel,"setType:",FSRelationshipTypeToOne);
}
objj_msgSend(_1b,"addRelationship:",rel);
}
}
}
objj_msgSend(_1b,"setColumns:",_1e);
if(_1f){
objj_msgSend(_1b,"setPk:",_1f);
}
return _1b;
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("tagName"),function(_21,_22){
with(_21){
return "entity";
}
}),new objj_method(sel_getUid("platformObjectClass"),function(_23,_24){
with(_23){
return objj_msgSend(FSEntity,"class");
}
})]);
var _1=objj_allocateClassPair(CPArrayController,"FSArrayController"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_entity"),new objj_ivar("_defaultDict")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("entity"),function(_25,_26){
with(_25){
return _entity;
}
}),new objj_method(sel_getUid("setEntity:"),function(_27,_28,_29){
with(_27){
_entity=_29;
}
}),new objj_method(sel_getUid("pk"),function(_2a,_2b){
with(_2a){
return objj_msgSend(_entity,"pk");
}
}),new objj_method(sel_getUid("selectedObject"),function(_2c,_2d){
with(_2c){
var s=objj_msgSend(_2c,"selectedObjects");
return objj_msgSend(s,"count")?objj_msgSend(s,"objectAtIndex:",0):nil;
}
}),new objj_method(sel_getUid("_defaultNewObject"),function(_2e,_2f){
with(_2e){
return objj_msgSend(_entity,"createObjectWithDictionary:",_defaultDict);
}
}),new objj_method(sel_getUid("setContent:"),function(_30,_31,_32){
with(_30){
if(objj_msgSend(_32,"respondsToSelector:",sel_getUid("defaults"))){
_defaultDict=objj_msgSend(_32,"defaults");
}
objj_msgSendSuper({receiver:_30,super_class:objj_getClass("FSArrayController").super_class},"setContent:",_32);
}
})]);
var _1=objj_allocateClassPair(GSMarkupTagObject,"GSMarkupArrayController"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initPlatformObject:"),function(_33,_34,_35){
with(_33){
_35=objj_msgSend(_35,"init");
objj_msgSend(_35,"setAutomaticallyRearrangesObjects:",YES);
objj_msgSend(_35,"setObjectClass:",objj_msgSend(FSObject,"class"));
objj_msgSend(_35,"setEntity:",objj_msgSend(_attributes,"objectForKey:","entity"));
return _35;
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("tagName"),function(_36,_37){
with(_36){
return "arrayController";
}
}),new objj_method(sel_getUid("platformObjectClass"),function(_38,_39){
with(_38){
return objj_msgSend(FSArrayController,"class");
}
})]);
p;17;ImageController.jt;6831;@STATIC;1.0;I;21;Foundation/CPObject.jI;25;Renaissance/Renaissance.ji;20;AnnotatedImageView.jt;6731;
objj_executeFile("Foundation/CPObject.j",NO);
objj_executeFile("Renaissance/Renaissance.j",NO);
objj_executeFile("AnnotatedImageView.j",YES);
var _1=objj_allocateClassPair(CPObject,"ImageController"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("imageSuperview"),new objj_ivar("rawImageSuperview"),new objj_ivar("annotatedImageView"),new objj_ivar("myAppController"),new objj_ivar("compoPopup"),new objj_ivar("_analysesController"),new objj_ivar("_scale"),new objj_ivar("_originalSize"),new objj_ivar("_compoID"),new objj_ivar("_imageID"),new objj_ivar("_progress"),new objj_ivar("_mywindow"),new objj_ivar("_rawImage"),new objj_ivar("_cookedImage"),new objj_ivar("_analyzedImage"),new objj_ivar("_idtrial"),new objj_ivar("_updateContinuously"),new objj_ivar("_isLoadingImage")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("scale"),function(_3,_4){
with(_3){
return _scale;
}
}),new objj_method(sel_getUid("setScale:"),function(_5,_6,_7){
with(_5){
_scale=_7;
}
}),new objj_method(sel_getUid("compoID"),function(_8,_9){
with(_8){
return _compoID;
}
}),new objj_method(sel_getUid("setCompoID:"),function(_a,_b,_c){
with(_a){
_compoID=_c;
}
}),new objj_method(sel_getUid("idtrial"),function(_d,_e){
with(_d){
return _idtrial;
}
}),new objj_method(sel_getUid("setIdtrial:"),function(_f,_10,_11){
with(_f){
_idtrial=_11;
}
}),new objj_method(sel_getUid("updateContinuously"),function(_12,_13){
with(_12){
return _updateContinuously;
}
}),new objj_method(sel_getUid("setUpdateContinuously:"),function(_14,_15,_16){
with(_14){
_updateContinuously=_16;
}
}),new objj_method(sel_getUid("isLoadingImage"),function(_17,_18){
with(_17){
return _isLoadingImage;
}
}),new objj_method(sel_getUid("setIsLoadingImage:"),function(_19,_1a,_1b){
with(_19){
_isLoadingImage=_1b;
}
}),new objj_method(sel_getUid("getImagePixelCount"),function(_1c,_1d){
with(_1c){
return Math.floor(_originalSize.width*_scale*_originalSize.height*_scale);
}
}),new objj_method(sel_getUid("_backgroundImage"),function(_1e,_1f){
with(_1e){
var _20=objj_msgSend(_analysesController,"valueForKeyPath:","selection.idcomposition_for_editing");
var _21=objj_msgSend(_analysesController,"valueForKeyPath:","selection.idimage");
var _22=objj_msgSend(myAppController,"baseImageURL")+_21+"?cmp="+_20;
if(_originalSize){
_22+="&width="+objj_msgSend(_1e,"getImagePixelCount");
}
var img=objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:",_22);
return img;
}
}),new objj_method(sel_getUid("imageDidLoad:"),function(_23,_24,_25){
with(_23){
var _26=objj_msgSend(_25,"size");
var _27=objj_msgSend(objj_msgSend(CPImageView,"alloc"),"initWithFrame:",CPMakeRect(0,0,_26.width,_26.height));
if(!_originalSize&&_scale==1){
_originalSize=CPSizeCreateCopy(_26);
}
objj_msgSend(_27,"setImage:",_25);
if(_25==_cookedImage){
objj_msgSend(imageSuperview,"setDocumentView:",_27);
}else{
if(_25==_rawImage){
objj_msgSend(rawImageSuperview,"setDocumentView:",_27);
}else{
if(_25==_analyzedImage){
}
}
}
_isLoadingImage=NO;
objj_msgSend(_progress,"stopAnimation:",_23);
}
}),new objj_method(sel_getUid("_setImageID:"),function(_28,_29,_2a){
with(_28){
_imageID=_2a;
var rnd=Math.floor(Math.random()*100000);
var _2b=objj_msgSend(myAppController,"baseImageURL")+_2a+"?rnd="+rnd;
if(_originalSize){
_2b+="&width="+objj_msgSend(_28,"getImagePixelCount");
}
_isLoadingImage=YES;
objj_msgSend(_progress,"startAnimation:",_28);
if(_compoID){
_cookedImage=objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:",_2b+"&cmp="+_compoID+"&cc=1");
objj_msgSend(_cookedImage,"setDelegate:",_28);
}
_rawImage=objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:",_2b);
objj_msgSend(_rawImage,"setDelegate:",_28);
_analyzedImage=objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:",_2b);
objj_msgSend(_analyzedImage,"setDelegate:",_28);
objj_msgSend(annotatedImageView,"bind:toObject:withKeyPath:options:","backgroundImage",_28,"_backgroundImage",nil);
objj_msgSend(annotatedImageView,"bind:toObject:withKeyPath:options:","scale",_28,"_scale",nil);
}
}),new objj_method(sel_getUid("initWithImageID:appController:"),function(_2c,_2d,_2e,_2f){
with(_2c){
_2c=objj_msgSendSuper({receiver:_2c,super_class:objj_getClass("ImageController").super_class},"init");
_scale=1;
myAppController=_2f;
_analysesController=objj_msgSend(FSArrayController,"new");
objj_msgSend(_analysesController,"setEntity:",objj_msgSend(myAppController.analysesController,"entity"));
objj_msgSend(_analysesController,"setContent:",objj_msgSend(myAppController.folderContentController,"valueForKeyPath:","selection.image.analyses"));
objj_msgSend(CPBundle,"loadRessourceNamed:owner:","image.gsmarkup",_2c);
_compoID=objj_msgSend(objj_msgSend(compoPopup,"selectedItem"),"tag");
objj_msgSend(_2c,"_setImageID:",_2e);
_idtrial=parseInt(objj_msgSend(myAppController.trialsController,"valueForKeyPath:","selection.id"));
objj_msgSend(_mywindow,"setTitle:","Image "+_2e);
return _2c;
}
}),new objj_method(sel_getUid("setScale:"),function(_30,_31,_32){
with(_30){
_scale=_32;
if(!_originalSize){
return;
}
objj_msgSend(_30,"_setImageID:",_imageID);
}
}),new objj_method(sel_getUid("compoChanged:"),function(_33,_34,_35){
with(_33){
_compoID=objj_msgSend(objj_msgSend(_35,"selectedItem"),"tag");
objj_msgSend(_33,"_setImageID:",_imageID);
}
}),new objj_method(sel_getUid("reload:"),function(_36,_37,_38){
with(_36){
if(!objj_msgSend(_36,"isLoadingImage")){
objj_msgSend(_36,"_setImageID:",_imageID);
}
}
}),new objj_method(sel_getUid("editCompo:"),function(_39,_3a,_3b){
with(_39){
var _3c=objj_msgSend(objj_msgSend(compoPopup,"selectedItem"),"tag");
var o=objj_msgSend(objj_msgSend(myAppController.displayfilters_ac,"entity"),"objectWithPK:",_3c);
if(o){
objj_msgSend(objj_msgSend(CompoController,"alloc"),"initWithCompo:andAppController:",o,myAppController);
}
}
}),new objj_method(sel_getUid("delete:"),function(_3d,_3e,_3f){
with(_3d){
objj_msgSend(annotatedImageView,"delete:",_3f);
}
})]);
var _1=objj_getClass("ImageController");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"ImageController\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("setNumberingPoints"),function(_40,_41){
with(_40){
objj_msgSend(annotatedImageView,"setStyleFlags:",objj_msgSend(annotatedImageView,"styleFlags")|AIVStyleNumbers);
}
}),new objj_method(sel_getUid("setDrawingLines"),function(_42,_43){
with(_42){
objj_msgSend(annotatedImageView,"setStyleFlags:",objj_msgSend(annotatedImageView,"styleFlags")|AIVStylePolygon);
}
}),new objj_method(sel_getUid("setDrawingAngle"),function(_44,_45){
with(_44){
objj_msgSend(annotatedImageView,"setStyleFlags:",objj_msgSend(annotatedImageView,"styleFlags")|AIVStyleAngleInfo);
}
})]);
p;20;AnnotatedImageView.jt;17084;@STATIC;1.0;I;21;Foundation/CPObject.jI;25;Renaissance/Renaissance.jI;24;CoreText/CGContextText.jt;16979;
objj_executeFile("Foundation/CPObject.j",NO);
objj_executeFile("Renaissance/Renaissance.j",NO);
objj_executeFile("CoreText/CGContextText.j",NO);
AIVStylePlain=0;
AIVStyleNumbers=1;
AIVStylePolygon=2;
AIVStyleLengthInfo=4;
AIVStyleAngleInfo=8;
var _1=objj_getClass("CPObject");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"CPObject\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("selectMe"),function(_3,_4){
with(_3){
if(objj_msgSend(_3,"respondsToSelector:",sel_getUid("setSelected:"))){
objj_msgSend(_3,"setSelected:",YES);
}
}
})]);
var _1=objj_allocateClassPair(CPView,"DotView"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_selected"),new objj_ivar("_data")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("data"),function(_5,_6){
with(_5){
return _data;
}
}),new objj_method(sel_getUid("setData:"),function(_7,_8,_9){
with(_7){
_data=_9;
}
}),new objj_method(sel_getUid("setSelected:"),function(_a,_b,_c){
with(_a){
_selected=_c;
objj_msgSend(_a,"setNeedsDisplay:",YES);
}
}),new objj_method(sel_getUid("isSelected"),function(_d,_e){
with(_d){
return _selected;
}
}),new objj_method(sel_getUid("initWithFrame:"),function(_f,_10,_11){
with(_f){
if(_f=objj_msgSendSuper({receiver:_f,super_class:objj_getClass("DotView").super_class},"initWithFrame:",_11)){
objj_msgSend(_f,"setSelected:",NO);
}
return _f;
}
}),new objj_method(sel_getUid("initWithCentroid:"),function(_12,_13,_14){
with(_12){
var _15=objj_msgSend(objj_msgSend(_12,"class"),"frameFromCentroid:",_14);
_12=objj_msgSend(_12,"initWithFrame:",_15);
return _12;
}
}),new objj_method(sel_getUid("drawRect:"),function(_16,_17,_18){
with(_16){
var _19=objj_msgSend(objj_msgSend(CPGraphicsContext,"currentContext"),"graphicsPort");
CGContextSetFillColor(_19,objj_msgSend(objj_msgSend(_16,"class"),"color"));
var _1a=CPMakeRect(_18.origin.x+2,_18.origin.y+2,_18.size.width-2,_18.size.height-2);
CGContextFillEllipseInRect(_19,_1a);
CGContextSetStrokeColor(_19,objj_msgSend(objj_msgSend(_16,"class"),"shadowColor"));
CGContextStrokeEllipseInRect(_19,_1a);
if(_selected){
CGContextSetFillColor(_19,objj_msgSend(CPColor,"whiteColor"));
CGContextSetAlpha(_19,0.5);
CGContextFillEllipseInRect(_19,_18);
}
}
}),new objj_method(sel_getUid("translateByX:andY:"),function(_1b,_1c,_1d,_1e){
with(_1b){
var _1f=objj_msgSend(_1b,"frame");
_1f.origin.x+=_1d;
_1f.origin.y+=_1e;
objj_msgSend(_1b,"setFrame:",_1f);
}
}),new objj_method(sel_getUid("objectValue"),function(_20,_21){
with(_20){
var _22=objj_msgSend(_20,"frame");
var _23=objj_msgSend(objj_msgSend(_20,"class"),"radius");
var r=CPMakePoint(_22.origin.x+1+_23,_22.origin.y+1+_23);
return r;
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("radius"),function(_24,_25){
with(_24){
return 5;
}
}),new objj_method(sel_getUid("color"),function(_26,_27){
with(_26){
return objj_msgSend(CPColor,"yellowColor");
}
}),new objj_method(sel_getUid("shadowColor"),function(_28,_29){
with(_28){
return objj_msgSend(CPColor,"orangeColor");
}
}),new objj_method(sel_getUid("textColor"),function(_2a,_2b){
with(_2a){
return objj_msgSend(CPColor,"blackColor");
}
}),new objj_method(sel_getUid("frameFromCentroid:"),function(_2c,_2d,_2e){
with(_2c){
var _2f=objj_msgSend(objj_msgSend(_2c,"class"),"radius");
return CPMakeRect(_2e.x-_2f-1,_2e.y-_2f-1,_2f*2+1,_2f*2+1);
}
})]);
var _1=objj_allocateClassPair(CPControl,"AnnotatedImageView"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_backgroundImageView"),new objj_ivar("_selOriginOffset"),new objj_ivar("_lastPoint"),new objj_ivar("_currentGraphic"),new objj_ivar("_marqueeSelectionBounds"),new objj_ivar("_marqueeOrigin"),new objj_ivar("_marqueeLayer"),new objj_ivar("_scale"),new objj_ivar("_styleFlags")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("styleFlags"),function(_30,_31){
with(_30){
return _styleFlags;
}
}),new objj_method(sel_getUid("setStyleFlags:"),function(_32,_33,_34){
with(_32){
_styleFlags=_34;
}
}),new objj_method(sel_getUid("stringForObjectValue:"),function(_35,_36,_37){
with(_35){
return parseInt(_37*_scale);
}
}),new objj_method(sel_getUid("objectValueForString:error:"),function(_38,_39,_3a,_3b){
with(_38){
return parseInt(_3a/_scale);
}
}),new objj_method(sel_getUid("initWithFrame:"),function(_3c,_3d,_3e){
with(_3c){
if(_3c=objj_msgSendSuper({receiver:_3c,super_class:objj_getClass("AnnotatedImageView").super_class},"initWithFrame:",_3e)){
_selOriginOffset=CPMakePoint(0,0);
_marqueeSelectionBounds=CPRectMakeZero();
_marqueeLayer=objj_msgSend(CALayer,"layer");
objj_msgSend(_3c,"setLayer:",_marqueeLayer);
objj_msgSend(_marqueeLayer,"setDelegate:",_3c);
_scale=1;
objj_msgSend(_marqueeLayer,"setNeedsDisplay");
}
return _3c;
}
}),new objj_method(sel_getUid("rebuildLayoutForGraphicClass:"),function(_3f,_40,_41){
with(_3f){
var _42=objj_msgSend(_3f,"subviews");
var n=objj_msgSend(_42,"count");
for(var i=0;i<n;i++){
var _43=_42[i];
if(objj_msgSend(_43,"respondsToSelector:",sel_getUid("isSelected"))){
objj_msgSend(_43,"removeFromSuperview");
}
}
var _44=objj_msgSend(_3f,"objectValue");
if(!_44){
return;
}
var l=objj_msgSend(_44,"count");
for(var i=0;i<l;i++){
var ai=objj_msgSend(_44,"objectAtIndex:",i);
var o=objj_msgSend(objj_msgSend(_41,"alloc"),"initWithCentroid:",CPMakePoint(objj_msgSend(ai,"valueForKey:","row"),objj_msgSend(ai,"valueForKey:","col")));
objj_msgSend(o,"setData:",ai);
objj_msgSend(_3f,"addDotView:",o);
}
objj_msgSend(_marqueeLayer,"setNeedsDisplay");
}
}),new objj_method(sel_getUid("sizeToFit"),function(_45,_46){
with(_45){
}
}),new objj_method(sel_getUid("addDotView:"),function(_47,_48,_49){
with(_47){
if(_backgroundImageView){
objj_msgSend(_47,"addSubview:positioned:relativeTo:",_49,CPWindowAbove,_backgroundImageView);
}else{
objj_msgSend(_47,"addSubview:",_49);
}
}
}),new objj_method(sel_getUid("setObjectValue:"),function(_4a,_4b,_4c){
with(_4a){
objj_msgSendSuper({receiver:_4a,super_class:objj_getClass("AnnotatedImageView").super_class},"setObjectValue:",_4c);
objj_msgSend(objj_msgSend(_4c,"entity"),"setFormatter:forColumnName:",_4a,"row");
objj_msgSend(objj_msgSend(_4c,"entity"),"setFormatter:forColumnName:",_4a,"col");
objj_msgSend(_4a,"rebuildLayoutForGraphicClass:",objj_msgSend(DotView,"class"));
}
}),new objj_method(sel_getUid("imageDidLoad:"),function(_4d,_4e,_4f){
with(_4d){
objj_msgSend(_4d,"setBackgroundImage:",_4f);
}
}),new objj_method(sel_getUid("setBackgroundImage:"),function(_50,_51,_52){
with(_50){
if(objj_msgSend(_52,"loadStatus")!=CPImageLoadStatusCompleted){
objj_msgSend(_52,"setDelegate:",_50);
return;
}
var _53=objj_msgSend(_52,"size");
if(_backgroundImageView){
objj_msgSend(_backgroundImageView,"removeFromSuperview");
}
var _54=CPMakeRect(0,0,_53.width,_53.height);
_backgroundImageView=objj_msgSend(objj_msgSend(CPImageView,"alloc"),"initWithFrame:",_54);
objj_msgSend(_backgroundImageView,"setImageScaling:",CPScaleToFit);
objj_msgSend(_backgroundImageView,"setImage:",_52);
objj_msgSend(_50,"addSubview:positioned:relativeTo:",_backgroundImageView,CPWindowBelow,nil);
objj_msgSend(_50,"setFrame:",_54);
objj_msgSend(_50,"setNeedsDisplay:",YES);
}
}),new objj_method(sel_getUid("backgroundImage"),function(_55,_56){
with(_55){
return objj_msgSend(_backgroundImageView,"image");
}
}),new objj_method(sel_getUid("scale"),function(_57,_58){
with(_57){
return _scale;
}
}),new objj_method(sel_getUid("setScale:"),function(_59,_5a,_5b){
with(_59){
_scale=_5b;
objj_msgSend(_59,"setObjectValue:",objj_msgSend(_59,"objectValue"));
}
}),new objj_method(sel_getUid("drawLayer:inContext:"),function(_5c,_5d,_5e,_5f){
with(_5c){
var _60=objj_msgSend(DotView,"class");
if(!CPRectEqualToRect(_marqueeSelectionBounds,CPRectMakeZero())){
CGContextSetStrokeColor(_5f,objj_msgSend(CPColor,"lightGrayColor"));
CGContextStrokeRect(_5f,_marqueeSelectionBounds);
}
if(_styleFlags&AIVStylePolygon){
CGContextBeginPath(_5f);
var _61=objj_msgSend(_5c,"allDots");
var n=objj_msgSend(_61,"count");
var _62=YES;
for(var i=0;i<n;i++){
var _63=_61[i];
var o=objj_msgSend(_63,"objectValue");
if(_62){
CGContextMoveToPoint(_5f,o.x,o.y);
_62=NO;
}else{
CGContextAddLineToPoint(_5f,o.x,o.y);
}
}
CGContextClosePath(_5f);
CGContextSetStrokeColor(_5f,objj_msgSend(CPColor,"yellowColor"));
CGContextStrokePath(_5f);
}
if(_styleFlags&AIVStyleAngleInfo){
CGContextBeginPath(_5f);
var _61=objj_msgSend(_5c,"allDots");
var n=objj_msgSend(_61,"count");
if(n){
var _64=objj_msgSend(_61[0],"objectValue");
var _65=objj_msgSend(_61[n-1],"objectValue");
CGContextMoveToPoint(_5f,_65.x,_65.y);
CGContextAddLineToPoint(_5f,_64.x,_64.y);
CGContextClosePath(_5f);
CGContextSetStrokeColor(_5f,objj_msgSend(CPColor,"yellowColor"));
CGContextStrokePath(_5f);
var _66=(_64.x>_65.x)?Math.atan((_64.y-_65.y)/(_64.x-_65.x)):(3.14-Math.atan((_64.y-_65.y)/(_65.x-_64.x)));
CGContextMoveToPoint(_5f,_65.x,_65.y);
CGContextAddLineToPoint(_5f,_65.x+50,_65.y);
CGContextClosePath(_5f);
CGContextStrokePath(_5f);
CGContextMoveToPoint(_5f,_65.x,_65.y);
CGContextAddArc(_5f,_65.x,_65.y,50,0,_66,NO);
CGContextClosePath(_5f);
CGContextStrokePath(_5f);
}
}
if(_styleFlags&AIVStyleNumbers){
CGContextSelectFont(_5f,objj_msgSend(CPFont,"systemFontOfSize:",8));
CGContextSetFillColor(_5f,objj_msgSend(_60,"textColor"));
CGContextSetStrokeColor(_5f,objj_msgSend(_60,"textColor"));
var _61=objj_msgSend(_5c,"allDots");
var n=objj_msgSend(_61,"count");
for(var i=0;i<n;i++){
var _63=_61[i];
var o=objj_msgSend(_63,"objectValue");
CGContextSetTextPosition(_5f,o.x-2,o.y+1);
CGContextShowText(_5f,i);
}
}
if(_styleFlags&AIVStyleLengthInfo){
CGContextSelectFont(_5f,objj_msgSend(CPFont,"systemFontOfSize:",12));
var _61=objj_msgSend(_5c,"subviews");
var n=objj_msgSend(_61,"count");
var _64,_67;
for(var i=0;i<n;i++){
var _63=_61[i];
if(objj_msgSend(_63,"isKindOfClass:",_60)){
_67=objj_msgSend(_63,"objectValue");
if(_64){
var _68=CGPointMake((_64.x+_67.x)/2,(_64.y+_67.y)/2);
var _69=Math.sqrt((_64.x-_67.x)*(_64.x-_67.x)+(_64.y-_67.y)*(_64.y-_67.y));
var _6a=objj_msgSend(CPString,"stringWithFormat:","%3.2f",_69);
CGContextSetTextPosition(_5f,_68.x+2,_68.y+2);
CGContextSetFillColor(_5f,objj_msgSend(CPColor,"blackColor"));
CGContextSetStrokeColor(_5f,objj_msgSend(CPColor,"blackColor"));
CGContextShowText(_5f,_6a);
CGContextSetTextPosition(_5f,_68.x+1,_68.y+1);
CGContextSetFillColor(_5f,objj_msgSend(_60,"color"));
CGContextSetStrokeColor(_5f,objj_msgSend(_60,"color"));
CGContextShowText(_5f,_6a);
}
_64=_67;
}
}
}
}
}),new objj_method(sel_getUid("autolayoutDefaultVerticalAlignment"),function(_6b,_6c){
with(_6b){
return GSAutoLayoutExpand;
}
}),new objj_method(sel_getUid("autolayoutDefaultHorizontalAlignment"),function(_6d,_6e){
with(_6d){
return GSAutoLayoutExpand;
}
}),new objj_method(sel_getUid("graphicsWithinRect:"),function(_6f,_70,_71){
with(_6f){
var _72=objj_msgSend(_6f,"subviews");
var n=objj_msgSend(_72,"count");
var _73=objj_msgSend(DotView,"class");
var ret=objj_msgSend(CPArray,"new");
for(var i=0;i<n;i++){
var _74=_72[i];
if(objj_msgSend(_74,"isKindOfClass:",_73)){
if(CPRectIntersectsRect(_71,objj_msgSend(_74,"frame"))||CPRectContainsPoint(objj_msgSend(_74,"frame"),_71.origin)){
objj_msgSend(ret,"addObject:",_74);
}
}
}
return ret;
}
}),new objj_method(sel_getUid("graphicUnderPoint:"),function(_75,_76,_77){
with(_75){
var ret=objj_msgSend(_75,"graphicsWithinRect:",CPMakeRect(_77.x,_77.y,1,1));
return ret.length?ret[0]:nil;
}
}),new objj_method(sel_getUid("deselectAllSubviews"),function(_78,_79){
with(_78){
var _7a=objj_msgSend(_78,"subviews");
var n=objj_msgSend(_7a,"count");
var _7b=objj_msgSend(DotView,"class");
for(var i=0;i<n;i++){
var _7c=_7a[i];
if(objj_msgSend(_7c,"respondsToSelector:",sel_getUid("setSelected:"))){
objj_msgSend(_7c,"setSelected:",NO);
}
}
return nil;
}
}),new objj_method(sel_getUid("selectedDots"),function(_7d,_7e){
with(_7d){
var _7f=objj_msgSend(_7d,"subviews");
var n=objj_msgSend(_7f,"count");
var ret=objj_msgSend(CPMutableArray,"new");
for(var i=0;i<n;i++){
var _80=_7f[i];
if(objj_msgSend(_80,"respondsToSelector:",sel_getUid("isSelected"))&&objj_msgSend(_80,"isSelected")){
objj_msgSend(ret,"addObject:",_80);
}
}
return ret;
}
}),new objj_method(sel_getUid("moveSelectedGraphicsWithEvent:"),function(_81,_82,_83){
with(_81){
var _84=objj_msgSend(_83,"type");
if(_84==CPLeftMouseUp){
_lastPoint=nil;
var _85=objj_msgSend(_currentGraphic,"data");
if(_85){
var p=objj_msgSend(_currentGraphic,"objectValue");
objj_msgSend(_85,"setValue:forKey:",p.y,"col");
objj_msgSend(_85,"setValue:forKey:",p.x,"row");
}
objj_msgSend(_marqueeLayer,"setNeedsDisplay");
return;
}else{
if(_84==CPLeftMouseDragged){
var _86=objj_msgSend(_81,"convertPoint:fromView:",objj_msgSend(_83,"locationInWindow"),nil);
_86.x-=_selOriginOffset.x;
_86.y-=_selOriginOffset.y;
if(!_lastPoint){
_lastPoint=_86;
}
if(!CPPointEqualToPoint(_lastPoint,_86)){
objj_msgSend(_currentGraphic,"translateByX:andY:",(_86.x-_lastPoint.x),(_86.y-_lastPoint.y));
}
_lastPoint=_86;
}
}
objj_msgSend(_marqueeLayer,"setNeedsDisplay");
objj_msgSend(CPApp,"setTarget:selector:forNextEventMatchingMask:untilDate:inMode:dequeue:",_81,sel_getUid("moveSelectedGraphicsWithEvent:"),CPLeftMouseDraggedMask|CPLeftMouseUpMask,nil,nil,YES);
}
}),new objj_method(sel_getUid("dragMarqueeWithEvent:"),function(_87,_88,_89){
with(_87){
var _8a=objj_msgSend(_89,"type");
if(_8a==CPLeftMouseUp){
_marqueeSelectionBounds=CPRectMakeZero();
objj_msgSend(_marqueeLayer,"setNeedsDisplay");
return;
}else{
if(_8a==CPLeftMouseDragged){
var _8b=objj_msgSend(_87,"convertPoint:fromView:",objj_msgSend(_89,"locationInWindow"),nil);
var x1=Math.min(_marqueeOrigin.x,_8b.x);
var y1=Math.min(_marqueeOrigin.y,_8b.y);
var x2=Math.max(_marqueeOrigin.x,_8b.x);
var y2=Math.max(_marqueeOrigin.y,_8b.y);
_marqueeSelectionBounds=CPRectMake(x1,y1,Math.abs(x1-x2),Math.abs(y1-y2));
objj_msgSend(_marqueeLayer,"setNeedsDisplay");
objj_msgSend(_87,"deselectAllSubviews");
var arr=objj_msgSend(_87,"graphicsWithinRect:",_marqueeSelectionBounds);
objj_msgSend(arr,"makeObjectsPerformSelector:",sel_getUid("selectMe"));
}
}
objj_msgSend(CPApp,"setTarget:selector:forNextEventMatchingMask:untilDate:inMode:dequeue:",_87,sel_getUid("dragMarqueeWithEvent:"),CPLeftMouseDraggedMask|CPLeftMouseUpMask,nil,nil,YES);
}
}),new objj_method(sel_getUid("mouseDown:"),function(_8c,_8d,_8e){
with(_8c){
var _8f=objj_msgSend(_8c,"convertPoint:fromView:",objj_msgSend(_8e,"locationInWindow"),nil);
var _90=objj_msgSend(DotView,"radius");
var _91=CPMakeRect(_8f.x-_90-1,_8f.y-_90-1,_90*2+1,_90*2+1);
var _92;
if(_92=objj_msgSend(_8c,"graphicUnderPoint:",_8f)){
mydotframe=objj_msgSend(_92,"frame");
_currentGraphic=_92;
if(!objj_msgSend(_8e,"modifierFlags")){
objj_msgSend(_8c,"deselectAllSubviews");
}
objj_msgSend(_currentGraphic,"setSelected:",YES);
_selOriginOffset.x=mydotframe.origin.x-_8f.x;
_selOriginOffset.y=mydotframe.origin.y-_8f.y;
objj_msgSend(_8c,"moveSelectedGraphicsWithEvent:",_8e);
}else{
if(objj_msgSend(_8e,"modifierFlags")){
if(CPRectEqualToRect(_marqueeSelectionBounds,CPRectMakeZero())){
_marqueeSelectionBounds.origin=_marqueeOrigin=_8f;
}
objj_msgSend(_8c,"dragMarqueeWithEvent:",_8e);
}else{
_92=objj_msgSend(objj_msgSend(DotView,"alloc"),"initWithFrame:",_91);
objj_msgSend(_8c,"addToModelPoint:",objj_msgSend(_92,"objectValue"));
objj_msgSend(_8c,"deselectAllSubviews");
objj_msgSend(_8c,"addDotView:",_92);
_currentGraphic=_92;
objj_msgSend(_8c,"moveSelectedGraphicsWithEvent:",_8e);
}
}
}
}),new objj_method(sel_getUid("addToModelPoint:"),function(_93,_94,_95){
with(_93){
var _96=objj_msgSend(_93,"objectValue");
var _97=objj_msgSend(CPDictionary,"new");
objj_msgSend(_97,"setObject:forKey:",_95.x,"row");
objj_msgSend(_97,"setObject:forKey:",_95.y,"col");
objj_msgSend(_96,"addObject:",_97);
}
}),new objj_method(sel_getUid("deleteDots:"),function(_98,_99,arr){
with(_98){
var _9a=objj_msgSend(_98,"objectValue");
var n=objj_msgSend(arr,"count");
for(var i=0;i<n;i++){
var dot=objj_msgSend(arr,"objectAtIndex:",i);
if(objj_msgSend(dot,"data")){
objj_msgSend(_9a,"removeObject:",objj_msgSend(dot,"data"));
}
objj_msgSend(dot,"removeFromSuperview");
}
objj_msgSend(_marqueeLayer,"setNeedsDisplay");
}
}),new objj_method(sel_getUid("delete:"),function(_9b,_9c,_9d){
with(_9b){
objj_msgSend(_9b,"deleteDots:",objj_msgSend(_9b,"selectedDots"));
}
}),new objj_method(sel_getUid("allDots"),function(_9e,_9f){
with(_9e){
var _a0=objj_msgSend(_9e,"subviews");
var n=objj_msgSend(_a0,"count");
var ret=objj_msgSend(CPMutableArray,"new");
for(var i=0;i<n;i++){
var _a1=_a0[i];
if(objj_msgSend(_a1,"respondsToSelector:",sel_getUid("isSelected"))){
objj_msgSend(ret,"addObject:",_a1);
}
}
return ret;
}
})]);
var _1=objj_allocateClassPair(GSMarkupTagView,"GSMarkupTagAnnotatedImageView"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_2,[new objj_method(sel_getUid("tagName"),function(_a2,_a3){
with(_a2){
return "annotatedImageView";
}
}),new objj_method(sel_getUid("platformObjectClass"),function(_a4,_a5){
with(_a4){
return objj_msgSend(AnnotatedImageView,"class");
}
})]);
