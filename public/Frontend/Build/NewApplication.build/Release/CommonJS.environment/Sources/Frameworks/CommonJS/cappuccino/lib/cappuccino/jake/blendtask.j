@STATIC;1.0;I;23;Foundation/Foundation.jI;15;AppKit/AppKit.jI;19;BlendKit/BlendKit.jt;5473;
objj_executeFile("Foundation/Foundation.j",NO);
objj_executeFile("AppKit/AppKit.j",NO);
objj_executeFile("BlendKit/BlendKit.j",NO);
var _1=require("file"),_2=require("narwhal/term"),_3=require("jake").task,_4=require("jake").filedir,_5=require("objective-j/jake/bundletask").BundleTask;
BlendTask=function(_6){
_5.apply(this,arguments);
this._themeDescriptors=[];
this._keyedThemes=[];
};
BlendTask.__proto__=_5;
BlendTask.prototype.__proto__=_5.prototype;
BlendTask.prototype.packageType=function(){
return "BLND";
};
BlendTask.prototype.infoPlist=function(){
var _7=_5.prototype.infoPlist.apply(this,arguments);
_7.setValueForKey("CPKeyedThemes",require("narwhal/util").unique(this._keyedThemes));
return _7;
};
BlendTask.prototype.themeDescriptors=function(){
return this._themeDescriptors;
};
BlendTask.prototype.setThemeDescriptors=function(_8){
this._themeDescriptors=_8;
};
BlendTask.prototype.defineTasks=function(){
this.defineThemeDescriptorTasks();
_5.prototype.defineTasks.apply(this,arguments);
};
BlendTask.prototype.defineSourceTasks=function(){
};
BlendTask.prototype.defineThemeDescriptorTasks=function(){
this.environments().forEach(function(_9){
var _a=_9.name()+".environment",_b=this.themeDescriptors(),_c=this.resourcesPath(),_d=_1.join(this.buildIntermediatesProductPath(),_a,"Resources"),_e=this.buildProductStaticPathForEnvironment(_9),_f=this._keyedThemes,_10=this.name()+":themes";
this.enhance(_10);
_b.forEach(function(_11){
objj_importFile(_1.absolute(_11),YES);
});
objj_msgSend(BKThemeDescriptor,"allThemeDescriptorClasses").forEach(function(_12){
var _13=_1.join(_d,objj_msgSend(_12,"themeName")+".keyedtheme");
_4(_13,_10);
_4(_e,[_13]);
_f.push(objj_msgSend(_12,"themeName")+".keyedtheme");
});
_3(_10,function(){
objj_msgSend(BKThemeDescriptor,"allThemeDescriptorClasses").forEach(function(_14){
var _15=objj_msgSend(objj_msgSend(BKThemeTemplate,"alloc"),"init");
objj_msgSend(_15,"setValue:forKey:",objj_msgSend(_14,"themeName"),"name");
var _16=objj_msgSend(_14,"themedObjectTemplates"),_17=cibDataFromTopLevelObjects(_16.concat([_15])),_18=themeFromCibData(_17);
_1.mkdirs(_d);
_1.write(_1.join(_d,objj_msgSend(_14,"themeName")+".keyedtheme"),"t;"+_18.length+";"+_18,{charset:"UTF-8"});
});
});
},this);
};
cibDataFromTopLevelObjects=function(_19){
var _1a=objj_msgSend(CPData,"data"),_1b=objj_msgSend(objj_msgSend(CPKeyedArchiver,"alloc"),"initForWritingWithMutableData:",_1a),_1c=objj_msgSend(objj_msgSend(_CPCibObjectData,"alloc"),"init");
_1c._fileOwner=objj_msgSend(_CPCibCustomObject,"new");
_1c._fileOwner._className="CPObject";
var _1d=0,_1e=_19.length;
for(;_1d<_1e;++_1d){
_1c._objectsValues[_1d]=_1c._fileOwner;
_1c._objectsKeys[_1d]=_19[_1d];
}
objj_msgSend(_1b,"encodeObject:forKey:",_1c,"CPCibObjectDataKey");
objj_msgSend(_1b,"finishEncoding");
return _1a;
};
themeFromCibData=function(_1f){
var cib=objj_msgSend(objj_msgSend(CPCib,"alloc"),"initWithData:",_1f),_20=[];
objj_msgSend(cib,"_setAwakenCustomResources:",NO);
objj_msgSend(cib,"instantiateCibWithExternalNameTable:",objj_msgSend(CPDictionary,"dictionaryWithObject:forKey:",_20,CPCibTopLevelObjects));
var _21=_20.length,_22=nil,_23=[];
while(_21--){
var _24=_20[_21];
_23=_23.concat(objj_msgSend(_24,"blendThemeObjectTemplates"));
if(objj_msgSend(_24,"isKindOfClass:",objj_msgSend(BKThemeTemplate,"class"))){
_22=objj_msgSend(objj_msgSend(CPTheme,"alloc"),"initWithName:",objj_msgSend(_24,"valueForKey:","name"));
}
}
_2.stream.print("Building \x00green("+objj_msgSend(_22,"name")+"\x00) theme");
objj_msgSend(_23,"makeObjectsPerformSelector:withObject:",sel_getUid("blendAddThemedObjectAttributesToTheme:"),_22);
return objj_msgSend(objj_msgSend(CPKeyedArchiver,"archivedDataWithRootObject:",_22),"rawString");
};
var _25=objj_getClass("CPCib");
if(!_25){
throw new SyntaxError("*** Could not find definition for class \"CPCib\"");
}
var _26=_25.isa;
class_addMethods(_25,[new objj_method(sel_getUid("initWithData:"),function(_27,_28,_29){
with(_27){
_27=objj_msgSendSuper({receiver:_27,super_class:objj_getClass("CPCib").super_class},"init");
if(_27){
_data=_29;
}
return _27;
}
})]);
var _25=objj_getClass("CPObject");
if(!_25){
throw new SyntaxError("*** Could not find definition for class \"CPObject\"");
}
var _26=_25.isa;
class_addMethods(_25,[new objj_method(sel_getUid("blendThemeObjectTemplates"),function(_2a,_2b){
with(_2a){
var _2c=objj_msgSend(_2a,"class");
if(objj_msgSend(_2c,"isKindOfClass:",objj_msgSend(BKThemedObjectTemplate,"class"))){
return [_2a];
}
if(objj_msgSend(_2c,"isKindOfClass:",objj_msgSend(CPView,"class"))){
var _2d=[],_2e=objj_msgSend(_2a,"subviews"),_2f=objj_msgSend(_2e,"count");
while(_2f--){
_2d=_2d.concat(objj_msgSend(_2e[_2f],"blendThemeObjectTemplates"));
}
return _2d;
}
return [];
}
})]);
var _25=objj_getClass("BKThemedObjectTemplate");
if(!_25){
throw new SyntaxError("*** Could not find definition for class \"BKThemedObjectTemplate\"");
}
var _26=_25.isa;
class_addMethods(_25,[new objj_method(sel_getUid("blendAddThemedObjectAttributesToTheme:"),function(_30,_31,_32){
with(_30){
var _33=objj_msgSend(_30,"valueForKey:","themedObject");
if(!_33){
var _34=objj_msgSend(_30,"subviews");
if(objj_msgSend(_34,"count")>0){
_33=_34[0];
}
}
if(_33){
_2.stream.print(" Recording themed properties for \x00purple("+objj_msgSend(_33,"className")+"\x00).");
objj_msgSend(_32,"takeThemeFromObject:",_33);
}
}
})]);
exports.BlendTask=BlendTask;
exports.blend=function(_35,_36){
return BlendTask.defineTask(_35,_36);
};
