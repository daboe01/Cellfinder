@STATIC;1.0;I;21;Foundation/CPObject.jI;25;Renaissance/Renaissance.ji;17;CompoController.ji;17;ImageController.jt;14547;
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
