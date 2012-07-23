@STATIC;1.0;p;15;_NSCornerView.jt;994;@STATIC;1.0;I;26;AppKit/CPTableHeaderView.jt;945;
objj_executeFile("AppKit/CPTableHeaderView.j",NO);
var _1=objj_getClass("_CPCornerView");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"_CPCornerView\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("NS_initWithCoder:"),function(_3,_4,_5){
with(_3){
return _3=objj_msgSendSuper({receiver:_3,super_class:objj_getClass("_CPCornerView").super_class},"NS_initWithCoder:",_5);
}
})]);
var _1=objj_allocateClassPair(_CPCornerView,"_NSCornerView"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initWithCoder:"),function(_6,_7,_8){
with(_6){
_6=objj_msgSendSuper({receiver:_6,super_class:objj_getClass("_NSCornerView").super_class},"NS_initWithCoder:",_8);
if(_6){
_frame.size.height=23;
_bounds.size.height=23;
}
return _6;
}
}),new objj_method(sel_getUid("classForKeyedArchiver"),function(_9,_a){
with(_9){
return objj_msgSend(_CPCornerView,"class");
}
})]);
p;15;Converter+Mac.jt;3535;@STATIC;1.0;i;11;Converter.jt;3500;
objj_executeFile("Converter.j",YES);
var _1=objj_getClass("Converter");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"Converter\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("convertedDataFromMacData:resourcesPath:"),function(_3,_4,_5,_6){
with(_3){
var _7=objj_msgSend(objj_msgSend(Nib2CibKeyedUnarchiver,"alloc"),"initForReadingWithData:resourcesPath:",_5,_6),_8=objj_msgSend(_7,"decodeObjectForKey:","IB.objectdata"),_9=objj_msgSend(_7,"allObjects"),_a=objj_msgSend(_9,"count");
while(_a--){
var _b=_9[_a];
objj_msgSend(_3,"replaceFontForObject:",_b);
if(!objj_msgSend(_b,"isKindOfClass:",objj_msgSend(CPView,"class"))){
continue;
}
var _c=objj_msgSend(_b,"superview");
if(!_c||objj_msgSend(_c,"NS_isFlipped")){
continue;
}
var _d=CGRectGetHeight(objj_msgSend(_c,"bounds")),_e=objj_msgSend(_b,"frame");
objj_msgSend(_b,"setFrameOrigin:",CGPointMake(CGRectGetMinX(_e),_d-CGRectGetMaxY(_e)));
var _f=objj_msgSend(_b,"autoresizingMask");
autoresizingMask=_f&~(CPViewMaxYMargin|CPViewMinYMargin);
if(!(_f&(CPViewMaxYMargin|CPViewMinYMargin|CPViewHeightSizable))){
autoresizingMask|=CPViewMinYMargin;
}else{
if(_f&CPViewMaxYMargin){
autoresizingMask|=CPViewMinYMargin;
}
if(_f&CPViewMinYMargin){
autoresizingMask|=CPViewMaxYMargin;
}
}
objj_msgSend(_b,"setAutoresizingMask:",autoresizingMask);
}
var _10=objj_msgSend(CPData,"data"),_11=objj_msgSend(objj_msgSend(CPKeyedArchiver,"alloc"),"initForWritingWithMutableData:",_10);
objj_msgSend(_11,"encodeObject:forKey:",_8,"CPCibObjectDataKey");
objj_msgSend(_11,"finishEncoding");
return _10;
}
}),new objj_method(sel_getUid("replaceFontForObject:"),function(_12,_13,_14){
with(_12){
if(objj_msgSend(_14,"respondsToSelector:",sel_getUid("font"))&&objj_msgSend(_14,"respondsToSelector:",sel_getUid("setFont:"))){
var _15=objj_msgSend(_14,"font");
if(_15){
objj_msgSend(_12,"replaceFont:forObject:",_15,_14);
}
}else{
if(objj_msgSend(_14,"isKindOfClass:",objj_msgSend(CPView,"class"))){
var _16=objj_msgSend(_14,"subviews"),_17=objj_msgSend(_16,"count");
if(_17&&objj_msgSend(_16[0],"isKindOfClass:",objj_msgSend(CPRadio,"class"))){
while(_17--){
var _18=_16[_17];
objj_msgSend(_12,"replaceFont:forObject:",objj_msgSend(_18,"font"),_18);
}
}
}
}
}
}),new objj_method(sel_getUid("replaceFont:forObject:"),function(_19,_1a,_1b,_1c){
with(_19){
var _1d=nil;
if(objj_msgSend(_1c,"respondsToSelector:",sel_getUid("cibFontForNibFont"))){
_1d=objj_msgSend(_1c,"cibFontForNibFont");
}else{
_1d=objj_msgSend(NSFont,"cibFontForNibFont:",objj_msgSend(_1c,"font"));
}
if(!_1d||!objj_msgSend(_1d,"isEqual:",_1b)){
var _1e="";
if(!_1d){
var _1f=objj_msgSend(_1b,"isBold");
for(var i=0;i<themes.length;++i){
_1d=objj_msgSend(themes[i],"valueForAttributeWithName:inState:forClass:","font",objj_msgSend(_1c,"themeState"),objj_msgSend(_1c,"class"));
if(_1d){
_1e=" (from "+objj_msgSend(themes[i],"name")+")";
break;
}
}
if(!_1d||objj_msgSend(_1d,"familyName")===CPFontDefaultSystemFontFace){
var _20=objj_msgSend(_1d,"size")||CPFontDefaultSystemFontSize,_1f=_1d?objj_msgSend(_1d,"isBold"):_1f;
if(_20===CPFontDefaultSystemFontSize){
_20=objj_msgSend(CPFont,"systemFontSize");
}
_1d=_1f?objj_msgSend(CPFont,"boldSystemFontOfSize:",_20):objj_msgSend(CPFont,"systemFontOfSize:",_20);
}
}
objj_msgSend(_1c,"setFont:",_1d);
CPLog.debug("%s: substituted <%s>%s for <%fpx %s>",objj_msgSend(_1c,"className"),_1d?objj_msgSend(_1d,"cssString"):"theme default",_1e,objj_msgSend(_1b,"size"),objj_msgSend(_1b,"familyName"));
}
}
})]);
p;11;Converter.jt;4778;@STATIC;1.0;I;23;Foundation/Foundation.jI;15;AppKit/AppKit.jI;19;BlendKit/BlendKit.ji;15;Converter+Mac.jt;4667;
objj_executeFile("Foundation/Foundation.j",NO);
objj_executeFile("AppKit/AppKit.j",NO);
objj_executeFile("BlendKit/BlendKit.j",NO);
var _1=require("file"),OS=require("os"),_2=nil;
NibFormatUndetermined=0,NibFormatMac=1,NibFormatIPhone=2;
ConverterModeLegacy=0;
ConverterModeNew=1;
ConverterConversionException="ConverterConversionException";
var _3=objj_allocateClassPair(CPObject,"Converter"),_4=_3.isa;
class_addIvars(_3,[new objj_ivar("inputPath"),new objj_ivar("outputPath"),new objj_ivar("resourcesPath"),new objj_ivar("format"),new objj_ivar("themes"),new objj_ivar("userNSClasses")]);
objj_registerClassPair(_3);
class_addMethods(_3,[new objj_method(sel_getUid("inputPath"),function(_5,_6){
with(_5){
return inputPath;
}
}),new objj_method(sel_getUid("outputPath"),function(_7,_8){
with(_7){
return outputPath;
}
}),new objj_method(sel_getUid("setOutputPath:"),function(_9,_a,_b){
with(_9){
outputPath=_b;
}
}),new objj_method(sel_getUid("resourcesPath"),function(_c,_d){
with(_c){
return resourcesPath;
}
}),new objj_method(sel_getUid("setResourcesPath:"),function(_e,_f,_10){
with(_e){
resourcesPath=_10;
}
}),new objj_method(sel_getUid("format"),function(_11,_12){
with(_11){
return format;
}
}),new objj_method(sel_getUid("themes"),function(_13,_14){
with(_13){
return themes;
}
}),new objj_method(sel_getUid("userNSClasses"),function(_15,_16){
with(_15){
return userNSClasses;
}
}),new objj_method(sel_getUid("setUserNSClasses:"),function(_17,_18,_19){
with(_17){
userNSClasses=_19;
}
}),new objj_method(sel_getUid("initWithInputPath:format:themes:"),function(_1a,_1b,_1c,_1d,_1e){
with(_1a){
_1a=objj_msgSendSuper({receiver:_1a,super_class:objj_getClass("Converter").super_class},"init");
if(_1a){
_2=_1a;
inputPath=_1c;
format=_1d;
themes=_1e;
}
return _1a;
}
}),new objj_method(sel_getUid("convert"),function(_1f,_20){
with(_1f){
if(objj_msgSend(resourcesPath,"length")&&!_1.isReadable(resourcesPath)){
objj_msgSend(CPException,"raise:reason:",ConverterConversionException,"Could not read Resources at path \""+resourcesPath+"\"");
}
var _21=format;
if(_21===NibFormatUndetermined){
_21=NibFormatMac;
if(_1.extension(inputPath)!==".nib"&&_1.isFile(inputPath)&&_1.read(inputPath,{charset:"UTF-8"}).indexOf("<archive type=\"com.apple.InterfaceBuilder3.CocoaTouch.XIB\"")!==-1){
_21=NibFormatIPhone;
}
if(_21===NibFormatMac){
CPLog.info("Auto-detected Cocoa Nib or Xib File");
}else{
CPLog.info("Auto-detected CocoaTouch Xib File");
}
}
var _22=objj_msgSend(_1f,"CPCompliantNibDataAtFilePath:",inputPath);
if(_21===NibFormatMac){
var _23=objj_msgSend(_1f,"convertedDataFromMacData:resourcesPath:",_22,resourcesPath);
}else{
objj_msgSend(CPException,"raise:reason:",ConverterConversionException,"nib2cib does not understand this nib format.");
}
if(!objj_msgSend(outputPath,"length")){
outputPath=inputPath.substr(0,inputPath.length-_1.extension(inputPath).length)+".cib";
}
_1.write(outputPath,objj_msgSend(_23,"rawString"),{charset:"UTF-8"});
CPLog.info(CPLogColorize("Conversion successful","warn"));
}
}),new objj_method(sel_getUid("CPCompliantNibDataAtFilePath:"),function(_24,_25,_26){
with(_24){
CPLog.info("Converting Xib file to plist...");
var _27="",_28="";
try{
_27=_1.join("/tmp",_1.basename(_26)+".tmp.nib");
if(OS.popen(["/usr/bin/ibtool",_26,"--compile",_27]).wait()===1){
objj_msgSend(CPException,"raise:reason:",ConverterConversionException,"Could not compile file: "+_26);
}
var _28=_1.join("/tmp",_1.basename(_26)+".tmp.plist");
if(OS.popen(["/usr/bin/plutil","-convert","xml1",_27,"-o",_28]).wait()===1){
objj_msgSend(CPException,"raise:reason:",ConverterConversionException,"Could not convert to xml plist for file: "+_26);
}
if(!_1.isReadable(_28)){
objj_msgSend(CPException,"raise:reason:",ConverterConversionException,"Unable to convert nib file.");
}
var _29=_1.read(_28,{charset:"UTF-8"});
if(system.engine==="rhino"){
_29=String(java.lang.String(_29).replaceAll("\\<key\\>\\s*CF\\$UID\\s*\\</key\\>","<key>CP\\$UID</key>"));
}else{
_29=_29.replace(/\<key\>\s*CF\$UID\s*\<\/key\>/g,"<key>CP$UID</key>");
}
_29=_29.replace(/<string>[\u0000-\u0008\u000B\u000C\u000E-\u001F]<\/string>/g,function(c){
CPLog.warn("Warning: converting character 0x"+c.charCodeAt(8).toString(16)+" to base64 representation");
return "<string type=\"base64\">"+CFData.encodeBase64String(c.charAt(8))+"</string>";
});
}
finally{
if(_27!==""&&_1.isWritable(_27)){
_1.remove(_27);
}
if(_28!==""&&_1.isWritable(_28)){
_1.remove(_28);
}
}
return objj_msgSend(CPData,"dataWithRawString:",_29);
}
})]);
class_addMethods(_4,[new objj_method(sel_getUid("sharedConverter"),function(_2a,_2b){
with(_2a){
return _2;
}
})]);
objj_executeFile("Converter+Mac.j",YES);
p;6;main.jt;184;@STATIC;1.0;i;9;Nib2Cib.jt;153;
objj_executeFile("Nib2Cib.j",YES);
main=function(_1){
var _2=objj_msgSend(objj_msgSend(Nib2Cib,"alloc"),"initWithArgs:",_1);
objj_msgSend(_2,"run");
};
p;9;Nib2Cib.jt;19632;@STATIC;1.0;I;23;Foundation/Foundation.jI;15;AppKit/AppKit.jI;19;BlendKit/BlendKit.ji;14;NSFoundation.ji;10;NSAppKit.ji;24;Nib2CibKeyedUnarchiver.ji;11;Converter.jt;19461;
objj_executeFile("Foundation/Foundation.j",NO);
objj_executeFile("AppKit/AppKit.j",NO);
objj_executeFile("BlendKit/BlendKit.j",NO);
objj_executeFile("NSFoundation.j",YES);
objj_executeFile("NSAppKit.j",YES);
objj_executeFile("Nib2CibKeyedUnarchiver.j",YES);
objj_executeFile("Converter.j",YES);
var _1=require("file"),OS=require("os"),_2=require("system"),_3=require("jake").FileList,_4=require("narwhal/term").stream,_5=require("objective-j").StaticResource,_6="Aristo",_7=["Debug","Release"],_8="MainMenu",_9=new RegExp("^(defaultTheme|auxThemes|verbosity|quiet|frameworks|format)$"),_a=/"[^\"]+"|'[^\']+'|\S+/g;
var _b=objj_allocateClassPair(CPObject,"Nib2Cib"),_c=_b.isa;
class_addIvars(_b,[new objj_ivar("commandLineArgs"),new objj_ivar("parser"),new objj_ivar("nibInfo"),new objj_ivar("appDirectory"),new objj_ivar("resourcesDirectory"),new objj_ivar("infoPlist"),new objj_ivar("userNSClasses")]);
objj_registerClassPair(_b);
class_addMethods(_b,[new objj_method(sel_getUid("initWithArgs:"),function(_d,_e,_f){
with(_d){
_d=objj_msgSendSuper({receiver:_d,super_class:objj_getClass("Nib2Cib").super_class},"init");
if(_d){
commandLineArgs=_f;
parser=new (require("narwhal/args").Parser)();
nibInfo={};
appDirectory="";
resourcesDirectory="";
infoPlist=objj_msgSend(CPDictionary,"dictionary");
userNSClasses=[];
}
return _d;
}
}),new objj_method(sel_getUid("run"),function(_10,_11){
with(_10){
try{
var _12=objj_msgSend(_10,"parseOptionsFromArgs:",commandLineArgs);
objj_msgSend(_10,"setLogLevel:",_12.quiet?-1:_12.verbosity);
if(_12.watch){
objj_msgSend(_10,"watchWithOptions:",_12);
}else{
objj_msgSend(_10,"convertWithOptions:inputFile:",_12,nil);
}
}
catch(anException){
CPLog.fatal(objj_msgSend(_10,"exceptionReason:",anException));
OS.exit(1);
}
}
}),new objj_method(sel_getUid("convertWithOptions:inputFile:"),function(_13,_14,_15,_16){
with(_13){
try{
_16=_16||objj_msgSend(_13,"getInputFile:",_15.args);
objj_msgSend(_13,"getAppAndResourceDirectoriesFromInputFile:options:",_16,_15);
if(_15.readStoredOptions){
_15=objj_msgSend(_13,"mergeOptionsWithStoredOptions:inputFile:",_15,_16);
objj_msgSend(_13,"setLogLevel:",_15.quiet?-1:_15.verbosity);
}
if(!_15.quiet&&_15.verbosity>0){
objj_msgSend(_13,"printVersion");
}
var _17=objj_msgSend(_13,"getOutputFileFromInputFile:args:",_16,_15.args),_18=objj_msgSend(_13,"readConfigFile:inputFile:",_15.configFile||"",_16);
infoPlist=_18.plist;
if(infoPlist){
var _19=objj_msgSend(infoPlist,"valueForKey:","CPSystemFontFace");
if(_19){
objj_msgSend(CPFont,"setSystemFontFace:",_19);
}
var _1a=objj_msgSend(infoPlist,"valueForKey:","CPSystemFontSize");
if(_1a){
objj_msgSend(CPFont,"setSystemFontSize:",parseFloat(_1a,10));
}
}else{
infoPlist=objj_msgSend(CPDictionary,"dictionary");
}
var _1b=objj_msgSend(_13,"getThemeList:",_15),_1c=objj_msgSend(_13,"loadThemesFromList:",_1b);
CPLog.info("\n-------------------------------------------------------------");
CPLog.info("Input         : "+_16);
CPLog.info("Output        : "+_17);
CPLog.info("Format        : "+["Auto","Mac","iPhone"][_15.format]);
CPLog.info("Application   : "+appDirectory);
CPLog.info("Resources     : "+resourcesDirectory);
CPLog.info("Frameworks    : "+(_15.frameworks||""));
CPLog.info("Default theme : "+_1b[0]);
CPLog.info("Aux themes    : "+_1b.slice(1).join(", "));
CPLog.info("Config file   : "+(_18.path||""));
CPLog.info("System Font   : "+objj_msgSend(CPFont,"systemFontSize")+"px "+objj_msgSend(CPFont,"systemFontFace"));
CPLog.info("-------------------------------------------------------------\n");
var _1d=objj_msgSend(objj_msgSend(Converter,"alloc"),"initWithInputPath:format:themes:",_16,_15.format,_1c);
objj_msgSend(_1d,"setOutputPath:",_17);
objj_msgSend(_1d,"setResourcesPath:",resourcesDirectory);
var _1e=function(){
objj_msgSend(_13,"loadNSClassesFromBundle:",objj_msgSend(CPBundle,"mainBundle"));
objj_msgSend(_1d,"setUserNSClasses:",userNSClasses);
objj_msgSend(_1d,"convert");
};
objj_msgSend(_13,"loadFrameworks:verbosity:callback:",_15.frameworks,_15.verbosity,_1e);
return YES;
}
catch(anException){
CPLog.fatal(objj_msgSend(_13,"exceptionReason:",anException));
return NO;
}
}
}),new objj_method(sel_getUid("watchWithOptions:"),function(_1f,_20,_21){
with(_1f){
var _22=_21.quiet?-1:_21.verbosity,_23=_21.args[0];
if(!_23){
_23=_1.canonical(_1.isDirectory("Resources")?"Resources":".");
}else{
_23=_1.canonical(_23);
if(_1.basename(_23)!=="Resources"){
var _24=_1.join(_23,"Resources");
if(_1.isDirectory(_24)){
_23=_24;
}
}
}
if(!_1.isDirectory(_23)){
objj_msgSend(_1f,"failWithMessage:","Cannot find the directory: "+_23);
}
objj_msgSend(_1f,"setLogLevel:",1);
var _25=new _3(_1.join(_23,"*.[nx]ib")).items(),_26=_25.length;
while(_26--){
var nib=_25[_26],cib=nib.substr(0,nib.length-4)+".cib";
if(_1.exists(cib)&&(_1.mtime(nib)-_1.mtime(cib))<=0){
nibInfo[nib]=_1.mtime(nib);
}
}
CPLog.info("Watching: "+CPLogColorize(_23,"debug"));
CPLog.info("Press Control-C to stop...");
while(true){
var _27=objj_msgSend(_1f,"getModifiedNibsInDirectory:",_23);
for(var i=0;i<_27.length;++i){
var _28=_27[i][0],nib=_27[i][1],_29=_28==="add"?"Added":"Modified",_2a=_28==="add"?"info":"debug";
CPLog.info(">> %s: %s",CPLogColorize(_29,_2a),nib);
if(_28==="add"){
var cib=nib.substr(0,nib.length-4)+".cib";
if(_1.exists(cib)&&(_1.mtime(nib)-_1.mtime(cib))<0){
continue;
}
}
objj_msgSend(_1f,"setLogLevel:",_22);
var _2b=objj_msgSend(_1f,"convertWithOptions:inputFile:",_21,nib);
objj_msgSend(_1f,"setLogLevel:",1);
if(_2b){
if(_22>0){
_4.print();
}else{
CPLog.warn("Conversion successful");
}
}
}
OS.sleep(1);
}
}
}),new objj_method(sel_getUid("parseOptionsFromArgs:"),function(_2c,_2d,_2e){
with(_2c){
parser.usage("[--watch DIRECTORY] [INPUT_FILE [OUTPUT_FILE]]");
parser.option("--watch","watch").set(true).help("Ask nib2cib to watch a directory for changes");
parser.option("-R","resourcesDir").set().displayName("directory").help("Set the Resources directory, usually unnecessary as it is inferred from the input path");
parser.option("--default-theme","defaultTheme").set().displayName("name").help("Specify a custom default theme which is not set in your Info.plist");
parser.option("-t","--theme","auxThemes").push().displayName("name").help("An additional theme loaded dynamically by your application");
parser.option("--config","configFile").set().displayName("path").help("A path to an Info.plist file from which the system font and/or size can be retrieved");
parser.option("-v","--verbose","verbosity").inc().help("Increase verbosity level");
parser.option("-q","--quiet","quiet").set(true).help("No output");
parser.option("-F","--framework","frameworks").push().help("Add a framework to load");
parser.option("--no-stored-options","readStoredOptions").set(false).def(true).help("Do not read stored options");
parser.option("--mac","format").set(NibFormatMac).def(NibFormatUndetermined).help("Set format to Mac");
parser.option("--version","showVersion").action(function(){
objj_msgSend(_2c,"printVersionAndExit");
}).help("Show the version of nib2cib and quit");
parser.helpful();
var _2f=parser.parse(_2e,null,null,true);
if(_2f.args.length>2){
parser.printUsage(_2f);
OS.exit(0);
}
return _2f;
}
}),new objj_method(sel_getUid("mergeOptionsWithStoredOptions:inputFile:"),function(_30,_31,_32,_33){
with(_30){
var _34=objj_msgSend(_30,"readStoredOptionsAtPath:",_1.join(_2.env["HOME"],".nib2cibconfig")),_35=objj_msgSend(_30,"readStoredOptionsAtPath:",_1.join(appDirectory,"nib2cib.conf")),_36=_1.basename(_33,_1.extension(_33))+".conf",_37=objj_msgSend(_30,"readStoredOptionsAtPath:",_1.join(_1.dirname(_33),_36));
_34=objj_msgSend(_30,"parseOptionsFromArgs:",[_32.command].concat(_34));
_35=objj_msgSend(_30,"parseOptionsFromArgs:",[_32.command].concat(_35));
_37=objj_msgSend(_30,"parseOptionsFromArgs:",[_32.command].concat(_37));
var _38=_34;
objj_msgSend(_30,"mergeOptions:with:",_35,_38);
objj_msgSend(_30,"mergeOptions:with:",_37,_38);
objj_msgSend(_30,"mergeOptions:with:",_32,_38);
_38.args=_32.args;
return _38;
}
}),new objj_method(sel_getUid("readStoredOptionsAtPath:"),function(_39,_3a,_3b){
with(_39){
_3b=_1.canonical(_3b);
if(!_1.isReadable(_3b)){
return [];
}
var _3c=_1.open(_3b,"r"),_3d=_3c.readLine(),_3e=_3d.match(_a)||[];
_3c.close();
CPLog.debug("Reading stored options: "+_3b);
if(_3e){
for(var i=0;i<_3e.length;++i){
var str=_3e[i];
if((str.charAt(0)==="\""&&str.substr(-1)==="\"")||(str.charAt(0)==="'"&&str.substr(-1)==="'")){
_3e[i]=str.substr(1,str.length-2);
}
}
return _3e;
}else{
return [];
}
}
}),new objj_method(sel_getUid("printOptions:"),function(_3f,_40,_41){
with(_3f){
for(option in _41){
var _42=_41[option];
if(_42){
var _43=_42.length!==undefined?_42.length>0:!!_42;
if(_43){
print(option+": "+_42);
}
}
}
}
}),new objj_method(sel_getUid("mergeOptions:with:"),function(_44,_45,_46,_47){
with(_44){
for(option in _46){
if(!_9.test(option)){
continue;
}
if(_46.hasOwnProperty(option)){
var _48=_46[option];
if(_48){
var _49=_48.length!==undefined?_48.length>0:!!_48;
if(_49){
_47[option]=_48;
}
}
}
}
}
}),new objj_method(sel_getUid("setLogLevel:"),function(_4a,_4b,_4c){
with(_4a){
CPLogUnregister(CPLogPrint);
if(_4c===0){
CPLogRegister(CPLogPrint,"warn",logFormatter);
}else{
if(_4c===1){
CPLogRegister(CPLogPrint,"info",logFormatter);
}else{
if(_4c>1){
CPLogRegister(CPLogPrint,null,logFormatter);
}
}
}
}
}),new objj_method(sel_getUid("getInputFile:"),function(_4d,_4e,_4f){
with(_4d){
var _50=_4f[0]||_8,_51="";
if(!/^.+\.[nx]ib$/.test(_50)){
if(_51=objj_msgSend(_4d,"findInputFile:extension:",_50,".xib")){
_50=_51;
}else{
if(_51=objj_msgSend(_4d,"findInputFile:extension:",_50,".nib")){
_50=_51;
}else{
objj_msgSend(_4d,"failWithMessage:","Cannot find the input file (.xib or .nib): "+_1.canonical(_50));
}
}
}else{
if(_51=objj_msgSend(_4d,"findInputFile:extension:",_50,nil)){
_50=_51;
}else{
objj_msgSend(_4d,"failWithMessage:","Could not read the input file: "+_1.canonical(_50));
}
}
return _1.canonical(_50);
}
}),new objj_method(sel_getUid("findInputFile:extension:"),function(_52,_53,_54,_55){
with(_52){
var _56=_54;
if(_55){
_56+=_55;
}
if(_1.isReadable(_56)){
return _56;
}
if(_1.basename(_1.dirname(_54))!=="Resources"&&_1.isDirectory("Resources")){
_56=_1.resolve(_56,_1.join("Resources",_1.basename(_56)));
if(_1.isReadable(_56)){
return _56;
}
}
return null;
}
}),new objj_method(sel_getUid("getAppAndResourceDirectoriesFromInputFile:options:"),function(_57,_58,_59,_5a){
with(_57){
appDirectory=resourcesDirectory="";
if(_5a.resourcesDir){
var _5b=_1.canonical(_5a.resourcesDir);
if(!_1.isDirectory(_5b)){
objj_msgSend(_57,"failWithMessage:","Cannot read resources at: "+_5b);
}
resourcesDirectory=_5b;
}
var _5c=_1.dirname(_59);
if(_1.basename(_5c)==="Resources"){
appDirectory=_1.dirname(_5c);
resourcesDirectory=resourcesDirectory||_5c;
}else{
appDirectory=_5c;
if(!resourcesDirectory){
var _5b=_1.join(appDirectory,"Resources");
if(_1.isDirectory(_5b)){
resourcesDirectory=_5b;
}
}
}
}
}),new objj_method(sel_getUid("getOutputFileFromInputFile:args:"),function(_5d,_5e,_5f,_60){
with(_5d){
var _61=null;
if(_60.length>1){
_61=_60[1];
if(!/^.+\.cib$/.test(_61)){
_61+=".cib";
}
}else{
_61=_1.join(_1.dirname(_5f),_1.basename(_5f,_1.extension(_5f)))+".cib";
}
_61=_1.canonical(_61);
if(!_1.isWritable(_1.dirname(_61))){
objj_msgSend(_5d,"failWithMessage:","Cannot write the output file at: "+_61);
}
return _61;
}
}),new objj_method(sel_getUid("loadFrameworks:verbosity:callback:"),function(_62,_63,_64,_65,_66){
with(_62){
if(!_64||_64.length===0){
return _66();
}
var _67=function(_68){
return _68;
};
_64.forEach(function(_69){
objj_msgSend(_62,"setLogLevel:",_65);
var _6a=nil;
if(_69.indexOf("/")===-1){
_6a=objj_msgSend(_62,"findInCappBuild:isDirectory:callback:",_69,YES,_67);
if(!_6a){
_6a=objj_msgSend(_62,"findInFrameworks:path:isDirectory:callback:",_1.join(appDirectory,"Frameworks"),_69,YES,_67);
}
if(!_6a){
_6a=objj_msgSend(_62,"findInInstalledFrameworks:isDirectory:callback:",_69,YES,_67);
}
}else{
_6a=_1.canonical(_69);
}
if(!_6a){
objj_msgSend(_62,"failWithMessage:","Cannot find the framework \""+_69+"\"");
}
CPLog.debug("Loading framework: "+_6a);
try{
objj_msgSend(_62,"setLogLevel:",-1);
var _6b=objj_msgSend(objj_msgSend(CPBundle,"alloc"),"initWithPath:",_6a);
objj_msgSend(_6b,"loadWithDelegate:",nil);
objj_msgSend(_62,"setLogLevel:",_65);
objj_msgSend(_62,"loadNSClassesFromBundle:",_6b);
}
finally{
objj_msgSend(_62,"setLogLevel:",_65);
}
require("browser/timeout").serviceTimeouts();
});
_66();
}
}),new objj_method(sel_getUid("loadNSClassesFromBundle:"),function(_6c,_6d,_6e){
with(_6c){
var _6f=objj_msgSend(_6e,"objectForInfoDictionaryKey:","NSClasses")||[],_70=objj_msgSend(_6e,"bundlePath");
for(var i=0;i<_6f.length;++i){
if(userNSClasses.indexOf(_6f[i])>=0){
continue;
}
var _71=_1.join(_70,"NS_"+_6f[i]+".j");
objj_importFile(_71,YES);
CPLog.debug("Imported NS class: %s",_71);
userNSClasses.push(_6f[i]);
}
}
}),new objj_method(sel_getUid("getThemeList:"),function(_72,_73,_74){
with(_72){
var _75=_74.defaultTheme;
if(!_75){
_75=objj_msgSend(infoPlist,"valueForKey:","CPDefaultTheme");
}
if(!_75){
_75=objj_msgSend(_72,"getAppKitDefaultThemeName");
}
var _76=objj_msgSend(CPSet,"setWithObject:",_75);
if(_74.auxThemes){
objj_msgSend(_76,"addObjectsFromArray:",_74.auxThemes);
}
var _77=infoPlist.valueForKey("CPAuxiliaryThemes");
if(_77){
objj_msgSend(_76,"addObjectsFromArray:",_77);
}
objj_msgSend(_76,"removeObject:",_75);
var _78=objj_msgSend(_76,"allObjects");
objj_msgSend(_78,"insertObject:atIndex:",_75,0);
return _78;
}
}),new objj_method(sel_getUid("findInCappBuild:isDirectory:callback:"),function(_79,_7a,_7b,_7c,_7d){
with(_79){
var _7e=_2.env["CAPP_BUILD"];
if(!_7e){
return undefined;
}
_7e=_1.canonical(_7e);
if(_1.isDirectory(_7e)){
var _7f=null;
for(var i=0;i<_7.length&&!_7f;++i){
var _80=_1.join(_7e,_7[i],_7b);
if((_7c&&_1.isDirectory(_80))||(!_7c&&_1.exists(_80))){
_7f=_7d(_80);
}
}
return _7f;
}else{
return false;
}
}
}),new objj_method(sel_getUid("findInInstalledFrameworks:isDirectory:callback:"),function(_81,_82,_83,_84,_85){
with(_81){
return objj_msgSend(_81,"findInFrameworks:path:isDirectory:callback:",_1.canonical(_1.join(_2.prefix,"packages/cappuccino/Frameworks")),_83,_84,_85);
}
}),new objj_method(sel_getUid("findInFrameworks:path:isDirectory:callback:"),function(_86,_87,_88,_89,_8a,_8b){
with(_86){
var _8c=null,_8d=_1.join(_88,"Debug",_89);
if((_8a&&_1.isDirectory(_8d))||(!_8a&&_1.exists(_8d))){
_8c=_8b(_8d);
}
if(!_8c){
_8d=_1.join(_88,_89);
if((_8a&&_1.isDirectory(_8d))||(!_8a&&_1.exists(_8d))){
_8c=_8b(_8d);
}
}
return _8c;
}
}),new objj_method(sel_getUid("getAppKitDefaultThemeName"),function(_8e,_8f){
with(_8e){
var _90=function(_91){
return objj_msgSend(_8e,"themeNameFromPropertyList:",_91);
},_92=objj_msgSend(_8e,"findInCappBuild:isDirectory:callback:","AppKit/Info.plist",NO,_90);
if(!_92){
_92=objj_msgSend(_8e,"findInInstalledFrameworks:isDirectory:callback:","AppKit/Info.plist",NO,_90);
}
return _92||_6;
}
}),new objj_method(sel_getUid("themeNameFromPropertyList:"),function(_93,_94,_95){
with(_93){
if(!_1.isReadable(_95)){
return nil;
}
var _96=nil,_97=CFPropertyList.readPropertyListFromFile(_95);
if(_97){
_96=_97.valueForKey("CPDefaultTheme");
}
return _96;
}
}),new objj_method(sel_getUid("loadThemesFromList:"),function(_98,_99,_9a){
with(_98){
var _9b=[];
for(var i=0;i<_9a.length;++i){
_9b.push(objj_msgSend(_98,"loadThemeNamed:directory:",_9a[i],resourcesDirectory));
}
return _9b;
}
}),new objj_method(sel_getUid("loadThemeNamed:directory:"),function(_9c,_9d,_9e,_9f){
with(_9c){
if(/^.+\.blend$/.test(_9e)){
_9e=_9e.substr(0,_9e.length-".blend".length);
}
var _a0=_9e+".blend",_a1="";
if(_9f){
_a1=_1.join(_1.canonical(_9f),_a0);
if(!_1.isDirectory(_a1)){
_a1=_9f=null;
}
}
if(!_9f){
var _a2=function(_a3){
return _a3;
};
_a1=objj_msgSend(_9c,"findInCappBuild:isDirectory:callback:",_a0,YES,_a2);
if(!_a1){
_a1=objj_msgSend(_9c,"findInInstalledFrameworks:isDirectory:callback:","AppKit/Resources/"+_a0,YES,_a2);
}
if(!_a1){
var _a4=_1.canonical(_a0);
if(_1.isDirectory(_a4)){
_a1=_a4;
}
}
}
if(!_a1){
objj_msgSend(_9c,"failWithMessage:","Cannot find the theme \""+_9e+"\"");
}
return objj_msgSend(_9c,"readThemeWithName:atPath:",_9e,_a1);
}
}),new objj_method(sel_getUid("readThemeWithName:atPath:"),function(_a5,_a6,_a7,_a8){
with(_a5){
var _a9=new CFBundle(_a8);
_a9.mostEligibleEnvironment=function(){
return "Browser";
};
_a9.load();
var _aa=_a9.valueForInfoDictionaryKey("CPKeyedThemes");
if(!_aa){
objj_msgSend(_a5,"failWithMessage:","Could not find the keyed themes in the theme: "+_a8);
}
var _ab=_aa.indexOf(_a7+".keyedtheme");
if(_ab<0){
objj_msgSend(_a5,"failWithMessage:","Could not find the main theme data ("+_a7+".keyedtheme"+") in the theme: "+_a8);
}
var _ac=_a9.pathForResource(_aa[_ab]),_ad=new CFMutableData();
_ad.setRawString(_5.resourceAtURL(new CFURL(_ac),true).contents());
var _ae=objj_msgSend(CPKeyedUnarchiver,"unarchiveObjectWithData:",_ad);
if(!_ae){
objj_msgSend(_a5,"failWithMessage:","Could not unarchive the theme at: "+_a8);
}
CPLog.debug("Loaded theme: "+_a8);
return _ae;
}
}),new objj_method(sel_getUid("readConfigFile:inputFile:"),function(_af,_b0,_b1,_b2){
with(_af){
var _b3=null,_b4;
if(_b1){
_b4=_1.canonical(_b1);
if(!_1.isReadable(_b4)){
objj_msgSend(_af,"failWithMessage:","Cannot find the config file: "+_b4);
}
_b3=_b4;
}else{
_b4=_1.join(appDirectory,"Info.plist");
if(_1.isReadable(_b4)){
_b3=_b4;
}
}
var _b5=null;
if(_b3){
var _b5=_1.read(_b3);
if(!_b5){
objj_msgSend(_af,"failWithMessage:","Could not read the Info.plist at: "+_b3);
}
_b5=CFPropertyList.propertyListFromString(_b5);
if(!_b5){
objj_msgSend(_af,"failWithMessage:","Could not parse the Info.plist at: "+_b3);
}
}
return {path:_b3,plist:_b5};
}
}),new objj_method(sel_getUid("getModifiedNibsInDirectory:"),function(_b6,_b7,_b8){
with(_b6){
var _b9=new _3(_1.join(_b8,"*.[nx]ib")).items(),_ba=_b9.length,_bb={},_bc=[];
while(_ba--){
var nib=_b9[_ba];
_bb[nib]=_1.mtime(nib);
if(!nibInfo.hasOwnProperty(nib)){
_bc.push(["add",nib]);
}else{
if(_bb[nib]-nibInfo[nib]!==0){
_bc.push(["mod",nib]);
}
delete nibInfo[nib];
}
}
for(var nib in nibInfo){
if(nibInfo.hasOwnProperty(nib)){
CPLog.info(">> %s: %s",CPLogColorize("Deleted","warn"),nib);
}
}
nibInfo=_bb;
return _bc;
}
}),new objj_method(sel_getUid("printVersionAndExit"),function(_bd,_be){
with(_bd){
objj_msgSend(_bd,"printVersion");
OS.exit(0);
}
}),new objj_method(sel_getUid("printVersion"),function(_bf,_c0){
with(_bf){
var _c1=_1.dirname(_1.dirname(_1.canonical(_2.args[0]))),_c2=null;
if(_1.basename(_c1)==="narwhal"){
_c1=_1.join(_c1,"packages","cappuccino");
}
_c1=_1.join(_c1,"lib","nib2cib","Info.plist");
if(_1.isReadable(_c1)){
var _c3=_1.read(_c1);
if(!_c3){
return;
}
_c3=CFPropertyList.propertyListFromString(_c3);
if(!_c3){
return;
}
_c2=_c3.valueForKey("CPBundleVersion");
if(_c2){
_4.print("nib2cib v"+_c2);
}
}
if(!_c2){
_4.print("<No version info available>");
}
}
}),new objj_method(sel_getUid("exceptionReason:"),function(_c4,_c5,_c6){
with(_c4){
if(typeof (_c6)==="string"){
return _c6;
}else{
if(_c6.isa&&objj_msgSend(_c6,"respondsToSelector:",sel_getUid("reason"))){
return objj_msgSend(_c6,"reason");
}else{
return "An unknown error occurred";
}
}
}
}),new objj_method(sel_getUid("failWithMessage:"),function(_c7,_c8,_c9){
with(_c7){
objj_msgSend(CPException,"raise:reason:",ConverterConversionException,_c9);
}
})]);
logFormatter=function(_ca,_cb,_cc){
if(_cb==="info"){
return _ca;
}else{
return CPLogColorize(_ca,_cb);
}
};
p;24;Nib2CibKeyedUnarchiver.jt;1384;@STATIC;1.0;I;30;Foundation/CPKeyedUnarchiver.jt;1330;
objj_executeFile("Foundation/CPKeyedUnarchiver.j",NO);
var _1=require("file");
var _2=objj_allocateClassPair(CPKeyedUnarchiver,"Nib2CibKeyedUnarchiver"),_3=_2.isa;
class_addIvars(_2,[new objj_ivar("resourcesPath")]);
objj_registerClassPair(_2);
class_addMethods(_2,[new objj_method(sel_getUid("resourcesPath"),function(_4,_5){
with(_4){
return resourcesPath;
}
}),new objj_method(sel_getUid("initForReadingWithData:resourcesPath:"),function(_6,_7,_8,_9){
with(_6){
_6=objj_msgSendSuper({receiver:_6,super_class:objj_getClass("Nib2CibKeyedUnarchiver").super_class},"initForReadingWithData:",_8);
if(_6){
resourcesPath=_9;
}
return _6;
}
}),new objj_method(sel_getUid("allObjects"),function(_a,_b){
with(_a){
return _objects;
}
}),new objj_method(sel_getUid("resourcePathForName:"),function(_c,_d,_e){
with(_c){
if(!resourcesPath){
return NULL;
}
var _f=[_1.listPaths(resourcesPath)];
while(_f.length>0){
var _10=_f.shift(),_11=0,_12=_10.length;
for(;_11<_12;++_11){
var _13=_10[_11];
if(_1.basename(_13)===_e){
return _13;
}else{
if(_1.isDirectory(_13)){
_f.push(_1.listPaths(_13));
}else{
if(!_1.extension(_e)&&_1.basename(_13).replace(/\.[^.]*$/,"")===_e){
return _13;
}
}
}
}
}
return NULL;
}
})]);
_1.listPaths=function(_14){
var _15=_1.list(_14),_16=_15.length;
while(_16--){
_15[_16]=_1.join(_14,_15[_16]);
}
return _15;
};
p;10;NSAppKit.jt;3881;@STATIC;1.0;i;15;_NSCornerView.ji;19;NSArrayController.ji;7;NSBox.ji;10;NSButton.ji;8;NSCell.ji;16;NSClassSwapper.ji;12;NSClipView.ji;9;NSColor.ji;13;NSColorWell.ji;18;NSCollectionView.ji;22;NSCollectionViewItem.ji;11;NSControl.ji;16;NSCustomObject.ji;18;NSCustomResource.ji;14;NSCustomView.ji;9;NSEvent.ji;8;NSFont.ji;16;NSIBObjectData.ji;9;NSImage.ji;13;NSImageView.ji;18;NSLevelIndicator.ji;10;NSMatrix.ji;8;NSMenu.ji;12;NSMenuItem.ji;16;NSNibConnector.ji;20;NSObjectController.ji;15;NSOutlineView.ji;15;NSPopUpButton.ji;19;NSPredicateEditor.ji;13;NSResponder.ji;14;NSRuleEditor.ji;14;NSScrollView.ji;12;NSScroller.ji;15;NSSearchField.ji;7;NSSet.ji;19;NSSecureTextField.ji;20;NSSegmentedControl.ji;10;NSSlider.ji;13;NSSplitView.ji;11;NSStepper.ji;15;NSTableColumn.ji;19;NSTableHeaderView.ji;13;NSTableView.ji;11;NSTabView.ji;15;NSTabViewItem.ji;13;NSTextField.ji;14;NSTokenField.ji;11;NSToolbar.ji;28;NSToolbarFlexibleSpaceItem.ji;15;NSToolbarItem.ji;25;NSToolbarShowColorsItem.ji;24;NSToolbarSeparatorItem.ji;20;NSToolbarSpaceItem.ji;26;NSUserDefaultsController.ji;8;NSView.ji;18;NSViewController.ji;18;NSWindowTemplate.ji;9;WebView.ji;18;NSSortDescriptor.ji;11;NSPopover.ji;21;NSProgressIndicator.jt;2671;
objj_executeFile("_NSCornerView.j",YES);
objj_executeFile("NSArrayController.j",YES);
objj_executeFile("NSBox.j",YES);
objj_executeFile("NSButton.j",YES);
objj_executeFile("NSCell.j",YES);
objj_executeFile("NSClassSwapper.j",YES);
objj_executeFile("NSClipView.j",YES);
objj_executeFile("NSColor.j",YES);
objj_executeFile("NSColorWell.j",YES);
objj_executeFile("NSCollectionView.j",YES);
objj_executeFile("NSCollectionViewItem.j",YES);
objj_executeFile("NSControl.j",YES);
objj_executeFile("NSCustomObject.j",YES);
objj_executeFile("NSCustomResource.j",YES);
objj_executeFile("NSCustomView.j",YES);
objj_executeFile("NSEvent.j",YES);
objj_executeFile("NSFont.j",YES);
objj_executeFile("NSIBObjectData.j",YES);
objj_executeFile("NSImage.j",YES);
objj_executeFile("NSImageView.j",YES);
objj_executeFile("NSLevelIndicator.j",YES);
objj_executeFile("NSMatrix.j",YES);
objj_executeFile("NSMenu.j",YES);
objj_executeFile("NSMenuItem.j",YES);
objj_executeFile("NSNibConnector.j",YES);
objj_executeFile("NSObjectController.j",YES);
objj_executeFile("NSOutlineView.j",YES);
objj_executeFile("NSPopUpButton.j",YES);
objj_executeFile("NSPredicateEditor.j",YES);
objj_executeFile("NSResponder.j",YES);
objj_executeFile("NSRuleEditor.j",YES);
objj_executeFile("NSScrollView.j",YES);
objj_executeFile("NSScroller.j",YES);
objj_executeFile("NSSearchField.j",YES);
objj_executeFile("NSSet.j",YES);
objj_executeFile("NSSecureTextField.j",YES);
objj_executeFile("NSSegmentedControl.j",YES);
objj_executeFile("NSSlider.j",YES);
objj_executeFile("NSSplitView.j",YES);
objj_executeFile("NSStepper.j",YES);
objj_executeFile("NSTableColumn.j",YES);
objj_executeFile("NSTableHeaderView.j",YES);
objj_executeFile("NSTableView.j",YES);
objj_executeFile("NSTabView.j",YES);
objj_executeFile("NSTabViewItem.j",YES);
objj_executeFile("NSTextField.j",YES);
objj_executeFile("NSTokenField.j",YES);
objj_executeFile("NSToolbar.j",YES);
objj_executeFile("NSToolbarFlexibleSpaceItem.j",YES);
objj_executeFile("NSToolbarItem.j",YES);
objj_executeFile("NSToolbarShowColorsItem.j",YES);
objj_executeFile("NSToolbarSeparatorItem.j",YES);
objj_executeFile("NSToolbarSpaceItem.j",YES);
objj_executeFile("NSUserDefaultsController.j",YES);
objj_executeFile("NSView.j",YES);
objj_executeFile("NSViewController.j",YES);
objj_executeFile("NSWindowTemplate.j",YES);
objj_executeFile("WebView.j",YES);
objj_executeFile("NSSortDescriptor.j",YES);
objj_executeFile("NSPopover.j",YES);
objj_executeFile("NSProgressIndicator.j",YES);
CP_NSMapClassName=function(_1){
if(_1.indexOf("NS")===0){
var _2="CP"+_1.substr(2);
if(CPClassFromString(_2)){
CPLog.debug("NSAppKit: mapping "+_1+" to "+_2);
return _2;
}
}
return _1;
};
p;9;NSArray.jt;439;@STATIC;1.0;I;21;Foundation/CPObject.jt;395;
objj_executeFile("Foundation/CPObject.j",NO);
var _1=objj_allocateClassPair(CPObject,"NSArray"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initWithCoder:"),function(_3,_4,_5){
with(_3){
return objj_msgSend(_5,"decodeObjectForKey:","NS.objects");
}
})]);
var _1=objj_allocateClassPair(NSArray,"NSMutableArray"),_2=_1.isa;
objj_registerClassPair(_1);
p;19;NSArrayController.jt;1565;@STATIC;1.0;I;26;AppKit/CPArrayController.jt;1515;
objj_executeFile("AppKit/CPArrayController.j",NO);
var _1=objj_getClass("CPArrayController");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"CPArrayController\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("NS_initWithCoder:"),function(_3,_4,_5){
with(_3){
_3=objj_msgSendSuper({receiver:_3,super_class:objj_getClass("CPArrayController").super_class},"NS_initWithCoder:",_5);
if(_3){
_avoidsEmptySelection=objj_msgSend(_5,"decodeBoolForKey:","NSAvoidsEmptySelection");
_clearsFilterPredicateOnInsertion=objj_msgSend(_5,"decodeBoolForKey:","NSClearsFilterPredicateOnInsertion");
_filterRestrictsInsertion=objj_msgSend(_5,"decodeBoolForKey:","NSFilterRestrictsInsertion");
_preservesSelection=objj_msgSend(_5,"decodeBoolForKey:","NSPreservesSelection");
_selectsInsertedObjects=objj_msgSend(_5,"decodeBoolForKey:","NSSelectsInsertedObjects");
_alwaysUsesMultipleValuesMarker=objj_msgSend(_5,"decodeBoolForKey:","NSAlwaysUsesMultipleValuesMarker");
_automaticallyRearrangesObjects=objj_msgSend(_5,"decodeBoolForKey:","NSAutomaticallyRearrangesObjects");
}
return _3;
}
})]);
var _1=objj_allocateClassPair(CPArrayController,"NSArrayController"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initWithCoder:"),function(_6,_7,_8){
with(_6){
return objj_msgSend(_6,"NS_initWithCoder:",_8);
}
}),new objj_method(sel_getUid("classForKeyedArchiver"),function(_9,_a){
with(_9){
return objj_msgSend(CPArrayController,"class");
}
})]);
p;20;NSAttributedString.jt;598;@STATIC;1.0;I;21;Foundation/CPObject.jI;31;Foundation/CPAttributedString.jt;518;
objj_executeFile("Foundation/CPObject.j",NO);
objj_executeFile("Foundation/CPAttributedString.j",NO);
var _1=objj_allocateClassPair(CPAttributedString,"NSAttributedString"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initWithCoder:"),function(_3,_4,_5){
with(_3){
return objj_msgSend(objj_msgSend(CPAttributedString,"alloc"),"initWithString:","");
}
})]);
var _1=objj_allocateClassPair(NSAttributedString,"NSMutableAttributedString"),_2=_1.isa;
objj_registerClassPair(_1);
p;7;NSBox.jt;1595;@STATIC;1.0;I;14;AppKit/CPBox.jt;1557;
objj_executeFile("AppKit/CPBox.j",NO);
var _1=objj_getClass("CPBox");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"CPBox\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("NS_initWithCoder:"),function(_3,_4,_5){
with(_3){
_3=objj_msgSendSuper({receiver:_3,super_class:objj_getClass("CPBox").super_class},"NS_initWithCoder:",_5);
if(_3){
_boxType=objj_msgSend(_5,"decodeIntForKey:","NSBoxType");
_borderType=objj_msgSend(_5,"decodeIntForKey:","NSBorderType");
_borderColor=objj_msgSend(_5,"decodeObjectForKey:","NSBorderColor2")||objj_msgSend(CPColor,"colorWithRed:green:blue:alpha:",0,0,0,0.42);
_fillColor=objj_msgSend(_5,"decodeObjectForKey:","NSFillColor2")||objj_msgSend(CPColor,"clearColor");
_cornerRadius=objj_msgSend(_5,"decodeFloatForKey:","NSCornerRadius2");
_borderWidth=objj_msgSend(_5,"decodeFloatForKey:","NSBorderWidth2")||1;
_contentMargin=objj_msgSend(_5,"decodeSizeForKey:","NSOffsets");
_title=objj_msgSend(objj_msgSend(_5,"decodeObjectForKey:","NSTitleCell"),"objectValue")||"";
_titlePosition=objj_msgSend(_5,"decodeObjectForKey:","NSTitlePosition");
if(_titlePosition===undefined){
_titlePosition=CPAtTop;
}
}
return _3;
}
})]);
var _1=objj_allocateClassPair(CPBox,"NSBox"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initWithCoder:"),function(_6,_7,_8){
with(_6){
return objj_msgSend(_6,"NS_initWithCoder:",_8);
}
}),new objj_method(sel_getUid("classForKeyedArchiver"),function(_9,_a){
with(_9){
return objj_msgSend(CPBox,"class");
}
})]);
p;10;NSButton.jt;7308;@STATIC;1.0;I;17;AppKit/CPButton.jI;19;AppKit/CPCheckBox.jI;16;AppKit/CPRadio.ji;8;NSCell.ji;11;NSControl.jt;7194;
objj_executeFile("AppKit/CPButton.j",NO);
objj_executeFile("AppKit/CPCheckBox.j",NO);
objj_executeFile("AppKit/CPRadio.j",NO);
objj_executeFile("NSCell.j",YES);
objj_executeFile("NSControl.j",YES);
var _1={};
_1[CPRoundedBezelStyle]=18;
_1[CPTexturedRoundedBezelStyle]=20;
_1[CPHUDBezelStyle]=20;
var _2=8388608,_3=16777216,_4=16711680,_5=16,_6=4,_7=12,_8=28,_9=44,_a=60,_b=68,_c=108;
var _d=objj_getClass("CPButton");
if(!_d){
throw new SyntaxError("*** Could not find definition for class \"CPButton\"");
}
var _e=_d.isa;
class_addMethods(_d,[new objj_method(sel_getUid("NS_initWithCoder:"),function(_f,_10,_11){
with(_f){
_f=objj_msgSendSuper({receiver:_f,super_class:objj_getClass("CPButton").super_class},"NS_initWithCoder:",_11);
if(_f){
var _12=objj_msgSend(_11,"decodeObjectForKey:","NSCell");
_f=objj_msgSend(_f,"NS_initWithCell:",_12);
}
return _f;
}
}),new objj_method(sel_getUid("NS_initWithCell:"),function(_13,_14,_15){
with(_13){
var _16=objj_msgSend(_15,"alternateImage"),_17=0,_18=0,_19=0;
if(objj_msgSend(_16,"isKindOfClass:",objj_msgSend(NSButtonImageSource,"class"))){
if(objj_msgSend(_16,"imageName")==="NSSwitch"){
_13.isa=objj_msgSend(CPCheckBox,"class");
}else{
if(objj_msgSend(_16,"imageName")==="NSRadioButton"){
_13.isa=objj_msgSend(CPRadio,"class");
_13._radioGroup=objj_msgSend(CPRadioGroup,"new");
}
}
_themeClass=objj_msgSend(objj_msgSend(_13,"class"),"defaultThemeClass");
}
NIB_CONNECTION_EQUIVALENCY_TABLE[objj_msgSend(_15,"UID")]=_13;
_title=objj_msgSend(_15,"title");
_controlSize=CPRegularControlSize;
objj_msgSend(_13,"setBordered:",objj_msgSend(_15,"isBordered"));
_bezelStyle=objj_msgSend(_15,"bezelStyle");
switch(_bezelStyle){
case CPRoundedBezelStyle:
_19=6;
_18=4;
_17=-12;
break;
case CPTexturedRoundedBezelStyle:
_19=2;
_18=-2;
_17=0;
break;
case CPHUDBezelStyle:
break;
case CPRoundRectBezelStyle:
_19=-3;
_18=-2;
_17=0;
_bezelStyle=CPRoundedBezelStyle;
break;
case CPSmallSquareBezelStyle:
_18=-2;
_17=0;
_bezelStyle=CPTexturedRoundedBezelStyle;
break;
case CPThickSquareBezelStyle:
case CPThickerSquareBezelStyle:
case CPRegularSquareBezelStyle:
_19=3;
_18=0;
_17=-4;
_bezelStyle=CPTexturedRoundedBezelStyle;
break;
case CPTexturedSquareBezelStyle:
_19=4;
_18=-1;
_17=-2;
_bezelStyle=CPTexturedRoundedBezelStyle;
break;
case CPShadowlessSquareBezelStyle:
_19=5;
_18=-2;
_17=0;
_bezelStyle=CPTexturedRoundedBezelStyle;
break;
case CPRecessedBezelStyle:
_19=-3;
_18=-2;
_17=0;
_bezelStyle=CPHUDBezelStyle;
break;
case CPRoundedDisclosureBezelStyle:
case CPHelpButtonBezelStyle:
case CPCircularBezelStyle:
case CPDisclosureBezelStyle:
CPLog.warn("NSButton [%s]: unsupported bezel style: %d",_title==null?"<no title>":"\""+_title+"\"",_bezelStyle);
_bezelStyle=CPHUDBezelStyle;
break;
default:
CPLog.warn("NSButton [%s]: unknown bezel style: %d",_title==null?"<no title>":"\""+_title+"\"",_bezelStyle);
_bezelStyle=CPHUDBezelStyle;
}
if(objj_msgSend(_15,"isBordered")){
CPLog.debug("NSButton [%s]: adjusting height from %d to %d",_title==null?"<no title>":"\""+_title+"\"",_frame.size.height,CPButtonDefaultHeight);
_frame.size.height=CPButtonDefaultHeight;
_frame.origin.x+=_18;
_frame.origin.y+=_19;
_frame.size.width+=_17;
_bounds.size.width+=_17;
_bounds.size.height=CPButtonDefaultHeight;
}
_keyEquivalent=objj_msgSend(_15,"keyEquivalent");
_keyEquivalentModifierMask=objj_msgSend(_15,"keyEquivalentModifierMask");
_imageDimsWhenDisabled=YES;
_allowsMixedState=objj_msgSend(_15,"allowsMixedState");
objj_msgSend(_13,"setImage:",objj_msgSend(_15,"normalImage"));
objj_msgSend(_13,"setImagePosition:",objj_msgSend(_15,"imagePosition"));
objj_msgSend(_13,"setEnabled:",objj_msgSend(_15,"isEnabled"));
return _13;
}
})]);
var _d=objj_allocateClassPair(CPButton,"NSButton"),_e=_d.isa;
objj_registerClassPair(_d);
class_addMethods(_d,[new objj_method(sel_getUid("initWithCoder:"),function(_1a,_1b,_1c){
with(_1a){
return objj_msgSend(_1a,"NS_initWithCoder:",_1c);
}
}),new objj_method(sel_getUid("classForKeyedArchiver"),function(_1d,_1e){
with(_1d){
return objj_msgSend(CPButton,"class");
}
})]);
var _d=objj_allocateClassPair(NSActionCell,"NSButtonCell"),_e=_d.isa;
class_addIvars(_d,[new objj_ivar("_isBordered"),new objj_ivar("_bezelStyle"),new objj_ivar("_title"),new objj_ivar("_normalImage"),new objj_ivar("_alternateImage"),new objj_ivar("_allowsMixedState"),new objj_ivar("_imagePosition"),new objj_ivar("_keyEquivalent"),new objj_ivar("_keyEquivalentModifierMask")]);
objj_registerClassPair(_d);
class_addMethods(_d,[new objj_method(sel_getUid("isBordered"),function(_1f,_20){
with(_1f){
return _isBordered;
}
}),new objj_method(sel_getUid("bezelStyle"),function(_21,_22){
with(_21){
return _bezelStyle;
}
}),new objj_method(sel_getUid("title"),function(_23,_24){
with(_23){
return _title;
}
}),new objj_method(sel_getUid("normalImage"),function(_25,_26){
with(_25){
return _normalImage;
}
}),new objj_method(sel_getUid("alternateImage"),function(_27,_28){
with(_27){
return _alternateImage;
}
}),new objj_method(sel_getUid("allowsMixedState"),function(_29,_2a){
with(_29){
return _allowsMixedState;
}
}),new objj_method(sel_getUid("imagePosition"),function(_2b,_2c){
with(_2b){
return _imagePosition;
}
}),new objj_method(sel_getUid("keyEquivalent"),function(_2d,_2e){
with(_2d){
return _keyEquivalent;
}
}),new objj_method(sel_getUid("keyEquivalentModifierMask"),function(_2f,_30){
with(_2f){
return _keyEquivalentModifierMask;
}
}),new objj_method(sel_getUid("initWithCoder:"),function(_31,_32,_33){
with(_31){
_31=objj_msgSendSuper({receiver:_31,super_class:objj_getClass("NSButtonCell").super_class},"initWithCoder:",_33);
if(_31){
var _34=objj_msgSend(_33,"decodeIntForKey:","NSButtonFlags"),_35=objj_msgSend(_33,"decodeIntForKey:","NSButtonFlags2"),_36=objj_msgSend(_33,"decodeIntForKey:","NSCellFlags2"),_37=(_34&_4)>>_5;
_isBordered=(_34&_2)?YES:NO;
_bezelStyle=(_35&7)|((_35&32)>>2);
_title=objj_msgSend(_33,"decodeObjectForKey:","NSContents");
_objectValue=objj_msgSend(_31,"state");
_normalImage=objj_msgSend(_33,"decodeObjectForKey:","NSNormalImage");
_alternateImage=objj_msgSend(_33,"decodeObjectForKey:","NSAlternateImage");
_allowsMixedState=(_36&_3)?YES:NO;
if((_37&_c)==_c){
_imagePosition=CPImageOverlaps;
}else{
if((_37&_b)==_b){
_imagePosition=CPImageOnly;
}else{
if((_37&_a)==_a){
_imagePosition=CPImageLeft;
}else{
if((_37&_9)==_9){
_imagePosition=CPImageRight;
}else{
if((_37&_8)==_8){
_imagePosition=CPImageBelow;
}else{
if((_37&_7)==_7){
_imagePosition=CPImageAbove;
}else{
if((_37&_6)==_6){
_imagePosition=CPNoImage;
}
}
}
}
}
}
}
_keyEquivalent=objj_msgSend(_33,"decodeObjectForKey:","NSKeyEquivalent");
_keyEquivalentModifierMask=_35>>8;
}
return _31;
}
})]);
var _d=objj_allocateClassPair(CPObject,"NSButtonImageSource"),_e=_d.isa;
class_addIvars(_d,[new objj_ivar("_imageName")]);
objj_registerClassPair(_d);
class_addMethods(_d,[new objj_method(sel_getUid("imageName"),function(_38,_39){
with(_38){
return _imageName;
}
}),new objj_method(sel_getUid("initWithCoder:"),function(_3a,_3b,_3c){
with(_3a){
_3a=objj_msgSendSuper({receiver:_3a,super_class:objj_getClass("NSButtonImageSource").super_class},"init");
if(_3a){
_imageName=objj_msgSend(_3c,"decodeObjectForKey:","NSImageName");
}
return _3a;
}
})]);
p;8;NSCell.jt;4269;@STATIC;1.0;I;21;Foundation/CPObject.ji;8;NSFont.jt;4212;
objj_executeFile("Foundation/CPObject.j",NO);
objj_executeFile("NSFont.j",YES);
var _1=objj_allocateClassPair(CPObject,"NSCell"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_state"),new objj_ivar("_isHighlighted"),new objj_ivar("_isEnabled"),new objj_ivar("_isEditable"),new objj_ivar("_isBordered"),new objj_ivar("_isBezeled"),new objj_ivar("_isSelectable"),new objj_ivar("_isScrollable"),new objj_ivar("_isContinuous"),new objj_ivar("_scrolls"),new objj_ivar("_wraps"),new objj_ivar("_truncates"),new objj_ivar("_sendsActionOnEndEditing"),new objj_ivar("_alignment"),new objj_ivar("_controlSize"),new objj_ivar("_objectValue"),new objj_ivar("_font"),new objj_ivar("_lineBreakMode"),new objj_ivar("_formatter")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("state"),function(_3,_4){
with(_3){
return _state;
}
}),new objj_method(sel_getUid("isHighlighted"),function(_5,_6){
with(_5){
return _isHighlighted;
}
}),new objj_method(sel_getUid("isEnabled"),function(_7,_8){
with(_7){
return _isEnabled;
}
}),new objj_method(sel_getUid("isEditable"),function(_9,_a){
with(_9){
return _isEditable;
}
}),new objj_method(sel_getUid("isBordered"),function(_b,_c){
with(_b){
return _isBordered;
}
}),new objj_method(sel_getUid("isBezeled"),function(_d,_e){
with(_d){
return _isBezeled;
}
}),new objj_method(sel_getUid("isSelectable"),function(_f,_10){
with(_f){
return _isSelectable;
}
}),new objj_method(sel_getUid("isScrollable"),function(_11,_12){
with(_11){
return _isScrollable;
}
}),new objj_method(sel_getUid("isContinuous"),function(_13,_14){
with(_13){
return _isContinuous;
}
}),new objj_method(sel_getUid("scrolls"),function(_15,_16){
with(_15){
return _scrolls;
}
}),new objj_method(sel_getUid("wraps"),function(_17,_18){
with(_17){
return _wraps;
}
}),new objj_method(sel_getUid("truncates"),function(_19,_1a){
with(_19){
return _truncates;
}
}),new objj_method(sel_getUid("sendsActionOnEndEditing"),function(_1b,_1c){
with(_1b){
return _sendsActionOnEndEditing;
}
}),new objj_method(sel_getUid("alignment"),function(_1d,_1e){
with(_1d){
return _alignment;
}
}),new objj_method(sel_getUid("controlSize"),function(_1f,_20){
with(_1f){
return _controlSize;
}
}),new objj_method(sel_getUid("objectValue"),function(_21,_22){
with(_21){
return _objectValue;
}
}),new objj_method(sel_getUid("font"),function(_23,_24){
with(_23){
return _font;
}
}),new objj_method(sel_getUid("lineBreakMode"),function(_25,_26){
with(_25){
return _lineBreakMode;
}
}),new objj_method(sel_getUid("formatter"),function(_27,_28){
with(_27){
return _formatter;
}
}),new objj_method(sel_getUid("initWithCoder:"),function(_29,_2a,_2b){
with(_29){
_29=objj_msgSendSuper({receiver:_29,super_class:objj_getClass("NSCell").super_class},"init");
if(_29){
var _2c=objj_msgSend(_2b,"decodeIntForKey:","NSCellFlags"),_2d=objj_msgSend(_2b,"decodeIntForKey:","NSCellFlags2");
_state=(_2c&2147483648)?CPOnState:CPOffState;
_isHighlighted=(_2c&1073741824)?YES:NO;
_isEnabled=(_2c&536870912)?NO:YES;
_isEditable=(_2c&268435456)?YES:NO;
_isBordered=(_2c&8388608)?YES:NO;
_isBezeled=(_2c&4194304)?YES:NO;
_isSelectable=(_2c&2097152)?YES:NO;
_isScrollable=(_2c&1048576)?YES:NO;
_isContinuous=(_2c&524544)?YES:NO;
_scrolls=(_2c&1048576)&&(_2c&64);
_wraps=(_2c&1048576===0)&&(_2c&64===0);
_truncates=!(_2c&1048576)&&(_2c&64);
_alignment=(_2d&469762048)>>26;
_lineBreakMode=(_2d&3584)>>9;
_controlSize=(_2d&917504)>>17;
_sendsActionOnEndEditing=(_2d&4194304)?YES:NO;
_objectValue=objj_msgSend(_2b,"decodeObjectForKey:","NSContents");
_font=objj_msgSend(_2b,"decodeObjectForKey:","NSSupport");
_formatter=objj_msgSend(_2b,"decodeObjectForKey:","NSFormatter");
}
return _29;
}
}),new objj_method(sel_getUid("replacementObjectForCoder:"),function(_2e,_2f,_30){
with(_2e){
return nil;
}
}),new objj_method(sel_getUid("stringValue"),function(_31,_32){
with(_31){
if(objj_msgSend(_objectValue,"isKindOfClass:",objj_msgSend(CPString,"class"))){
return _objectValue;
}
if(objj_msgSend(_objectValue,"respondsToSelector:",sel_getUid("attributedStringValue"))){
return objj_msgSend(_objectValue,"attributedStringValue");
}
return "";
}
})]);
var _1=objj_allocateClassPair(NSCell,"NSActionCell"),_2=_1.isa;
objj_registerClassPair(_1);
p;16;NSClassSwapper.jt;1906;@STATIC;1.0;i;11;Converter.jt;1871;
objj_executeFile("Converter.j",YES);
var _1={},_2={};
var _3="_CPCibClassSwapperClassNameKey",_4="_CPCibClassSwapperOriginalClassNameKey";
var _5=objj_allocateClassPair(_CPCibClassSwapper,"NSClassSwapper"),_6=_5.isa;
objj_registerClassPair(_5);
class_addMethods(_6,[new objj_method(sel_getUid("swapperClassForClassName:originalClassName:"),function(_7,_8,_9,_a){
with(_7){
var _b="$NSClassSwapper_"+_9+"_"+_a,_c=objj_lookUpClass(_b);
if(!_c){
var _d=nil;
if(objj_msgSend(objj_msgSend(objj_msgSend(Converter,"sharedConverter"),"userNSClasses"),"containsObject:",_9)){
_d=objj_lookUpClass("NS_"+_9);
}
var _e=_d||objj_lookUpClass(_a);
_c=objj_allocateClassPair(_e,_b);
objj_registerClassPair(_c);
class_addMethod(_c,sel_getUid("initWithCoder:"),function(_f,_10,_11){
if(_d){
_f.isa=_d;
_f=objj_msgSend(_f,_10,_11);
_f.isa=_c;
}else{
_f=objj_msgSendSuper({super_class:_e,receiver:_f},_10,_11);
}
if(_f){
var UID=objj_msgSend(_f,"UID");
_1[UID]=_9;
_2[UID]=_a;
}
return _f;
},"");
class_addMethod(_c,sel_getUid("classForKeyedArchiver"),function(_12,_13){
return objj_msgSend(_CPCibClassSwapper,"class");
},"");
class_addMethod(_c,sel_getUid("encodeWithCoder:"),function(_14,_15,_16){
if(_d){
_14.isa=_d;
objj_msgSend(_14,_15,_16);
_14.isa=_c;
}else{
objj_msgSendSuper({super_class:_e,receiver:_14},_15,_16);
}
if(_d){
var _17=objj_msgSend(_d,"classForKeyedArchiver");
if(_17){
_9=objj_msgSend(_17,"className");
}
}
objj_msgSend(_16,"encodeObject:forKey:",_9,_3);
objj_msgSend(_16,"encodeObject:forKey:",CP_NSMapClassName(_a),_4);
},"");
}
return _c;
}
}),new objj_method(sel_getUid("allocWithCoder:"),function(_18,_19,_1a){
with(_18){
var _1b=objj_msgSend(_1a,"decodeObjectForKey:","NSClassName"),_1c=objj_msgSend(_1a,"decodeObjectForKey:","NSOriginalClassName");
return objj_msgSend(objj_msgSend(_18,"swapperClassForClassName:originalClassName:",_1b,_1c),"alloc");
}
})]);
p;12;NSClipView.jt;1141;@STATIC;1.0;I;19;AppKit/CPClipView.jt;1098;
objj_executeFile("AppKit/CPClipView.j",NO);
var _1=objj_getClass("CPClipView");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"CPClipView\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("NS_initWithCoder:"),function(_3,_4,_5){
with(_3){
if(_3=objj_msgSendSuper({receiver:_3,super_class:objj_getClass("CPClipView").super_class},"NS_initWithCoder:",_5)){
_documentView=objj_msgSend(_5,"decodeObjectForKey:","NSDocView");
if(objj_msgSend(_5,"containsValueForKey:","NSBGColor")){
objj_msgSend(_3,"setBackgroundColor:",objj_msgSend(_5,"decodeObjectForKey:","NSBGColor"));
}
}
return _3;
}
}),new objj_method(sel_getUid("NS_isFlipped"),function(_6,_7){
with(_6){
return YES;
}
})]);
var _1=objj_allocateClassPair(CPClipView,"NSClipView"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initWithCoder:"),function(_8,_9,_a){
with(_8){
return objj_msgSend(_8,"NS_initWithCoder:",_a);
}
}),new objj_method(sel_getUid("classForKeyedArchiver"),function(_b,_c){
with(_b){
return objj_msgSend(CPClipView,"class");
}
})]);
p;18;NSCollectionView.jt;1532;@STATIC;1.0;I;25;AppKit/CPCollectionView.jt;1483;
objj_executeFile("AppKit/CPCollectionView.j",NO);
var _1=objj_getClass("CPCollectionView");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"CPCollectionView\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("NS_initWithCoder:"),function(_3,_4,_5){
with(_3){
_items=[];
_content=[];
_cachedItems=[];
_itemSize=CGSizeMakeZero();
_minItemSize=CGSizeMakeZero();
_maxItemSize=CGSizeMakeZero();
_verticalMargin=5;
_tileWidth=-1;
_selectionIndexes=objj_msgSend(CPIndexSet,"indexSet");
_allowsEmptySelection=YES;
if(_3=objj_msgSendSuper({receiver:_3,super_class:objj_getClass("CPCollectionView").super_class},"NS_initWithCoder:",_5)){
_backgroundColors=objj_msgSend(_5,"decodeObjectForKey:","NSBackgroundColors");
_maxNumberOfRows=objj_msgSend(_5,"decodeIntForKey:","NSMaxNumberOfGridRows");
_maxNumberOfColumns=objj_msgSend(_5,"decodeIntForKey:","NSMaxNumberOfGridColumns");
_isSelectable=objj_msgSend(_5,"decodeBoolForKey:","NSSelectable");
_allowsMultipleSelection=objj_msgSend(_5,"decodeBoolForKey:","NSAllowsMultipleSelection");
}
return _3;
}
})]);
var _1=objj_allocateClassPair(CPCollectionView,"NSCollectionView"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initWithCoder:"),function(_6,_7,_8){
with(_6){
return objj_msgSend(_6,"NS_initWithCoder:",_8);
}
}),new objj_method(sel_getUid("classForKeyedArchiver"),function(_9,_a){
with(_9){
return objj_msgSend(CPCollectionView,"class");
}
})]);
p;22;NSCollectionViewItem.jt;904;@STATIC;1.0;I;29;AppKit/CPCollectionViewItem.jt;852;
objj_executeFile("AppKit/CPCollectionViewItem.j",NO);
var _1=objj_getClass("CPCollectionViewItem");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"CPCollectionViewItem\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("NS_initWithCoder:"),function(_3,_4,_5){
with(_3){
return objj_msgSendSuper({receiver:_3,super_class:objj_getClass("CPCollectionViewItem").super_class},"NS_initWithCoder:",_5);
}
})]);
var _1=objj_allocateClassPair(CPCollectionViewItem,"NSCollectionViewItem"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initWithCoder:"),function(_6,_7,_8){
with(_6){
return objj_msgSend(_6,"NS_initWithCoder:",_8);
}
}),new objj_method(sel_getUid("classForKeyedArchiver"),function(_9,_a){
with(_9){
return objj_msgSend(CPCollectionViewItem,"class");
}
})]);
p;9;NSColor.jt;2102;@STATIC;1.0;I;19;Foundation/CPData.jI;16;AppKit/CPColor.jt;2038;
objj_executeFile("Foundation/CPData.j",NO);
objj_executeFile("AppKit/CPColor.j",NO);
var _1=-1,_2=0,_3=1,_4=2,_5=3,_6=4,_7=5,_8=6;
var _9=objj_getClass("CPColor");
if(!_9){
throw new SyntaxError("*** Could not find definition for class \"CPColor\"");
}
var _a=_9.isa;
class_addMethods(_9,[new objj_method(sel_getUid("NS_initWithCoder:"),function(_b,_c,_d){
with(_b){
var _e=objj_msgSend(_d,"decodeIntForKey:","NSColorSpace"),_f;
switch(_e){
case 1:
case 2:
var rgb=objj_msgSend(_d,"decodeBytesForKey:","NSRGB"),_10=CFData.bytesToString(rgb),_11=objj_msgSend(_10,"componentsSeparatedByString:"," "),_12=[0,0,0,1];
for(var i=0;i<_11.length&&i<4;i++){
_12[i]=objj_msgSend(_11[i],"floatValue");
}
_f=objj_msgSend(CPColor,"colorWithCalibratedRed:green:blue:alpha:",_12[0],_12[1],_12[2],_12[3]);
break;
case 3:
case 4:
var _13=objj_msgSend(_d,"decodeBytesForKey:","NSWhite"),_10=CFData.bytesToString(_13),_11=objj_msgSend(_10,"componentsSeparatedByString:"," "),_12=[0,1];
for(var i=0;i<_11.length&&i<2;i++){
_12[i]=objj_msgSend(_11[i],"floatValue");
}
_f=objj_msgSend(CPColor,"colorWithCalibratedWhite:alpha:",_12[0],_12[1]);
break;
case 6:
var _14=objj_msgSend(_d,"decodeObjectForKey:","NSCatalogName"),_15=objj_msgSend(_d,"decodeObjectForKey:","NSColorName"),_16=objj_msgSend(_d,"decodeObjectForKey:","NSColor");
if(_14==="System"){
var _f=null;
if(_15==="controlColor"){
_f=nil;
}else{
if(_15==="controlBackgroundColor"){
_f=objj_msgSend(CPColor,"whiteColor");
}else{
if(!_f){
_f=_16;
}
}
}
}else{
_f=null;
if(!_f){
_f=_16;
}
}
break;
default:
CPLog.warn("-[%@ %s] unknown color space %d",isa,_c,_e);
_f=objj_msgSend(CPColor,"blackColor");
break;
}
return _f;
}
})]);
var _9=objj_allocateClassPair(CPColor,"NSColor"),_a=_9.isa;
objj_registerClassPair(_9);
class_addMethods(_9,[new objj_method(sel_getUid("initWithCoder:"),function(_17,_18,_19){
with(_17){
return objj_msgSend(_17,"NS_initWithCoder:",_19);
}
}),new objj_method(sel_getUid("classForKeyedArchiver"),function(_1a,_1b){
with(_1a){
return objj_msgSend(CPColor,"class");
}
})]);
p;13;NSColorWell.jt;1194;@STATIC;1.0;I;20;AppKit/CPColorWell.ji;8;NSCell.ji;11;NSControl.jt;1122;
objj_executeFile("AppKit/CPColorWell.j",NO);
objj_executeFile("NSCell.j",YES);
objj_executeFile("NSControl.j",YES);
var _1=objj_getClass("CPColorWell");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"CPColorWell\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("NS_initWithCoder:"),function(_3,_4,_5){
with(_3){
_3=objj_msgSendSuper({receiver:_3,super_class:objj_getClass("CPColorWell").super_class},"NS_initWithCoder:",_5);
if(_3){
objj_msgSend(_3,"setEnabled:",objj_msgSend(_5,"decodeBoolForKey:","NSEnabled"));
objj_msgSend(_3,"setBordered:",objj_msgSend(_5,"decodeBoolForKey:","NSIsBordered"));
objj_msgSend(_3,"setColor:",objj_msgSend(_5,"decodeObjectForKey:","NSColor"));
}
return _3;
}
})]);
var _1=objj_allocateClassPair(CPColorWell,"NSColorWell"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initWithCoder:"),function(_6,_7,_8){
with(_6){
return objj_msgSend(_6,"NS_initWithCoder:",_8);
}
}),new objj_method(sel_getUid("classForKeyedArchiver"),function(_9,_a){
with(_9){
return objj_msgSend(CPColorWell,"class");
}
})]);
p;11;NSControl.jt;1752;@STATIC;1.0;I;18;AppKit/CPControl.ji;8;NSCell.ji;8;NSView.jt;1686;
objj_executeFile("AppKit/CPControl.j",NO);
objj_executeFile("NSCell.j",YES);
objj_executeFile("NSView.j",YES);
var _1=objj_getClass("CPControl");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"CPControl\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("NS_initWithCoder:"),function(_3,_4,_5){
with(_3){
_3=objj_msgSendSuper({receiver:_3,super_class:objj_getClass("CPControl").super_class},"NS_initWithCoder:",_5);
if(_3){
var _6=objj_msgSend(_5,"decodeObjectForKey:","NSCell");
objj_msgSend(_3,"sendActionOn:",CPLeftMouseUpMask);
objj_msgSend(_3,"setSendsActionOnEndEditing:",objj_msgSend(_6,"sendsActionOnEndEditing"));
objj_msgSend(_3,"setObjectValue:",objj_msgSend(_6,"objectValue"));
objj_msgSend(_3,"setFont:",objj_msgSend(_6,"font"));
objj_msgSend(_3,"setAlignment:",objj_msgSend(_6,"alignment"));
objj_msgSend(_3,"setEnabled:",objj_msgSend(_5,"decodeBoolForKey:","NSEnabled"));
objj_msgSend(_3,"setContinuous:",objj_msgSend(_6,"isContinuous"));
objj_msgSend(_3,"setTarget:",objj_msgSend(_5,"decodeObjectForKey:","NSTarget"));
objj_msgSend(_3,"setAction:",objj_msgSend(_5,"decodeObjectForKey:","NSAction"));
objj_msgSend(_3,"setLineBreakMode:",objj_msgSend(_6,"lineBreakMode"));
objj_msgSend(_3,"setFormatter:",objj_msgSend(_6,"formatter"));
}
return _3;
}
})]);
var _1=objj_allocateClassPair(CPControl,"NSControl"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initWithCoder:"),function(_7,_8,_9){
with(_7){
return objj_msgSend(_7,"NS_initWithCoder:",_9);
}
}),new objj_method(sel_getUid("classForKeyedArchiver"),function(_a,_b){
with(_a){
return objj_msgSend(CPControl,"class");
}
})]);
p;16;NSCustomObject.jt;969;@STATIC;1.0;I;27;AppKit/_CPCibCustomObject.jt;919;
objj_executeFile("AppKit/_CPCibCustomObject.j",NO);
var _1=objj_getClass("_CPCibCustomObject");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"_CPCibCustomObject\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("NS_initWithCoder:"),function(_3,_4,_5){
with(_3){
_3=objj_msgSendSuper({receiver:_3,super_class:objj_getClass("_CPCibCustomObject").super_class},"init");
if(_3){
_className=CP_NSMapClassName(objj_msgSend(_5,"decodeObjectForKey:","NSClassName"));
}
return _3;
}
})]);
var _1=objj_allocateClassPair(_CPCibCustomObject,"NSCustomObject"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initWithCoder:"),function(_6,_7,_8){
with(_6){
return objj_msgSend(_6,"NS_initWithCoder:",_8);
}
}),new objj_method(sel_getUid("classForKeyedArchiver"),function(_9,_a){
with(_9){
return objj_msgSend(_CPCibCustomObject,"class");
}
})]);
p;18;NSCustomResource.jt;1902;@STATIC;1.0;I;29;AppKit/_CPCibCustomResource.jt;1849;
objj_executeFile("AppKit/_CPCibCustomResource.j",NO);
var _1=require("file");
var _2=objj_getClass("_CPCibCustomResource");
if(!_2){
throw new SyntaxError("*** Could not find definition for class \"_CPCibCustomResource\"");
}
var _3=_2.isa;
class_addMethods(_2,[new objj_method(sel_getUid("NS_initWithCoder:"),function(_4,_5,_6){
with(_4){
_4=objj_msgSendSuper({receiver:_4,super_class:objj_getClass("_CPCibCustomResource").super_class},"init");
if(_4){
_className=CP_NSMapClassName(objj_msgSend(_6,"decodeObjectForKey:","NSClassName"));
_resourceName=objj_msgSend(_6,"decodeObjectForKey:","NSResourceName");
var _7=CGSizeMakeZero();
if(_resourceName=="NSSwitch"){
return nil;
}else{
if(_resourceName=="NSAddTemplate"||_resourceName=="NSRemoveTemplate"){
_resourceName=_resourceName.replace("NS","CP");
}else{
if(!objj_msgSend(objj_msgSend(_6,"resourcesPath"),"length")){
CPLog.warn("Resources found in nib, but no resources path specified with -R option.");
}else{
var _8=objj_msgSend(_6,"resourcePathForName:",_resourceName);
if(!_8){
CPLog.warn("Resource \""+_resourceName+"\" not found in the resources path: "+objj_msgSend(_6,"resourcesPath"));
}else{
_7=_9(_1.canonical(_8));
}
if(_8&&_1.extension(_8)!==_1.extension(_resourceName)){
_resourceName+=_1.extension(_8);
}
}
}
}
_properties=objj_msgSend(CPDictionary,"dictionaryWithObject:forKey:",_7,"size");
}
return _4;
}
})]);
var _a=require("cappuccino/image-utility"),_9=_a.sizeOfImageAtPath;
var _2=objj_allocateClassPair(_CPCibCustomResource,"NSCustomResource"),_3=_2.isa;
objj_registerClassPair(_2);
class_addMethods(_2,[new objj_method(sel_getUid("initWithCoder:"),function(_b,_c,_d){
with(_b){
return objj_msgSend(_b,"NS_initWithCoder:",_d);
}
}),new objj_method(sel_getUid("classForKeyedArchiver"),function(_e,_f){
with(_e){
return objj_msgSend(_CPCibCustomResource,"class");
}
})]);
p;14;NSCustomView.jt;1027;@STATIC;1.0;I;25;AppKit/_CPCibCustomView.ji;8;NSView.jt;967;
objj_executeFile("AppKit/_CPCibCustomView.j",NO);
objj_executeFile("NSView.j",YES);
var _1="_CPCibCustomViewClassNameKey";
var _2=objj_allocateClassPair(CPView,"NSCustomView"),_3=_2.isa;
class_addIvars(_2,[new objj_ivar("_className")]);
objj_registerClassPair(_2);
class_addMethods(_2,[new objj_method(sel_getUid("initWithCoder:"),function(_4,_5,_6){
with(_4){
_4=objj_msgSendSuper({receiver:_4,super_class:objj_getClass("NSCustomView").super_class},"NS_initWithCoder:",_6);
if(_4){
_className=objj_msgSend(_6,"decodeObjectForKey:","NSClassName");
}
return _4;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_7,_8,_9){
with(_7){
objj_msgSendSuper({receiver:_7,super_class:objj_getClass("NSCustomView").super_class},"encodeWithCoder:",_9);
objj_msgSend(_9,"encodeObject:forKey:",CP_NSMapClassName(_className),_1);
}
}),new objj_method(sel_getUid("classForKeyedArchiver"),function(_a,_b){
with(_a){
return objj_msgSend(_CPCibCustomView,"class");
}
})]);
p;17;NSDateFormatter.jt;911;@STATIC;1.0;I;28;Foundation/CPDateFormatter.jt;860;
objj_executeFile("Foundation/CPDateFormatter.j",NO);
var _1=objj_getClass("CPDateFormatter");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"CPDateFormatter\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("NS_initWithCoder:"),function(_3,_4,_5){
with(_3){
_3=objj_msgSendSuper({receiver:_3,super_class:objj_getClass("CPDateFormatter").super_class},"init");
if(_3){
_dateStyle=CPDateFormatterShortStyle;
}
return _3;
}
})]);
var _1=objj_allocateClassPair(CPDateFormatter,"NSDateFormatter"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initWithCoder:"),function(_6,_7,_8){
with(_6){
return objj_msgSend(_6,"NS_initWithCoder:",_8);
}
}),new objj_method(sel_getUid("classForKeyedArchiver"),function(_9,_a){
with(_9){
return objj_msgSend(CPDateFormatter,"class");
}
})]);
p;14;NSDictionary.jt;491;@STATIC;1.0;t;473;
var _1=objj_allocateClassPair(CPObject,"NSDictionary"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initWithCoder:"),function(_3,_4,_5){
with(_3){
return objj_msgSend(CPDictionary,"dictionaryWithObjects:forKeys:",objj_msgSend(_5,"decodeObjectForKey:","NS.objects"),objj_msgSend(_5,"decodeObjectForKey:","NS.keys"));
}
})]);
var _1=objj_allocateClassPair(NSDictionary,"NSMutableDictionary"),_2=_1.isa;
objj_registerClassPair(_1);
p;9;NSEvent.jt;718;@STATIC;1.0;t;700;
NSAlphaShiftKeyMask=1<<16;
NSShiftKeyMask=1<<17;
NSControlKeyMask=1<<18;
NSAlternateKeyMask=1<<19;
NSCommandKeyMask=1<<20;
NSNumericPadKeyMask=1<<21;
NSHelpKeyMask=1<<22;
NSFunctionKeyMask=1<<23;
NSDeviceIndependentModifierFlagsMask=4294901760;
CP_NSMapKeyMask=function(_1){
var _2=0;
if(_1&NSAlphaShiftKeyMask){
_2|=CPAlphaShiftKeyMask;
}
if(_1&NSShiftKeyMask){
_2|=CPShiftKeyMask;
}
if(_1&NSControlKeyMask){
_2|=CPControlKeyMask;
}
if(_1&NSAlternateKeyMask){
_2|=CPAlternateKeyMask;
}
if(_1&NSCommandKeyMask){
_2|=CPCommandKeyMask;
}
if(_1&NSNumericPadKeyMask){
_2|=CPNumericPadKeyMask;
}
if(_1&NSHelpKeyMask){
_2|=CPHelpKeyMask;
}
if(_1&NSFunctionKeyMask){
_2|=CPFunctionKeyMask;
}
return _2;
};
p;14;NSExpression.jt;6205;@STATIC;1.0;I;25;Foundation/CPExpression.jt;6156;
objj_executeFile("Foundation/CPExpression.j",NO);
var _1=objj_allocateClassPair(_CPKeyPathExpression,"NSKeyPathExpression"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initWithCoder:"),function(_3,_4,_5){
with(_3){
return objj_msgSend(_3,"NS_initWithCoder:",_5);
}
}),new objj_method(sel_getUid("classForKeyedArchiver"),function(_6,_7){
with(_6){
return objj_msgSend(_CPKeyPathExpression,"class");
}
})]);
var _1=objj_allocateClassPair(_CPConstantValueExpression,"_CPKeyPathSpecifierExpression"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("NS_initWithCoder:"),function(_8,_9,_a){
with(_8){
var _b=objj_msgSend(_a,"decodeObjectForKey:","NSKeyPath");
_8=objj_msgSendSuper({receiver:_8,super_class:objj_getClass("_CPKeyPathSpecifierExpression").super_class},"initWithValue:",_b);
return _8;
}
})]);
var _1=objj_allocateClassPair(_CPKeyPathSpecifierExpression,"NSKeyPathSpecifierExpression"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initWithCoder:"),function(_c,_d,_e){
with(_c){
return objj_msgSend(_c,"NS_initWithCoder:",_e);
}
}),new objj_method(sel_getUid("classForKeyedArchiver"),function(_f,_10){
with(_f){
return objj_msgSend(_CPConstantValueExpression,"class");
}
})]);
var _1=objj_getClass("_CPConstantValueExpression");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"_CPConstantValueExpression\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("NS_initWithCoder:"),function(_11,_12,_13){
with(_11){
var _14=objj_msgSend(_13,"decodeObjectForKey:","NSConstantValue");
return objj_msgSend(_11,"initWithValue:",_14);
}
})]);
var _1=objj_allocateClassPair(_CPConstantValueExpression,"NSConstantValueExpression"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initWithCoder:"),function(_15,_16,_17){
with(_15){
return objj_msgSend(_15,"NS_initWithCoder:",_17);
}
}),new objj_method(sel_getUid("classForKeyedArchiver"),function(_18,_19){
with(_18){
return objj_msgSend(_CPConstantValueExpression,"class");
}
})]);
var _1=objj_getClass("_CPFunctionExpression");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"_CPFunctionExpression\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("NS_initWithCoder:"),function(_1a,_1b,_1c){
with(_1a){
var _1d=objj_msgSend(_1c,"decodeIntForKey:","NSExpressionType"),_1e=objj_msgSend(_1c,"decodeObjectForKey:","NSOperand"),_1f=CPSelectorFromString(objj_msgSend(_1c,"decodeObjectForKey:","NSSelectorName")),_20=objj_msgSend(_1c,"decodeObjectForKey:","NSArguments");
return objj_msgSend(_1a,"initWithTarget:selector:arguments:type:",_1e,_1f,_20,_1d);
}
})]);
var _1=objj_allocateClassPair(_CPFunctionExpression,"NSFunctionExpression"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initWithCoder:"),function(_21,_22,_23){
with(_21){
return objj_msgSend(_21,"NS_initWithCoder:",_23);
}
}),new objj_method(sel_getUid("classForKeyedArchiver"),function(_24,_25){
with(_24){
return objj_msgSend(_CPFunctionExpression,"class");
}
})]);
var _1=objj_getClass("_CPSetExpression");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"_CPSetExpression\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("NS_initWithCoder:"),function(_26,_27,_28){
with(_26){
var _29=objj_msgSend(_28,"decodeIntForKey:","NSExpressionType"),_2a=objj_msgSend(_28,"decodeObjectForKey:","NSLeftExpression"),_2b=objj_msgSend(_28,"decodeObjectForKey:","NSRightExpression");
return objj_msgSend(_26,"initWithType:left:right:",_29,_2a,_2b);
}
})]);
var _1=objj_allocateClassPair(_CPSetExpression,"NSSetExpression"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initWithCoder:"),function(_2c,_2d,_2e){
with(_2c){
return objj_msgSend(_2c,"NS_initWithCoder:",_2e);
}
}),new objj_method(sel_getUid("classForKeyedArchiver"),function(_2f,_30){
with(_2f){
return objj_msgSend(_CPSetExpression,"class");
}
})]);
var _1=objj_allocateClassPair(_CPSelfExpression,"NSSelfExpression"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initWithCoder:"),function(_31,_32,_33){
with(_31){
return objj_msgSendSuper({receiver:_31,super_class:objj_getClass("NSSelfExpression").super_class},"init");
}
}),new objj_method(sel_getUid("classForKeyedArchiver"),function(_34,_35){
with(_34){
return objj_msgSend(_CPSelfExpression,"class");
}
})]);
var _1=objj_getClass("_CPVariableExpression");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"_CPVariableExpression\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("NS_initWithCoder:"),function(_36,_37,_38){
with(_36){
var _39=objj_msgSend(_38,"decodeObjectForKey:","NSVariable");
return objj_msgSend(_36,"initWithVariable:",_39);
}
})]);
var _1=objj_allocateClassPair(_CPVariableExpression,"NSVariableExpression"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initWithCoder:"),function(_3a,_3b,_3c){
with(_3a){
return objj_msgSend(_3a,"NS_initWithCoder:",_3c);
}
}),new objj_method(sel_getUid("classForKeyedArchiver"),function(_3d,_3e){
with(_3d){
return objj_msgSend(_CPVariableExpression,"class");
}
})]);
var _1=objj_getClass("_CPAggregateExpression");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"_CPAggregateExpression\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("NS_initWithCoder:"),function(_3f,_40,_41){
with(_3f){
var _42=objj_msgSend(_41,"decodeObjectForKey:","NSCollection");
return objj_msgSend(_3f,"initWithAggregate:",_42);
}
})]);
var _1=objj_allocateClassPair(_CPAggregateExpression,"NSAggregateExpression"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initWithCoder:"),function(_43,_44,_45){
with(_43){
return objj_msgSend(_43,"NS_initWithCoder:",_45);
}
}),new objj_method(sel_getUid("classForKeyedArchiver"),function(_46,_47){
with(_46){
return objj_msgSend(_CPAggregateExpression,"class");
}
})]);
p;8;NSFont.jt;1692;@STATIC;1.0;I;15;AppKit/CPFont.jt;1653;
objj_executeFile("AppKit/CPFont.j",NO);
var OS=require("os"),_1=require("cappuccino/fontinfo").fontinfo;
var _2="Lucida Grande",_3=13;
var _4=objj_getClass("CPFont");
if(!_4){
throw new SyntaxError("*** Could not find definition for class \"CPFont\"");
}
var _5=_4.isa;
class_addMethods(_4,[new objj_method(sel_getUid("NS_initWithCoder:"),function(_6,_7,_8){
with(_6){
var _9=objj_msgSend(_8,"decodeObjectForKey:","NSName"),_a=objj_msgSend(_8,"decodeDoubleForKey:","NSSize"),_b=false,_c=false,_d=_1(_9,_a);
if(_d){
_9=_d.familyName;
_b=_d.bold;
_c=_d.italic;
}
return objj_msgSend(_6,"_initWithName:size:bold:italic:",_9,_a,_b,_c);
}
})]);
var _4=objj_allocateClassPair(CPFont,"NSFont"),_5=_4.isa;
objj_registerClassPair(_4);
class_addMethods(_4,[new objj_method(sel_getUid("initWithCoder:"),function(_e,_f,_10){
with(_e){
return objj_msgSend(_e,"NS_initWithCoder:",_10);
}
}),new objj_method(sel_getUid("classForKeyedArchiver"),function(_11,_12){
with(_11){
return objj_msgSend(CPFont,"class");
}
})]);
class_addMethods(_5,[new objj_method(sel_getUid("initialize"),function(_13,_14){
with(_13){
CPLog.debug("NSFont: default IB font: %s %f",_2,_3);
}
}),new objj_method(sel_getUid("cibFontForNibFont:"),function(_15,_16,_17){
with(_15){
var _18=objj_msgSend(_17,"familyName");
if(_18===_2){
var _19=objj_msgSend(_17,"size"),_1a=objj_msgSend(_17,"isBold"),_1b=objj_msgSend(_17,"isItalic");
if(_19===_3&&!_1a&&!_1b){
return nil;
}else{
return objj_msgSend(objj_msgSend(CPFont,"alloc"),"_initWithName:size:bold:italic:",objj_msgSend(CPFont,"systemFontFace"),(_19==_3?CPFontDefaultSystemFontSize:_19),_1a,_1b);
}
}
return objj_msgSend(_17,"copy");
}
})]);
p;13;NSFormatter.jt;111;@STATIC;1.0;t;94;
var _1=objj_allocateClassPair(CPObject,"NSFormatter"),_2=_1.isa;
objj_registerClassPair(_1);
p;14;NSFoundation.jt;602;@STATIC;1.0;i;9;NSArray.ji;20;NSAttributedString.ji;17;NSDateFormatter.ji;14;NSDictionary.ji;14;NSExpression.ji;13;NSFormatter.ji;17;NSMutableString.ji;8;NSNull.ji;19;NSNumberFormatter.ji;7;NSSet.jt;399;
objj_executeFile("NSArray.j",YES);
objj_executeFile("NSAttributedString.j",YES);
objj_executeFile("NSDateFormatter.j",YES);
objj_executeFile("NSDictionary.j",YES);
objj_executeFile("NSExpression.j",YES);
objj_executeFile("NSFormatter.j",YES);
objj_executeFile("NSMutableString.j",YES);
objj_executeFile("NSNull.j",YES);
objj_executeFile("NSNumberFormatter.j",YES);
objj_executeFile("NSSet.j",YES);
p;16;NSIBObjectData.jt;2550;@STATIC;1.0;I;25;AppKit/_CPCibObjectData.ji;8;NSCell.jt;2489;
objj_executeFile("AppKit/_CPCibObjectData.j",NO);
objj_executeFile("NSCell.j",YES);
var _1=objj_getClass("_CPCibObjectData");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"_CPCibObjectData\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("NS_initWithCoder:"),function(_3,_4,_5){
with(_3){
_3=objj_msgSend(_3,"init");
if(_3){
_namesKeys=objj_msgSend(_5,"decodeObjectForKey:","NSNamesKeys");
_namesValues=objj_msgSend(_5,"decodeObjectForKey:","NSNamesValues");
_classesKeys=objj_msgSend(_5,"decodeObjectForKey:","NSClassesKeys");
_classesValues=objj_msgSend(_5,"decodeObjectForKey:","NSClassesValues");
_connections=objj_msgSend(_5,"decodeObjectForKey:","NSConnections");
_framework=objj_msgSend(_5,"decodeObjectForKey:","NSFramework");
_objectsKeys=objj_msgSend(_5,"decodeObjectForKey:","NSObjectsKeys");
_objectsValues=objj_msgSend(_5,"decodeObjectForKey:","NSObjectsValues");
objj_msgSend(_3,"removeCellsFromObjectGraph");
_fileOwner=objj_msgSend(_5,"decodeObjectForKey:","NSRoot");
_visibleWindows=objj_msgSend(_5,"decodeObjectForKey:","NSVisibleWindows");
}
return _3;
}
}),new objj_method(sel_getUid("removeCellsFromObjectGraph"),function(_6,_7){
with(_6){
var _8=_objectsKeys.length,_9={},_a={};
while(_8--){
var _b=_objectsKeys[_8];
if(!_b){
continue;
}
var _c=_objectsValues[_8];
if(objj_msgSend(_b,"isKindOfClass:",objj_msgSend(NSCell,"class"))){
_9[objj_msgSend(_b,"UID")]=_c;
continue;
}
if(!objj_msgSend(_c,"isKindOfClass:",objj_msgSend(NSCell,"class"))){
continue;
}
var _d=objj_msgSend(_c,"UID"),_e=_a[_d];
if(!_e){
_e=[];
_a[_d]=_e;
}
_e.push(_b);
_objectsKeys.splice(_8,1);
_objectsValues.splice(_8,1);
}
for(var _f in _a){
if(_a.hasOwnProperty(_f)){
var _e=_a[_f],_c=_9[_f];
_e.forEach(function(_10){
CPLog.debug("NSIBObjectData: promoted "+_10+" to child of "+_c);
_objectsKeys.push(_10);
_objectsValues.push(_c);
});
}
}
var _8=_objectsKeys.length;
while(_8--){
var _11=_objectsKeys[_8];
if(objj_msgSend(_11,"respondsToSelector:",sel_getUid("swapCellsForParents:"))){
objj_msgSend(_11,"swapCellsForParents:",_9);
}
}
}
})]);
var _1=objj_allocateClassPair(_CPCibObjectData,"NSIBObjectData"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initWithCoder:"),function(_12,_13,_14){
with(_12){
return objj_msgSend(_12,"NS_initWithCoder:",_14);
}
}),new objj_method(sel_getUid("classForKeyedArchiver"),function(_15,_16){
with(_15){
return objj_msgSend(_CPCibObjectData,"class");
}
})]);
p;9;NSImage.jt;848;@STATIC;1.0;I;16;AppKit/CPImage.jt;809;
objj_executeFile("AppKit/CPImage.j",NO);
var _1=objj_getClass("CPImage");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"CPImage\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("NS_initWithCoder:"),function(_3,_4,_5){
with(_3){
_3=objj_msgSend(_3,"init");
if(_3){
var _6=objj_msgSend(_5,"decodeIntForKey:","NSImageFlags");
_size=objj_msgSend(_5,"decodeSizeForKey:","NSSize");
}
return _3;
}
})]);
var _1=objj_allocateClassPair(CPImage,"NSImage"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initWithCoder:"),function(_7,_8,_9){
with(_7){
return objj_msgSend(_7,"NS_initWithCoder:",_9);
}
}),new objj_method(sel_getUid("classForKeyedArchiver"),function(_a,_b){
with(_a){
return objj_msgSend(CPImage,"class");
}
})]);
p;13;NSImageView.jt;2912;@STATIC;1.0;I;20;AppKit/CPImageView.jt;2868;
objj_executeFile("AppKit/CPImageView.j",NO);
var _1=objj_getClass("CPImageView");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"CPImageView\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("NS_initWithCoder:"),function(_3,_4,_5){
with(_3){
_3=objj_msgSendSuper({receiver:_3,super_class:objj_getClass("CPImageView").super_class},"NS_initWithCoder:",_5);
if(_3){
var _6=objj_msgSend(_5,"decodeObjectForKey:","NSCell");
objj_msgSend(_3,"setImageScaling:",objj_msgSend(_6,"imageScaling"));
objj_msgSend(_3,"setImageAlignment:",objj_msgSend(_6,"imageAlignment"));
_isEditable=objj_msgSend(_6,"isEditable");
}
return _3;
}
})]);
var _1=objj_allocateClassPair(CPImageView,"NSImageView"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initWithCoder:"),function(_7,_8,_9){
with(_7){
return objj_msgSendSuper({receiver:_7,super_class:objj_getClass("NSImageView").super_class},"NS_initWithCoder:",_9);
}
}),new objj_method(sel_getUid("classForKeyedArchiver"),function(_a,_b){
with(_a){
return objj_msgSend(CPImageView,"class");
}
})]);
NSImageAlignCenter=0;
NSImageAlignTop=1;
NSImageAlignTopLeft=2;
NSImageAlignTopRight=3;
NSImageAlignLeft=4;
NSImageAlignBottom=5;
NSImageAlignBottomLeft=6;
NSImageAlignBottomRight=7;
NSImageAlignRight=8;
NSImageScaleProportionallyDown=0;
NSImageScaleAxesIndependently=1;
NSImageScaleNone=2;
NSImageScaleProportionallyUpOrDown=3;
NSImageFrameNone=0;
NSImageFramePhoto=1;
NSImageFrameGrayBezel=2;
NSImageFrameGroove=3;
NSImageFrameButton=4;
var _1=objj_allocateClassPair(NSCell,"NSImageCell"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_animates"),new objj_ivar("_imageAlignment"),new objj_ivar("_imageScaling"),new objj_ivar("_frameStyle")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("_animates"),function(_c,_d){
with(_c){
return _animates;
}
}),new objj_method(sel_getUid("_setAnimates:"),function(_e,_f,_10){
with(_e){
_animates=_10;
}
}),new objj_method(sel_getUid("imageAlignment"),function(_11,_12){
with(_11){
return _imageAlignment;
}
}),new objj_method(sel_getUid("imageScaling"),function(_13,_14){
with(_13){
return _imageScaling;
}
}),new objj_method(sel_getUid("_frameStyle"),function(_15,_16){
with(_15){
return _frameStyle;
}
}),new objj_method(sel_getUid("_setFrameStyle:"),function(_17,_18,_19){
with(_17){
_frameStyle=_19;
}
}),new objj_method(sel_getUid("initWithCoder:"),function(_1a,_1b,_1c){
with(_1a){
_1a=objj_msgSendSuper({receiver:_1a,super_class:objj_getClass("NSImageCell").super_class},"initWithCoder:",_1c);
if(_1a){
_animates=objj_msgSend(_1c,"decodeBoolForKey:","NSAnimates");
_imageAlignment=objj_msgSend(_1c,"decodeIntForKey:","NSAlign");
_imageScaling=objj_msgSend(_1c,"decodeIntForKey:","NSScale");
_frameStyle=objj_msgSend(_1c,"decodeIntForKey:","NSStyle");
}
return _1a;
}
})]);
p;18;NSLevelIndicator.jt;3899;@STATIC;1.0;I;25;AppKit/CPLevelIndicator.jt;3850;
objj_executeFile("AppKit/CPLevelIndicator.j",NO);
var _1=objj_getClass("CPLevelIndicator");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"CPLevelIndicator\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("NS_initWithCoder:"),function(_3,_4,_5){
with(_3){
var _6=objj_msgSend(_5,"decodeObjectForKey:","NSCell");
_minValue=objj_msgSend(_6,"minValue");
_maxValue=objj_msgSend(_6,"maxValue");
_3=objj_msgSendSuper({receiver:_3,super_class:objj_getClass("CPLevelIndicator").super_class},"NS_initWithCoder:",_5);
if(_3){
_3=objj_msgSend(_3,"NS_initWithCell:",_6);
}
return _3;
}
}),new objj_method(sel_getUid("NS_initWithCell:"),function(_7,_8,_9){
with(_7){
_minValue=objj_msgSend(_9,"minValue");
_maxValue=objj_msgSend(_9,"maxValue");
_levelIndicatorStyle=objj_msgSend(_9,"levelIndicatorStyle");
_warningValue=objj_msgSend(_9,"warningValue");
_criticalValue=objj_msgSend(_9,"criticalValue");
_tickMarkPosition=objj_msgSend(_9,"tickMarkPosition");
_numberOfTickMarks=objj_msgSend(_9,"numberOfTickMarks");
_numberOfMajorTickMarks=objj_msgSend(_9,"numberOfMajorTickMarks");
objj_msgSend(_7,"setEditable:",objj_msgSend(_9,"isEditable"));
objj_msgSend(_7,"setEnabled:",objj_msgSend(_9,"isEnabled"));
objj_msgSend(_7,"setContinuous:",objj_msgSend(_9,"isContinuous"));
return _7;
}
})]);
var _1=objj_allocateClassPair(CPLevelIndicator,"NSLevelIndicator"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initWithCoder:"),function(_a,_b,_c){
with(_a){
return objj_msgSend(_a,"NS_initWithCoder:",_c);
}
}),new objj_method(sel_getUid("classForKeyedArchiver"),function(_d,_e){
with(_d){
return objj_msgSend(CPLevelIndicator,"class");
}
})]);
var _1=objj_allocateClassPair(NSCell,"NSLevelIndicatorCell"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_levelIndicatorStyle"),new objj_ivar("_minValue"),new objj_ivar("_maxValue"),new objj_ivar("_warningValue"),new objj_ivar("_criticalValue"),new objj_ivar("_tickMarkPosition"),new objj_ivar("_numberOfTickMarks"),new objj_ivar("_numberOfMajorTickMarks")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("levelIndicatorStyle"),function(_f,_10){
with(_f){
return _levelIndicatorStyle;
}
}),new objj_method(sel_getUid("minValue"),function(_11,_12){
with(_11){
return _minValue;
}
}),new objj_method(sel_getUid("maxValue"),function(_13,_14){
with(_13){
return _maxValue;
}
}),new objj_method(sel_getUid("warningValue"),function(_15,_16){
with(_15){
return _warningValue;
}
}),new objj_method(sel_getUid("criticalValue"),function(_17,_18){
with(_17){
return _criticalValue;
}
}),new objj_method(sel_getUid("tickMarkPosition"),function(_19,_1a){
with(_19){
return _tickMarkPosition;
}
}),new objj_method(sel_getUid("numberOfTickMarks"),function(_1b,_1c){
with(_1b){
return _numberOfTickMarks;
}
}),new objj_method(sel_getUid("numberOfMajorTickMarks"),function(_1d,_1e){
with(_1d){
return _numberOfMajorTickMarks;
}
}),new objj_method(sel_getUid("initWithCoder:"),function(_1f,_20,_21){
with(_1f){
_1f=objj_msgSendSuper({receiver:_1f,super_class:objj_getClass("NSLevelIndicatorCell").super_class},"initWithCoder:",_21);
if(_1f){
_objectValue=objj_msgSend(_21,"decodeDoubleForKey:","NSValue");
_minValue=objj_msgSend(_21,"decodeDoubleForKey:","NSMinValue");
_maxValue=objj_msgSend(_21,"decodeDoubleForKey:","NSMaxValue");
_warningValue=objj_msgSend(_21,"decodeDoubleForKey:","NSWarningValue");
_criticalValue=objj_msgSend(_21,"decodeDoubleForKey:","NSCriticalValue");
_levelIndicatorStyle=objj_msgSend(_21,"decodeIntForKey:","NSIndicatorStyle");
_tickMarkPosition=objj_msgSend(_21,"decodeIntForKey:","NSTickMarkPosition");
_numberOfTickMarks=objj_msgSend(_21,"decodeIntForKey:","NSNumberOfTickMarks");
_numberOfTickMarks=objj_msgSend(_21,"decodeIntForKey:","NSNumberOfMajorTickMarks");
}
return _1f;
}
})]);
p;10;NSMatrix.jt;2946;@STATIC;1.0;I;21;Foundation/CPObject.jI;15;AppKit/CPView.ji;8;NSView.jt;2869;
objj_executeFile("Foundation/CPObject.j",NO);
objj_executeFile("AppKit/CPView.j",NO);
objj_executeFile("NSView.j",YES);
var _1=1073741824,_2=16777216;
var _3=objj_allocateClassPair(CPView,"NSMatrix"),_4=_3.isa;
objj_registerClassPair(_3);
class_addMethods(_3,[new objj_method(sel_getUid("initWithCoder:"),function(_5,_6,_7){
with(_5){
return objj_msgSend(_5,"NS_initWithCoder:",_7);
}
}),new objj_method(sel_getUid("NS_initWithCoder:"),function(_8,_9,_a){
with(_8){
_8=objj_msgSendSuper({receiver:_8,super_class:objj_getClass("NSMatrix").super_class},"NS_initWithCoder:",_a);
if(_8){
var _b=objj_msgSend(_a,"decodeIntForKey:","NSNumRows"),_c=objj_msgSend(_a,"decodeIntForKey:","NSNumCols"),_d=objj_msgSend(_a,"decodeSizeForKey:","NSCellSize"),_e=objj_msgSend(_a,"decodeSizeForKey:","NSIntercellSpacing"),_f=objj_msgSend(_a,"decodeIntForKey:","NSMatrixFlags"),_10=_f&_1,_11=_f&_2,_12=objj_msgSend(_a,"decodeObjectForKey:","NSBackgroundColor"),_13=objj_msgSend(_a,"decodeObjectForKey:","NSCells"),_14=objj_msgSend(_a,"decodeObjectForKey:","NSSelectedCell");
if(_10){
var _15=objj_msgSend(CPRadioGroup,"new"),_16=CGRectMake(0,0,_d.width,_d.height);
for(var _17=0;_17<_b;++_17){
_16.origin.x=0;
for(var _18=0;_18<_c;++_18){
var _19=_13[_17*_c+_18],_1a=objj_msgSend(objj_msgSend(CPRadio,"alloc"),"initWithFrame:radioGroup:cell:",_16,_15,_19);
objj_msgSend(_8,"addSubview:",_1a);
NIB_CONNECTION_EQUIVALENCY_TABLE[objj_msgSend(_19,"UID")]=_1a;
_16.origin.x=CGRectGetMaxX(_16)+_e.width;
}
_16.origin.y=CGRectGetMaxY(_16)+_e.height;
}
if(_11){
objj_msgSend(_8,"setBackgroundColor:",_12);
}
_8.isa=objj_msgSend(CPView,"class");
}else{
_8=nil;
}
}
return _8;
}
})]);
var _3=objj_getClass("CPRadio");
if(!_3){
throw new SyntaxError("*** Could not find definition for class \"CPRadio\"");
}
var _4=_3.isa;
class_addMethods(_3,[new objj_method(sel_getUid("initWithFrame:radioGroup:cell:"),function(_1b,_1c,_1d,_1e,_1f){
with(_1b){
_1b=objj_msgSend(_1b,"initWithFrame:radioGroup:",_1d,_1e);
if(_1b){
objj_msgSend(_1b,"setAutoresizingMask:",CPViewWidthSizable|CPViewHeightSizable);
objj_msgSend(_1b,"setTitle:",objj_msgSend(_1f,"title"));
objj_msgSend(_1b,"setBackgroundColor:",objj_msgSend(CPColor,"clearColor"));
objj_msgSend(_1b,"setFont:",objj_msgSend(_1f,"font"));
objj_msgSend(_1b,"setAlignment:",objj_msgSend(_1f,"alignment"));
objj_msgSend(_1b,"setLineBreakMode:",objj_msgSend(_1f,"lineBreakMode"));
objj_msgSend(_1b,"setImagePosition:",objj_msgSend(_1f,"imagePosition"));
objj_msgSend(_1b,"setKeyEquivalent:",objj_msgSend(_1f,"keyEquivalent"));
objj_msgSend(_1b,"setKeyEquivalentModifierMask:",objj_msgSend(_1f,"keyEquivalentModifierMask"));
objj_msgSend(_1b,"setAllowsMixedState:",objj_msgSend(_1f,"allowsMixedState"));
objj_msgSend(_1b,"setObjectValue:",objj_msgSend(_1f,"objectValue"));
objj_msgSend(_1b,"setEnabled:",objj_msgSend(_1f,"isEnabled"));
}
return _1b;
}
})]);
p;8;NSMenu.jt;1489;@STATIC;1.0;I;15;AppKit/CPMenu.ji;12;NSMenuItem.jt;1433;
objj_executeFile("AppKit/CPMenu.j",NO);
objj_executeFile("NSMenuItem.j",YES);
NS_CPMenuNameMap={_NSMainMenu:"_CPMainMenu",_NSAppleMenu:"_CPApplicationMenu",_NSServicesMenu:"_CPServicesMenu",_NSWindowsMenu:"_CPWindowsMenu",_NSFontMenu:"_CPFontMenu",_NSRecentDocumentsMenu:"_CPRecentDocumentsMenu",_NSOpenDocumentsMenu:"_CPOpenDocumentsMenu"};
var _1=objj_getClass("CPMenu");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"CPMenu\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("NS_initWithCoder:"),function(_3,_4,_5){
with(_3){
_3=objj_msgSendSuper({receiver:_3,super_class:objj_getClass("CPMenu").super_class},"init");
if(_3){
_title=objj_msgSend(_5,"decodeObjectForKey:","NSTitle");
_items=objj_msgSend(_5,"decodeObjectForKey:","NSMenuItems");
_name=objj_msgSend(_5,"decodeObjectForKey:","NSName");
var _6=NS_CPMenuNameMap[_name];
if(_6){
_name=_6;
}
_showsStateColumn=!objj_msgSend(_5,"containsValueForKey:","NSMenuExcludeMarkColumn")||!objj_msgSend(_5,"decodeBoolForKey:","NSMenuExcludeMarkColumn");
}
return _3;
}
})]);
var _1=objj_allocateClassPair(CPMenu,"NSMenu"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initWithCoder:"),function(_7,_8,_9){
with(_7){
return objj_msgSend(_7,"NS_initWithCoder:",_9);
}
}),new objj_method(sel_getUid("classForKeyedArchiver"),function(_a,_b){
with(_a){
return objj_msgSend(CPMenu,"class");
}
})]);
p;12;NSMenuItem.jt;2217;@STATIC;1.0;I;19;AppKit/CPMenuItem.ji;9;NSEvent.ji;8;NSMenu.jt;2149;
objj_executeFile("AppKit/CPMenuItem.j",NO);
objj_executeFile("NSEvent.j",YES);
objj_executeFile("NSMenu.j",YES);
var _1=objj_getClass("CPMenuItem");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"CPMenuItem\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("NS_initWithCoder:"),function(_3,_4,_5){
with(_3){
_3=objj_msgSendSuper({receiver:_3,super_class:objj_getClass("CPMenuItem").super_class},"init");
if(_3){
_isSeparator=objj_msgSend(_5,"decodeBoolForKey:","NSIsSeparator");
_title=objj_msgSend(_5,"decodeObjectForKey:","NSTitle");
_target=objj_msgSend(_5,"decodeObjectForKey:","NSTarget");
_action=objj_msgSend(_5,"decodeObjectForKey:","NSAction");
_isEnabled=!objj_msgSend(_5,"decodeBoolForKey:","NSIsDisabled");
_isHidden=objj_msgSend(_5,"decodeBoolForKey:","NSIsHidden");
_tag=objj_msgSend(_5,"decodeIntForKey:","NSTag");
_state=objj_msgSend(_5,"decodeIntForKey:","NSState");
_image=objj_msgSend(_5,"decodeObjectForKey:","NSImage");
_submenu=objj_msgSend(_5,"decodeObjectForKey:","NSSubmenu");
_menu=objj_msgSend(_5,"decodeObjectForKey:","NSMenu");
_keyEquivalent=objj_msgSend(_5,"decodeObjectForKey:","NSKeyEquiv");
_keyEquivalentModifierMask=CP_NSMapKeyMask(objj_msgSend(_5,"decodeObjectForKey:","NSKeyEquivModMask"));
_indentationLevel=objj_msgSend(_5,"decodeIntForKey:","NSIndent");
_representedObject=objj_msgSend(_5,"decodeObjectForKey:","NSRepObject");
}
return _3;
}
}),new objj_method(sel_getUid("swapCellsForParents:"),function(_6,_7,_8){
with(_6){
var _9=objj_msgSend(_6,"target");
if(!_9){
return;
}
var _a=_8[objj_msgSend(objj_msgSend(_6,"target"),"UID")];
if(_a){
objj_msgSend(_6,"setTarget:",_a);
}
}
})]);
var _1=objj_allocateClassPair(CPMenuItem,"NSMenuItem"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initWithCoder:"),function(_b,_c,_d){
with(_b){
return objj_msgSend(_b,"NS_initWithCoder:",_d);
}
}),new objj_method(sel_getUid("classForKeyedArchiver"),function(_e,_f){
with(_e){
return objj_msgSend(CPMenuItem,"class");
}
})]);
var _1=objj_allocateClassPair(NSButtonCell,"NSMenuItemCell"),_2=_1.isa;
objj_registerClassPair(_1);
p;17;NSMutableString.jt;279;@STATIC;1.0;t;261;
var _1=objj_allocateClassPair(CPObject,"NSMutableString"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initWithCoder:"),function(_3,_4,_5){
with(_3){
return objj_msgSend(_5,"decodeObjectForKey:","NS.string");
}
})]);
p;16;NSNibConnector.jt;7055;@STATIC;1.0;I;23;AppKit/CPCibConnector.jI;30;AppKit/CPCibControlConnector.jI;29;AppKit/CPCibOutletConnector.jI;40;AppKit/CPCibRuntimeAttributesConnector.jI;27;AppKit/CPCibHelpConnector.jt;6862;
objj_executeFile("AppKit/CPCibConnector.j",NO);
objj_executeFile("AppKit/CPCibControlConnector.j",NO);
objj_executeFile("AppKit/CPCibOutletConnector.j",NO);
objj_executeFile("AppKit/CPCibRuntimeAttributesConnector.j",NO);
objj_executeFile("AppKit/CPCibHelpConnector.j",NO);
NIB_CONNECTION_EQUIVALENCY_TABLE={};
var _1=objj_getClass("CPCibConnector");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"CPCibConnector\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("NS_initWithCoder:"),function(_3,_4,_5){
with(_3){
_3=objj_msgSendSuper({receiver:_3,super_class:objj_getClass("CPCibConnector").super_class},"init");
if(_3){
_source=objj_msgSend(_5,"decodeObjectForKey:","NSSource");
_destination=objj_msgSend(_5,"decodeObjectForKey:","NSDestination");
_label=objj_msgSend(_5,"decodeObjectForKey:","NSLabel");
var _6=objj_msgSend(_source,"UID"),_7=objj_msgSend(_destination,"UID");
if(_6 in NIB_CONNECTION_EQUIVALENCY_TABLE){
CPLog.debug("NSNibConnector: swapped object: "+_source+" for object: "+NIB_CONNECTION_EQUIVALENCY_TABLE[_6]);
_source=NIB_CONNECTION_EQUIVALENCY_TABLE[_6];
}
if(_7 in NIB_CONNECTION_EQUIVALENCY_TABLE){
CPLog.debug("NSNibConnector: swapped object: "+_destination+" for object: "+NIB_CONNECTION_EQUIVALENCY_TABLE[_7]);
_destination=NIB_CONNECTION_EQUIVALENCY_TABLE[_7];
}
if(_source&&_destination){
CPLog.debug("NSNibConnector: connection: "+objj_msgSend(_source,"description")+" "+objj_msgSend(_destination,"description")+" "+_label);
}
}
return _3;
}
})]);
var _1=objj_allocateClassPair(CPCibConnector,"NSNibConnector"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initWithCoder:"),function(_8,_9,_a){
with(_8){
return objj_msgSend(_8,"NS_initWithCoder:",_a);
}
}),new objj_method(sel_getUid("classForKeyedArchiver"),function(_b,_c){
with(_b){
return objj_msgSend(CPCibConnector,"class");
}
})]);
var _1=objj_allocateClassPair(CPCibControlConnector,"NSNibControlConnector"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initWithCoder:"),function(_d,_e,_f){
with(_d){
return objj_msgSend(_d,"NS_initWithCoder:",_f);
}
}),new objj_method(sel_getUid("classForKeyedArchiver"),function(_10,_11){
with(_10){
return objj_msgSend(CPCibControlConnector,"class");
}
})]);
var _1=objj_allocateClassPair(CPCibOutletConnector,"NSNibOutletConnector"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initWithCoder:"),function(_12,_13,_14){
with(_12){
return objj_msgSend(_12,"NS_initWithCoder:",_14);
}
}),new objj_method(sel_getUid("classForKeyedArchiver"),function(_15,_16){
with(_15){
return objj_msgSend(CPCibOutletConnector,"class");
}
})]);
var _17=objj_msgSend(CPSet,"setWithObjects:","NSNegateBoolean","NSIsNil","NSIsNotNil","NSUnarchiveFromData","NSKeyedUnarchiveFromData");
var _1=objj_getClass("CPCibBindingConnector");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"CPCibBindingConnector\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("NS_initWithCoder:"),function(_18,_19,_1a){
with(_18){
_18=objj_msgSendSuper({receiver:_18,super_class:objj_getClass("CPCibBindingConnector").super_class},"NS_initWithCoder:",_1a);
if(_18){
_binding=objj_msgSend(_1a,"decodeObjectForKey:","NSBinding");
_keyPath=objj_msgSend(_1a,"decodeObjectForKey:","NSKeyPath");
_options=objj_msgSend(CPDictionary,"dictionary");
var _1b=objj_msgSend(_1a,"decodeObjectForKey:","NSOptions"),_1c=objj_msgSend(_1b,"keyEnumerator"),key;
while((key=objj_msgSend(_1c,"nextObject"))!==nil){
var _1d="CP"+key.substring(2),_1e=objj_msgSend(_1b,"objectForKey:",key);
if(_1d===CPValueTransformerNameBindingOption&&objj_msgSend(_17,"containsObject:",_1e)){
_1e="CP"+_1e.substring(2);
}
objj_msgSend(_options,"setObject:forKey:",_1e,_1d);
}
CPLog.debug("NSNibConnector: binding connector: "+objj_msgSend(_binding,"description")+" to: "+_destination+" "+objj_msgSend(_keyPath,"description")+" "+objj_msgSend(_options,"description"));
}
return _18;
}
})]);
var _1=objj_allocateClassPair(CPCibBindingConnector,"NSNibBindingConnector"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initWithCoder:"),function(_1f,_20,_21){
with(_1f){
return objj_msgSend(_1f,"NS_initWithCoder:",_21);
}
}),new objj_method(sel_getUid("classForKeyedArchiver"),function(_22,_23){
with(_22){
return objj_msgSend(CPCibBindingConnector,"class");
}
})]);
var _1=objj_getClass("CPCibRuntimeAttributesConnector");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"CPCibRuntimeAttributesConnector\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("NS_initWithCoder:"),function(_24,_25,_26){
with(_24){
_24=objj_msgSendSuper({receiver:_24,super_class:objj_getClass("CPCibRuntimeAttributesConnector").super_class},"NS_initWithCoder:",_26);
if(_24){
_source=objj_msgSend(_26,"decodeObjectForKey:","NSObject");
_keyPaths=objj_msgSend(_26,"decodeObjectForKey:","NSKeyPaths");
_values=objj_msgSend(_26,"decodeObjectForKey:","NSValues");
var _27=objj_msgSend(_keyPaths,"count");
CPLog.debug("NSNibConnector: runtime attributes connector: "+objj_msgSend(_source,"description"));
while(_27--){
var _28=_values[_27],_29=typeof (_28)==="boolean"?"BOOL":objj_msgSend(_28,"className");
CPLog.debug("   %s (%s): %s",_keyPaths[_27],_29,_28);
}
}
return _24;
}
})]);
var _1=objj_allocateClassPair(CPCibRuntimeAttributesConnector,"NSIBUserDefinedRuntimeAttributesConnector"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initWithCoder:"),function(_2a,_2b,_2c){
with(_2a){
return objj_msgSend(_2a,"NS_initWithCoder:",_2c);
}
}),new objj_method(sel_getUid("classForKeyedArchiver"),function(_2d,_2e){
with(_2d){
return objj_msgSend(CPCibRuntimeAttributesConnector,"class");
}
})]);
var _1=objj_getClass("CPCibHelpConnector");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"CPCibHelpConnector\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("NS_initWithCoder:"),function(_2f,_30,_31){
with(_2f){
_2f=objj_msgSendSuper({receiver:_2f,super_class:objj_getClass("CPCibHelpConnector").super_class},"NS_initWithCoder:",_31);
if(_2f){
_destination=objj_msgSend(_31,"decodeObjectForKey:","NSDestination");
_file=objj_msgSend(_31,"decodeObjectForKey:","NSFile");
_marker=objj_msgSend(_31,"decodeObjectForKey:","NSMarker");
}
return _2f;
}
})]);
var _1=objj_allocateClassPair(CPCibHelpConnector,"NSIBHelpConnector"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initWithCoder:"),function(_32,_33,_34){
with(_32){
return objj_msgSend(_32,"NS_initWithCoder:",_34);
}
}),new objj_method(sel_getUid("classForKeyedArchiver"),function(_35,_36){
with(_35){
return objj_msgSend(CPCibHelpConnector,"class");
}
})]);
p;8;NSNull.jt;434;@STATIC;1.0;I;19;Foundation/CPNull.jt;392;
objj_executeFile("Foundation/CPNull.j",NO);
var _1=objj_allocateClassPair(CPNull,"NSNull"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initWithCoder:"),function(_3,_4,_5){
with(_3){
return objj_msgSend(CPNull,"null");
}
}),new objj_method(sel_getUid("classForKeyedArchiver"),function(_6,_7){
with(_6){
return objj_msgSend(CPNull,"class");
}
})]);
p;19;NSNumberFormatter.jt;889;@STATIC;1.0;I;30;Foundation/CPNumberFormatter.jt;836;
objj_executeFile("Foundation/CPNumberFormatter.j",NO);
var _1=objj_getClass("CPNumberFormatter");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"CPNumberFormatter\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("NS_initWithCoder:"),function(_3,_4,_5){
with(_3){
_3=objj_msgSendSuper({receiver:_3,super_class:objj_getClass("CPNumberFormatter").super_class},"init");
if(_3){
}
return _3;
}
})]);
var _1=objj_allocateClassPair(CPNumberFormatter,"NSNumberFormatter"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initWithCoder:"),function(_6,_7,_8){
with(_6){
return objj_msgSend(_6,"NS_initWithCoder:",_8);
}
}),new objj_method(sel_getUid("classForKeyedArchiver"),function(_9,_a){
with(_9){
return objj_msgSend(CPNumberFormatter,"class");
}
})]);
p;20;NSObjectController.jt;1305;@STATIC;1.0;I;27;AppKit/CPObjectController.jt;1254;
objj_executeFile("AppKit/CPObjectController.j",NO);
var _1=objj_getClass("CPObjectController");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"CPObjectController\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("NS_initWithCoder:"),function(_3,_4,_5){
with(_3){
_3=objj_msgSendSuper({receiver:_3,super_class:objj_getClass("CPObjectController").super_class},"init");
if(_3){
_declaredKeys=objj_msgSend(_5,"decodeObjectForKey:","NSDeclaredKeys");
var _6=objj_msgSend(_5,"decodeObjectForKey:","NSObjectClassName");
if(_6){
_objectClassName=CP_NSMapClassName(_6);
}else{
_objectClass=objj_msgSend(CPMutableDictionary,"class");
}
_isEditable=objj_msgSend(_5,"decodeBoolForKey:","NSEditable");
_automaticallyPreparesContent=objj_msgSend(_5,"decodeBoolForKey:","NSAutomaticallyPreparesContent");
}
return _3;
}
})]);
var _1=objj_allocateClassPair(CPObjectController,"NSObjectController"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initWithCoder:"),function(_7,_8,_9){
with(_7){
return objj_msgSend(_7,"NS_initWithCoder:",_9);
}
}),new objj_method(sel_getUid("classForKeyedArchiver"),function(_a,_b){
with(_a){
return objj_msgSend(CPObjectController,"class");
}
})]);
p;15;NSOutlineView.jt;1507;@STATIC;1.0;I;22;AppKit/CPOutlineView.jt;1461;
objj_executeFile("AppKit/CPOutlineView.j",NO);
var _1=objj_getClass("CPOutlineView");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"CPOutlineView\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("NS_initWithCoder:"),function(_3,_4,_5){
with(_3){
_3=objj_msgSendSuper({receiver:_3,super_class:objj_getClass("CPOutlineView").super_class},"NS_initWithCoder:",_5);
if(_3){
if(objj_msgSend(_5,"containsValueForKey:","NSOutlineViewOutlineTableColumnKey")){
_outlineTableColumn=objj_msgSend(_5,"decodeObjectForKey:","NSOutlineViewOutlineTableColumnKey");
}else{
_outlineTableColumn=objj_msgSend(objj_msgSend(_3,"tableColumns"),"objectAtIndex:",0);
}
if(objj_msgSend(_5,"containsValueForKey:","NSOutlineViewIndentationPerLevelKey")){
_indentationPerLevel=objj_msgSend(_5,"decodeFloatForKey:","NSOutlineViewIndentationPerLevelKey");
}else{
_indentationPerLevel=16;
}
_outlineViewDataSource=objj_msgSend(_5,"decodeObjectForKey:","NSDataSource");
_outlineViewDelegate=objj_msgSend(_5,"decodeObjectForKey:","NSDelegate");
}
return _3;
}
})]);
var _1=objj_allocateClassPair(CPOutlineView,"NSOutlineView"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initWithCoder:"),function(_6,_7,_8){
with(_6){
return objj_msgSend(_6,"NS_initWithCoder:",_8);
}
}),new objj_method(sel_getUid("classForKeyedArchiver"),function(_9,_a){
with(_9){
return objj_msgSend(CPOutlineView,"class");
}
})]);
p;11;NSPopover.jt;1018;@STATIC;1.0;I;18;AppKit/CPPopover.jt;977;
objj_executeFile("AppKit/CPPopover.j",NO);
var _1=objj_getClass("CPPopover");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"CPPopover\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("NS_initWithCoder:"),function(_3,_4,_5){
with(_3){
_3=objj_msgSendSuper({receiver:_3,super_class:objj_getClass("CPPopover").super_class},"NS_initWithCoder:",_5);
if(_3){
_behavior=objj_msgSend(_5,"decodeIntForKey:","NSBehavior");
_appearance=objj_msgSend(_5,"decodeIntForKey:","NSAppearance");
_animates=objj_msgSend(_5,"decodeBoolForKey:","NSAnimates");
}
return _3;
}
})]);
var _1=objj_allocateClassPair(CPPopover,"NSPopover"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initWithCoder:"),function(_6,_7,_8){
with(_6){
return objj_msgSend(_6,"NS_initWithCoder:",_8);
}
}),new objj_method(sel_getUid("classForKeyedArchiver"),function(_9,_a){
with(_9){
return objj_msgSend(CPPopover,"class");
}
})]);
p;15;NSPopUpButton.jt;2408;@STATIC;1.0;I;22;AppKit/CPPopUpButton.ji;8;NSMenu.jt;2350;
objj_executeFile("AppKit/CPPopUpButton.j",NO);
objj_executeFile("NSMenu.j",YES);
var _1=objj_getClass("CPPopUpButton");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"CPPopUpButton\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("NS_initWithCoder:"),function(_3,_4,_5){
with(_3){
if(_3=objj_msgSendSuper({receiver:_3,super_class:objj_getClass("CPPopUpButton").super_class},"NS_initWithCoder:",_5)){
var _6=objj_msgSend(_5,"decodeObjectForKey:","NSCell");
_menu=objj_msgSend(_6,"menu");
_frame.origin.x-=3;
_frame.origin.y-=4;
_frame.size.width+=6;
_bounds.size.width+=6;
objj_msgSend(_3,"setPullsDown:",objj_msgSend(_6,"pullsDown"));
_preferredEdge=objj_msgSend(_6,"preferredEdge");
}
return _3;
}
})]);
var _1=objj_allocateClassPair(CPPopUpButton,"NSPopUpButton"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initWithCoder:"),function(_7,_8,_9){
with(_7){
return objj_msgSend(_7,"NS_initWithCoder:",_9);
}
}),new objj_method(sel_getUid("classForKeyedArchiver"),function(_a,_b){
with(_a){
return objj_msgSend(CPPopUpButton,"class");
}
})]);
var _1=objj_allocateClassPair(NSMenuItemCell,"NSPopUpButtonCell"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("pullsDown"),new objj_ivar("selectedIndex"),new objj_ivar("preferredEdge"),new objj_ivar("menu")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("pullsDown"),function(_c,_d){
with(_c){
return pullsDown;
}
}),new objj_method(sel_getUid("selectedIndex"),function(_e,_f){
with(_e){
return selectedIndex;
}
}),new objj_method(sel_getUid("preferredEdge"),function(_10,_11){
with(_10){
return preferredEdge;
}
}),new objj_method(sel_getUid("menu"),function(_12,_13){
with(_12){
return menu;
}
}),new objj_method(sel_getUid("initWithCoder:"),function(_14,_15,_16){
with(_14){
_14=objj_msgSendSuper({receiver:_14,super_class:objj_getClass("NSPopUpButtonCell").super_class},"initWithCoder:",_16);
if(_14){
pullsDown=objj_msgSend(_16,"decodeBoolForKey:","NSPullDown");
selectedIndex=objj_msgSend(_16,"decodeIntForKey:","NSSelectedIndex");
preferredEdge=objj_msgSend(_16,"decodeIntForKey:","NSPreferredEdge");
menu=objj_msgSend(_16,"decodeObjectForKey:","NSMenu");
}
return _14;
}
}),new objj_method(sel_getUid("objectValue"),function(_17,_18){
with(_17){
return selectedIndex;
}
})]);
p;19;NSPredicateEditor.jt;2521;@STATIC;1.0;I;26;AppKit/CPPredicateEditor.jt;2471;
objj_executeFile("AppKit/CPPredicateEditor.j",NO);
var _1=objj_getClass("CPPredicateEditor");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"CPPredicateEditor\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("NS_initWithCoder:"),function(_3,_4,_5){
with(_3){
_3=objj_msgSendSuper({receiver:_3,super_class:objj_getClass("CPPredicateEditor").super_class},"NS_initWithCoder:",_5);
if(_3){
_allTemplates=objj_msgSend(_5,"decodeObjectForKey:","NSPredicateTemplates");
}
return _3;
}
})]);
var _1=objj_allocateClassPair(CPPredicateEditor,"NSPredicateEditor"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initWithCoder:"),function(_6,_7,_8){
with(_6){
return objj_msgSend(_6,"NS_initWithCoder:",_8);
}
}),new objj_method(sel_getUid("classForKeyedArchiver"),function(_9,_a){
with(_9){
return objj_msgSend(CPPredicateEditor,"class");
}
})]);
var _1=objj_getClass("CPPredicateEditorRowTemplate");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"CPPredicateEditorRowTemplate\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("NS_initWithCoder:"),function(_b,_c,_d){
with(_b){
_b=objj_msgSendSuper({receiver:_b,super_class:objj_getClass("CPPredicateEditorRowTemplate").super_class},"init");
if(_b){
_templateType=objj_msgSend(_d,"decodeIntForKey:","NSPredicateTemplateType");
_predicateOptions=objj_msgSend(_d,"decodeIntForKey:","NSPredicateTemplateOptions");
_predicateModifier=objj_msgSend(_d,"decodeIntForKey:","NSPredicateTemplateModifier");
_leftAttributeType=objj_msgSend(_d,"decodeIntForKey:","NSPredicateTemplateLeftAttributeType");
_rightAttributeType=objj_msgSend(_d,"decodeIntForKey:","NSPredicateTemplateRightAttributeType");
_leftIsWildcard=objj_msgSend(_d,"decodeBoolForKey:","NSPredicateTemplateLeftIsWildcard");
_rightIsWildcard=objj_msgSend(_d,"decodeBoolForKey:","NSPredicateTemplateRightIsWildcard");
_views=objj_msgSend(_d,"decodeObjectForKey:","NSPredicateTemplateViews");
}
return _b;
}
})]);
var _1=objj_allocateClassPair(CPPredicateEditorRowTemplate,"NSPredicateEditorRowTemplate"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initWithCoder:"),function(_e,_f,_10){
with(_e){
return objj_msgSend(_e,"NS_initWithCoder:",_10);
}
}),new objj_method(sel_getUid("classForKeyedArchiver"),function(_11,_12){
with(_11){
return objj_msgSend(CPPredicateEditorRowTemplate,"class");
}
})]);
p;21;NSProgressIndicator.jt;1682;@STATIC;1.0;I;28;AppKit/CPProgressIndicator.jt;1630;
objj_executeFile("AppKit/CPProgressIndicator.j",NO);
var _1=1<<12;
var _2=objj_getClass("CPProgressIndicator");
if(!_2){
throw new SyntaxError("*** Could not find definition for class \"CPProgressIndicator\"");
}
var _3=_2.isa;
class_addMethods(_2,[new objj_method(sel_getUid("NS_initWithCoder:"),function(_4,_5,_6){
with(_4){
_4=objj_msgSendSuper({receiver:_4,super_class:objj_getClass("CPProgressIndicator").super_class},"NS_initWithCoder:",_6);
if(_4){
var _7=objj_msgSend(_6,"decodeIntForKey:","NSpiFlags");
_minValue=objj_msgSend(_6,"decodeDoubleForKey:","NSMinValue");
_maxValue=objj_msgSend(_6,"decodeDoubleForKey:","NSMaxValue");
_style=(_7&_1)?CPProgressIndicatorSpinningStyle:CPProgressIndicatorBarStyle;
_isIndeterminate=(_7&2)?YES:NO;
_isDisplayedWhenStopped=(_7&8192)?NO:YES;
_controlSize=(_7&256)?CPSmallControlSize:CPRegularControlSize;
if(_style===CPProgressIndicatorSpinningStyle){
_controlSize=_controlSize==CPRegularControlSize?CPSmallControlSize:CPMiniControlSize;
}
_doubleValue=0;
var _8=objj_msgSend(_4,"frameSize");
if(_style!==CPProgressIndicatorSpinningStyle){
_8.height=15;
}
objj_msgSend(_4,"setFrameSize:",_8);
objj_msgSend(_4,"updateBackgroundColor");
objj_msgSend(_4,"drawBar");
}
return _4;
}
})]);
var _2=objj_allocateClassPair(CPProgressIndicator,"NSProgressIndicator"),_3=_2.isa;
objj_registerClassPair(_2);
class_addMethods(_2,[new objj_method(sel_getUid("initWithCoder:"),function(_9,_a,_b){
with(_9){
return objj_msgSend(_9,"NS_initWithCoder:",_b);
}
}),new objj_method(sel_getUid("classForKeyedArchiver"),function(_c,_d){
with(_c){
return objj_msgSend(CPProgressIndicator,"class");
}
})]);
p;13;NSResponder.jt;928;@STATIC;1.0;I;20;AppKit/CPResponder.jt;885;
objj_executeFile("AppKit/CPResponder.j",NO);
var _1=objj_getClass("CPResponder");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"CPResponder\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("NS_initWithCoder:"),function(_3,_4,_5){
with(_3){
_3=objj_msgSendSuper({receiver:_3,super_class:objj_getClass("CPResponder").super_class},"init");
if(_3){
objj_msgSend(_3,"setNextResponder:",objj_msgSend(_5,"decodeObjectForKey:","NSNextResponder"));
}
return _3;
}
})]);
var _1=objj_allocateClassPair(CPResponder,"NSResponder"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initWithCoder:"),function(_6,_7,_8){
with(_6){
return objj_msgSend(_6,"NS_initWithCoder:",_8);
}
}),new objj_method(sel_getUid("classForKeyedArchiver"),function(_9,_a){
with(_9){
return objj_msgSend(CPResponder,"class");
}
})]);
p;14;NSRuleEditor.jt;3309;@STATIC;1.0;I;21;AppKit/CPRuleEditor.jI;20;AppKit/CPTextField.ji;8;NSCell.ji;11;NSControl.jt;3211;
objj_executeFile("AppKit/CPRuleEditor.j",NO);
objj_executeFile("AppKit/CPTextField.j",NO);
objj_executeFile("NSCell.j",YES);
objj_executeFile("NSControl.j",YES);
var _1=objj_getClass("CPRuleEditor");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"CPRuleEditor\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("NS_initWithCoder:"),function(_3,_4,_5){
with(_3){
_3=objj_msgSendSuper({receiver:_3,super_class:objj_getClass("CPRuleEditor").super_class},"NS_initWithCoder:",_5);
if(_3){
_alignmentGridWidth=objj_msgSend(_5,"decodeFloatForKey:","NSRuleEditorAlignmentGridWidth");
_sliceHeight=objj_msgSend(_5,"decodeDoubleForKey:","NSRuleEditorSliceHeight");
_stringsFilename=objj_msgSend(_5,"decodeObjectForKey:","NSRuleEditorStringsFileName");
_editable=objj_msgSend(_5,"decodeBoolForKey:","NSRuleEditorEditable");
_allowsEmptyCompoundRows=objj_msgSend(_5,"decodeBoolForKey:","NSRuleEditorAllowsEmptyCompoundRows");
_disallowEmpty=objj_msgSend(_5,"decodeBoolForKey:","NSRuleEditorDisallowEmpty");
_nestingMode=objj_msgSend(_5,"decodeIntForKey:","NSRuleEditorNestingMode");
_typeKeyPath=objj_msgSend(_5,"decodeObjectForKey:","NSRuleEditorRowTypeKeyPath");
_itemsKeyPath=objj_msgSend(_5,"decodeObjectForKey:","NSRuleEditorItemsKeyPath");
_valuesKeyPath=objj_msgSend(_5,"decodeObjectForKey:","NSRuleEditorValuesKeyPath");
_subrowsArrayKeyPath=objj_msgSend(_5,"decodeObjectForKey:","NSRuleEditorSubrowsArrayKeyPath");
_boundArrayKeyPath=objj_msgSend(_5,"decodeObjectForKey:","NSRuleEditorBoundArrayKeyPath");
_boundArrayOwner=objj_msgSend(_5,"decodeObjectForKey:","NSRuleEditorBoundArrayOwner");
_slices=objj_msgSend(_5,"decodeObjectForKey:","NSRuleEditorSlices");
_ruleDelegate=objj_msgSend(_5,"decodeObjectForKey:","NSRuleEditorDelegate");
}
return _3;
}
})]);
var _1=objj_allocateClassPair(CPRuleEditor,"NSRuleEditor"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initWithCoder:"),function(_6,_7,_8){
with(_6){
return objj_msgSend(_6,"NS_initWithCoder:",_8);
}
}),new objj_method(sel_getUid("classForKeyedArchiver"),function(_9,_a){
with(_9){
return objj_msgSend(CPRuleEditor,"class");
}
})]);
var _1=objj_allocateClassPair(_CPRuleEditorViewSliceHolder,"_NSRuleEditorViewSliceHolder"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initWithCoder:"),function(_b,_c,_d){
with(_b){
return objj_msgSend(_b,"NS_initWithCoder:",_d);
}
}),new objj_method(sel_getUid("classForKeyedArchiver"),function(_e,_f){
with(_e){
return objj_msgSend(_CPRuleEditorViewSliceHolder,"class");
}
})]);
var _1=objj_allocateClassPair(_CPRuleEditorViewUnboundRowHolder,"_NSRuleEditorViewUnboundRowHolder"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initWithCoder:"),function(_10,_11,_12){
with(_10){
if(_10=objj_msgSendSuper({receiver:_10,super_class:objj_getClass("_NSRuleEditorViewUnboundRowHolder").super_class},"init")){
boundArray=objj_msgSend(_12,"decodeObjectForKey:","NSBoundArray");
}
return _10;
}
}),new objj_method(sel_getUid("classForKeyedArchiver"),function(_13,_14){
with(_13){
return objj_msgSend(_CPRuleEditorViewUnboundRowHolder,"class");
}
})]);
p;12;NSScroller.jt;1676;@STATIC;1.0;I;19;AppKit/CPScroller.jt;1633;
objj_executeFile("AppKit/CPScroller.j",NO);
var _1=objj_getClass("CPScroller");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"CPScroller\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("NS_initWithCoder:"),function(_3,_4,_5){
with(_3){
if(_3=objj_msgSendSuper({receiver:_3,super_class:objj_getClass("CPScroller").super_class},"NS_initWithCoder:",_5)){
_controlSize=CPRegularControlSize;
_knobProportion=1;
if(objj_msgSend(_5,"containsValueForKey:","NSPercent")){
_knobProportion=objj_msgSend(_5,"decodeFloatForKey:","NSPercent");
}
_value=0;
if(objj_msgSend(_5,"containsValueForKey:","NSCurValue")){
_value=objj_msgSend(_5,"decodeFloatForKey:","NSCurValue");
}
objj_msgSend(_3,"_calculateIsVertical");
var _6=objj_msgSend(_3,"isVertical");
if(CPStringFromSelector(objj_msgSend(_3,"action"))==="_doScroller:"){
if(_6){
objj_msgSend(_3,"setAction:",sel_getUid("_verticalScrollerDidScroll:"));
}else{
objj_msgSend(_3,"setAction:",sel_getUid("_horizontalScrollerDidScroll:"));
}
}
_partRects=[];
if(_6){
objj_msgSend(_3,"setFrameSize:",CGSizeMake(15,CGRectGetHeight(objj_msgSend(_3,"frame"))));
}else{
objj_msgSend(_3,"setFrameSize:",CGSizeMake(CGRectGetWidth(objj_msgSend(_3,"frame")),15));
}
}
return _3;
}
})]);
var _1=objj_allocateClassPair(CPScroller,"NSScroller"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initWithCoder:"),function(_7,_8,_9){
with(_7){
return objj_msgSend(_7,"NS_initWithCoder:",_9);
}
}),new objj_method(sel_getUid("classForKeyedArchiver"),function(_a,_b){
with(_a){
return objj_msgSend(CPScroller,"class");
}
})]);
p;14;NSScrollView.jt;1772;@STATIC;1.0;I;21;AppKit/CPScrollView.jt;1727;
objj_executeFile("AppKit/CPScrollView.j",NO);
var _1=objj_getClass("CPScrollView");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"CPScrollView\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("NS_initWithCoder:"),function(_3,_4,_5){
with(_3){
if(_3=objj_msgSendSuper({receiver:_3,super_class:objj_getClass("CPScrollView").super_class},"NS_initWithCoder:",_5)){
var _6=objj_msgSend(_5,"decodeIntForKey:","NSsFlags");
_verticalScroller=objj_msgSend(_5,"decodeObjectForKey:","NSVScroller");
_horizontalScroller=objj_msgSend(_5,"decodeObjectForKey:","NSHScroller");
_contentView=objj_msgSend(_5,"decodeObjectForKey:","NSContentView");
_headerClipView=objj_msgSend(_5,"decodeObjectForKey:","NSHeaderClipView");
_cornerView=objj_msgSend(_5,"decodeObjectForKey:","NSCornerView");
_bottomCornerView=objj_msgSend(objj_msgSend(CPView,"alloc"),"init");
objj_msgSend(_3,"addSubview:",_bottomCornerView);
_scrollerKnobStyle=objj_msgSend(_5,"decodeObjectForKey:","NSScrollerKnobStyle");
if(_scrollerKnobStyle===nil){
_scrollerKnobStyle=CPScrollerKnobStyleDefault;
}
_hasVerticalScroller=!!(_6&(1<<4));
_hasHorizontalScroller=!!(_6&(1<<5));
_autohidesScrollers=!!(_6&(1<<9));
_borderType=_6&3;
_verticalLineScroll=10;
_verticalPageScroll=10;
_horizontalLineScroll=10;
_horizontalPageScroll=10;
}
return _3;
}
})]);
var _1=objj_allocateClassPair(CPScrollView,"NSScrollView"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initWithCoder:"),function(_7,_8,_9){
with(_7){
return objj_msgSend(_7,"NS_initWithCoder:",_9);
}
}),new objj_method(sel_getUid("classForKeyedArchiver"),function(_a,_b){
with(_a){
return objj_msgSend(CPScrollView,"class");
}
})]);
p;15;NSSearchField.jt;3312;@STATIC;1.0;I;22;AppKit/CPSearchField.ji;13;NSTextField.jt;3248;
objj_executeFile("AppKit/CPSearchField.j",NO);
objj_executeFile("NSTextField.j",YES);
var _1=objj_getClass("CPSearchField");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"CPSearchField\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("NS_initWithCoder:"),function(_3,_4,_5){
with(_3){
_3=objj_msgSendSuper({receiver:_3,super_class:objj_getClass("CPSearchField").super_class},"NS_initWithCoder:",_5);
if(_3){
var _6=objj_msgSend(_5,"decodeObjectForKey:","NSCell");
objj_msgSend(_3,"setRecentsAutosaveName:",objj_msgSend(_6,"recentsAutosaveName"));
objj_msgSend(_3,"setMaximumRecents:",objj_msgSend(_6,"maximumRecents"));
objj_msgSend(_3,"setSendsWholeSearchString:",objj_msgSend(_6,"sendsWholeSearchString"));
objj_msgSend(_3,"setSendsSearchStringImmediately:",objj_msgSend(_6,"sendsSearchStringImmediately"));
if(objj_msgSend(_3,"isBezeled")){
var _7=objj_msgSend(_3,"frame");
objj_msgSend(_3,"setFrameSize:",CGSizeMake(_7.size.width,_7.size.height+1));
}
}
return _3;
}
})]);
var _1=objj_allocateClassPair(CPSearchField,"NSSearchField"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initWithCoder:"),function(_8,_9,_a){
with(_8){
_8=objj_msgSend(_8,"NS_initWithCoder:",_a);
return _8;
}
}),new objj_method(sel_getUid("classForKeyedArchiver"),function(_b,_c){
with(_b){
return objj_msgSend(CPSearchField,"class");
}
})]);
var _1=objj_allocateClassPair(NSTextFieldCell,"NSSearchFieldCell"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_recentsAutosaveName"),new objj_ivar("_maximumRecents"),new objj_ivar("_sendsWholeSearchString"),new objj_ivar("_sendsSearchStringImmediately")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("recentsAutosaveName"),function(_d,_e){
with(_d){
return _recentsAutosaveName;
}
}),new objj_method(sel_getUid("setRecentsAutosaveName:"),function(_f,_10,_11){
with(_f){
_recentsAutosaveName=_11;
}
}),new objj_method(sel_getUid("maximumRecents"),function(_12,_13){
with(_12){
return _maximumRecents;
}
}),new objj_method(sel_getUid("setMaximumRecents:"),function(_14,_15,_16){
with(_14){
_maximumRecents=_16;
}
}),new objj_method(sel_getUid("sendsWholeSearchString"),function(_17,_18){
with(_17){
return _sendsWholeSearchString;
}
}),new objj_method(sel_getUid("setSendsWholeSearchString:"),function(_19,_1a,_1b){
with(_19){
_sendsWholeSearchString=_1b;
}
}),new objj_method(sel_getUid("sendsSearchStringImmediately"),function(_1c,_1d){
with(_1c){
return _sendsSearchStringImmediately;
}
}),new objj_method(sel_getUid("setSendsSearchStringImmediately:"),function(_1e,_1f,_20){
with(_1e){
_sendsSearchStringImmediately=_20;
}
}),new objj_method(sel_getUid("initWithCoder:"),function(_21,_22,_23){
with(_21){
if(_21=objj_msgSendSuper({receiver:_21,super_class:objj_getClass("NSSearchFieldCell").super_class},"initWithCoder:",_23)){
_recentsAutosaveName=objj_msgSend(_23,"decodeObjectForKey:","NSRecentsAutosaveName");
_maximumRecents=objj_msgSend(_23,"decodeIntForKey:","NSMaximumRecents");
_sendsWholeSearchString=objj_msgSend(_23,"decodeBoolForKey:","NSSendsWholeSearchString");
_sendsSearchStringImmediately=objj_msgSend(_23,"decodeBytesForKey:","NSSearchFieldFlags")?YES:NO;
}
return _21;
}
})]);
p;19;NSSecureTextField.jt;660;@STATIC;1.0;I;26;AppKit/CPSecureTextField.ji;13;NSTextField.jt;593;
objj_executeFile("AppKit/CPSecureTextField.j",NO);
objj_executeFile("NSTextField.j",YES);
var _1=objj_allocateClassPair(CPSecureTextField,"NSSecureTextField"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initWithCoder:"),function(_3,_4,_5){
with(_3){
return objj_msgSend(_3,"NS_initWithCoder:",_5);
}
}),new objj_method(sel_getUid("classForKeyedArchiver"),function(_6,_7){
with(_6){
return objj_msgSend(CPSecureTextField,"class");
}
})]);
var _1=objj_allocateClassPair(NSTextFieldCell,"NSSecureTextFieldCell"),_2=_1.isa;
objj_registerClassPair(_1);
p;20;NSSegmentedControl.jt;4192;@STATIC;1.0;I;27;AppKit/CPSegmentedControl.jt;4141;
objj_executeFile("AppKit/CPSegmentedControl.j",NO);
var _1=objj_getClass("CPSegmentedControl");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"CPSegmentedControl\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("NS_initWithCoder:"),function(_3,_4,_5){
with(_3){
_segments=[];
_themeStates=[];
if(_3=objj_msgSendSuper({receiver:_3,super_class:objj_getClass("CPSegmentedControl").super_class},"NS_initWithCoder:",_5)){
var _6=objj_msgSend(_3,"frame"),_7=_6.size.width;
_6.size.width=0;
_6.origin.x=MAX(_6.origin.x-4,0);
objj_msgSend(_3,"setFrame:",_6);
var _8=objj_msgSend(_5,"decodeObjectForKey:","NSCell");
_segments=objj_msgSend(_8,"segments");
_selectedSegment=objj_msgSend(_8,"selectedSegment");
_segmentStyle=objj_msgSend(_8,"segmentStyle");
_trackingMode=objj_msgSend(_8,"trackingMode");
objj_msgSend(_3,"setValue:forThemeAttribute:",CPCenterTextAlignment,"alignment");
for(var i=0;i<_segments.length;i++){
_themeStates[i]=_segments[i].selected?CPThemeStateSelected:CPThemeStateNormal;
objj_msgSend(_3,"tileWithChangedSegment:",i);
}
_6.size.width=_7;
objj_msgSend(_3,"setFrame:",_6);
}
return _3;
}
})]);
var _1=objj_allocateClassPair(CPSegmentedControl,"NSSegmentedControl"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initWithCoder:"),function(_9,_a,_b){
with(_9){
return objj_msgSend(_9,"NS_initWithCoder:",_b);
}
}),new objj_method(sel_getUid("classForKeyedArchiver"),function(_c,_d){
with(_c){
return objj_msgSend(CPSegmentedControl,"class");
}
})]);
var _1=objj_allocateClassPair(NSActionCell,"NSSegmentedCell"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_segments"),new objj_ivar("_selectedSegment"),new objj_ivar("_segmentStyle"),new objj_ivar("_trackingMode")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("segments"),function(_e,_f){
with(_e){
return _segments;
}
}),new objj_method(sel_getUid("selectedSegment"),function(_10,_11){
with(_10){
return _selectedSegment;
}
}),new objj_method(sel_getUid("segmentStyle"),function(_12,_13){
with(_12){
return _segmentStyle;
}
}),new objj_method(sel_getUid("trackingMode"),function(_14,_15){
with(_14){
return _trackingMode;
}
}),new objj_method(sel_getUid("initWithCoder:"),function(_16,_17,_18){
with(_16){
if(_16=objj_msgSendSuper({receiver:_16,super_class:objj_getClass("NSSegmentedCell").super_class},"initWithCoder:",_18)){
_segments=objj_msgSend(_18,"decodeObjectForKey:","NSSegmentImages");
_selectedSegment=objj_msgSend(_18,"decodeObjectForKey:","NSSelectedSegment");
if(_selectedSegment===nil){
_selectedSegment=-1;
}
_segmentStyle=objj_msgSend(_18,"decodeIntForKey:","NSSegmentStyle");
_trackingMode=objj_msgSend(_18,"decodeIntForKey:","NSTrackingMode");
if(_trackingMode==CPSegmentSwitchTrackingSelectOne&&_selectedSegment==-1){
_selectedSegment=0;
}
}
return _16;
}
})]);
var _1=objj_getClass("_CPSegmentItem");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"_CPSegmentItem\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("NS_initWithCoder:"),function(_19,_1a,_1b){
with(_19){
if(_19=objj_msgSendSuper({receiver:_19,super_class:objj_getClass("_CPSegmentItem").super_class},"init")){
image=objj_msgSend(_1b,"decodeObjectForKey:","NSSegmentItemImage");
label=objj_msgSend(_1b,"decodeObjectForKey:","NSSegmentItemLabel");
menu=objj_msgSend(_1b,"decodeObjectForKey:","NSSegmentItemMenu");
selected=objj_msgSend(_1b,"decodeBoolForKey:","NSSegmentItemSelected");
enabled=!objj_msgSend(_1b,"decodeBoolForKey:","NSSegmentItemDisabled");
tag=objj_msgSend(_1b,"decodeIntForKey:","NSSegmentItemTag");
width=objj_msgSend(_1b,"decodeIntForKey:","NSSegmentItemWidth");
frame=CGRectMakeZero();
}
return _19;
}
})]);
var _1=objj_allocateClassPair(_CPSegmentItem,"NSSegmentItem"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initWithCoder:"),function(_1c,_1d,_1e){
with(_1c){
return objj_msgSend(_1c,"NS_initWithCoder:",_1e);
}
}),new objj_method(sel_getUid("classForKeyedArchiver"),function(_1f,_20){
with(_1f){
return objj_msgSend(_CPSegmentItem,"class");
}
})]);
p;7;NSSet.jt;558;@STATIC;1.0;I;21;Foundation/CPObject.jI;18;Foundation/CPSet.jt;491;
objj_executeFile("Foundation/CPObject.j",NO);
objj_executeFile("Foundation/CPSet.j",NO);
var _1=objj_allocateClassPair(CPObject,"NSSet"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initWithCoder:"),function(_3,_4,_5){
with(_3){
return objj_msgSend(objj_msgSend(CPSet,"alloc"),"initWithArray:",objj_msgSend(_5,"decodeObjectForKey:","NS.objects"));
}
})]);
var _1=objj_allocateClassPair(NSSet,"NSMutableSet"),_2=_1.isa;
objj_registerClassPair(_1);
p;10;NSSlider.jt;2631;@STATIC;1.0;I;17;AppKit/CPSlider.jt;2590;
objj_executeFile("AppKit/CPSlider.j",NO);
var _1=objj_getClass("CPSlider");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"CPSlider\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("NS_initWithCoder:"),function(_3,_4,_5){
with(_3){
var _6=objj_msgSend(_5,"decodeObjectForKey:","NSCell");
_minValue=objj_msgSend(_6,"minValue");
_maxValue=objj_msgSend(_6,"maxValue");
_3=objj_msgSendSuper({receiver:_3,super_class:objj_getClass("CPSlider").super_class},"NS_initWithCoder:",_5);
if(_3){
_altIncrementValue=objj_msgSend(_6,"altIncrementValue");
objj_msgSend(_3,"setSliderType:",objj_msgSend(_6,"sliderType"));
if(objj_msgSend(_3,"sliderType")===CPCircularSlider){
var _7=objj_msgSend(_3,"frame");
objj_msgSend(_3,"setFrameSize:",CGSizeMake(_7.size.width+4,_7.size.height+2));
}
}
return _3;
}
})]);
var _1=objj_allocateClassPair(CPSlider,"NSSlider"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initWithCoder:"),function(_8,_9,_a){
with(_8){
return objj_msgSend(_8,"NS_initWithCoder:",_a);
}
}),new objj_method(sel_getUid("classForKeyedArchiver"),function(_b,_c){
with(_b){
return objj_msgSend(CPSlider,"class");
}
})]);
var _1=objj_allocateClassPair(NSCell,"NSSliderCell"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_minValue"),new objj_ivar("_maxValue"),new objj_ivar("_altIncrementValue"),new objj_ivar("_vertical"),new objj_ivar("_sliderType")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("minValue"),function(_d,_e){
with(_d){
return _minValue;
}
}),new objj_method(sel_getUid("maxValue"),function(_f,_10){
with(_f){
return _maxValue;
}
}),new objj_method(sel_getUid("altIncrementValue"),function(_11,_12){
with(_11){
return _altIncrementValue;
}
}),new objj_method(sel_getUid("isVertical"),function(_13,_14){
with(_13){
return _vertical;
}
}),new objj_method(sel_getUid("sliderType"),function(_15,_16){
with(_15){
return _sliderType;
}
}),new objj_method(sel_getUid("initWithCoder:"),function(_17,_18,_19){
with(_17){
_17=objj_msgSendSuper({receiver:_17,super_class:objj_getClass("NSSliderCell").super_class},"initWithCoder:",_19);
if(_17){
_objectValue=objj_msgSend(_19,"decodeDoubleForKey:","NSValue");
_minValue=objj_msgSend(_19,"decodeDoubleForKey:","NSMinValue");
_maxValue=objj_msgSend(_19,"decodeDoubleForKey:","NSMaxValue");
_altIncrementValue=objj_msgSend(_19,"decodeDoubleForKey:","NSAltIncValue");
_isVertical=objj_msgSend(_19,"decodeBoolForKey:","NSVertical");
_sliderType=objj_msgSend(_19,"decodeIntForKey:","NSSliderType");
}
return _17;
}
})]);
p;18;NSSortDescriptor.jt;1079;@STATIC;1.0;I;29;Foundation/CPSortDescriptor.jt;1026;
objj_executeFile("Foundation/CPSortDescriptor.j",NO);
var _1=objj_getClass("CPSortDescriptor");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"CPSortDescriptor\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("NS_initWithCoder:"),function(_3,_4,_5){
with(_3){
if(_3=objj_msgSendSuper({receiver:_3,super_class:objj_getClass("CPSortDescriptor").super_class},"init")){
_key=objj_msgSend(_5,"decodeObjectForKey:","NSKey");
_selector=CPSelectorFromString(objj_msgSend(_5,"decodeObjectForKey:","NSSelector"));
_ascending=objj_msgSend(_5,"decodeBoolForKey:","NSAscending");
}
return _3;
}
})]);
var _1=objj_allocateClassPair(CPSortDescriptor,"NSSortDescriptor"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initWithCoder:"),function(_6,_7,_8){
with(_6){
return objj_msgSend(_6,"NS_initWithCoder:",_8);
}
}),new objj_method(sel_getUid("classForKeyedArchiver"),function(_9,_a){
with(_9){
return objj_msgSend(CPSortDescriptor,"class");
}
})]);
p;13;NSSplitView.jt;1055;@STATIC;1.0;I;20;AppKit/CPSplitView.jt;1011;
objj_executeFile("AppKit/CPSplitView.j",NO);
var _1=objj_getClass("CPSplitView");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"CPSplitView\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("NS_initWithCoder:"),function(_3,_4,_5){
with(_3){
if(_3=objj_msgSendSuper({receiver:_3,super_class:objj_getClass("CPSplitView").super_class},"NS_initWithCoder:",_5)){
_isVertical=objj_msgSend(_5,"decodeBoolForKey:","NSIsVertical");
_isPaneSplitter=objj_msgSend(_5,"decodeIntForKey:","NSDividerStyle")==3;
_autosaveName=objj_msgSend(_5,"decodeObjectForKey:","NSAutosaveName");
}
return _3;
}
})]);
var _1=objj_allocateClassPair(CPSplitView,"NSSplitView"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initWithCoder:"),function(_6,_7,_8){
with(_6){
return objj_msgSend(_6,"NS_initWithCoder:",_8);
}
}),new objj_method(sel_getUid("classForKeyedArchiver"),function(_9,_a){
with(_9){
return objj_msgSend(CPSplitView,"class");
}
})]);
p;11;NSStepper.jt;2495;@STATIC;1.0;I;18;AppKit/CPStepper.jt;2453;
objj_executeFile("AppKit/CPStepper.j",NO);
var _1=objj_getClass("CPStepper");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"CPStepper\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("NS_initWithCoder:"),function(_3,_4,_5){
with(_3){
_3=objj_msgSendSuper({receiver:_3,super_class:objj_getClass("CPStepper").super_class},"NS_initWithCoder:",_5);
if(_3){
var _6=objj_msgSend(_5,"decodeObjectForKey:","NSCell");
_minValue=objj_msgSend(_6,"minValue");
_maxValue=objj_msgSend(_6,"maxValue");
_increment=objj_msgSend(_6,"increment");
_valueWraps=objj_msgSend(_6,"valueWraps");
_autorepeat=objj_msgSend(_6,"autorepeat");
_objectValue=objj_msgSend(_6,"objectValue");
}
return _3;
}
})]);
var _1=objj_allocateClassPair(CPStepper,"NSStepper"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initWithCoder:"),function(_7,_8,_9){
with(_7){
return objj_msgSend(_7,"NS_initWithCoder:",_9);
}
}),new objj_method(sel_getUid("classForKeyedArchiver"),function(_a,_b){
with(_a){
return objj_msgSend(CPStepper,"class");
}
})]);
var _1=objj_allocateClassPair(NSCell,"NSStepperCell"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_minValue"),new objj_ivar("_maxValue"),new objj_ivar("_increment"),new objj_ivar("_valueWraps"),new objj_ivar("_autorepeat")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("minValue"),function(_c,_d){
with(_c){
return _minValue;
}
}),new objj_method(sel_getUid("maxValue"),function(_e,_f){
with(_e){
return _maxValue;
}
}),new objj_method(sel_getUid("increment"),function(_10,_11){
with(_10){
return _increment;
}
}),new objj_method(sel_getUid("valueWraps"),function(_12,_13){
with(_12){
return _valueWraps;
}
}),new objj_method(sel_getUid("autorepeat"),function(_14,_15){
with(_14){
return _autorepeat;
}
}),new objj_method(sel_getUid("initWithCoder:"),function(_16,_17,_18){
with(_16){
_16=objj_msgSendSuper({receiver:_16,super_class:objj_getClass("NSStepperCell").super_class},"initWithCoder:",_18);
if(_16){
_objectValue=objj_msgSend(_18,"decodeDoubleForKey:","NSValue");
_minValue=objj_msgSend(_18,"decodeDoubleForKey:","NSMinValue");
_maxValue=objj_msgSend(_18,"decodeDoubleForKey:","NSMaxValue");
_increment=objj_msgSend(_18,"decodeDoubleForKey:","NSIncrement");
_valueWraps=objj_msgSend(_18,"decodeBoolForKey:","NSValueWraps");
_autorepeat=objj_msgSend(_18,"decodeBoolForKey:","NSAutorepeat");
}
return _16;
}
})]);
p;15;NSTableColumn.jt;3988;@STATIC;1.0;I;22;AppKit/CPTableColumn.jI;26;AppKit/CPTableHeaderView.jI;17;AppKit/CPButton.jt;3889;
objj_executeFile("AppKit/CPTableColumn.j",NO);
objj_executeFile("AppKit/CPTableHeaderView.j",NO);
objj_executeFile("AppKit/CPButton.j",NO);
var _1=objj_getClass("CPTableColumn");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"CPTableColumn\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("NS_initWithCoder:"),function(_3,_4,_5){
with(_3){
_3=objj_msgSend(_3,"init");
if(_3){
_identifier=objj_msgSend(_5,"decodeObjectForKey:","NSIdentifier");
var _6=objj_msgSend(_5,"decodeObjectForKey:","NSDataCell");
if(objj_msgSend(_6,"isKindOfClass:",objj_msgSend(NSImageCell,"class"))){
_dataView=objj_msgSend(objj_msgSend(CPImageView,"alloc"),"initWithFrame:",CGRectMakeZero());
objj_msgSend(_dataView,"setImageScaling:",objj_msgSend(_6,"imageScaling"));
objj_msgSend(_dataView,"setImageAlignment:",objj_msgSend(_6,"imageAlignment"));
}else{
if(objj_msgSend(_6,"isKindOfClass:",objj_msgSend(NSTextFieldCell,"class"))){
_dataView=objj_msgSend(objj_msgSend(CPTextField,"alloc"),"initWithFrame:",CPRectMakeZero());
var _7=objj_msgSend(_6,"font"),_8=nil;
if(_7){
_7=objj_msgSend(NSFont,"cibFontForNibFont:",_7);
}
if(!_7){
_7=objj_msgSend(CPFont,"systemFontOfSize:",objj_msgSend(CPFont,"systemFontSize"));
}
var _8=objj_msgSend(CPFont,"boldFontWithName:size:",objj_msgSend(_7,"familyName"),objj_msgSend(_7,"size"));
objj_msgSend(_dataView,"setFont:",_7);
objj_msgSend(_dataView,"setValue:forThemeAttribute:inState:",_8,"font",CPThemeStateSelectedDataView);
objj_msgSend(_dataView,"setLineBreakMode:",CPLineBreakByTruncatingTail);
objj_msgSend(_dataView,"setValue:forThemeAttribute:",CPCenterVerticalTextAlignment,"vertical-alignment");
objj_msgSend(_dataView,"setValue:forThemeAttribute:",CGInsetMake(0,5,0,5),"content-inset");
var _9=objj_msgSend(_6,"textColor"),_a=objj_msgSend(_dataView,"currentValueForThemeAttribute:","text-color");
if(!objj_msgSend(_9,"isEqual:",_a)){
objj_msgSend(_dataView,"setTextColor:",objj_msgSend(_6,"textColor"));
}
}else{
if(objj_msgSend(_6,"isKindOfClass:",objj_msgSend(NSButtonCell,"class"))){
_dataView=objj_msgSend(objj_msgSend(CPButton,"alloc"),"initWithFrame:",CGRectMakeZero());
_dataView=objj_msgSend(_dataView,"NS_initWithCell:",_6);
}else{
if(objj_msgSend(_6,"isKindOfClass:",objj_msgSend(NSLevelIndicatorCell,"class"))){
_dataView=objj_msgSend(objj_msgSend(CPLevelIndicator,"alloc"),"initWithFrame:",CGRectMakeZero());
_dataView=objj_msgSend(_dataView,"NS_initWithCell:",_6);
}
}
}
}
objj_msgSend(_dataView,"setValue:forThemeAttribute:",objj_msgSend(_6,"alignment"),"alignment");
var _b=objj_msgSend(_5,"decodeObjectForKey:","NSHeaderCell"),_c=objj_msgSend(objj_msgSend(_CPTableColumnHeaderView,"alloc"),"initWithFrame:",CPRectMakeZero());
objj_msgSend(_c,"setStringValue:",objj_msgSend(_b,"objectValue"));
objj_msgSend(_c,"setValue:forThemeAttribute:",objj_msgSend(_6,"alignment"),"text-alignment");
objj_msgSend(_3,"setHeaderView:",_c);
_width=objj_msgSend(_5,"decodeFloatForKey:","NSWidth");
_minWidth=objj_msgSend(_5,"decodeFloatForKey:","NSMinWidth");
_maxWidth=objj_msgSend(_5,"decodeFloatForKey:","NSMaxWidth");
_resizingMask=objj_msgSend(_5,"decodeIntForKey:","NSResizingMask");
_isHidden=objj_msgSend(_5,"decodeBoolForKey:","NSHidden");
_isEditable=objj_msgSend(_5,"decodeBoolForKey:","NSIsEditable");
_sortDescriptorPrototype=objj_msgSend(_5,"decodeObjectForKey:","NSSortDescriptorPrototype");
}
return _3;
}
})]);
var _1=objj_allocateClassPair(CPTableColumn,"NSTableColumn"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initWithCoder:"),function(_d,_e,_f){
with(_d){
return objj_msgSend(_d,"NS_initWithCoder:",_f);
}
}),new objj_method(sel_getUid("classForKeyedArchiver"),function(_10,_11){
with(_10){
return objj_msgSend(CPTableColumn,"class");
}
})]);
var _1=objj_allocateClassPair(NSActionCell,"NSTableHeaderCell"),_2=_1.isa;
objj_registerClassPair(_1);
p;19;NSTableHeaderView.jt;1061;@STATIC;1.0;I;26;AppKit/CPTableHeaderView.jt;1011;
objj_executeFile("AppKit/CPTableHeaderView.j",NO);
var _1=objj_getClass("CPTableHeaderView");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"CPTableHeaderView\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("NS_initWithCoder:"),function(_3,_4,_5){
with(_3){
if(_3=objj_msgSendSuper({receiver:_3,super_class:objj_getClass("CPTableHeaderView").super_class},"NS_initWithCoder:",_5)){
_tableView=objj_msgSend(_5,"decodeObjectForKey:","NSTableView");
if(_bounds.size.height===17){
_bounds.size.height=23;
_frame.size.height=23;
}
_drawsColumnLines=YES;
}
return _3;
}
})]);
var _1=objj_allocateClassPair(CPTableHeaderView,"NSTableHeaderView"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initWithCoder:"),function(_6,_7,_8){
with(_6){
return objj_msgSend(_6,"NS_initWithCoder:",_8);
}
}),new objj_method(sel_getUid("classForKeyedArchiver"),function(_9,_a){
with(_9){
return objj_msgSend(CPTableHeaderView,"class");
}
})]);
p;13;NSTableView.jt;2615;@STATIC;1.0;I;20;AppKit/CPTableView.jt;2571;
objj_executeFile("AppKit/CPTableView.j",NO);
var _1=objj_getClass("CPTableView");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"CPTableView\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("NS_initWithCoder:"),function(_3,_4,_5){
with(_3){
_3=objj_msgSendSuper({receiver:_3,super_class:objj_getClass("CPTableView").super_class},"NS_initWithCoder:",_5);
if(_3){
var _6=objj_msgSend(_5,"decodeIntForKey:","NSTvFlags");
_rowHeight=objj_msgSend(_5,"decodeFloatForKey:","NSRowHeight");
if(_rowHeight==17){
_rowHeight=23;
}
_headerView=objj_msgSend(_5,"decodeObjectForKey:","NSHeaderView");
_cornerView=_headerView?objj_msgSend(_5,"decodeObjectForKey:","NSCornerView"):nil;
objj_msgSend(_cornerView,"setHidden:",NO);
_autosaveName=objj_msgSend(_5,"decodeObjectForKey:","NSAutosaveName");
_tableColumns=objj_msgSend(_5,"decodeObjectForKey:","NSTableColumns");
objj_msgSend(_tableColumns,"makeObjectsPerformSelector:withObject:",sel_getUid("setTableView:"),_3);
_intercellSpacing=CGSizeMake(objj_msgSend(_5,"decodeFloatForKey:","NSIntercellSpacingWidth"),objj_msgSend(_5,"decodeFloatForKey:","NSIntercellSpacingHeight"));
var _7=objj_msgSend(_5,"decodeObjectForKey:","NSGridColor");
if(!objj_msgSend(_7,"isEqual:",objj_msgSend(CPColor,"colorWithRed:green:blue:alpha:",127/255,127/255,127/255,1))){
objj_msgSend(_3,"setValue:forThemeAttribute:",_7,"grid-color");
}
_gridStyleMask=objj_msgSend(_5,"decodeIntForKey:","NSGridStyleMask");
_usesAlternatingRowBackgroundColors=(_6&8388608)?YES:NO;
_alternatingRowBackgroundColors=[objj_msgSend(CPColor,"whiteColor"),objj_msgSend(CPColor,"colorWithHexString:","e4e7ff")];
_selectionHighlightStyle=objj_msgSend(_5,"decodeIntForKey:","NSTableViewSelectionHighlightStyle");
_columnAutoResizingStyle=objj_msgSend(_5,"decodeIntForKey:","NSColumnAutoresizingStyle");
_allowsMultipleSelection=(_6&134217728)?YES:NO;
_allowsEmptySelection=(_6&268435456)?YES:NO;
_allowsColumnSelection=(_6&67108864)?YES:NO;
_allowsColumnResizing=(_6&1073741824)?YES:NO;
_allowsColumnReordering=(_6&2147483648)?YES:NO;
objj_msgSend(_3,"setBackgroundColor:",objj_msgSend(_5,"decodeObjectForKey:","NSBackgroundColor"));
}
return _3;
}
})]);
var _1=objj_allocateClassPair(CPTableView,"NSTableView"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initWithCoder:"),function(_8,_9,_a){
with(_8){
return objj_msgSend(_8,"NS_initWithCoder:",_a);
}
}),new objj_method(sel_getUid("classForKeyedArchiver"),function(_b,_c){
with(_b){
return objj_msgSend(CPTableView,"class");
}
})]);
p;11;NSTabView.jt;1198;@STATIC;1.0;I;18;AppKit/CPTabView.ji;15;NSTabViewItem.jt;1136;
objj_executeFile("AppKit/CPTabView.j",NO);
objj_executeFile("NSTabViewItem.j",YES);
var _1=objj_getClass("CPTabView");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"CPTabView\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("NS_initWithCoder:"),function(_3,_4,_5){
with(_3){
if(_3=objj_msgSendSuper({receiver:_3,super_class:objj_getClass("CPTabView").super_class},"NS_initWithCoder:",_5)){
var _6=objj_msgSend(_5,"decodeObjectForKey:","NSTvFlags");
_type=_6&7;
_items=objj_msgSend(_5,"decodeObjectForKey:","NSTabViewItems");
_selectedIndex=objj_msgSend(_items,"indexOfObject:",objj_msgSend(_5,"decodeObjectForKey:","NSSelectedTabViewItem"));
_font=objj_msgSend(_5,"decodeObjectForKey:","NSFont");
}
return _3;
}
})]);
var _1=objj_allocateClassPair(CPTabView,"NSTabView"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initWithCoder:"),function(_7,_8,_9){
with(_7){
return objj_msgSend(_7,"NS_initWithCoder:",_9);
}
}),new objj_method(sel_getUid("classForKeyedArchiver"),function(_a,_b){
with(_a){
return objj_msgSend(CPTabView,"class");
}
})]);
p;15;NSTabViewItem.jt;1024;@STATIC;1.0;I;22;AppKit/CPTabViewItem.jt;979;
objj_executeFile("AppKit/CPTabViewItem.j",NO);
var _1=objj_getClass("CPTabViewItem");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"CPTabViewItem\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("NS_initWithCoder:"),function(_3,_4,_5){
with(_3){
if(_3=objj_msgSendSuper({receiver:_3,super_class:objj_getClass("CPTabViewItem").super_class},"init")){
_identifier=objj_msgSend(_5,"decodeObjectForKey:","NSIdentifier");
_label=objj_msgSend(_5,"decodeObjectForKey:","NSLabel");
_view=objj_msgSend(_5,"decodeObjectForKey:","NSView");
}
return _3;
}
})]);
var _1=objj_allocateClassPair(CPTabViewItem,"NSTabViewItem"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initWithCoder:"),function(_6,_7,_8){
with(_6){
return objj_msgSend(_6,"NS_initWithCoder:",_8);
}
}),new objj_method(sel_getUid("classForKeyedArchiver"),function(_9,_a){
with(_9){
return objj_msgSend(CPTabViewItem,"class");
}
})]);
p;13;NSTextField.jt;4459;@STATIC;1.0;I;20;AppKit/CPTextField.ji;11;NSControl.ji;8;NSCell.jI;15;AppKit/CPFont.jt;4367;
objj_executeFile("AppKit/CPTextField.j",NO);
objj_executeFile("NSControl.j",YES);
objj_executeFile("NSCell.j",YES);
objj_executeFile("AppKit/CPFont.j",NO);
var _1=objj_getClass("CPTextField");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"CPTextField\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("NS_initWithCoder:"),function(_3,_4,_5){
with(_3){
_3=objj_msgSendSuper({receiver:_3,super_class:objj_getClass("CPTextField").super_class},"NS_initWithCoder:",_5);
if(_3){
var _6=objj_msgSend(_5,"decodeObjectForKey:","NSCell");
if(objj_msgSend(_6,"isEditable")&&objj_msgSend(objj_msgSend(_6,"font"),"isEqual:",objj_msgSend(CPFont,"boldSystemFontOfSize:",12))){
objj_msgSend(_3,"setFont:",objj_msgSend(CPFont,"systemFontOfSize:",12));
}
objj_msgSend(_3,"sendActionOn:",CPKeyUpMask|CPKeyDownMask);
objj_msgSend(_3,"setEditable:",objj_msgSend(_6,"isEditable"));
objj_msgSend(_3,"setSelectable:",objj_msgSend(_6,"isSelectable"));
objj_msgSend(_3,"setBordered:",objj_msgSend(_6,"isBordered"));
objj_msgSend(_3,"setBezeled:",objj_msgSend(_6,"isBezeled"));
objj_msgSend(_3,"setBezelStyle:",objj_msgSend(_6,"bezelStyle"));
objj_msgSend(_3,"setDrawsBackground:",objj_msgSend(_6,"drawsBackground"));
objj_msgSend(_3,"setLineBreakMode:",objj_msgSend(_6,"lineBreakMode"));
objj_msgSend(_3,"setAlignment:",objj_msgSend(_6,"alignment"));
objj_msgSend(_3,"setTextFieldBackgroundColor:",objj_msgSend(_6,"backgroundColor"));
objj_msgSend(_3,"setPlaceholderString:",objj_msgSend(_6,"placeholderString"));
var _7=objj_msgSend(_6,"textColor"),_8=objj_msgSend(_3,"currentValueForThemeAttribute:","text-color");
if(!objj_msgSend(_7,"isEqual:",_8)){
objj_msgSend(_3,"setTextColor:",objj_msgSend(_6,"textColor"));
}
if(objj_msgSend(_3,"isBezeled")){
var _9=objj_msgSend(_3,"frame");
objj_msgSend(_3,"setFrameOrigin:",CGPointMake(_9.origin.x-6,_9.origin.y-3));
objj_msgSend(_3,"setFrameSize:",CGSizeMake(_9.size.width+8,_9.size.height+7));
}else{
if(objj_msgSend(objj_msgSend(_3,"font"),"isBold")){
var _9=objj_msgSend(_3,"frame");
objj_msgSend(_3,"setFrameOrigin:",CGPointMake(_9.origin.x,_9.origin.y-1));
objj_msgSend(_3,"setFrameSize:",CGSizeMake(_9.size.width,_9.size.height+2));
}
}
CPLog.debug("NSTextField: title=\""+objj_msgSend(_3,"stringValue")+"\", placeholder="+(objj_msgSend(_6,"placeholderString")==null?"<none>":"\""+objj_msgSend(_6,"placeholderString")+"\"")+", isBordered="+objj_msgSend(_3,"isBordered")+", isBezeled="+objj_msgSend(_3,"isBezeled")+", bezelStyle="+objj_msgSend(_3,"bezelStyle"));
}
return _3;
}
})]);
var _1=objj_allocateClassPair(CPTextField,"NSTextField"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initWithCoder:"),function(_a,_b,_c){
with(_a){
return objj_msgSend(_a,"NS_initWithCoder:",_c);
}
}),new objj_method(sel_getUid("classForKeyedArchiver"),function(_d,_e){
with(_d){
return objj_msgSend(CPTextField,"class");
}
})]);
var _1=objj_allocateClassPair(NSCell,"NSTextFieldCell"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_bezelStyle"),new objj_ivar("_drawsBackground"),new objj_ivar("_backgroundColor"),new objj_ivar("_textColor"),new objj_ivar("_placeholderString")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("bezelStyle"),function(_f,_10){
with(_f){
return _bezelStyle;
}
}),new objj_method(sel_getUid("drawsBackground"),function(_11,_12){
with(_11){
return _drawsBackground;
}
}),new objj_method(sel_getUid("backgroundColor"),function(_13,_14){
with(_13){
return _backgroundColor;
}
}),new objj_method(sel_getUid("textColor"),function(_15,_16){
with(_15){
return _textColor;
}
}),new objj_method(sel_getUid("placeholderString"),function(_17,_18){
with(_17){
return _placeholderString;
}
}),new objj_method(sel_getUid("initWithCoder:"),function(_19,_1a,_1b){
with(_19){
_19=objj_msgSendSuper({receiver:_19,super_class:objj_getClass("NSTextFieldCell").super_class},"initWithCoder:",_1b);
if(_19){
_bezelStyle=objj_msgSend(_1b,"decodeObjectForKey:","NSTextBezelStyle")||CPTextFieldSquareBezel;
_drawsBackground=objj_msgSend(_1b,"decodeBoolForKey:","NSDrawsBackground");
_backgroundColor=objj_msgSend(_1b,"decodeObjectForKey:","NSBackgroundColor");
_textColor=objj_msgSend(_1b,"decodeObjectForKey:","NSTextColor");
_placeholderString=objj_msgSend(_1b,"decodeObjectForKey:","NSPlaceholderString");
}
return _19;
}
})]);
p;14;NSTokenField.jt;1830;@STATIC;1.0;I;21;AppKit/CPTokenField.ji;11;NSControl.ji;8;NSCell.ji;13;NSTextField.jI;15;AppKit/CPFont.jt;1719;
objj_executeFile("AppKit/CPTokenField.j",NO);
objj_executeFile("NSControl.j",YES);
objj_executeFile("NSCell.j",YES);
objj_executeFile("NSTextField.j",YES);
objj_executeFile("AppKit/CPFont.j",NO);
var _1=objj_getClass("CPTokenField");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"CPTokenField\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("NS_initWithCoder:"),function(_3,_4,_5){
with(_3){
_3=objj_msgSendSuper({receiver:_3,super_class:objj_getClass("CPTokenField").super_class},"NS_initWithCoder:",_5);
if(_3){
var _6=objj_msgSend(_5,"decodeObjectForKey:","NSCell");
_3=objj_msgSend(_3,"NS_initWithCell:",_6);
}
return _3;
}
}),new objj_method(sel_getUid("NS_initWithCell:"),function(_7,_8,_9){
with(_7){
return _7;
}
})]);
var _1=objj_allocateClassPair(CPTokenField,"NSTokenField"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initWithCoder:"),function(_a,_b,_c){
with(_a){
return objj_msgSend(_a,"NS_initWithCoder:",_c);
}
}),new objj_method(sel_getUid("classForKeyedArchiver"),function(_d,_e){
with(_d){
return objj_msgSend(CPTokenField,"class");
}
})]);
var _1=objj_allocateClassPair(NSTextFieldCell,"NSTokenFieldCell"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_tokenStyle")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("tokenStyle"),function(_f,_10){
with(_f){
return _tokenStyle;
}
}),new objj_method(sel_getUid("initWithCoder:"),function(_11,_12,_13){
with(_11){
_11=objj_msgSendSuper({receiver:_11,super_class:objj_getClass("NSTokenFieldCell").super_class},"initWithCoder:",_13);
if(_11){
_tokenStyle=objj_msgSend(_13,"decodeIntForKey:","NSTokenStyle");
}
return _11;
}
})]);
p;11;NSToolbar.jt;1986;@STATIC;1.0;I;18;AppKit/CPToolbar.ji;15;NSToolbarItem.jt;1924;
objj_executeFile("AppKit/CPToolbar.j",NO);
objj_executeFile("NSToolbarItem.j",YES);
var _1=objj_getClass("CPToolbar");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"CPToolbar\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("NS_initWithCoder:"),function(_3,_4,_5){
with(_3){
if(_3){
_identifier=objj_msgSend(_5,"decodeObjectForKey:","NSToolbarIdentifier");
_displayMode=objj_msgSend(_5,"decodeIntForKey:","NSToolbarDisplayMode");
_showsBaselineSeparator=objj_msgSend(_5,"decodeBoolForKey:","NSToolbarShowsBaselineSeparator");
_allowsUserCustomization=objj_msgSend(_5,"decodeBoolForKey:","NSToolbarAllowsUserCustomization");
_isVisible=objj_msgSend(_5,"decodeBoolForKey:","NSToolbarPrefersToBeShown");
_identifiedItems=objj_msgSend(CPMutableDictionary,"dictionary");
var _6=objj_msgSend(_5,"decodeObjectForKey:","NSToolbarIBIdentifiedItems"),_7=nil,_8=objj_msgSend(_6,"keyEnumerator");
while((_7=objj_msgSend(_8,"nextObject"))!==nil){
var _9=NS_CPToolbarItemIdentifierMap[_7]||_7;
objj_msgSend(_identifiedItems,"setObject:forKey:",objj_msgSend(_6,"objectForKey:",_7),_9);
}
_defaultItems=objj_msgSend(_5,"decodeObjectForKey:","NSToolbarIBDefaultItems");
_allowedItems=objj_msgSend(_5,"decodeObjectForKey:","NSToolbarIBAllowedItems");
_selectableItems=objj_msgSend(_5,"decodeObjectForKey:","NSToolbarIBSelectableItems");
_sizeMode=objj_msgSend(_5,"decodeObjectForKey:","NSToolbarSizeMode")||CPToolbarSizeModeDefault;
_delegate=objj_msgSend(_5,"decodeObjectForKey:","NSToolbarDelegate");
}
return _3;
}
})]);
var _1=objj_allocateClassPair(CPToolbar,"NSToolbar"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initWithCoder:"),function(_a,_b,_c){
with(_a){
return objj_msgSend(_a,"NS_initWithCoder:",_c);
}
}),new objj_method(sel_getUid("classForKeyedArchiver"),function(_d,_e){
with(_d){
return objj_msgSend(CPToolbar,"class");
}
})]);
p;28;NSToolbarFlexibleSpaceItem.jt;414;@STATIC;1.0;I;36;AppKit/_CPToolbarFlexibleSpaceItem.jt;355;
objj_executeFile("AppKit/_CPToolbarFlexibleSpaceItem.j",NO);
var _1=objj_allocateClassPair(_CPToolbarFlexibleSpaceItem,"NSToolbarFlexibleSpaceItem"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("classForKeyedArchiver"),function(_3,_4){
with(_3){
return objj_msgSend(_CPToolbarFlexibleSpaceItem,"class");
}
})]);
p;15;NSToolbarItem.jt;2932;@STATIC;1.0;I;22;AppKit/CPToolbarItem.jt;2886;
objj_executeFile("AppKit/CPToolbarItem.j",NO);
NS_CPToolbarItemIdentifierMap={"NSToolbarSeparatorItem":CPToolbarSeparatorItemIdentifier,"NSToolbarSpaceItem":CPToolbarSpaceItemIdentifier,"NSToolbarFlexibleSpaceItem":CPToolbarFlexibleSpaceItemIdentifier,"NSToolbarShowColorsItem":CPToolbarShowColorsItemIdentifier,"NSToolbarShowFontsItem":CPToolbarShowFontsItemIdentifier,"NSToolbarCustomizeToolbarItem":CPToolbarCustomizeToolbarItemIdentifier,"NSToolbarPrintItem":CPToolbarPrintItemIdentifier};
var _1=objj_getClass("CPToolbarItem");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"CPToolbarItem\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("NS_initWithCoder:"),function(_3,_4,_5){
with(_3){
_3=objj_msgSendSuper({receiver:_3,super_class:objj_getClass("CPToolbarItem").super_class},"init");
if(_3){
var _6=objj_msgSend(_5,"decodeObjectForKey:","NSToolbarItemIdentifier");
_itemIdentifier=NS_CPToolbarItemIdentifierMap[_6]||_6;
_minSize=objj_msgSend(_5,"decodeSizeForKey:","NSToolbarItemMinSize");
_maxSize=objj_msgSend(_5,"decodeSizeForKey:","NSToolbarItemMaxSize");
objj_msgSend(_3,"setLabel:",objj_msgSend(_5,"decodeObjectForKey:","NSToolbarItemLabel"));
objj_msgSend(_3,"setPaletteLabel:",objj_msgSend(_5,"decodeObjectForKey:","NSToolbarItemPaletteLabel"));
objj_msgSend(_3,"setToolTip:",objj_msgSend(_5,"decodeObjectForKey:","NSToolbarItemToolTip"));
objj_msgSend(_3,"setTag:",objj_msgSend(_5,"decodeObjectForKey:","NSToolbarItemTag"));
objj_msgSend(_3,"setTarget:",objj_msgSend(_5,"decodeObjectForKey:","NSToolbarItemTarget"));
objj_msgSend(_3,"setAction:",CPSelectorFromString(objj_msgSend(_5,"decodeObjectForKey:","NSToolbarItemAction")));
objj_msgSend(_3,"setEnabled:",objj_msgSend(_5,"decodeBoolForKey:","NSToolbarItemEnabled"));
objj_msgSend(_3,"setImage:",objj_msgSend(_5,"decodeObjectForKey:","NSToolbarItemImage"));
if(_maxSize.height>0){
_maxSize.height=MIN(_maxSize.height,32);
}
if(_minSize.height>0){
_minSize.height=MIN(_minSize.height,32);
}
objj_msgSend(_3,"setView:",objj_msgSend(_5,"decodeObjectForKey:","NSToolbarItemView"));
if(objj_msgSend(_view,"isKindOfClass:",CPSearchField)&&_maxSize.height==22){
_maxSize.height=objj_msgSend(_view,"frameSize").height;
_minSize.height=_maxSize.height;
}
objj_msgSend(_3,"setVisibilityPriority:",objj_msgSend(_5,"decodeIntForKey:","NSToolbarItemVisibilityPriority"));
objj_msgSend(_3,"setAutovalidates:",objj_msgSend(_5,"decodeBoolForKey:","NSToolbarItemAutovalidates"));
}
return _3;
}
})]);
var _1=objj_allocateClassPair(CPToolbarItem,"NSToolbarItem"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initWithCoder:"),function(_7,_8,_9){
with(_7){
return objj_msgSend(_7,"NS_initWithCoder:",_9);
}
}),new objj_method(sel_getUid("classForKeyedArchiver"),function(_a,_b){
with(_a){
return objj_msgSend(CPToolbarItem,"class");
}
})]);
p;24;NSToolbarSeparatorItem.jt;394;@STATIC;1.0;I;32;AppKit/_CPToolbarSeparatorItem.jt;339;
objj_executeFile("AppKit/_CPToolbarSeparatorItem.j",NO);
var _1=objj_allocateClassPair(_CPToolbarSeparatorItem,"NSToolbarSeparatorItem"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("classForKeyedArchiver"),function(_3,_4){
with(_3){
return objj_msgSend(_CPToolbarSeparatorItem,"class");
}
})]);
p;25;NSToolbarShowColorsItem.jt;399;@STATIC;1.0;I;33;AppKit/_CPToolbarShowColorsItem.jt;343;
objj_executeFile("AppKit/_CPToolbarShowColorsItem.j",NO);
var _1=objj_allocateClassPair(_CPToolbarShowColorsItem,"NSToolbarShowColorsItem"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("classForKeyedArchiver"),function(_3,_4){
with(_3){
return objj_msgSend(_CPToolbarShowColorsItem,"class");
}
})]);
p;20;NSToolbarSpaceItem.jt;374;@STATIC;1.0;I;28;AppKit/_CPToolbarSpaceItem.jt;323;
objj_executeFile("AppKit/_CPToolbarSpaceItem.j",NO);
var _1=objj_allocateClassPair(_CPToolbarSpaceItem,"NSToolbarSpaceItem"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("classForKeyedArchiver"),function(_3,_4){
with(_3){
return objj_msgSend(_CPToolbarSpaceItem,"class");
}
})]);
p;26;NSUserDefaultsController.jt;1233;@STATIC;1.0;I;33;AppKit/CPUserDefaultsController.jt;1176;
objj_executeFile("AppKit/CPUserDefaultsController.j",NO);
var _1=objj_getClass("CPUserDefaultsController");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"CPUserDefaultsController\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("NS_initWithCoder:"),function(_3,_4,_5){
with(_3){
if(objj_msgSend(_5,"decodeBoolForKey:","NSSharedInstance")){
return objj_msgSend(CPUserDefaultsController,"sharedUserDefaultsController");
}
_3=objj_msgSendSuper({receiver:_3,super_class:objj_getClass("CPUserDefaultsController").super_class},"NS_initWithCoder:",_5);
if(_3){
objj_msgSend(CPException,"raise:reason:",CPUnsupportedMethodException,"decoding of non-shared NSUserDefaultsController not implemented");
}
return _3;
}
})]);
var _1=objj_allocateClassPair(CPUserDefaultsController,"NSUserDefaultsController"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initWithCoder:"),function(_6,_7,_8){
with(_6){
return objj_msgSend(_6,"NS_initWithCoder:",_8);
}
}),new objj_method(sel_getUid("classForKeyedArchiver"),function(_9,_a){
with(_9){
return objj_msgSend(CPUserDefaultsController,"class");
}
})]);
p;8;NSView.jt;1824;@STATIC;1.0;I;15;AppKit/CPView.jt;1785;
objj_executeFile("AppKit/CPView.j",NO);
var _1=63,_2=1<<8,_3=1<<31;
var _4=objj_getClass("CPView");
if(!_4){
throw new SyntaxError("*** Could not find definition for class \"CPView\"");
}
var _5=_4.isa;
class_addMethods(_4,[new objj_method(sel_getUid("NS_initWithCoder:"),function(_6,_7,_8){
with(_6){
_frame=CGRectMakeZero();
if(objj_msgSend(_8,"containsValueForKey:","NSFrame")){
_frame=objj_msgSend(_8,"decodeRectForKey:","NSFrame");
}else{
if(objj_msgSend(_8,"containsValueForKey:","NSFrameSize")){
_frame.size=objj_msgSend(_8,"decodeSizeForKey:","NSFrameSize");
}
}
_6=objj_msgSendSuper({receiver:_6,super_class:objj_getClass("CPView").super_class},"NS_initWithCoder:",_8);
if(_6){
_tag=objj_msgSend(_8,"decodeIntForKey:","NSTag");
_bounds=CGRectMake(0,0,CGRectGetWidth(_frame),CGRectGetHeight(_frame));
_window=objj_msgSend(_8,"decodeObjectForKey:","NSWindow");
_superview=objj_msgSend(_8,"decodeObjectForKey:","NSSuperview");
_subviews=objj_msgSend(_8,"decodeObjectForKey:","NSSubviews");
if(!_subviews){
_subviews=[];
}
var _9=objj_msgSend(_8,"decodeIntForKey:","NSvFlags");
_autoresizingMask=_9&_1;
_autoresizesSubviews=_9&_2;
_hitTests=YES;
_isHidden=_9&_3;
_opacity=1;
_themeClass=objj_msgSend(_6,"themeClass");
_themeAttributes={};
_themeState=CPThemeStateNormal;
objj_msgSend(_6,"_loadThemeAttributes");
}
return _6;
}
}),new objj_method(sel_getUid("NS_isFlipped"),function(_a,_b){
with(_a){
return NO;
}
})]);
var _4=objj_allocateClassPair(CPView,"NSView"),_5=_4.isa;
objj_registerClassPair(_4);
class_addMethods(_4,[new objj_method(sel_getUid("initWithCoder:"),function(_c,_d,_e){
with(_c){
return objj_msgSend(_c,"NS_initWithCoder:",_e);
}
}),new objj_method(sel_getUid("classForKeyedArchiver"),function(_f,_10){
with(_f){
return objj_msgSend(CPView,"class");
}
})]);
p;18;NSViewController.jt;1145;@STATIC;1.0;I;25;AppKit/CPViewController.jt;1096;
objj_executeFile("AppKit/CPViewController.j",NO);
var _1=objj_getClass("CPViewController");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"CPViewController\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("NS_initWithCoder:"),function(_3,_4,_5){
with(_3){
_3=objj_msgSendSuper({receiver:_3,super_class:objj_getClass("CPViewController").super_class},"NS_initWithCoder:",_5);
if(_3){
_title=objj_msgSend(_5,"decodeObjectForKey:","NSTitle");
_cibName=objj_msgSend(_5,"decodeObjectForKey:","NSNibName");
var _6=objj_msgSend(_5,"decodeObjectForKey:","NSNibBundleIdentifier");
if(_6){
_cibBundle=objj_msgSend(CPBundle,"bundleWithPath:",_6);
}
}
return _3;
}
})]);
var _1=objj_allocateClassPair(CPViewController,"NSViewController"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initWithCoder:"),function(_7,_8,_9){
with(_7){
return objj_msgSend(_7,"NS_initWithCoder:",_9);
}
}),new objj_method(sel_getUid("classForKeyedArchiver"),function(_a,_b){
with(_a){
return objj_msgSend(CPViewController,"class");
}
})]);
p;18;NSWindowTemplate.jt;2493;@STATIC;1.0;I;29;AppKit/_CPCibWindowTemplate.jt;2440;
objj_executeFile("AppKit/_CPCibWindowTemplate.j",NO);
var _1=0,_2=1,_3=2,_4=4,_5=8,_6=16,_7=64,_8=256,_9=8192,_a=2048;
var _b=objj_getClass("_CPCibWindowTemplate");
if(!_b){
throw new SyntaxError("*** Could not find definition for class \"_CPCibWindowTemplate\"");
}
var _c=_b.isa;
class_addMethods(_b,[new objj_method(sel_getUid("NS_initWithCoder:"),function(_d,_e,_f){
with(_d){
_d=objj_msgSendSuper({receiver:_d,super_class:objj_getClass("_CPCibWindowTemplate").super_class},"init");
if(_d){
if(objj_msgSend(_f,"containsValueForKey:","NSMinSize")){
_minSize=objj_msgSend(_f,"decodeSizeForKey:","NSMinSize");
}
if(objj_msgSend(_f,"containsValueForKey:","NSMaxSize")){
_maxSize=objj_msgSend(_f,"decodeSizeForKey:","NSMaxSize");
}
_screenRect=objj_msgSend(_f,"decodeRectForKey:","NSScreenRect");
_viewClass=objj_msgSend(_f,"decodeObjectForKey:","NSViewClass");
_wtFlags=objj_msgSend(_f,"decodeIntForKey:","NSWTFlags");
_windowAutorecalculatesKeyViewLoop=!!(_wtFlags&_a);
_windowBacking=objj_msgSend(_f,"decodeIntForKey:","NSWindowBacking");
_windowClass=CP_NSMapClassName(objj_msgSend(_f,"decodeObjectForKey:","NSWindowClass"));
_windowRect=objj_msgSend(_f,"decodeRectForKey:","NSWindowRect");
_windowStyleMask=objj_msgSend(_f,"decodeIntForKey:","NSWindowStyleMask");
_windowTitle=objj_msgSend(_f,"decodeObjectForKey:","NSWindowTitle");
_windowView=objj_msgSend(_f,"decodeObjectForKey:","NSWindowView");
_windowRect.origin.y=_screenRect.size.height-_windowRect.origin.y-_windowRect.size.height;
if(_windowStyleMask===_1){
_windowStyleMask=CPBorderlessWindowMask;
}else{
_windowStyleMask=(_windowStyleMask&_2?CPTitledWindowMask:0)|(_windowStyleMask&_3?CPClosableWindowMask:0)|(_windowStyleMask&_4?CPMiniaturizableWindowMask:0)|(_windowStyleMask&_5?CPResizableWindowMask:0)|(_windowStyleMask&_8?_8:0)|(_windowStyleMask&_7?CPDocModalWindowMask:0)|(_windowStyleMask&_9?CPHUDBackgroundWindowMask:0);
}
_windowIsFullBridge=objj_msgSend(_f,"decodeObjectForKey:","NSFrameAutosaveName")==="CPBorderlessBridgeWindowMask";
}
return _d;
}
})]);
var _b=objj_allocateClassPair(_CPCibWindowTemplate,"NSWindowTemplate"),_c=_b.isa;
objj_registerClassPair(_b);
class_addMethods(_b,[new objj_method(sel_getUid("initWithCoder:"),function(_10,_11,_12){
with(_10){
return objj_msgSend(_10,"NS_initWithCoder:",_12);
}
}),new objj_method(sel_getUid("classForKeyedArchiver"),function(_13,_14){
with(_13){
return objj_msgSend(_CPCibWindowTemplate,"class");
}
})]);
p;9;WebView.jt;814;@STATIC;1.0;I;18;AppKit/CPWebView.jt;773;
objj_executeFile("AppKit/CPWebView.j",NO);
var _1=objj_getClass("CPWebView");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"CPWebView\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("NS_initWithCoder:"),function(_3,_4,_5){
with(_3){
return objj_msgSendSuper({receiver:_3,super_class:objj_getClass("CPWebView").super_class},"NS_initWithCoder:",_5);
}
})]);
var _1=objj_allocateClassPair(CPWebView,"WebView"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initWithCoder:"),function(_6,_7,_8){
with(_6){
return objj_msgSend(_6,"NS_initWithCoder:",_8);
}
}),new objj_method(sel_getUid("classForKeyedArchiver"),function(_9,_a){
with(_9){
return objj_msgSend(CPWebView,"class");
}
})]);
e;