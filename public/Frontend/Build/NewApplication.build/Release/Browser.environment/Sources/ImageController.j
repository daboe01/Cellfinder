@STATIC;1.0;I;21;Foundation/CPObject.jI;25;Renaissance/Renaissance.ji;20;AnnotatedImageView.jt;6731;
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
