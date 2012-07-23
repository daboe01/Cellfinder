@STATIC;1.0;t;8168;
var _1=require("file");
var _2=require("objective-j");
var _3=require("interpreter").Context;
ObjectiveJRuntimeAnalyzer=function(_4){
this.rootPath=_4;
this.rootURL=new CFURL(String(_4));
this.context=new _3();
this.scope=setupObjectiveJ(this.context);
this.require=this.context.global.require;
this.mainBundleURL=new this.context.global.CFURL("file:"+this.rootPath);
var _5=this.require("objective-j");
_5.Executable.prototype.path=function(){
var _6=this.URL();
return _6?_6.absoluteURL().path():null;
};
_5.FileDependency.prototype.path=function(){
var _7=this.URL();
return _7?_7.path():null;
};
this.context.global.CFBundle.prototype.executablePath=function(){
var _8=this.executableURL();
return _8?_8.absoluteURL().path():null;
};
this.require("cappuccino/objj-flatten-additions");
if(!this.context.global.CFHTTPRequest._lookupCachedRequest){
print("Warning: CFHTTPRequest._lookupCachedRequest. Need to import objj-flatten-additions module.");
}
var _9=this.requestedURLs={};
var _a=this.context.global.CFHTTPRequest._lookupCachedRequest;
this.context.global.CFHTTPRequest._lookupCachedRequest=function(_b){
var _c=new CFURL(_b,this.rootURL).absoluteURL().path();
_9[_c]=true;
return _a.apply(null,arguments);
};
};
ObjectiveJRuntimeAnalyzer.prototype.setIncludePaths=function(_d){
this.context.global.OBJJ_INCLUDE_PATHS=_d;
};
ObjectiveJRuntimeAnalyzer.prototype.setEnvironments=function(_e){
this.context.global.CFBundle.environments=function(){
return _e;
};
};
ObjectiveJRuntimeAnalyzer.prototype.makeAbsoluteURL=function(_f){
if(_f instanceof this.context.global.CFURL&&_f.scheme()){
return _f;
}
return new this.context.global.CFURL(_f,this.mainBundleURL);
};
ObjectiveJRuntimeAnalyzer.prototype.initializeGlobalRecorder=function(){
this.initializeGlobalRecorder=function(){
};
this.ignore=cloneProperties(this.scope,true);
this.files={};
var _10=[];
var _11=null;
var _12=null;
var _13=this;
recordAndReset=function(){
var _14=cloneProperties(_13.scope);
if(_11&&_12){
_13.files[_12]=_13.files[_12]||{};
_13.files[_12].globals=_13.files[_12].globals||{};
diff({before:_11,after:_14,ignore:_13.ignore,added:_13.files[_12].globals,changed:_13.files[_12].globals});
}else{
if(!_12){
}
}
_11=_14;
};
var _15=this.require("objective-j");
var _16=_15.Executable.fileExecuterForURL;
_15.Executable.fileExecuterForURL=function(_17){
_17=_13.makeAbsoluteURL(_17);
var _18=_17.absoluteURL().path();
var _19=_16.apply(this,arguments);
return function(_1a,_1b,_1c){
var _1d=typeof _1a==="string"?_1a:_1a.absoluteURL().path();
recordAndReset();
_10.push(_12);
if(_1b&&!_1.isAbsolute(_1d)){
_12=_1.normal(_1.join(_18,_1d));
}else{
_12=_1d;
}
system.stderr.write(">").flush();
_19.apply(this,arguments);
system.stderr.write("<").flush();
recordAndReset();
_12=_10.pop();
};
};
};
ObjectiveJRuntimeAnalyzer.prototype.load=function(_1e){
this.require("objective-j").objj_eval("("+(function(_1f){
objj_importFile(_1f,true,function(){
print("Done importing and evaluating: "+_1f);
});
})+")")(_1e);
};
ObjectiveJRuntimeAnalyzer.prototype.finishLoading=function(_20){
this.require("browser/timeout").serviceTimeouts();
};
ObjectiveJRuntimeAnalyzer.prototype.mapGlobalsToFiles=function(){
this.mergeLibraryImports();
var _21={};
for(var _22 in this.files){
for(var _23 in this.files[_22].globals){
(_21[_23]=_21[_23]||[]).push(_22);
}
}
return _21;
};
ObjectiveJRuntimeAnalyzer.prototype.mapFilesToGlobals=function(){
this.mergeLibraryImports();
var _24={};
for(var _25 in this.files){
_24[_25]={};
for(var _26 in this.files[_25].globals){
_24[_25][_26]=true;
}
}
return _24;
};
ObjectiveJRuntimeAnalyzer.prototype.mergeLibraryImports=function(){
for(var _27 in this.files){
if(_1.isRelative(_27)){
var _28=this.executableForImport(_27,false).path();
CPLog.debug("Merging "+_27+" => "+_28);
this.files[_28]=this.files[_28]||{};
this.files[_28].globals=this.files[_28].globals||{};
for(var _29 in this.files[_27].globals){
this.files[_28].globals[_29]=true;
}
delete this.files[_27];
}
}
};
ObjectiveJRuntimeAnalyzer.prototype.executableForImport=function(_2a,_2b){
if(_2b===undefined){
_2b=true;
}
var _2c=this.require("objective-j"),_2d=nil,URL=new this.context.global.CFURL(_2a);
_2c.Executable.fileExecutableSearcherForURL(URL)(URL,_2b,function(_2e){
_2d=_2e;
});
return _2d;
};
ObjectiveJRuntimeAnalyzer.prototype.traverseDependencies=function(_2f,_30){
_30=_30||{};
_30.processedFiles=_30.processedFiles||{};
_30.importedFiles=_30.importedFiles||{};
_30.referencedFiles=_30.referencedFiles||{};
_30.ignoredImports=_30.ignoredImports||{};
var _31=_2f.path();
if(_30.processedFiles[_31]){
return;
}
_30.processedFiles[_31]=true;
var _32=false;
if(_30.ignoreAllImports){
_32=true;
}else{
if(_30.ignoreFrameworkImports){
var _33=_31.match(new RegExp("([^\\/]+)\\/([^\\/]+)\\.j$"));
if(_33&&_33[1]===_33[2]){
_32=true;
}
}
}
var _34={},_35={};
if(_30.progressCallback){
_30.progressCallback(this.rootPath.relative(_31),_31);
}
var _36=_2f.code();
var _37=uniqueTokens(_36);
markFilesReferencedByTokens(_37,this.mapGlobalsToFiles(),_34);
delete _34[_31];
if(_32){
if(_30.ignoreImportsCallback){
_30.ignoreImportsCallback(this.rootPath.relative(_31),_31);
}
_30.ignoredImports[_31]=true;
}else{
_2f.fileDependencies().forEach(function(_38){
var _39=null;
if(_38.isLocal()){
_39=this.executableForImport(_1.normal(_1.join(_1.dirname(_31),_38.path())),true);
}else{
_39=this.executableForImport(_38.path(),false);
}
if(_39){
var _3a=_39.path();
if(_3a!==_31){
_35[_3a]=true;
}else{
CPLog.error("Ignoring self import (why are you importing yourself?!): "+this.rootPath.relative(_3a));
}
}else{
CPLog.error("Couldn't find file for import "+_38.path()+" ("+_38.isLocal()+")");
}
},this);
}
this.checkImported(_30,_31,_35);
_30.importedFiles[_31]=_35;
this.checkReferenced(_30,_31,_34);
_30.referencedFiles[_31]=_34;
return _30;
};
ObjectiveJRuntimeAnalyzer.prototype.checkImported=function(_3b,_3c,_3d){
for(var _3e in _3d){
if(_3e!==_3c){
if(_3b.importCallback){
_3b.importCallback(_3c,_3e);
}
var _3f=this.executableForImport(_3e,true);
if(_3f){
this.traverseDependencies(_3f,_3b);
}else{
CPLog.error("Missing imported file: "+_3e);
}
}
}
};
ObjectiveJRuntimeAnalyzer.prototype.checkReferenced=function(_40,_41,_42){
for(var _43 in _42){
if(_43!==_41){
if(_40.referenceCallback){
_40.referenceCallback(_41,_43,_42[_43]);
}
var _44=this.executableForImport(_43,true);
if(_44){
this.traverseDependencies(_44,_40);
}else{
CPLog.error("Missing referenced file: "+_43);
}
}
}
};
ObjectiveJRuntimeAnalyzer.prototype.fileExecutables=function(){
var _45=this.require("objective-j");
return _45.FileExecutablesForPaths;
};
uniqueTokens=function(_46){
var _47=new _2.Lexer(_46,null);
var _48,_49={};
while(_48=_47.skip_whitespace()){
_49[_48]=true;
}
return Object.keys(_49);
};
markFilesReferencedByTokens=function(_4a,_4b,_4c){
_4a.forEach(function(_4d){
if(_4b.hasOwnProperty(_4d)){
var _4e=_4b[_4d];
for(var i=0;i<_4e.length;i++){
_4c[_4e[i]]=_4c[_4e[i]]||{};
_4c[_4e[i]][_4d]=true;
}
}
});
};
setupObjectiveJ=function(_4f){
_4f.global.NARWHAL_HOME=system.prefix;
_4f.global.NARWHAL_ENGINE_HOME=_1.join(system.prefix,"engines","rhino");
var _50=_1.join(_4f.global.NARWHAL_ENGINE_HOME,"bootstrap.js");
_4f.evalFile(_50);
_4f.global.require("browser");
var _51=_4f.global.require("objective-j");
addMockBrowserEnvironment(_51.window);
return _51.window;
};
addMockBrowserEnvironment=function(_52){
if(!_52.window){
_52.window=_52;
}
if(!_52.location){
_52.location={};
}
if(!_52.location.href){
_52.location.href="";
}
if(!_52.Element){
_52.Element=function(){
this.style={};
};
}
if(!_52.document){
_52.document={createElement:function(){
return new _52.Element();
}};
}
};
cloneProperties=function(_53,_54){
var _55={};
for(var _56 in _53){
_55[_56]=_54?true:_53[_56];
}
return _55;
};
diff=function(o){
for(var i in o.after){
if(o.added&&!o.ignore[i]&&typeof o.before[i]=="undefined"){
o.added[i]=true;
}
}
for(var i in o.after){
if(o.changed&&!o.ignore[i]&&typeof o.before[i]!="undefined"&&typeof o.after[i]!="undefined"&&o.before[i]!==o.after[i]){
o.changed[i]=true;
}
}
for(var i in o.before){
if(o.deleted&&!o.ignore[i]&&typeof o.after[i]=="undefined"){
o.deleted[i]=true;
}
}
};
