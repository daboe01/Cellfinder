var ObjectiveJ={};
(function(_1,_2){
if(!this.JSON){
JSON={};
}
(function(){
function f(n){
return n<10?"0"+n:n;
};
if(typeof Date.prototype.toJSON!=="function"){
Date.prototype.toJSON=function(_3){
return this.getUTCFullYear()+"-"+f(this.getUTCMonth()+1)+"-"+f(this.getUTCDate())+"T"+f(this.getUTCHours())+":"+f(this.getUTCMinutes())+":"+f(this.getUTCSeconds())+"Z";
};
String.prototype.toJSON=Number.prototype.toJSON=Boolean.prototype.toJSON=function(_4){
return this.valueOf();
};
}
var cx=new RegExp("[\\u0000\\u00ad\\u0600-\\u0604\\u070f\\u17b4\\u17b5\\u200c-\\u200f\\u2028-\\u202f\\u2060-\\u206f\\ufeff\\ufff0-\\uffff]","g");
var _5=new RegExp("[\\\\\\\"\\x00-\\x1f\\x7f-\\x9f\\u00ad\\u0600-\\u0604\\u070f\\u17b4\\u17b5\\u200c-\\u200f\\u2028-\\u202f\\u2060-\\u206f\\ufeff\\ufff0-\\uffff]","g");
var _6,_7,_8={"\b":"\\b","\t":"\\t","\n":"\\n","\f":"\\f","\r":"\\r","\"":"\\\"","\\":"\\\\"},_9;
function _a(_b){
_5.lastIndex=0;
return _5.test(_b)?"\""+_b.replace(_5,function(a){
var c=_8[a];
return typeof c==="string"?c:"\\u"+("0000"+a.charCodeAt(0).toString(16)).slice(-4);
})+"\"":"\""+_b+"\"";
};
function _c(_d,_e){
var i,k,v,_f,_10=_6,_11,_12=_e[_d];
if(_12&&typeof _12==="object"&&typeof _12.toJSON==="function"){
_12=_12.toJSON(_d);
}
if(typeof _9==="function"){
_12=_9.call(_e,_d,_12);
}
switch(typeof _12){
case "string":
return _a(_12);
case "number":
return isFinite(_12)?String(_12):"null";
case "boolean":
case "null":
return String(_12);
case "object":
if(!_12){
return "null";
}
_6+=_7;
_11=[];
if(Object.prototype.toString.apply(_12)==="[object Array]"){
_f=_12.length;
for(i=0;i<_f;i+=1){
_11[i]=_c(i,_12)||"null";
}
v=_11.length===0?"[]":_6?"[\n"+_6+_11.join(",\n"+_6)+"\n"+_10+"]":"["+_11.join(",")+"]";
_6=_10;
return v;
}
if(_9&&typeof _9==="object"){
_f=_9.length;
for(i=0;i<_f;i+=1){
k=_9[i];
if(typeof k==="string"){
v=_c(k,_12);
if(v){
_11.push(_a(k)+(_6?": ":":")+v);
}
}
}
}else{
for(k in _12){
if(Object.hasOwnProperty.call(_12,k)){
v=_c(k,_12);
if(v){
_11.push(_a(k)+(_6?": ":":")+v);
}
}
}
}
v=_11.length===0?"{}":_6?"{\n"+_6+_11.join(",\n"+_6)+"\n"+_10+"}":"{"+_11.join(",")+"}";
_6=_10;
return v;
}
};
if(typeof JSON.stringify!=="function"){
JSON.stringify=function(_13,_14,_15){
var i;
_6="";
_7="";
if(typeof _15==="number"){
for(i=0;i<_15;i+=1){
_7+=" ";
}
}else{
if(typeof _15==="string"){
_7=_15;
}
}
_9=_14;
if(_14&&typeof _14!=="function"&&(typeof _14!=="object"||typeof _14.length!=="number")){
throw new Error("JSON.stringify");
}
return _c("",{"":_13});
};
}
if(typeof JSON.parse!=="function"){
JSON.parse=function(_16,_17){
var j;
function _18(_19,key){
var k,v,_1a=_19[key];
if(_1a&&typeof _1a==="object"){
for(k in _1a){
if(Object.hasOwnProperty.call(_1a,k)){
v=_18(_1a,k);
if(v!==_29){
_1a[k]=v;
}else{
delete _1a[k];
}
}
}
}
return _17.call(_19,key,_1a);
};
cx.lastIndex=0;
if(cx.test(_16)){
_16=_16.replace(cx,function(a){
return "\\u"+("0000"+a.charCodeAt(0).toString(16)).slice(-4);
});
}
if(/^[\],:{}\s]*$/.test(_16.replace(/\\(?:["\\\/bfnrt]|u[0-9a-fA-F]{4})/g,"@").replace(/"[^"\\\n\r]*"|true|false|null|-?\d+(?:\.\d*)?(?:[eE][+\-]?\d+)?/g,"]").replace(/(?:^|:|,)(?:\s*\[)+/g,""))){
j=eval("("+_16+")");
return typeof _17==="function"?_18({"":j},""):j;
}
throw new SyntaxError("JSON.parse");
};
}
}());
var _1b=new RegExp("([^%]+|%(?:\\d+\\$)?[\\+\\-\\ \\#0]*[0-9\\*]*(.[0-9\\*]+)?[hlL]?[cbBdieEfgGosuxXpn%@])","g");
var _1c=new RegExp("(%)(?:(\\d+)\\$)?([\\+\\-\\ \\#0]*)([0-9\\*]*)((?:.[0-9\\*]+)?)([hlL]?)([cbBdieEfgGosuxXpn%@])");
_2.sprintf=function(_1d){
var _1d=arguments[0],_1e=_1d.match(_1b),_1f=0,_20="",arg=1;
for(var i=0;i<_1e.length;i++){
var t=_1e[i];
if(_1d.substring(_1f,_1f+t.length)!=t){
return _20;
}
_1f+=t.length;
if(t.charAt(0)!=="%"){
_20+=t;
}else{
if(t==="%%"){
_20+="%";
}else{
var _21=t.match(_1c);
if(_21.length!=8||_21[0]!=t){
return _20;
}
var _22=_21[1],_23=_21[2],_24=_21[3],_25=_21[4],_26=_21[5],_27=_21[6],_28=_21[7];
if(_23===_29||_23===null||_23===""){
_23=arg++;
}else{
_23=Number(_23);
}
var _2a=null;
if(_25=="*"){
_2a=arguments[_23];
}else{
if(_25!=""){
_2a=Number(_25);
}
}
var _2b=null;
if(_26==".*"){
_2b=arguments[_23];
}else{
if(_26!=""){
_2b=Number(_26.substring(1));
}
}
var _2c=(_24.indexOf("-")>=0);
var _2d=(_24.indexOf("0")>=0);
var _2e="";
if(RegExp("[bBdiufeExXo]").test(_28)){
var num=Number(arguments[_23]);
var _2f="";
if(num<0){
_2f="-";
}else{
if(_24.indexOf("+")>=0){
_2f="+";
}else{
if(_24.indexOf(" ")>=0){
_2f=" ";
}
}
}
if(_28=="d"||_28=="i"||_28=="u"){
var _30=String(Math.abs(Math.floor(num)));
_2e=_31(_2f,"",_30,"",_2a,_2c,_2d);
}
if(_28=="f"){
var _30=String((_2b!=null)?Math.abs(num).toFixed(_2b):Math.abs(num));
var _32=(_24.indexOf("#")>=0&&_30.indexOf(".")<0)?".":"";
_2e=_31(_2f,"",_30,_32,_2a,_2c,_2d);
}
if(_28=="e"||_28=="E"){
var _30=String(Math.abs(num).toExponential(_2b!=null?_2b:21));
var _32=(_24.indexOf("#")>=0&&_30.indexOf(".")<0)?".":"";
_2e=_31(_2f,"",_30,_32,_2a,_2c,_2d);
}
if(_28=="x"||_28=="X"){
var _30=String(Math.abs(num).toString(16));
var _33=(_24.indexOf("#")>=0&&num!=0)?"0x":"";
_2e=_31(_2f,_33,_30,"",_2a,_2c,_2d);
}
if(_28=="b"||_28=="B"){
var _30=String(Math.abs(num).toString(2));
var _33=(_24.indexOf("#")>=0&&num!=0)?"0b":"";
_2e=_31(_2f,_33,_30,"",_2a,_2c,_2d);
}
if(_28=="o"){
var _30=String(Math.abs(num).toString(8));
var _33=(_24.indexOf("#")>=0&&num!=0)?"0":"";
_2e=_31(_2f,_33,_30,"",_2a,_2c,_2d);
}
if(RegExp("[A-Z]").test(_28)){
_2e=_2e.toUpperCase();
}else{
_2e=_2e.toLowerCase();
}
}else{
var _2e="";
if(_28=="%"){
_2e="%";
}else{
if(_28=="c"){
_2e=String(arguments[_23]).charAt(0);
}else{
if(_28=="s"||_28=="@"){
_2e=String(arguments[_23]);
}else{
if(_28=="p"||_28=="n"){
_2e="";
}
}
}
}
_2e=_31("","",_2e,"",_2a,_2c,false);
}
_20+=_2e;
}
}
}
return _20;
};
function _31(_34,_35,_36,_37,_38,_39,_3a){
var _3b=(_34.length+_35.length+_36.length+_37.length);
if(_39){
return _34+_35+_36+_37+pad(_38-_3b," ");
}else{
if(_3a){
return _34+_35+pad(_38-_3b,"0")+_36+_37;
}else{
return pad(_38-_3b," ")+_34+_35+_36+_37;
}
}
};
function pad(n,ch){
return Array(MAX(0,n)+1).join(ch);
};
CPLogDisable=false;
var _3c="Cappuccino";
var _3d=["fatal","error","warn","info","debug","trace"];
var _3e=_3d[3];
var _3f={};
for(var i=0;i<_3d.length;i++){
_3f[_3d[i]]=i;
}
var _40={};
CPLogRegister=function(_41,_42,_43){
CPLogRegisterRange(_41,_3d[0],_42||_3d[_3d.length-1],_43);
};
CPLogRegisterRange=function(_44,_45,_46,_47){
var min=_3f[_45];
var max=_3f[_46];
if(min!==_29&&max!==_29&&min<=max){
for(var i=min;i<=max;i++){
CPLogRegisterSingle(_44,_3d[i],_47);
}
}
};
CPLogRegisterSingle=function(_48,_49,_4a){
if(!_40[_49]){
_40[_49]=[];
}
for(var i=0;i<_40[_49].length;i++){
if(_40[_49][i][0]===_48){
_40[_49][i][1]=_4a;
return;
}
}
_40[_49].push([_48,_4a]);
};
CPLogUnregister=function(_4b){
for(var _4c in _40){
for(var i=0;i<_40[_4c].length;i++){
if(_40[_4c][i][0]===_4b){
_40[_4c].splice(i--,1);
}
}
}
};
function _4d(_4e,_4f,_50){
if(_50==_29){
_50=_3c;
}
if(_4f==_29){
_4f=_3e;
}
var _51=(typeof _4e[0]=="string"&&_4e.length>1)?_2.sprintf.apply(null,_4e):String(_4e[0]);
if(_40[_4f]){
for(var i=0;i<_40[_4f].length;i++){
var _52=_40[_4f][i];
_52[0](_51,_4f,_50,_52[1]);
}
}
};
CPLog=function(){
_4d(arguments);
};
for(var i=0;i<_3d.length;i++){
CPLog[_3d[i]]=(function(_53){
return function(){
_4d(arguments,_53);
};
})(_3d[i]);
}
var _54=function(_55,_56,_57){
var now=new Date(),_58;
if(_56===null){
_56="";
}else{
_56=_56||"info";
_56="["+CPLogColorize(_56,_56)+"]";
}
_57=_57||"";
if(_57&&_56){
_57+=" ";
}
_58=_57+_56;
if(_58){
_58+=": ";
}
if(typeof _2.sprintf=="function"){
return _2.sprintf("%4d-%02d-%02d %02d:%02d:%02d.%03d %s%s",now.getFullYear(),now.getMonth()+1,now.getDate(),now.getHours(),now.getMinutes(),now.getSeconds(),now.getMilliseconds(),_58,_55);
}else{
return now+" "+_58+": "+_55;
}
};
CPLogConsole=function(_59,_5a,_5b,_5c){
if(typeof console!="undefined"){
var _5d=(_5c||_54)(_59,_5a,_5b),_5e={"fatal":"error","error":"error","warn":"warn","info":"info","debug":"debug","trace":"debug"}[_5a];
if(_5e&&console[_5e]){
console[_5e](_5d);
}else{
if(console.log){
console.log(_5d);
}
}
}
};
CPLogColorize=function(_5f,_60){
return _5f;
};
CPLogAlert=function(_61,_62,_63,_64){
if(typeof alert!="undefined"&&!CPLogDisable){
var _65=(_64||_54)(_61,_62,_63);
CPLogDisable=!confirm(_65+"\n\n(Click cancel to stop log alerts)");
}
};
var _66=null;
CPLogPopup=function(_67,_68,_69,_6a){
try{
if(CPLogDisable||window.open==_29){
return;
}
if(!_66||!_66.document){
_66=window.open("","_blank","width=600,height=400,status=no,resizable=yes,scrollbars=yes");
if(!_66){
CPLogDisable=!confirm(_67+"\n\n(Disable pop-up blocking for CPLog window; Click cancel to stop log alerts)");
return;
}
_6b(_66);
}
var _6c=_66.document.createElement("div");
_6c.setAttribute("class",_68||"fatal");
var _6d=(_6a||_54)(_67,_6a?_68:null,_69);
_6c.appendChild(_66.document.createTextNode(_6d));
_66.log.appendChild(_6c);
if(_66.focusEnabled.checked){
_66.focus();
}
if(_66.blockEnabled.checked){
_66.blockEnabled.checked=_66.confirm(_6d+"\nContinue blocking?");
}
if(_66.scrollEnabled.checked){
_66.scrollToBottom();
}
}
catch(e){
}
};
var _6e="<style type=\"text/css\" media=\"screen\"> body{font:10px Monaco,Courier,\"Courier New\",monospace,mono;padding-top:15px;} div > .fatal,div > .error,div > .warn,div > .info,div > .debug,div > .trace{display:none;overflow:hidden;white-space:pre;padding:0px 5px 0px 5px;margin-top:2px;-moz-border-radius:5px;-webkit-border-radius:5px;} div[wrap=\"yes\"] > div{white-space:normal;} .fatal{background-color:#ffb2b3;} .error{background-color:#ffe2b2;} .warn{background-color:#fdffb2;} .info{background-color:#e4ffb2;} .debug{background-color:#a0e5a0;} .trace{background-color:#99b9ff;} .enfatal .fatal,.enerror .error,.enwarn .warn,.eninfo .info,.endebug .debug,.entrace .trace{display:block;} div#header{background-color:rgba(240,240,240,0.82);position:fixed;top:0px;left:0px;width:100%;border-bottom:1px solid rgba(0,0,0,0.33);text-align:center;} ul#enablers{display:inline-block;margin:1px 15px 0 15px;padding:2px 0 2px 0;} ul#enablers li{display:inline;padding:0px 5px 0px 5px;margin-left:4px;-moz-border-radius:5px;-webkit-border-radius:5px;} [enabled=\"no\"]{opacity:0.25;} ul#options{display:inline-block;margin:0 15px 0px 15px;padding:0 0px;} ul#options li{margin:0 0 0 0;padding:0 0 0 0;display:inline;} </style>";
function _6b(_6f){
var doc=_6f.document;
doc.writeln("<html><head><title></title>"+_6e+"</head><body></body></html>");
doc.title=_3c+" Run Log";
var _70=doc.getElementsByTagName("head")[0];
var _71=doc.getElementsByTagName("body")[0];
var _72=window.location.protocol+"//"+window.location.host+window.location.pathname;
_72=_72.substring(0,_72.lastIndexOf("/")+1);
var div=doc.createElement("div");
div.setAttribute("id","header");
_71.appendChild(div);
var ul=doc.createElement("ul");
ul.setAttribute("id","enablers");
div.appendChild(ul);
for(var i=0;i<_3d.length;i++){
var li=doc.createElement("li");
li.setAttribute("id","en"+_3d[i]);
li.setAttribute("class",_3d[i]);
li.setAttribute("onclick","toggle(this);");
li.setAttribute("enabled","yes");
li.appendChild(doc.createTextNode(_3d[i]));
ul.appendChild(li);
}
var ul=doc.createElement("ul");
ul.setAttribute("id","options");
div.appendChild(ul);
var _73={"focus":["Focus",false],"block":["Block",false],"wrap":["Wrap",false],"scroll":["Scroll",true],"close":["Close",true]};
for(o in _73){
var li=doc.createElement("li");
ul.appendChild(li);
_6f[o+"Enabled"]=doc.createElement("input");
_6f[o+"Enabled"].setAttribute("id",o);
_6f[o+"Enabled"].setAttribute("type","checkbox");
if(_73[o][1]){
_6f[o+"Enabled"].setAttribute("checked","checked");
}
li.appendChild(_6f[o+"Enabled"]);
var _74=doc.createElement("label");
_74.setAttribute("for",o);
_74.appendChild(doc.createTextNode(_73[o][0]));
li.appendChild(_74);
}
_6f.log=doc.createElement("div");
_6f.log.setAttribute("class","enerror endebug enwarn eninfo enfatal entrace");
_71.appendChild(_6f.log);
_6f.toggle=function(_75){
var _76=(_75.getAttribute("enabled")=="yes")?"no":"yes";
_75.setAttribute("enabled",_76);
if(_76=="yes"){
_6f.log.className+=" "+_75.id;
}else{
_6f.log.className=_6f.log.className.replace(new RegExp("[\\s]*"+_75.id,"g"),"");
}
};
_6f.scrollToBottom=function(){
_6f.scrollTo(0,_71.offsetHeight);
};
_6f.wrapEnabled.addEventListener("click",function(){
_6f.log.setAttribute("wrap",_6f.wrapEnabled.checked?"yes":"no");
},false);
_6f.addEventListener("keydown",function(e){
var e=e||_6f.event;
if(e.keyCode==75&&(e.ctrlKey||e.metaKey)){
while(_6f.log.firstChild){
_6f.log.removeChild(_6f.log.firstChild);
}
e.preventDefault();
}
},"false");
window.addEventListener("unload",function(){
if(_6f&&_6f.closeEnabled&&_6f.closeEnabled.checked){
CPLogDisable=true;
_6f.close();
}
},false);
_6f.addEventListener("unload",function(){
if(!CPLogDisable){
CPLogDisable=!confirm("Click cancel to stop logging");
}
},false);
};
CPLogDefault=(typeof window==="object"&&window.console)?CPLogConsole:CPLogPopup;
var _29;
if(typeof window!=="undefined"){
window.setNativeTimeout=window.setTimeout;
window.clearNativeTimeout=window.clearTimeout;
window.setNativeInterval=window.setInterval;
window.clearNativeInterval=window.clearInterval;
}
NO=false;
YES=true;
nil=null;
Nil=null;
NULL=null;
ABS=Math.abs;
ASIN=Math.asin;
ACOS=Math.acos;
ATAN=Math.atan;
ATAN2=Math.atan2;
SIN=Math.sin;
COS=Math.cos;
TAN=Math.tan;
EXP=Math.exp;
POW=Math.pow;
CEIL=Math.ceil;
FLOOR=Math.floor;
ROUND=Math.round;
MIN=Math.min;
MAX=Math.max;
RAND=Math.random;
SQRT=Math.sqrt;
E=Math.E;
LN2=Math.LN2;
LN10=Math.LN10;
LOG=Math.log;
LOG2E=Math.LOG2E;
LOG10E=Math.LOG10E;
PI=Math.PI;
PI2=Math.PI*2;
PI_2=Math.PI/2;
SQRT1_2=Math.SQRT1_2;
SQRT2=Math.SQRT2;
function _77(_78){
this._eventListenersForEventNames={};
this._owner=_78;
};
_77.prototype.addEventListener=function(_79,_7a){
var _7b=this._eventListenersForEventNames;
if(!_7c.call(_7b,_79)){
var _7d=[];
_7b[_79]=_7d;
}else{
var _7d=_7b[_79];
}
var _7e=_7d.length;
while(_7e--){
if(_7d[_7e]===_7a){
return;
}
}
_7d.push(_7a);
};
_77.prototype.removeEventListener=function(_7f,_80){
var _81=this._eventListenersForEventNames;
if(!_7c.call(_81,_7f)){
return;
}
var _82=_81[_7f],_83=_82.length;
while(_83--){
if(_82[_83]===_80){
return _82.splice(_83,1);
}
}
};
_77.prototype.dispatchEvent=function(_84){
var _85=_84.type,_86=this._eventListenersForEventNames;
if(_7c.call(_86,_85)){
var _87=this._eventListenersForEventNames[_85],_88=0,_89=_87.length;
for(;_88<_89;++_88){
_87[_88](_84);
}
}
var _8a=(this._owner||this)["on"+_85];
if(_8a){
_8a(_84);
}
};
var _8b=0,_8c=null,_8d=[];
function _8e(_8f){
var _90=_8b;
if(_8c===null){
window.setNativeTimeout(function(){
var _91=_8d,_92=0,_93=_8d.length;
++_8b;
_8c=null;
_8d=[];
for(;_92<_93;++_92){
_91[_92]();
}
},0);
}
return function(){
var _94=arguments;
if(_8b>_90){
_8f.apply(this,_94);
}else{
_8d.push(function(){
_8f.apply(this,_94);
});
}
};
};
var _95=null;
if(window.ActiveXObject!==_29){
var _96=["Msxml2.XMLHTTP.3.0","Msxml2.XMLHTTP.6.0"],_97=_96.length;
while(_97--){
try{
var _98=_96[_97];
new ActiveXObject(_98);
_95=function(){
return new ActiveXObject(_98);
};
break;
}
catch(anException){
}
}
}
if(!_95){
_95=window.XMLHttpRequest;
}
CFHTTPRequest=function(){
this._isOpen=false;
this._requestHeaders={};
this._mimeType=null;
this._eventDispatcher=new _77(this);
this._nativeRequest=new _95();
var _99=this;
this._stateChangeHandler=function(){
_ac(_99);
};
this._nativeRequest.onreadystatechange=this._stateChangeHandler;
if(CFHTTPRequest.AuthenticationDelegate!==nil){
this._eventDispatcher.addEventListener("HTTP403",function(){
CFHTTPRequest.AuthenticationDelegate(_99);
});
}
};
CFHTTPRequest.UninitializedState=0;
CFHTTPRequest.LoadingState=1;
CFHTTPRequest.LoadedState=2;
CFHTTPRequest.InteractiveState=3;
CFHTTPRequest.CompleteState=4;
CFHTTPRequest.AuthenticationDelegate=nil;
CFHTTPRequest.prototype.status=function(){
try{
return this._nativeRequest.status||0;
}
catch(anException){
return 0;
}
};
CFHTTPRequest.prototype.statusText=function(){
try{
return this._nativeRequest.statusText||"";
}
catch(anException){
return "";
}
};
CFHTTPRequest.prototype.readyState=function(){
return this._nativeRequest.readyState;
};
CFHTTPRequest.prototype.success=function(){
var _9a=this.status();
if(_9a>=200&&_9a<300){
return YES;
}
return _9a===0&&this.responseText()&&this.responseText().length;
};
CFHTTPRequest.prototype.responseXML=function(){
var _9b=this._nativeRequest.responseXML;
if(_9b&&(_95===window.XMLHttpRequest)){
return _9b;
}
return _9c(this.responseText());
};
CFHTTPRequest.prototype.responsePropertyList=function(){
var _9d=this.responseText();
if(CFPropertyList.sniffedFormatOfString(_9d)===CFPropertyList.FormatXML_v1_0){
return CFPropertyList.propertyListFromXML(this.responseXML());
}
return CFPropertyList.propertyListFromString(_9d);
};
CFHTTPRequest.prototype.responseText=function(){
return this._nativeRequest.responseText;
};
CFHTTPRequest.prototype.setRequestHeader=function(_9e,_9f){
this._requestHeaders[_9e]=_9f;
};
CFHTTPRequest.prototype.getResponseHeader=function(_a0){
return this._nativeRequest.getResponseHeader(_a0);
};
CFHTTPRequest.prototype.getAllResponseHeaders=function(){
return this._nativeRequest.getAllResponseHeaders();
};
CFHTTPRequest.prototype.overrideMimeType=function(_a1){
this._mimeType=_a1;
};
CFHTTPRequest.prototype.open=function(_a2,_a3,_a4,_a5,_a6){
this._isOpen=true;
this._URL=_a3;
this._async=_a4;
this._method=_a2;
this._user=_a5;
this._password=_a6;
return this._nativeRequest.open(_a2,_a3,_a4,_a5,_a6);
};
CFHTTPRequest.prototype.send=function(_a7){
if(!this._isOpen){
delete this._nativeRequest.onreadystatechange;
this._nativeRequest.open(this._method,this._URL,this._async,this._user,this._password);
this._nativeRequest.onreadystatechange=this._stateChangeHandler;
}
for(var i in this._requestHeaders){
if(this._requestHeaders.hasOwnProperty(i)){
this._nativeRequest.setRequestHeader(i,this._requestHeaders[i]);
}
}
if(this._mimeType&&"overrideMimeType" in this._nativeRequest){
this._nativeRequest.overrideMimeType(this._mimeType);
}
this._isOpen=false;
try{
return this._nativeRequest.send(_a7);
}
catch(anException){
this._eventDispatcher.dispatchEvent({type:"failure",request:this});
}
};
CFHTTPRequest.prototype.abort=function(){
this._isOpen=false;
return this._nativeRequest.abort();
};
CFHTTPRequest.prototype.addEventListener=function(_a8,_a9){
this._eventDispatcher.addEventListener(_a8,_a9);
};
CFHTTPRequest.prototype.removeEventListener=function(_aa,_ab){
this._eventDispatcher.removeEventListener(_aa,_ab);
};
function _ac(_ad){
var _ae=_ad._eventDispatcher;
_ae.dispatchEvent({type:"readystatechange",request:_ad});
var _af=_ad._nativeRequest,_b0=["uninitialized","loading","loaded","interactive","complete"];
if(_b0[_ad.readyState()]==="complete"){
var _b1="HTTP"+_ad.status();
_ae.dispatchEvent({type:_b1,request:_ad});
var _b2=_ad.success()?"success":"failure";
_ae.dispatchEvent({type:_b2,request:_ad});
_ae.dispatchEvent({type:_b0[_ad.readyState()],request:_ad});
}else{
_ae.dispatchEvent({type:_b0[_ad.readyState()],request:_ad});
}
};
function _b3(_b4,_b5,_b6){
var _b7=new CFHTTPRequest();
if(_b4.pathExtension()==="plist"){
_b7.overrideMimeType("text/xml");
}
if(_2.asyncLoader){
_b7.onsuccess=_8e(_b5);
_b7.onfailure=_8e(_b6);
}else{
_b7.onsuccess=_b5;
_b7.onfailure=_b6;
}
_b7.open("GET",_b4.absoluteString(),_2.asyncLoader);
_b7.send("");
};
_2.asyncLoader=YES;
_2.Asynchronous=_8e;
_2.determineAndDispatchHTTPRequestEvents=_ac;
var _b8=0;
objj_generateObjectUID=function(){
return _b8++;
};
CFPropertyList=function(){
this._UID=objj_generateObjectUID();
};
CFPropertyList.DTDRE=/^\s*(?:<\?\s*xml\s+version\s*=\s*\"1.0\"[^>]*\?>\s*)?(?:<\!DOCTYPE[^>]*>\s*)?/i;
CFPropertyList.XMLRE=/^\s*(?:<\?\s*xml\s+version\s*=\s*\"1.0\"[^>]*\?>\s*)?(?:<\!DOCTYPE[^>]*>\s*)?<\s*plist[^>]*\>/i;
CFPropertyList.FormatXMLDTD="<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<!DOCTYPE plist PUBLIC \"-//Apple//DTD PLIST 1.0//EN\" \"http://www.apple.com/DTDs/PropertyList-1.0.dtd\">";
CFPropertyList.Format280NorthMagicNumber="280NPLIST";
CFPropertyList.FormatOpenStep=1,CFPropertyList.FormatXML_v1_0=100,CFPropertyList.FormatBinary_v1_0=200,CFPropertyList.Format280North_v1_0=-1000;
CFPropertyList.sniffedFormatOfString=function(_b9){
if(_b9.match(CFPropertyList.XMLRE)){
return CFPropertyList.FormatXML_v1_0;
}
if(_b9.substr(0,CFPropertyList.Format280NorthMagicNumber.length)===CFPropertyList.Format280NorthMagicNumber){
return CFPropertyList.Format280North_v1_0;
}
return NULL;
};
CFPropertyList.dataFromPropertyList=function(_ba,_bb){
var _bc=new CFMutableData();
_bc.setRawString(CFPropertyList.stringFromPropertyList(_ba,_bb));
return _bc;
};
CFPropertyList.stringFromPropertyList=function(_bd,_be){
if(!_be){
_be=CFPropertyList.Format280North_v1_0;
}
var _bf=_c0[_be];
return _bf["start"]()+_c1(_bd,_bf)+_bf["finish"]();
};
function _c1(_c2,_c3){
var _c4=typeof _c2,_c5=_c2.valueOf(),_c6=typeof _c5;
if(_c4!==_c6){
_c4=_c6;
_c2=_c5;
}
if(_c2===YES||_c2===NO){
_c4="boolean";
}else{
if(_c4==="number"){
if(FLOOR(_c2)===_c2&&(""+_c2).indexOf("e")==-1){
_c4="integer";
}else{
_c4="real";
}
}else{
if(_c4!=="string"){
if(_c2.slice){
_c4="array";
}else{
_c4="dictionary";
}
}
}
}
return _c3[_c4](_c2,_c3);
};
var _c0={};
_c0[CFPropertyList.FormatXML_v1_0]={"start":function(){
return CFPropertyList.FormatXMLDTD+"<plist version = \"1.0\">";
},"finish":function(){
return "</plist>";
},"string":function(_c7){
return "<string>"+_c8(_c7)+"</string>";
},"boolean":function(_c9){
return _c9?"<true/>":"<false/>";
},"integer":function(_ca){
return "<integer>"+_ca+"</integer>";
},"real":function(_cb){
return "<real>"+_cb+"</real>";
},"array":function(_cc,_cd){
var _ce=0,_cf=_cc.length,_d0="<array>";
for(;_ce<_cf;++_ce){
_d0+=_c1(_cc[_ce],_cd);
}
return _d0+"</array>";
},"dictionary":function(_d1,_d2){
var _d3=_d1._keys,_97=0,_d4=_d3.length,_d5="<dict>";
for(;_97<_d4;++_97){
var key=_d3[_97];
_d5+="<key>"+key+"</key>";
_d5+=_c1(_d1.valueForKey(key),_d2);
}
return _d5+"</dict>";
}};
var _d6="A",_d7="D",_d8="f",_d9="d",_da="S",_db="T",_dc="F",_dd="K",_de="E";
_c0[CFPropertyList.Format280North_v1_0]={"start":function(){
return CFPropertyList.Format280NorthMagicNumber+";1.0;";
},"finish":function(){
return "";
},"string":function(_df){
return _da+";"+_df.length+";"+_df;
},"boolean":function(_e0){
return (_e0?_db:_dc)+";";
},"integer":function(_e1){
var _e2=""+_e1;
return _d9+";"+_e2.length+";"+_e2;
},"real":function(_e3){
var _e4=""+_e3;
return _d8+";"+_e4.length+";"+_e4;
},"array":function(_e5,_e6){
var _e7=0,_e8=_e5.length,_e9=_d6+";";
for(;_e7<_e8;++_e7){
_e9+=_c1(_e5[_e7],_e6);
}
return _e9+_de+";";
},"dictionary":function(_ea,_eb){
var _ec=_ea._keys,_97=0,_ed=_ec.length,_ee=_d7+";";
for(;_97<_ed;++_97){
var key=_ec[_97];
_ee+=_dd+";"+key.length+";"+key;
_ee+=_c1(_ea.valueForKey(key),_eb);
}
return _ee+_de+";";
}};
var _ef="xml",_f0="#document",_f1="plist",_f2="key",_f3="dict",_f4="array",_f5="string",_f6="date",_f7="true",_f8="false",_f9="real",_fa="integer",_fb="data";
var _fc=function(_fd){
var _fe="",_97=0,_ff=_fd.length;
for(;_97<_ff;++_97){
var node=_fd[_97];
if(node.nodeType===3||node.nodeType===4){
_fe+=node.nodeValue;
}else{
if(node.nodeType!==8){
_fe+=_fc(node.childNodes);
}
}
}
return _fe;
};
var _100=function(_101,_102,_103){
var node=_101;
node=(node.firstChild);
if(node!==NULL&&((node.nodeType)===8||(node.nodeType)===3)){
while((node=(node.nextSibling))&&((node.nodeType)===8||(node.nodeType)===3)){
}
}
if(node){
return node;
}
if((String(_101.nodeName))===_f4||(String(_101.nodeName))===_f3){
_103.pop();
}else{
if(node===_102){
return NULL;
}
node=_101;
while((node=(node.nextSibling))&&((node.nodeType)===8||(node.nodeType)===3)){
}
if(node){
return node;
}
}
node=_101;
while(node){
var next=node;
while((next=(next.nextSibling))&&((next.nodeType)===8||(next.nodeType)===3)){
}
if(next){
return next;
}
var node=(node.parentNode);
if(_102&&node===_102){
return NULL;
}
_103.pop();
}
return NULL;
};
CFPropertyList.propertyListFromData=function(_104,_105){
return CFPropertyList.propertyListFromString(_104.rawString(),_105);
};
CFPropertyList.propertyListFromString=function(_106,_107){
if(!_107){
_107=CFPropertyList.sniffedFormatOfString(_106);
}
if(_107===CFPropertyList.FormatXML_v1_0){
return CFPropertyList.propertyListFromXML(_106);
}
if(_107===CFPropertyList.Format280North_v1_0){
return _108(_106);
}
return NULL;
};
var _d6="A",_d7="D",_d8="f",_d9="d",_da="S",_db="T",_dc="F",_dd="K",_de="E";
function _108(_109){
var _10a=new _10b(_109),_10c=NULL,key="",_10d=NULL,_10e=NULL,_10f=[],_110=NULL;
while(_10c=_10a.getMarker()){
if(_10c===_de){
_10f.pop();
continue;
}
var _111=_10f.length;
if(_111){
_110=_10f[_111-1];
}
if(_10c===_dd){
key=_10a.getString();
_10c=_10a.getMarker();
}
switch(_10c){
case _d6:
_10d=[];
_10f.push(_10d);
break;
case _d7:
_10d=new CFMutableDictionary();
_10f.push(_10d);
break;
case _d8:
_10d=parseFloat(_10a.getString());
break;
case _d9:
_10d=parseInt(_10a.getString(),10);
break;
case _da:
_10d=_10a.getString();
break;
case _db:
_10d=YES;
break;
case _dc:
_10d=NO;
break;
default:
throw new Error("*** "+_10c+" marker not recognized in Plist.");
}
if(!_10e){
_10e=_10d;
}else{
if(_110){
if(_110.slice){
_110.push(_10d);
}else{
_110.setValueForKey(key,_10d);
}
}
}
}
return _10e;
};
function _c8(_112){
return _112.replace(/&/g,"&amp;").replace(/"/g,"&quot;").replace(/'/g,"&apos;").replace(/</g,"&lt;").replace(/>/g,"&gt;");
};
function _113(_114){
return _114.replace(/&quot;/g,"\"").replace(/&apos;/g,"'").replace(/&lt;/g,"<").replace(/&gt;/g,">").replace(/&amp;/g,"&");
};
function _9c(_115){
if(window.DOMParser){
return (new window.DOMParser().parseFromString(_115,"text/xml").documentElement);
}else{
if(window.ActiveXObject){
XMLNode=new ActiveXObject("Microsoft.XMLDOM");
var _116=_115.match(CFPropertyList.DTDRE);
if(_116){
_115=_115.substr(_116[0].length);
}
XMLNode.loadXML(_115);
return XMLNode;
}
}
return NULL;
};
CFPropertyList.propertyListFromXML=function(_117){
var _118=_117;
if(_117.valueOf&&typeof _117.valueOf()==="string"){
_118=_9c(_117);
}
while(((String(_118.nodeName))===_f0)||((String(_118.nodeName))===_ef)){
_118=(_118.firstChild);
}
if(_118!==NULL&&((_118.nodeType)===8||(_118.nodeType)===3)){
while((_118=(_118.nextSibling))&&((_118.nodeType)===8||(_118.nodeType)===3)){
}
}
if(((_118.nodeType)===10)){
while((_118=(_118.nextSibling))&&((_118.nodeType)===8||(_118.nodeType)===3)){
}
}
if(!((String(_118.nodeName))===_f1)){
return NULL;
}
var key="",_119=NULL,_11a=NULL,_11b=_118,_11c=[],_11d=NULL;
while(_118=_100(_118,_11b,_11c)){
var _11e=_11c.length;
if(_11e){
_11d=_11c[_11e-1];
}
if((String(_118.nodeName))===_f2){
key=(_118.textContent||(_118.textContent!==""&&_fc([_118])));
while((_118=(_118.nextSibling))&&((_118.nodeType)===8||(_118.nodeType)===3)){
}
}
switch(String((String(_118.nodeName)))){
case _f4:
_119=[];
_11c.push(_119);
break;
case _f3:
_119=new CFMutableDictionary();
_11c.push(_119);
break;
case _f9:
_119=parseFloat((_118.textContent||(_118.textContent!==""&&_fc([_118]))));
break;
case _fa:
_119=parseInt((_118.textContent||(_118.textContent!==""&&_fc([_118]))),10);
break;
case _f5:
if((_118.getAttribute("type")==="base64")){
_119=(_118.firstChild)?CFData.decodeBase64ToString((_118.textContent||(_118.textContent!==""&&_fc([_118])))):"";
}else{
_119=_113((_118.firstChild)?(_118.textContent||(_118.textContent!==""&&_fc([_118]))):"");
}
break;
case _f6:
var _11f=Date.parseISO8601((_118.textContent||(_118.textContent!==""&&_fc([_118]))));
_119=isNaN(_11f)?new Date():new Date(_11f);
break;
case _f7:
_119=YES;
break;
case _f8:
_119=NO;
break;
case _fb:
_119=new CFMutableData();
var _120=(_118.firstChild)?CFData.decodeBase64ToArray((_118.textContent||(_118.textContent!==""&&_fc([_118]))),YES):[];
_119.setBytes(_120);
break;
default:
throw new Error("*** "+(String(_118.nodeName))+" tag not recognized in Plist.");
}
if(!_11a){
_11a=_119;
}else{
if(_11d){
if(_11d.slice){
_11d.push(_119);
}else{
_11d.setValueForKey(key,_119);
}
}
}
}
return _11a;
};
kCFPropertyListOpenStepFormat=CFPropertyList.FormatOpenStep;
kCFPropertyListXMLFormat_v1_0=CFPropertyList.FormatXML_v1_0;
kCFPropertyListBinaryFormat_v1_0=CFPropertyList.FormatBinary_v1_0;
kCFPropertyList280NorthFormat_v1_0=CFPropertyList.Format280North_v1_0;
CFPropertyListCreate=function(){
return new CFPropertyList();
};
CFPropertyListCreateFromXMLData=function(data){
return CFPropertyList.propertyListFromData(data,CFPropertyList.FormatXML_v1_0);
};
CFPropertyListCreateXMLData=function(_121){
return CFPropertyList.dataFromPropertyList(_121,CFPropertyList.FormatXML_v1_0);
};
CFPropertyListCreateFrom280NorthData=function(data){
return CFPropertyList.propertyListFromData(data,CFPropertyList.Format280North_v1_0);
};
CFPropertyListCreate280NorthData=function(_122){
return CFPropertyList.dataFromPropertyList(_122,CFPropertyList.Format280North_v1_0);
};
CPPropertyListCreateFromData=function(data,_123){
return CFPropertyList.propertyListFromData(data,_123);
};
CPPropertyListCreateData=function(_124,_125){
return CFPropertyList.dataFromPropertyList(_124,_125);
};
CFDictionary=function(_126){
this._keys=[];
this._count=0;
this._buckets={};
this._UID=objj_generateObjectUID();
};
var _127=Array.prototype.indexOf,_7c=Object.prototype.hasOwnProperty;
CFDictionary.prototype.copy=function(){
return this;
};
CFDictionary.prototype.mutableCopy=function(){
var _128=new CFMutableDictionary(),keys=this._keys,_129=this._count;
_128._keys=keys.slice();
_128._count=_129;
var _12a=0,_12b=this._buckets,_12c=_128._buckets;
for(;_12a<_129;++_12a){
var key=keys[_12a];
_12c[key]=_12b[key];
}
return _128;
};
CFDictionary.prototype.containsKey=function(aKey){
return _7c.apply(this._buckets,[aKey]);
};
CFDictionary.prototype.containsValue=function(_12d){
var keys=this._keys,_12e=this._buckets,_97=0,_12f=keys.length;
for(;_97<_12f;++_97){
if(_12e[keys[_97]]===_12d){
return YES;
}
}
return NO;
};
CFDictionary.prototype.count=function(){
return this._count;
};
CFDictionary.prototype.countOfKey=function(aKey){
return this.containsKey(aKey)?1:0;
};
CFDictionary.prototype.countOfValue=function(_130){
var keys=this._keys,_131=this._buckets,_97=0,_132=keys.length,_133=0;
for(;_97<_132;++_97){
if(_131[keys[_97]]===_130){
++_133;
}
}
return _133;
};
CFDictionary.prototype.keys=function(){
return this._keys.slice();
};
CFDictionary.prototype.valueForKey=function(aKey){
var _134=this._buckets;
if(!_7c.apply(_134,[aKey])){
return nil;
}
return _134[aKey];
};
CFDictionary.prototype.toString=function(){
var _135="{\n",keys=this._keys,_97=0,_136=this._count;
for(;_97<_136;++_97){
var key=keys[_97];
_135+="\t"+key+" = \""+String(this.valueForKey(key)).split("\n").join("\n\t")+"\"\n";
}
return _135+"}";
};
CFMutableDictionary=function(_137){
CFDictionary.apply(this,[]);
};
CFMutableDictionary.prototype=new CFDictionary();
CFMutableDictionary.prototype.copy=function(){
return this.mutableCopy();
};
CFMutableDictionary.prototype.addValueForKey=function(aKey,_138){
if(this.containsKey(aKey)){
return;
}
++this._count;
this._keys.push(aKey);
this._buckets[aKey]=_138;
};
CFMutableDictionary.prototype.removeValueForKey=function(aKey){
var _139=-1;
if(_127){
_139=_127.call(this._keys,aKey);
}else{
var keys=this._keys,_97=0,_13a=keys.length;
for(;_97<_13a;++_97){
if(keys[_97]===aKey){
_139=_97;
break;
}
}
}
if(_139===-1){
return;
}
--this._count;
this._keys.splice(_139,1);
delete this._buckets[aKey];
};
CFMutableDictionary.prototype.removeAllValues=function(){
this._count=0;
this._keys=[];
this._buckets={};
};
CFMutableDictionary.prototype.replaceValueForKey=function(aKey,_13b){
if(!this.containsKey(aKey)){
return;
}
this._buckets[aKey]=_13b;
};
CFMutableDictionary.prototype.setValueForKey=function(aKey,_13c){
if(_13c===nil||_13c===_29){
this.removeValueForKey(aKey);
}else{
if(this.containsKey(aKey)){
this.replaceValueForKey(aKey,_13c);
}else{
this.addValueForKey(aKey,_13c);
}
}
};
CFData=function(){
this._rawString=NULL;
this._propertyList=NULL;
this._propertyListFormat=NULL;
this._JSONObject=NULL;
this._bytes=NULL;
this._base64=NULL;
};
CFData.prototype.propertyList=function(){
if(!this._propertyList){
this._propertyList=CFPropertyList.propertyListFromString(this.rawString());
}
return this._propertyList;
};
CFData.prototype.JSONObject=function(){
if(!this._JSONObject){
try{
this._JSONObject=JSON.parse(this.rawString());
}
catch(anException){
}
}
return this._JSONObject;
};
CFData.prototype.rawString=function(){
if(this._rawString===NULL){
if(this._propertyList){
this._rawString=CFPropertyList.stringFromPropertyList(this._propertyList,this._propertyListFormat);
}else{
if(this._JSONObject){
this._rawString=JSON.stringify(this._JSONObject);
}else{
if(this._bytes){
this._rawString=CFData.bytesToString(this._bytes);
}else{
if(this._base64){
this._rawString=CFData.decodeBase64ToString(this._base64,true);
}else{
throw new Error("Can't convert data to string.");
}
}
}
}
}
return this._rawString;
};
CFData.prototype.bytes=function(){
if(this._bytes===NULL){
var _13d=CFData.stringToBytes(this.rawString());
this.setBytes(_13d);
}
return this._bytes;
};
CFData.prototype.base64=function(){
if(this._base64===NULL){
var _13e;
if(this._bytes){
_13e=CFData.encodeBase64Array(this._bytes);
}else{
_13e=CFData.encodeBase64String(this.rawString());
}
this.setBase64String(_13e);
}
return this._base64;
};
CFMutableData=function(){
CFData.call(this);
};
CFMutableData.prototype=new CFData();
function _13f(_140){
this._rawString=NULL;
this._propertyList=NULL;
this._propertyListFormat=NULL;
this._JSONObject=NULL;
this._bytes=NULL;
this._base64=NULL;
};
CFMutableData.prototype.setPropertyList=function(_141,_142){
_13f(this);
this._propertyList=_141;
this._propertyListFormat=_142;
};
CFMutableData.prototype.setJSONObject=function(_143){
_13f(this);
this._JSONObject=_143;
};
CFMutableData.prototype.setRawString=function(_144){
_13f(this);
this._rawString=_144;
};
CFMutableData.prototype.setBytes=function(_145){
_13f(this);
this._bytes=_145;
};
CFMutableData.prototype.setBase64String=function(_146){
_13f(this);
this._base64=_146;
};
var _147=["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z","a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z","0","1","2","3","4","5","6","7","8","9","+","/","="],_148=[];
for(var i=0;i<_147.length;i++){
_148[_147[i].charCodeAt(0)]=i;
}
CFData.decodeBase64ToArray=function(_149,_14a){
if(_14a){
_149=_149.replace(/[^A-Za-z0-9\+\/\=]/g,"");
}
var pad=(_149[_149.length-1]=="="?1:0)+(_149[_149.length-2]=="="?1:0),_14b=_149.length,_14c=[];
var i=0;
while(i<_14b){
var bits=(_148[_149.charCodeAt(i++)]<<18)|(_148[_149.charCodeAt(i++)]<<12)|(_148[_149.charCodeAt(i++)]<<6)|(_148[_149.charCodeAt(i++)]);
_14c.push((bits&16711680)>>16);
_14c.push((bits&65280)>>8);
_14c.push(bits&255);
}
if(pad>0){
return _14c.slice(0,-1*pad);
}
return _14c;
};
CFData.encodeBase64Array=function(_14d){
var pad=(3-(_14d.length%3))%3,_14e=_14d.length+pad,_14f=[];
if(pad>0){
_14d.push(0);
}
if(pad>1){
_14d.push(0);
}
var i=0;
while(i<_14e){
var bits=(_14d[i++]<<16)|(_14d[i++]<<8)|(_14d[i++]);
_14f.push(_147[(bits&16515072)>>18]);
_14f.push(_147[(bits&258048)>>12]);
_14f.push(_147[(bits&4032)>>6]);
_14f.push(_147[bits&63]);
}
if(pad>0){
_14f[_14f.length-1]="=";
_14d.pop();
}
if(pad>1){
_14f[_14f.length-2]="=";
_14d.pop();
}
return _14f.join("");
};
CFData.decodeBase64ToString=function(_150,_151){
return CFData.bytesToString(CFData.decodeBase64ToArray(_150,_151));
};
CFData.decodeBase64ToUtf16String=function(_152,_153){
return CFData.bytesToUtf16String(CFData.decodeBase64ToArray(_152,_153));
};
CFData.bytesToString=function(_154){
return String.fromCharCode.apply(NULL,_154);
};
CFData.stringToBytes=function(_155){
var temp=[];
for(var i=0;i<_155.length;i++){
temp.push(_155.charCodeAt(i));
}
return temp;
};
CFData.encodeBase64String=function(_156){
var temp=[];
for(var i=0;i<_156.length;i++){
temp.push(_156.charCodeAt(i));
}
return CFData.encodeBase64Array(temp);
};
CFData.bytesToUtf16String=function(_157){
var temp=[];
for(var i=0;i<_157.length;i+=2){
temp.push(_157[i+1]<<8|_157[i]);
}
return String.fromCharCode.apply(NULL,temp);
};
CFData.encodeBase64Utf16String=function(_158){
var temp=[];
for(var i=0;i<_158.length;i++){
var c=_158.charCodeAt(i);
temp.push(_158.charCodeAt(i)&255);
temp.push((_158.charCodeAt(i)&65280)>>8);
}
return CFData.encodeBase64Array(temp);
};
var _159,_15a,_15b=0;
function _15c(){
if(++_15b!==1){
return;
}
_159={};
_15a={};
};
function _15d(){
_15b=MAX(_15b-1,0);
if(_15b!==0){
return;
}
delete _159;
delete _15a;
};
var _15e=new RegExp("^"+"(?:"+"([^:/?#]+):"+")?"+"(?:"+"(//)"+"("+"(?:"+"("+"([^:@]*)"+":?"+"([^:@]*)"+")?"+"@"+")?"+"([^:/?#]*)"+"(?::(\\d*))?"+")"+")?"+"([^?#]*)"+"(?:\\?([^#]*))?"+"(?:#(.*))?");
var _15f=["url","scheme","authorityRoot","authority","userInfo","user","password","domain","portNumber","path","queryString","fragment"];
function _160(aURL){
if(aURL._parts){
return aURL._parts;
}
var _161=aURL.string(),_162=_161.match(/^mhtml:/);
if(_162){
_161=_161.substr("mhtml:".length);
}
if(_15b>0&&_7c.call(_15a,_161)){
aURL._parts=_15a[_161];
return aURL._parts;
}
aURL._parts={};
var _163=aURL._parts,_164=_15e.exec(_161),_97=_164.length;
while(_97--){
_163[_15f[_97]]=_164[_97]||NULL;
}
_163.portNumber=parseInt(_163.portNumber,10);
if(isNaN(_163.portNumber)){
_163.portNumber=-1;
}
_163.pathComponents=[];
if(_163.path){
var _165=_163.path.split("/"),_166=_163.pathComponents,_167=_165.length;
for(_97=0;_97<_167;++_97){
var _168=_165[_97];
if(_168){
_166.push(_168);
}else{
if(_97===0){
_166.push("/");
}
}
}
_163.pathComponents=_166;
}
if(_162){
_163.url="mhtml:"+_163.url;
_163.scheme="mhtml:"+_163.scheme;
}
if(_15b>0){
_15a[_161]=_163;
}
return _163;
};
CFURL=function(aURL,_169){
aURL=aURL||"";
if(aURL instanceof CFURL){
if(!_169){
return new CFURL(aURL.absoluteString());
}
var _16a=aURL.baseURL();
if(_16a){
_169=new CFURL(_16a.absoluteURL(),_169);
}
aURL=aURL.string();
}
if(_15b>0){
var _16b=aURL+" "+(_169&&_169.UID()||"");
if(_7c.call(_159,_16b)){
return _159[_16b];
}
_159[_16b]=this;
}
if(aURL.match(/^data:/)){
var _16c={},_97=_15f.length;
while(_97--){
_16c[_15f[_97]]="";
}
_16c.url=aURL;
_16c.scheme="data";
_16c.pathComponents=[];
this._parts=_16c;
this._standardizedURL=this;
this._absoluteURL=this;
}
this._UID=objj_generateObjectUID();
this._string=aURL;
this._baseURL=_169;
};
CFURL.prototype.UID=function(){
return this._UID;
};
var _16d={};
CFURL.prototype.mappedURL=function(){
return _16d[this.absoluteString()]||this;
};
CFURL.setMappedURLForURL=function(_16e,_16f){
_16d[_16e.absoluteString()]=_16f;
};
CFURL.prototype.schemeAndAuthority=function(){
var _170="",_171=this.scheme();
if(_171){
_170+=_171+":";
}
var _172=this.authority();
if(_172){
_170+="//"+_172;
}
return _170;
};
CFURL.prototype.absoluteString=function(){
if(this._absoluteString===_29){
this._absoluteString=this.absoluteURL().string();
}
return this._absoluteString;
};
CFURL.prototype.toString=function(){
return this.absoluteString();
};
function _173(aURL){
aURL=aURL.standardizedURL();
var _174=aURL.baseURL();
if(!_174){
return aURL;
}
var _175=((aURL)._parts||_160(aURL)),_176,_177=_174.absoluteURL(),_178=((_177)._parts||_160(_177));
if(_175.scheme||_175.authority){
_176=_175;
}else{
_176={};
_176.scheme=_178.scheme;
_176.authority=_178.authority;
_176.userInfo=_178.userInfo;
_176.user=_178.user;
_176.password=_178.password;
_176.domain=_178.domain;
_176.portNumber=_178.portNumber;
_176.queryString=_175.queryString;
_176.fragment=_175.fragment;
var _179=_175.pathComponents;
if(_179.length&&_179[0]==="/"){
_176.path=_175.path;
_176.pathComponents=_179;
}else{
var _17a=_178.pathComponents,_17b=_17a.concat(_179);
if(!_174.hasDirectoryPath()&&_17a.length){
_17b.splice(_17a.length-1,1);
}
if(_179.length&&(_179[0]===".."||_179[0]===".")){
_17c(_17b,YES);
}
_176.pathComponents=_17b;
_176.path=_17d(_17b,_179.length<=0||aURL.hasDirectoryPath());
}
}
var _17e=_17f(_176),_180=new CFURL(_17e);
_180._parts=_176;
_180._standardizedURL=_180;
_180._standardizedString=_17e;
_180._absoluteURL=_180;
_180._absoluteString=_17e;
return _180;
};
function _17d(_181,_182){
var path=_181.join("/");
if(path.length&&path.charAt(0)==="/"){
path=path.substr(1);
}
if(_182){
path+="/";
}
return path;
};
function _17c(_183,_184){
var _185=0,_186=0,_187=_183.length,_188=_184?_183:[],_189=NO;
for(;_185<_187;++_185){
var _18a=_183[_185];
if(_18a===""){
continue;
}
if(_18a==="."){
_189=_186===0;
continue;
}
if(_18a!==".."||_186===0||_188[_186-1]===".."){
_188[_186]=_18a;
_186++;
continue;
}
if(_186>0&&_188[_186-1]!=="/"){
--_186;
}
}
if(_189&&_186===0){
_188[_186++]=".";
}
_188.length=_186;
return _188;
};
function _17f(_18b){
var _18c="",_18d=_18b.scheme;
if(_18d){
_18c+=_18d+":";
}
var _18e=_18b.authority;
if(_18e){
_18c+="//"+_18e;
}
_18c+=_18b.path;
var _18f=_18b.queryString;
if(_18f){
_18c+="?"+_18f;
}
var _190=_18b.fragment;
if(_190){
_18c+="#"+_190;
}
return _18c;
};
CFURL.prototype.absoluteURL=function(){
if(this._absoluteURL===_29){
this._absoluteURL=_173(this);
}
return this._absoluteURL;
};
CFURL.prototype.standardizedURL=function(){
if(this._standardizedURL===_29){
var _191=((this)._parts||_160(this)),_192=_191.pathComponents,_193=_17c(_192,NO);
var _194=_17d(_193,this.hasDirectoryPath());
if(_191.path===_194){
this._standardizedURL=this;
}else{
var _195=_196(_191);
_195.pathComponents=_193;
_195.path=_194;
var _197=new CFURL(_17f(_195),this.baseURL());
_197._parts=_195;
_197._standardizedURL=_197;
this._standardizedURL=_197;
}
}
return this._standardizedURL;
};
function _196(_198){
var _199={},_19a=_15f.length;
while(_19a--){
var _19b=_15f[_19a];
_199[_19b]=_198[_19b];
}
return _199;
};
CFURL.prototype.string=function(){
return this._string;
};
CFURL.prototype.authority=function(){
var _19c=((this)._parts||_160(this)).authority;
if(_19c){
return _19c;
}
var _19d=this.baseURL();
return _19d&&_19d.authority()||"";
};
CFURL.prototype.hasDirectoryPath=function(){
var _19e=this._hasDirectoryPath;
if(_19e===_29){
var path=this.path();
if(!path){
return NO;
}
if(path.charAt(path.length-1)==="/"){
return YES;
}
var _19f=this.lastPathComponent();
_19e=_19f==="."||_19f==="..";
this._hasDirectoryPath=_19e;
}
return _19e;
};
CFURL.prototype.hostName=function(){
return this.authority();
};
CFURL.prototype.fragment=function(){
return ((this)._parts||_160(this)).fragment;
};
CFURL.prototype.lastPathComponent=function(){
if(this._lastPathComponent===_29){
var _1a0=this.pathComponents(),_1a1=_1a0.length;
if(!_1a1){
this._lastPathComponent="";
}else{
this._lastPathComponent=_1a0[_1a1-1];
}
}
return this._lastPathComponent;
};
CFURL.prototype.path=function(){
return ((this)._parts||_160(this)).path;
};
CFURL.prototype.createCopyDeletingLastPathComponent=function(){
var _1a2=((this)._parts||_160(this)),_1a3=_17c(_1a2.pathComponents,NO);
if(_1a3.length>0){
if(_1a3.length>1||_1a3[0]!=="/"){
_1a3.pop();
}
}
var _1a4=_1a3.length===1&&_1a3[0]==="/";
_1a2.pathComponents=_1a3;
_1a2.path=_1a4?"/":_17d(_1a3,NO);
return new CFURL(_17f(_1a2));
};
CFURL.prototype.pathComponents=function(){
return ((this)._parts||_160(this)).pathComponents;
};
CFURL.prototype.pathExtension=function(){
var _1a5=this.lastPathComponent();
if(!_1a5){
return NULL;
}
_1a5=_1a5.replace(/^\.*/,"");
var _1a6=_1a5.lastIndexOf(".");
return _1a6<=0?"":_1a5.substring(_1a6+1);
};
CFURL.prototype.queryString=function(){
return ((this)._parts||_160(this)).queryString;
};
CFURL.prototype.scheme=function(){
var _1a7=this._scheme;
if(_1a7===_29){
_1a7=((this)._parts||_160(this)).scheme;
if(!_1a7){
var _1a8=this.baseURL();
_1a7=_1a8&&_1a8.scheme();
}
this._scheme=_1a7;
}
return _1a7;
};
CFURL.prototype.user=function(){
return ((this)._parts||_160(this)).user;
};
CFURL.prototype.password=function(){
return ((this)._parts||_160(this)).password;
};
CFURL.prototype.portNumber=function(){
return ((this)._parts||_160(this)).portNumber;
};
CFURL.prototype.domain=function(){
return ((this)._parts||_160(this)).domain;
};
CFURL.prototype.baseURL=function(){
return this._baseURL;
};
CFURL.prototype.asDirectoryPathURL=function(){
if(this.hasDirectoryPath()){
return this;
}
var _1a9=this.lastPathComponent();
if(_1a9!=="/"){
_1a9="./"+_1a9;
}
return new CFURL(_1a9+"/",this);
};
function _1aa(aURL){
if(!aURL._resourcePropertiesForKeys){
aURL._resourcePropertiesForKeys=new CFMutableDictionary();
}
return aURL._resourcePropertiesForKeys;
};
CFURL.prototype.resourcePropertyForKey=function(aKey){
return _1aa(this).valueForKey(aKey);
};
CFURL.prototype.setResourcePropertyForKey=function(aKey,_1ab){
_1aa(this).setValueForKey(aKey,_1ab);
};
CFURL.prototype.staticResourceData=function(){
var data=new CFMutableData();
data.setRawString(_1ac.resourceAtURL(this).contents());
return data;
};
function _10b(_1ad){
this._string=_1ad;
var _1ae=_1ad.indexOf(";");
this._magicNumber=_1ad.substr(0,_1ae);
this._location=_1ad.indexOf(";",++_1ae);
this._version=_1ad.substring(_1ae,this._location++);
};
_10b.prototype.magicNumber=function(){
return this._magicNumber;
};
_10b.prototype.version=function(){
return this._version;
};
_10b.prototype.getMarker=function(){
var _1af=this._string,_1b0=this._location;
if(_1b0>=_1af.length){
return null;
}
var next=_1af.indexOf(";",_1b0);
if(next<0){
return null;
}
var _1b1=_1af.substring(_1b0,next);
if(_1b1==="e"){
return null;
}
this._location=next+1;
return _1b1;
};
_10b.prototype.getString=function(){
var _1b2=this._string,_1b3=this._location;
if(_1b3>=_1b2.length){
return null;
}
var next=_1b2.indexOf(";",_1b3);
if(next<0){
return null;
}
var size=parseInt(_1b2.substring(_1b3,next),10),text=_1b2.substr(next+1,size);
this._location=next+1+size;
return text;
};
var _1b4=0,_1b5=1<<0,_1b6=1<<1,_1b7=1<<2,_1b8=1<<3,_1b9=1<<4;
var _1ba={},_1bb={},_1bc=new Date().getTime(),_1bd=0,_1be=0;
CFBundle=function(aURL){
aURL=_1bf(aURL).asDirectoryPathURL();
var _1c0=aURL.absoluteString(),_1c1=_1ba[_1c0];
if(_1c1){
return _1c1;
}
_1ba[_1c0]=this;
this._bundleURL=aURL;
this._resourcesDirectoryURL=new CFURL("Resources/",aURL);
this._staticResource=NULL;
this._isValid=NO;
this._loadStatus=_1b4;
this._loadRequests=[];
this._infoDictionary=new CFDictionary();
this._eventDispatcher=new _77(this);
};
CFBundle.environments=function(){
return ["Browser","ObjJ"];
};
CFBundle.bundleContainingURL=function(aURL){
aURL=new CFURL(".",_1bf(aURL));
var _1c2,_1c3=aURL.absoluteString();
while(!_1c2||_1c2!==_1c3){
var _1c4=_1ba[_1c3];
if(_1c4&&_1c4._isValid){
return _1c4;
}
aURL=new CFURL("..",aURL);
_1c2=_1c3;
_1c3=aURL.absoluteString();
}
return NULL;
};
CFBundle.mainBundle=function(){
return new CFBundle(_1c5);
};
function _1c6(_1c7,_1c8){
if(_1c8){
_1bb[_1c7.name]=_1c8;
}
};
CFBundle.bundleForClass=function(_1c9){
return _1bb[_1c9.name]||CFBundle.mainBundle();
};
CFBundle.prototype.bundleURL=function(){
return this._bundleURL;
};
CFBundle.prototype.resourcesDirectoryURL=function(){
return this._resourcesDirectoryURL;
};
CFBundle.prototype.resourceURL=function(_1ca,_1cb,_1cc){
if(_1cb){
_1ca=_1ca+"."+_1cb;
}
if(_1cc){
_1ca=_1cc+"/"+_1ca;
}
var _1cd=(new CFURL(_1ca,this.resourcesDirectoryURL())).mappedURL();
return _1cd.absoluteURL();
};
CFBundle.prototype.mostEligibleEnvironmentURL=function(){
if(this._mostEligibleEnvironmentURL===_29){
this._mostEligibleEnvironmentURL=new CFURL(this.mostEligibleEnvironment()+".environment/",this.bundleURL());
}
return this._mostEligibleEnvironmentURL;
};
CFBundle.prototype.executableURL=function(){
if(this._executableURL===_29){
var _1ce=this.valueForInfoDictionaryKey("CPBundleExecutable");
if(!_1ce){
this._executableURL=NULL;
}else{
this._executableURL=new CFURL(_1ce,this.mostEligibleEnvironmentURL());
}
}
return this._executableURL;
};
CFBundle.prototype.infoDictionary=function(){
return this._infoDictionary;
};
CFBundle.prototype.valueForInfoDictionaryKey=function(aKey){
return this._infoDictionary.valueForKey(aKey);
};
CFBundle.prototype.hasSpritedImages=function(){
var _1cf=this._infoDictionary.valueForKey("CPBundleEnvironmentsWithImageSprites")||[],_97=_1cf.length,_1d0=this.mostEligibleEnvironment();
while(_97--){
if(_1cf[_97]===_1d0){
return YES;
}
}
return NO;
};
CFBundle.prototype.environments=function(){
return this._infoDictionary.valueForKey("CPBundleEnvironments")||["ObjJ"];
};
CFBundle.prototype.mostEligibleEnvironment=function(_1d1){
_1d1=_1d1||this.environments();
var _1d2=CFBundle.environments(),_97=0,_1d3=_1d2.length,_1d4=_1d1.length;
for(;_97<_1d3;++_97){
var _1d5=0,_1d6=_1d2[_97];
for(;_1d5<_1d4;++_1d5){
if(_1d6===_1d1[_1d5]){
return _1d6;
}
}
}
return NULL;
};
CFBundle.prototype.isLoading=function(){
return this._loadStatus&_1b5;
};
CFBundle.prototype.isLoaded=function(){
return !!(this._loadStatus&_1b9);
};
CFBundle.prototype.load=function(_1d7){
if(this._loadStatus!==_1b4){
return;
}
this._loadStatus=_1b5|_1b6;
var self=this,_1d8=this.bundleURL(),_1d9=new CFURL("..",_1d8);
if(_1d9.absoluteString()===_1d8.absoluteString()){
_1d9=_1d9.schemeAndAuthority();
}
_1ac.resolveResourceAtURL(_1d9,YES,function(_1da){
var _1db=_1d8.absoluteURL().lastPathComponent();
self._staticResource=_1da._children[_1db]||new _1ac(_1d8,_1da,YES,NO);
function _1dc(_1dd){
self._loadStatus&=~_1b6;
var _1de=_1dd.request.responsePropertyList();
self._isValid=!!_1de||CFBundle.mainBundle()===self;
if(_1de){
self._infoDictionary=_1de;
}
if(!self._infoDictionary){
_1e0(self,new Error("Could not load bundle at \""+path+"\""));
return;
}
if(self===CFBundle.mainBundle()&&self.valueForInfoDictionaryKey("CPApplicationSize")){
_1be=self.valueForInfoDictionaryKey("CPApplicationSize").valueForKey("executable")||0;
}
_1e4(self,_1d7);
};
function _1df(){
self._isValid=CFBundle.mainBundle()===self;
self._loadStatus=_1b4;
_1e0(self,new Error("Could not load bundle at \""+self.bundleURL()+"\""));
};
new _b3(new CFURL("Info.plist",self.bundleURL()),_1dc,_1df);
});
};
function _1e0(_1e1,_1e2){
_1e3(_1e1._staticResource);
_1e1._eventDispatcher.dispatchEvent({type:"error",error:_1e2,bundle:_1e1});
};
function _1e4(_1e5,_1e6){
if(!_1e5.mostEligibleEnvironment()){
return _1e7();
}
_1e8(_1e5,_1e9,_1e7);
_1ea(_1e5,_1e9,_1e7);
if(_1e5._loadStatus===_1b5){
return _1e9();
}
function _1e7(_1eb){
var _1ec=_1e5._loadRequests,_1ed=_1ec.length;
while(_1ed--){
_1ec[_1ed].abort();
}
this._loadRequests=[];
_1e5._loadStatus=_1b4;
_1e0(_1e5,_1eb||new Error("Could not recognize executable code format in Bundle "+_1e5));
};
function _1e9(){
if((typeof CPApp==="undefined"||!CPApp||!CPApp._finishedLaunching)&&typeof OBJJ_PROGRESS_CALLBACK==="function"&&_1be){
OBJJ_PROGRESS_CALLBACK(MAX(MIN(1,_1bd/_1be),0),_1be,_1e5.bundlePath());
}
if(_1e5._loadStatus===_1b5){
_1e5._loadStatus=_1b9;
}else{
return;
}
_1e3(_1e5._staticResource);
function _1ee(){
_1e5._eventDispatcher.dispatchEvent({type:"load",bundle:_1e5});
};
if(_1e6){
_1ef(_1e5,_1ee);
}else{
_1ee();
}
};
};
function _1e8(_1f0,_1f1,_1f2){
var _1f3=_1f0.executableURL();
if(!_1f3){
return;
}
_1f0._loadStatus|=_1b7;
new _b3(_1f3,function(_1f4){
try{
_1bd+=_1f4.request.responseText().length;
_1f5(_1f0,_1f4.request.responseText(),_1f3);
_1f0._loadStatus&=~_1b7;
_1f1();
}
catch(anException){
_1f2(anException);
}
},_1f2);
};
function _1f6(_1f7){
return "mhtml:"+new CFURL("MHTMLTest.txt",_1f7.mostEligibleEnvironmentURL());
};
function _1f8(_1f9){
if(_1fa===_1fb){
return new CFURL("dataURLs.txt",_1f9.mostEligibleEnvironmentURL());
}
if(_1fa===_1fc||_1fa===_1fd){
return new CFURL("MHTMLPaths.txt",_1f9.mostEligibleEnvironmentURL());
}
return NULL;
};
function _1ea(_1fe,_1ff,_200){
if(!_1fe.hasSpritedImages()){
return;
}
_1fe._loadStatus|=_1b8;
if(!_201()){
return _202(_1f6(_1fe),function(){
_1ea(_1fe,_1ff,_200);
});
}
var _203=_1f8(_1fe);
if(!_203){
_1fe._loadStatus&=~_1b8;
return _1ff();
}
new _b3(_203,function(_204){
try{
_1bd+=_204.request.responseText().length;
_1f5(_1fe,_204.request.responseText(),_203);
_1fe._loadStatus&=~_1b8;
}
catch(anException){
_200(anException);
}
_1ff();
},_200);
};
var _205=[],_1fa=-1,_206=0,_1fb=1,_1fc=2,_1fd=3;
function _201(){
return _1fa!==-1;
};
function _202(_207,_208){
if(_201()){
return;
}
_205.push(_208);
if(_205.length>1){
return;
}
_205.push(function(){
var size=0,_209=CFBundle.mainBundle().valueForInfoDictionaryKey("CPApplicationSize");
if(!_209){
return;
}
switch(_1fa){
case _1fb:
size=_209.valueForKey("data");
break;
case _1fc:
case _1fd:
size=_209.valueForKey("mhtml");
break;
}
_1be+=size;
});
_20a([_1fb,"data:image/gif;base64,R0lGODlhAQABAIAAAMc9BQAAACH5BAAAAAAALAAAAAABAAEAAAICRAEAOw==",_1fc,_207+"!test",_1fd,_207+"?"+_1bc+"!test"]);
};
function _20b(){
var _20c=_205.length;
while(_20c--){
_205[_20c]();
}
};
function _20a(_20d){
if(!("Image" in _1)||_20d.length<2){
_1fa=_206;
_20b();
return;
}
var _20e=new Image();
_20e.onload=function(){
if(_20e.width===1&&_20e.height===1){
_1fa=_20d[0];
_20b();
}else{
_20e.onerror();
}
};
_20e.onerror=function(){
_20a(_20d.slice(2));
};
_20e.src=_20d[1];
};
function _1ef(_20f,_210){
var _211=[_20f._staticResource];
function _212(_213){
for(;_213<_211.length;++_213){
var _214=_211[_213];
if(_214.isNotFound()){
continue;
}
if(_214.isFile()){
var _215=new _32d(_214.URL());
if(_215.hasLoadedFileDependencies()){
_215.execute();
}else{
_215.loadFileDependencies(function(){
_212(_213);
});
return;
}
}else{
if(_214.URL().absoluteString()===_20f.resourcesDirectoryURL().absoluteString()){
continue;
}
var _216=_214.children();
for(var name in _216){
if(_7c.call(_216,name)){
_211.push(_216[name]);
}
}
}
}
_210();
};
_212(0);
};
var _217="@STATIC",_218="p",_219="u",_21a="c",_21b="t",_21c="I",_21d="i";
function _1f5(_21e,_21f,_220){
var _221=new _10b(_21f);
if(_221.magicNumber()!==_217){
throw new Error("Could not read static file: "+_220);
}
if(_221.version()!=="1.0"){
throw new Error("Could not read static file: "+_220);
}
var _222,_223=_21e.bundleURL(),file=NULL;
while(_222=_221.getMarker()){
var text=_221.getString();
if(_222===_218){
var _224=new CFURL(text,_223),_225=_1ac.resourceAtURL(new CFURL(".",_224),YES);
file=new _1ac(_224,_225,NO,YES);
}else{
if(_222===_219){
var URL=new CFURL(text,_223),_226=_221.getString();
if(_226.indexOf("mhtml:")===0){
_226="mhtml:"+new CFURL(_226.substr("mhtml:".length),_223);
if(_1fa===_1fd){
var _227=_226.indexOf("!"),_228=_226.substring(0,_227),_229=_226.substring(_227);
_226=_228+"?"+_1bc+_229;
}
}
CFURL.setMappedURLForURL(URL,new CFURL(_226));
var _225=_1ac.resourceAtURL(new CFURL(".",URL),YES);
new _1ac(URL,_225,NO,YES);
}else{
if(_222===_21b){
file.write(text);
}
}
}
}
};
CFBundle.prototype.addEventListener=function(_22a,_22b){
this._eventDispatcher.addEventListener(_22a,_22b);
};
CFBundle.prototype.removeEventListener=function(_22c,_22d){
this._eventDispatcher.removeEventListener(_22c,_22d);
};
CFBundle.prototype.onerror=function(_22e){
throw _22e.error;
};
CFBundle.prototype.bundlePath=function(){
return this._bundleURL.absoluteURL().path();
};
CFBundle.prototype.path=function(){
CPLog.warn("CFBundle.prototype.path is deprecated, use CFBundle.prototype.bundlePath instead.");
return this.bundlePath.apply(this,arguments);
};
CFBundle.prototype.pathForResource=function(_22f){
return this.resourceURL(_22f).absoluteString();
};
var _230={};
function _1ac(aURL,_231,_232,_233){
this._parent=_231;
this._eventDispatcher=new _77(this);
var name=aURL.absoluteURL().lastPathComponent()||aURL.schemeAndAuthority();
this._name=name;
this._URL=aURL;
this._isResolved=!!_233;
if(_232){
this._URL=this._URL.asDirectoryPathURL();
}
if(!_231){
_230[name]=this;
}
this._isDirectory=!!_232;
this._isNotFound=NO;
if(_231){
_231._children[name]=this;
}
if(_232){
this._children={};
}else{
this._contents="";
}
};
_1ac.rootResources=function(){
return _230;
};
_2.StaticResource=_1ac;
function _1e3(_234){
_234._isResolved=YES;
_234._eventDispatcher.dispatchEvent({type:"resolve",staticResource:_234});
};
_1ac.prototype.resolve=function(){
if(this.isDirectory()){
var _235=new CFBundle(this.URL());
_235.onerror=function(){
};
_235.load(NO);
}else{
var self=this;
function _236(_237){
self._contents=_237.request.responseText();
_1e3(self);
};
function _238(){
self._isNotFound=YES;
_1e3(self);
};
new _b3(this.URL(),_236,_238);
}
};
_1ac.prototype.name=function(){
return this._name;
};
_1ac.prototype.URL=function(){
return this._URL;
};
_1ac.prototype.contents=function(){
return this._contents;
};
_1ac.prototype.children=function(){
return this._children;
};
_1ac.prototype.parent=function(){
return this._parent;
};
_1ac.prototype.isResolved=function(){
return this._isResolved;
};
_1ac.prototype.write=function(_239){
this._contents+=_239;
};
function _23a(_23b){
var _23c=_23b.schemeAndAuthority(),_23d=_230[_23c];
if(!_23d){
_23d=new _1ac(new CFURL(_23c),NULL,YES,YES);
}
return _23d;
};
_1ac.resourceAtURL=function(aURL,_23e){
aURL=_1bf(aURL).absoluteURL();
var _23f=_23a(aURL),_240=aURL.pathComponents(),_97=0,_241=_240.length;
for(;_97<_241;++_97){
var name=_240[_97];
if(_7c.call(_23f._children,name)){
_23f=_23f._children[name];
}else{
if(_23e){
if(name!=="/"){
name="./"+name;
}
_23f=new _1ac(new CFURL(name,_23f.URL()),_23f,YES,YES);
}else{
throw new Error("Static Resource at "+aURL+" is not resolved (\""+name+"\")");
}
}
}
return _23f;
};
_1ac.prototype.resourceAtURL=function(aURL,_242){
return _1ac.resourceAtURL(new CFURL(aURL,this.URL()),_242);
};
_1ac.resolveResourceAtURL=function(aURL,_243,_244){
aURL=_1bf(aURL).absoluteURL();
_245(_23a(aURL),_243,aURL.pathComponents(),0,_244);
};
_1ac.prototype.resolveResourceAtURL=function(aURL,_246,_247){
_1ac.resolveResourceAtURL(new CFURL(aURL,this.URL()).absoluteURL(),_246,_247);
};
function _245(_248,_249,_24a,_24b,_24c){
var _24d=_24a.length;
for(;_24b<_24d;++_24b){
var name=_24a[_24b],_24e=_7c.call(_248._children,name)&&_248._children[name];
if(!_24e){
_24e=new _1ac(new CFURL(name,_248.URL()),_248,_24b+1<_24d||_249,NO);
_24e.resolve();
}
if(!_24e.isResolved()){
return _24e.addEventListener("resolve",function(){
_245(_248,_249,_24a,_24b,_24c);
});
}
if(_24e.isNotFound()){
return _24c(null,new Error("File not found: "+_24a.join("/")));
}
if((_24b+1<_24d)&&_24e.isFile()){
return _24c(null,new Error("File is not a directory: "+_24a.join("/")));
}
_248=_24e;
}
_24c(_248);
};
function _24f(aURL,_250,_251){
var _252=_1ac.includeURLs(),_253=new CFURL(aURL,_252[_250]).absoluteURL();
_1ac.resolveResourceAtURL(_253,NO,function(_254){
if(!_254){
if(_250+1<_252.length){
_24f(aURL,_250+1,_251);
}else{
_251(NULL);
}
return;
}
_251(_254);
});
};
_1ac.resolveResourceAtURLSearchingIncludeURLs=function(aURL,_255){
_24f(aURL,0,_255);
};
_1ac.prototype.addEventListener=function(_256,_257){
this._eventDispatcher.addEventListener(_256,_257);
};
_1ac.prototype.removeEventListener=function(_258,_259){
this._eventDispatcher.removeEventListener(_258,_259);
};
_1ac.prototype.isNotFound=function(){
return this._isNotFound;
};
_1ac.prototype.isFile=function(){
return !this._isDirectory;
};
_1ac.prototype.isDirectory=function(){
return this._isDirectory;
};
_1ac.prototype.toString=function(_25a){
if(this.isNotFound()){
return "<file not found: "+this.name()+">";
}
var _25b=this.name();
if(this.isDirectory()){
var _25c=this._children;
for(var name in _25c){
if(_25c.hasOwnProperty(name)){
var _25d=_25c[name];
if(_25a||!_25d.isNotFound()){
_25b+="\n\t"+_25c[name].toString(_25a).split("\n").join("\n\t");
}
}
}
}
return _25b;
};
var _25e=NULL;
_1ac.includeURLs=function(){
if(_25e!==NULL){
return _25e;
}
_25e=[];
if(!_1.OBJJ_INCLUDE_PATHS&&!_1.OBJJ_INCLUDE_URLS){
_25e=["Frameworks","Frameworks/Debug"];
}else{
_25e=(_1.OBJJ_INCLUDE_PATHS||[]).concat(_1.OBJJ_INCLUDE_URLS||[]);
}
var _25f=_25e.length;
while(_25f--){
_25e[_25f]=new CFURL(_25e[_25f]).asDirectoryPathURL();
}
return _25e;
};
var _260="accessors",_261="class",_262="end",_263="function",_264="implementation",_265="import",_266="each",_267="outlet",_268="action",_269="new",_26a="selector",_26b="super",_26c="var",_26d="in",_26e="pragma",_26f="mark",_270="=",_271="+",_272="-",_273=":",_274=",",_275=".",_276="*",_277=";",_278="<",_279="{",_27a="}",_27b=">",_27c="[",_27d="\"",_27e="@",_27f="#",_280="]",_281="?",_282="(",_283=")",_284=/^(?:(?:\s+$)|(?:\/(?:\/|\*)))/,_285=/^[+-]?\d+(([.]\d+)*([eE][+-]?\d+))?$/,_286=/^[a-zA-Z_$](\w|$)*$/;
function _287(_288){
this._index=-1;
this._tokens=(_288+"\n").match(/\/\/.*(\r|\n)?|\/\*(?:.|\n|\r)*?\*\/|\w+\b|[+-]?\d+(([.]\d+)*([eE][+-]?\d+))?|"[^"\\]*(\\[\s\S][^"\\]*)*"|'[^'\\]*(\\[\s\S][^'\\]*)*'|\s+|./g);
this._context=[];
return this;
};
_287.prototype.push=function(){
this._context.push(this._index);
};
_287.prototype.pop=function(){
this._index=this._context.pop();
};
_287.prototype.peek=function(_289){
if(_289){
this.push();
var _28a=this.skip_whitespace();
this.pop();
return _28a;
}
return this._tokens[this._index+1];
};
_287.prototype.next=function(){
return this._tokens[++this._index];
};
_287.prototype.previous=function(){
return this._tokens[--this._index];
};
_287.prototype.last=function(){
if(this._index<0){
return NULL;
}
return this._tokens[this._index-1];
};
_287.prototype.skip_whitespace=function(_28b){
var _28c;
if(_28b){
while((_28c=this.previous())&&_284.test(_28c)){
}
}else{
while((_28c=this.next())&&_284.test(_28c)){
}
}
return _28c;
};
_2.Lexer=_287;
function _28d(){
this.atoms=[];
};
_28d.prototype.toString=function(){
return this.atoms.join("");
};
_2.preprocess=function(_28e,aURL,_28f){
return new _290(_28e,aURL,_28f).executable();
};
_2.eval=function(_291){
return eval(_2.preprocess(_291).code());
};
var _290=function(_292,aURL,_293){
this._URL=new CFURL(aURL);
_292=_292.replace(/^#[^\n]+\n/,"\n");
this._currentSelector="";
this._currentClass="";
this._currentSuperClass="";
this._currentSuperMetaClass="";
this._buffer=new _28d();
this._preprocessed=NULL;
this._dependencies=[];
this._tokens=new _287(_292);
this._flags=_293;
this._classMethod=false;
this._executable=NULL;
this._classLookupTable={};
this._classVars={};
var _294=new objj_class();
for(var i in _294){
this._classVars[i]=1;
}
this.preprocess(this._tokens,this._buffer);
};
_290.prototype.setClassInfo=function(_295,_296,_297){
this._classLookupTable[_295]={superClassName:_296,ivars:_297};
};
_290.prototype.getClassInfo=function(_298){
return this._classLookupTable[_298];
};
_290.prototype.allIvarNamesForClassName=function(_299){
var _29a={},_29b=this.getClassInfo(_299);
while(_29b){
for(var i in _29b.ivars){
_29a[i]=1;
}
_29b=this.getClassInfo(_29b.superClassName);
}
return _29a;
};
_2.Preprocessor=_290;
_290.Flags={};
_290.Flags.IncludeDebugSymbols=1<<0;
_290.Flags.IncludeTypeSignatures=1<<1;
_290.prototype.executable=function(){
if(!this._executable){
this._executable=new _29c(this._buffer.toString(),this._dependencies,this._URL);
}
return this._executable;
};
_290.prototype.accessors=function(_29d){
var _29e=_29d.skip_whitespace(),_29f={};
if(_29e!=_282){
_29d.previous();
return _29f;
}
while((_29e=_29d.skip_whitespace())!=_283){
var name=_29e,_2a0=true;
if(!/^\w+$/.test(name)){
throw new SyntaxError(this.error_message("*** @accessors attribute name not valid."));
}
if((_29e=_29d.skip_whitespace())==_270){
_2a0=_29d.skip_whitespace();
if(!/^\w+$/.test(_2a0)){
throw new SyntaxError(this.error_message("*** @accessors attribute value not valid."));
}
if(name=="setter"){
if((_29e=_29d.next())!=_273){
throw new SyntaxError(this.error_message("*** @accessors setter attribute requires argument with \":\" at end of selector name."));
}
_2a0+=":";
}
_29e=_29d.skip_whitespace();
}
_29f[name]=_2a0;
if(_29e==_283){
break;
}
if(_29e!=_274){
throw new SyntaxError(this.error_message("*** Expected ',' or ')' in @accessors attribute list."));
}
}
return _29f;
};
_290.prototype.brackets=function(_2a1,_2a2){
var _2a3=[];
while(this.preprocess(_2a1,NULL,NULL,NULL,_2a3[_2a3.length]=[])){
}
if(_2a3[0].length===1){
_2a2.atoms[_2a2.atoms.length]="[";
_2a2.atoms[_2a2.atoms.length]=_2a3[0][0];
_2a2.atoms[_2a2.atoms.length]="]";
}else{
var _2a4=new _28d();
if(_2a3[0][0].atoms[0]==_26b){
_2a2.atoms[_2a2.atoms.length]="objj_msgSendSuper(";
_2a2.atoms[_2a2.atoms.length]="{ receiver:self, super_class:"+(this._classMethod?this._currentSuperMetaClass:this._currentSuperClass)+" }";
}else{
_2a2.atoms[_2a2.atoms.length]="objj_msgSend(";
_2a2.atoms[_2a2.atoms.length]=_2a3[0][0];
}
_2a4.atoms[_2a4.atoms.length]=_2a3[0][1];
var _2a5=1,_2a6=_2a3.length,_2a7=new _28d();
for(;_2a5<_2a6;++_2a5){
var pair=_2a3[_2a5];
_2a4.atoms[_2a4.atoms.length]=pair[1];
_2a7.atoms[_2a7.atoms.length]=", "+pair[0];
}
_2a2.atoms[_2a2.atoms.length]=", \"";
_2a2.atoms[_2a2.atoms.length]=_2a4;
_2a2.atoms[_2a2.atoms.length]="\"";
_2a2.atoms[_2a2.atoms.length]=_2a7;
_2a2.atoms[_2a2.atoms.length]=")";
}
};
_290.prototype.directive=function(_2a8,_2a9,_2aa){
var _2ab=_2a9?_2a9:new _28d(),_2ac=_2a8.next();
if(_2ac.charAt(0)==_27d){
_2ab.atoms[_2ab.atoms.length]=_2ac;
}else{
if(_2ac===_261){
_2a8.skip_whitespace();
return;
}else{
if(_2ac===_264){
this.implementation(_2a8,_2ab);
}else{
if(_2ac===_265){
this._import(_2a8);
}else{
if(_2ac===_26a){
this.selector(_2a8,_2ab);
}
}
}
}
}
if(!_2a9){
return _2ab;
}
};
_290.prototype.hash=function(_2ad,_2ae){
var _2af=_2ae?_2ae:new _28d(),_2b0=_2ad.next();
if(_2b0===_26e){
_2b0=_2ad.skip_whitespace();
if(_2b0===_26f){
while((_2b0=_2ad.next()).indexOf("\n")<0){
}
}
}else{
throw new SyntaxError(this.error_message("*** Expected \"pragma\" to follow # but instead saw \""+_2b0+"\"."));
}
};
_290.prototype.implementation=function(_2b1,_2b2){
var _2b3=_2b2,_2b4="",_2b5=NO,_2b6=_2b1.skip_whitespace(),_2b7="Nil",_2b8=new _28d(),_2b9=new _28d();
if(!(/^\w/).test(_2b6)){
throw new Error(this.error_message("*** Expected class name, found \""+_2b6+"\"."));
}
this._currentSuperClass="objj_getClass(\""+_2b6+"\").super_class";
this._currentSuperMetaClass="objj_getMetaClass(\""+_2b6+"\").super_class";
this._currentClass=_2b6;
this._currentSelector="";
if((_2b4=_2b1.skip_whitespace())==_282){
_2b4=_2b1.skip_whitespace();
if(_2b4==_283){
throw new SyntaxError(this.error_message("*** Can't Have Empty Category Name for class \""+_2b6+"\"."));
}
if(_2b1.skip_whitespace()!=_283){
throw new SyntaxError(this.error_message("*** Improper Category Definition for class \""+_2b6+"\"."));
}
_2b3.atoms[_2b3.atoms.length]="{\nvar the_class = objj_getClass(\""+_2b6+"\")\n";
_2b3.atoms[_2b3.atoms.length]="if(!the_class) throw new SyntaxError(\"*** Could not find definition for class \\\""+_2b6+"\\\"\");\n";
_2b3.atoms[_2b3.atoms.length]="var meta_class = the_class.isa;";
}else{
if(_2b4==_273){
_2b4=_2b1.skip_whitespace();
if(!_286.test(_2b4)){
throw new SyntaxError(this.error_message("*** Expected class name, found \""+_2b4+"\"."));
}
_2b7=_2b4;
_2b4=_2b1.skip_whitespace();
}
_2b3.atoms[_2b3.atoms.length]="{var the_class = objj_allocateClassPair("+_2b7+", \""+_2b6+"\"),\nmeta_class = the_class.isa;";
if(_2b4==_279){
var _2ba={},_2bb=0,_2bc=[],_2bd,_2be={},_2bf=[];
while((_2b4=_2b1.skip_whitespace())&&_2b4!=_27a){
if(_2b4===_27e){
_2b4=_2b1.next();
if(_2b4===_260){
_2bd=this.accessors(_2b1);
}else{
if(_2b4!==_267){
throw new SyntaxError(this.error_message("*** Unexpected '@' token in ivar declaration ('@"+_2b4+"')."));
}else{
_2bf.push("@"+_2b4);
}
}
}else{
if(_2b4==_277){
if(_2bb++===0){
_2b3.atoms[_2b3.atoms.length]="class_addIvars(the_class, [";
}else{
_2b3.atoms[_2b3.atoms.length]=", ";
}
var name=_2bc[_2bc.length-1];
if(this._flags&_290.Flags.IncludeTypeSignatures){
_2b3.atoms[_2b3.atoms.length]="new objj_ivar(\""+name+"\", \""+_2bf.slice(0,_2bf.length-1).join(" ")+"\")";
}else{
_2b3.atoms[_2b3.atoms.length]="new objj_ivar(\""+name+"\")";
}
_2ba[name]=1;
_2bc=[];
_2bf=[];
if(_2bd){
_2be[name]=_2bd;
_2bd=NULL;
}
}else{
_2bc.push(_2b4);
_2bf.push(_2b4);
}
}
}
if(_2bc.length){
throw new SyntaxError(this.error_message("*** Expected ';' in ivar declaration, found '}'."));
}
if(_2bb){
_2b3.atoms[_2b3.atoms.length]="]);\n";
}
if(!_2b4){
throw new SyntaxError(this.error_message("*** Expected '}'"));
}
this.setClassInfo(_2b6,_2b7==="Nil"?null:_2b7,_2ba);
var _2ba=this.allIvarNamesForClassName(_2b6);
for(ivar_name in _2be){
var _2c0=_2be[ivar_name],_2c1=_2c0["property"]||ivar_name;
var _2c2=_2c0["getter"]||_2c1,_2c3="(id)"+_2c2+"\n{\nreturn "+ivar_name+";\n}";
if(_2b8.atoms.length!==0){
_2b8.atoms[_2b8.atoms.length]=",\n";
}
_2b8.atoms[_2b8.atoms.length]=this.method(new _287(_2c3),_2ba);
if(_2c0["readonly"]){
continue;
}
var _2c4=_2c0["setter"];
if(!_2c4){
var _2c5=_2c1.charAt(0)=="_"?1:0;
_2c4=(_2c5?"_":"")+"set"+_2c1.substr(_2c5,1).toUpperCase()+_2c1.substring(_2c5+1)+":";
}
var _2c6="(void)"+_2c4+"(id)newValue\n{\n";
if(_2c0["copy"]){
_2c6+="if ("+ivar_name+" !== newValue)\n"+ivar_name+" = [newValue copy];\n}";
}else{
_2c6+=ivar_name+" = newValue;\n}";
}
if(_2b8.atoms.length!==0){
_2b8.atoms[_2b8.atoms.length]=",\n";
}
_2b8.atoms[_2b8.atoms.length]=this.method(new _287(_2c6),_2ba);
}
}else{
_2b1.previous();
}
_2b3.atoms[_2b3.atoms.length]="objj_registerClassPair(the_class);\n";
}
if(!_2ba){
var _2ba=this.allIvarNamesForClassName(_2b6);
}
while((_2b4=_2b1.skip_whitespace())){
if(_2b4==_271){
this._classMethod=true;
if(_2b9.atoms.length!==0){
_2b9.atoms[_2b9.atoms.length]=", ";
}
_2b9.atoms[_2b9.atoms.length]=this.method(_2b1,this._classVars);
}else{
if(_2b4==_272){
this._classMethod=false;
if(_2b8.atoms.length!==0){
_2b8.atoms[_2b8.atoms.length]=", ";
}
_2b8.atoms[_2b8.atoms.length]=this.method(_2b1,_2ba);
}else{
if(_2b4==_27f){
this.hash(_2b1,_2b3);
}else{
if(_2b4==_27e){
if((_2b4=_2b1.next())==_262){
break;
}else{
throw new SyntaxError(this.error_message("*** Expected \"@end\", found \"@"+_2b4+"\"."));
}
}
}
}
}
}
if(_2b8.atoms.length!==0){
_2b3.atoms[_2b3.atoms.length]="class_addMethods(the_class, [";
_2b3.atoms[_2b3.atoms.length]=_2b8;
_2b3.atoms[_2b3.atoms.length]="]);\n";
}
if(_2b9.atoms.length!==0){
_2b3.atoms[_2b3.atoms.length]="class_addMethods(meta_class, [";
_2b3.atoms[_2b3.atoms.length]=_2b9;
_2b3.atoms[_2b3.atoms.length]="]);\n";
}
_2b3.atoms[_2b3.atoms.length]="}";
this._currentClass="";
};
_290.prototype._import=function(_2c7){
var _2c8="",_2c9=_2c7.skip_whitespace(),_2ca=(_2c9!==_278);
if(_2c9===_278){
while((_2c9=_2c7.next())&&_2c9!==_27b){
_2c8+=_2c9;
}
if(!_2c9){
throw new SyntaxError(this.error_message("*** Unterminated import statement."));
}
}else{
if(_2c9.charAt(0)===_27d){
_2c8=_2c9.substr(1,_2c9.length-2);
}else{
throw new SyntaxError(this.error_message("*** Expecting '<' or '\"', found \""+_2c9+"\"."));
}
}
this._buffer.atoms[this._buffer.atoms.length]="objj_executeFile(\"";
this._buffer.atoms[this._buffer.atoms.length]=_2c8;
this._buffer.atoms[this._buffer.atoms.length]=_2ca?"\", YES);":"\", NO);";
this._dependencies.push(new _2cb(new CFURL(_2c8),_2ca));
};
_290.prototype.method=function(_2cc,_2cd){
var _2ce=new _28d(),_2cf,_2d0="",_2d1=[],_2d2=[null];
_2cd=_2cd||{};
while((_2cf=_2cc.skip_whitespace())&&_2cf!==_279&&_2cf!==_277){
if(_2cf==_273){
var type="";
_2d0+=_2cf;
_2cf=_2cc.skip_whitespace();
if(_2cf==_282){
while((_2cf=_2cc.skip_whitespace())&&_2cf!=_283){
type+=_2cf;
}
_2cf=_2cc.skip_whitespace();
}
_2d2[_2d1.length+1]=type||null;
_2d1[_2d1.length]=_2cf;
if(_2cf in _2cd){
CPLog.warn(this.error_message("*** Warning: Method ( "+_2d0+" ) uses a parameter name that is already in use ( "+_2cf+" )"));
}
}else{
if(_2cf==_282){
var type="";
while((_2cf=_2cc.skip_whitespace())&&_2cf!=_283){
type+=_2cf;
}
_2d2[0]=type||null;
}else{
if(_2cf==_274){
if((_2cf=_2cc.skip_whitespace())!=_275||_2cc.next()!=_275||_2cc.next()!=_275){
throw new SyntaxError(this.error_message("*** Argument list expected after ','."));
}
}else{
_2d0+=_2cf;
}
}
}
}
if(_2cf===_277){
_2cf=_2cc.skip_whitespace();
if(_2cf!==_279){
throw new SyntaxError(this.error_message("Invalid semi-colon in method declaration. "+"Semi-colons are allowed only to terminate the method signature, before the open brace."));
}
}
var _2d3=0,_2d4=_2d1.length;
_2ce.atoms[_2ce.atoms.length]="new objj_method(sel_getUid(\"";
_2ce.atoms[_2ce.atoms.length]=_2d0;
_2ce.atoms[_2ce.atoms.length]="\"), function";
this._currentSelector=_2d0;
if(this._flags&_290.Flags.IncludeDebugSymbols){
_2ce.atoms[_2ce.atoms.length]=" $"+this._currentClass+"__"+_2d0.replace(/:/g,"_");
}
_2ce.atoms[_2ce.atoms.length]="(self, _cmd";
for(;_2d3<_2d4;++_2d3){
_2ce.atoms[_2ce.atoms.length]=", ";
_2ce.atoms[_2ce.atoms.length]=_2d1[_2d3];
}
_2ce.atoms[_2ce.atoms.length]=")\n{ with(self)\n{";
_2ce.atoms[_2ce.atoms.length]=this.preprocess(_2cc,NULL,_27a,_279);
_2ce.atoms[_2ce.atoms.length]="}\n}";
if(this._flags&_290.Flags.IncludeDebugSymbols){
_2ce.atoms[_2ce.atoms.length]=","+JSON.stringify(_2d2);
}
_2ce.atoms[_2ce.atoms.length]=")";
this._currentSelector="";
return _2ce;
};
_290.prototype.preprocess=function(_2d5,_2d6,_2d7,_2d8,_2d9){
var _2da=_2d6?_2d6:new _28d(),_2db=0,_2dc="";
if(_2d9){
_2d9[0]=_2da;
var _2dd=false,_2de=[0,0,0];
}
while((_2dc=_2d5.next())&&((_2dc!==_2d7)||_2db)){
if(_2d9){
if(_2dc===_281){
++_2de[2];
}else{
if(_2dc===_279){
++_2de[0];
}else{
if(_2dc===_27a){
--_2de[0];
}else{
if(_2dc===_282){
++_2de[1];
}else{
if(_2dc===_283){
--_2de[1];
}else{
if((_2dc===_273&&_2de[2]--===0||(_2dd=(_2dc===_280)))&&_2de[0]===0&&_2de[1]===0){
_2d5.push();
var _2df=_2dd?_2d5.skip_whitespace(true):_2d5.previous(),_2e0=_284.test(_2df);
if(_2e0||_286.test(_2df)&&_284.test(_2d5.previous())){
_2d5.push();
var last=_2d5.skip_whitespace(true),_2e1=true,_2e2=false;
if(last==="+"||last==="-"){
if(_2d5.previous()!==last){
_2e1=false;
}else{
last=_2d5.skip_whitespace(true);
_2e2=true;
}
}
_2d5.pop();
_2d5.pop();
if(_2e1&&((!_2e2&&(last===_27a))||last===_283||last===_280||last===_275||_285.test(last)||last.charAt(last.length-1)==="\""||last.charAt(last.length-1)==="'"||_286.test(last)&&!/^(new|return|case|var)$/.test(last))){
if(_2e0){
_2d9[1]=":";
}else{
_2d9[1]=_2df;
if(!_2dd){
_2d9[1]+=":";
}
var _2db=_2da.atoms.length;
while(_2da.atoms[_2db--]!==_2df){
}
_2da.atoms.length=_2db;
}
return !_2dd;
}
if(_2dd){
return NO;
}
}
_2d5.pop();
if(_2dd){
return NO;
}
}
}
}
}
}
}
_2de[2]=MAX(_2de[2],0);
}
if(_2d8){
if(_2dc===_2d8){
++_2db;
}else{
if(_2dc===_2d7){
--_2db;
}
}
}
if(_2dc===_263){
var _2e3="";
while((_2dc=_2d5.next())&&_2dc!==_282&&!(/^\w/).test(_2dc)){
_2e3+=_2dc;
}
if(_2dc===_282){
if(_2d8===_282){
++_2db;
}
_2da.atoms[_2da.atoms.length]="function"+_2e3+"(";
if(_2d9){
++_2de[1];
}
}else{
_2da.atoms[_2da.atoms.length]=_2dc+" = function";
}
}else{
if(_2dc==_27e){
this.directive(_2d5,_2da);
}else{
if(_2dc==_27f){
this.hash(_2d5,_2da);
}else{
if(_2dc==_27c){
this.brackets(_2d5,_2da);
}else{
_2da.atoms[_2da.atoms.length]=_2dc;
}
}
}
}
}
if(_2d9){
throw new SyntaxError(this.error_message("*** Expected ']' - Unterminated message send or array."));
}
if(!_2d6){
return _2da;
}
};
_290.prototype.selector=function(_2e4,_2e5){
var _2e6=_2e5?_2e5:new _28d();
_2e6.atoms[_2e6.atoms.length]="sel_getUid(\"";
if(_2e4.skip_whitespace()!=_282){
throw new SyntaxError(this.error_message("*** Expected '('"));
}
var _2e7=_2e4.skip_whitespace();
if(_2e7==_283){
throw new SyntaxError(this.error_message("*** Unexpected ')', can't have empty @selector()"));
}
_2e5.atoms[_2e5.atoms.length]=_2e7;
var _2e8,_2e9=true;
while((_2e8=_2e4.next())&&_2e8!=_283){
if(_2e9&&/^\d+$/.test(_2e8)||!(/^(\w|$|\:)/.test(_2e8))){
if(!(/\S/).test(_2e8)){
if(_2e4.skip_whitespace()==_283){
break;
}else{
throw new SyntaxError(this.error_message("*** Unexpected whitespace in @selector()."));
}
}else{
throw new SyntaxError(this.error_message("*** Illegal character '"+_2e8+"' in @selector()."));
}
}
_2e6.atoms[_2e6.atoms.length]=_2e8;
_2e9=(_2e8==_273);
}
_2e6.atoms[_2e6.atoms.length]="\")";
if(!_2e5){
return _2e6;
}
};
_290.prototype.error_message=function(_2ea){
return _2ea+" <Context File: "+this._URL+(this._currentClass?" Class: "+this._currentClass:"")+(this._currentSelector?" Method: "+this._currentSelector:"")+">";
};
function _2cb(aURL,_2eb){
this._URL=aURL;
this._isLocal=_2eb;
};
_2.FileDependency=_2cb;
_2cb.prototype.URL=function(){
return this._URL;
};
_2cb.prototype.isLocal=function(){
return this._isLocal;
};
_2cb.prototype.toMarkedString=function(){
var _2ec=this.URL().absoluteString();
return (this.isLocal()?_21d:_21c)+";"+_2ec.length+";"+_2ec;
};
_2cb.prototype.toString=function(){
return (this.isLocal()?"LOCAL: ":"STD: ")+this.URL();
};
var _2ed=0,_2ee=1,_2ef=2,_2f0=0;
function _29c(_2f1,_2f2,aURL,_2f3){
if(arguments.length===0){
return this;
}
this._code=_2f1;
this._function=_2f3||NULL;
this._URL=_1bf(aURL||new CFURL("(Anonymous"+(_2f0++)+")"));
this._fileDependencies=_2f2;
if(_2f2.length){
this._fileDependencyStatus=_2ed;
this._fileDependencyCallbacks=[];
}else{
this._fileDependencyStatus=_2ef;
}
if(this._function){
return;
}
this.setCode(_2f1);
};
_2.Executable=_29c;
_29c.prototype.path=function(){
return this.URL().path();
};
_29c.prototype.URL=function(){
return this._URL;
};
_29c.prototype.functionParameters=function(){
var _2f4=["global","objj_executeFile","objj_importFile"];
return _2f4;
};
_29c.prototype.functionArguments=function(){
var _2f5=[_1,this.fileExecuter(),this.fileImporter()];
return _2f5;
};
_29c.prototype.execute=function(){
var _2f6=_2f7;
_2f7=CFBundle.bundleContainingURL(this.URL());
var _2f8=this._function.apply(_1,this.functionArguments());
_2f7=_2f6;
return _2f8;
};
_29c.prototype.code=function(){
return this._code;
};
_29c.prototype.setCode=function(code){
this._code=code;
var _2f9=this.functionParameters().join(",");
this._function=new Function(_2f9,code);
};
_29c.prototype.fileDependencies=function(){
return this._fileDependencies;
};
_29c.prototype.hasLoadedFileDependencies=function(){
return this._fileDependencyStatus===_2ef;
};
var _2fa=0,_2fb=[],_2fc={};
_29c.prototype.loadFileDependencies=function(_2fd){
var _2fe=this._fileDependencyStatus;
if(_2fd){
if(_2fe===_2ef){
return _2fd();
}
this._fileDependencyCallbacks.push(_2fd);
}
if(_2fe===_2ed){
if(_2fa){
throw "Can't load";
}
_2ff(this);
}
};
function _2ff(_300){
_2fb.push(_300);
_300._fileDependencyStatus=_2ee;
var _301=_300.fileDependencies(),_97=0,_302=_301.length,_303=_300.referenceURL(),_304=_303.absoluteString(),_305=_300.fileExecutableSearcher();
_2fa+=_302;
for(;_97<_302;++_97){
var _306=_301[_97],_307=_306.isLocal(),URL=_306.URL(),_308=(_307&&(_304+" ")||"")+URL;
if(_2fc[_308]){
if(--_2fa===0){
_309();
}
continue;
}
_2fc[_308]=YES;
_305(URL,_307,_30a);
}
};
function _30a(_30b){
--_2fa;
if(_30b._fileDependencyStatus===_2ed){
_2ff(_30b);
}else{
if(_2fa===0){
_309();
}
}
};
function _309(){
var _30c=_2fb,_97=0,_30d=_30c.length;
_2fb=[];
for(;_97<_30d;++_97){
_30c[_97]._fileDependencyStatus=_2ef;
}
for(_97=0;_97<_30d;++_97){
var _30e=_30c[_97],_30f=_30e._fileDependencyCallbacks,_310=0,_311=_30f.length;
for(;_310<_311;++_310){
_30f[_310]();
}
_30e._fileDependencyCallbacks=[];
}
};
_29c.prototype.referenceURL=function(){
if(this._referenceURL===_29){
this._referenceURL=new CFURL(".",this.URL());
}
return this._referenceURL;
};
_29c.prototype.fileImporter=function(){
return _29c.fileImporterForURL(this.referenceURL());
};
_29c.prototype.fileExecuter=function(){
return _29c.fileExecuterForURL(this.referenceURL());
};
_29c.prototype.fileExecutableSearcher=function(){
return _29c.fileExecutableSearcherForURL(this.referenceURL());
};
var _312={};
_29c.fileExecuterForURL=function(aURL){
var _313=_1bf(aURL),_314=_313.absoluteString(),_315=_312[_314];
if(!_315){
_315=function(aURL,_316,_317){
_29c.fileExecutableSearcherForURL(_313)(aURL,_316,function(_318){
if(!_318.hasLoadedFileDependencies()){
throw "No executable loaded for file at URL "+aURL;
}
_318.execute(_317);
});
};
_312[_314]=_315;
}
return _315;
};
var _319={};
_29c.fileImporterForURL=function(aURL){
var _31a=_1bf(aURL),_31b=_31a.absoluteString(),_31c=_319[_31b];
if(!_31c){
_31c=function(aURL,_31d,_31e){
_15c();
_29c.fileExecutableSearcherForURL(_31a)(aURL,_31d,function(_31f){
_31f.loadFileDependencies(function(){
_31f.execute();
_15d();
if(_31e){
_31e();
}
});
});
};
_319[_31b]=_31c;
}
return _31c;
};
var _320={},_321={};
_29c.fileExecutableSearcherForURL=function(_322){
var _323=_322.absoluteString(),_324=_320[_323],_325={};
if(!_324){
_324=function(aURL,_326,_327){
var _328=(_326&&_322||"")+aURL,_329=_321[_328];
if(_329){
return _32a(_329);
}
var _32b=(aURL instanceof CFURL)&&aURL.scheme();
if(_326||_32b){
if(!_32b){
aURL=new CFURL(aURL,_322);
}
_1ac.resolveResourceAtURL(aURL,NO,_32a);
}else{
_1ac.resolveResourceAtURLSearchingIncludeURLs(aURL,_32a);
}
function _32a(_32c){
if(!_32c){
throw new Error("Could not load file at "+aURL);
}
_321[_328]=_32c;
_327(new _32d(_32c.URL()));
};
};
_320[_323]=_324;
}
return _324;
};
var _32e={};
function _32d(aURL){
aURL=_1bf(aURL);
var _32f=aURL.absoluteString(),_330=_32e[_32f];
if(_330){
return _330;
}
_32e[_32f]=this;
var _331=_1ac.resourceAtURL(aURL).contents(),_332=NULL,_333=aURL.pathExtension();
if(_331.match(/^@STATIC;/)){
_332=_334(_331,aURL);
}else{
if(_333==="j"||!_333){
_332=_2.preprocess(_331,aURL,_290.Flags.IncludeDebugSymbols);
}else{
_332=new _29c(_331,[],aURL);
}
}
_29c.apply(this,[_332.code(),_332.fileDependencies(),aURL,_332._function]);
this._hasExecuted=NO;
};
_2.FileExecutable=_32d;
_32d.prototype=new _29c();
_32d.prototype.execute=function(_335){
if(this._hasExecuted&&!_335){
return;
}
this._hasExecuted=YES;
_29c.prototype.execute.call(this);
};
_32d.prototype.hasExecuted=function(){
return this._hasExecuted;
};
function _334(_336,aURL){
var _337=new _10b(_336);
var _338=NULL,code="",_339=[];
while(_338=_337.getMarker()){
var text=_337.getString();
if(_338===_21b){
code+=text;
}else{
if(_338===_21c){
_339.push(new _2cb(new CFURL(text),NO));
}else{
if(_338===_21d){
_339.push(new _2cb(new CFURL(text),YES));
}
}
}
}
var fn=_32d._lookupCachedFunction(aURL);
if(fn){
return new _29c(code,_339,aURL,fn);
}
return new _29c(code,_339,aURL);
};
var _33a={};
_32d._cacheFunction=function(aURL,fn){
aURL=typeof aURL==="string"?aURL:aURL.absoluteString();
_33a[aURL]=fn;
};
_32d._lookupCachedFunction=function(aURL){
aURL=typeof aURL==="string"?aURL:aURL.absoluteString();
return _33a[aURL];
};
var _33b=1,_33c=2,_33d=4,_33e=8;
objj_ivar=function(_33f,_340){
this.name=_33f;
this.type=_340;
};
objj_method=function(_341,_342,_343){
this.name=_341;
this.method_imp=_342;
this.types=_343;
};
objj_class=function(_344){
this.isa=NULL;
this.version=0;
this.super_class=NULL;
this.sub_classes=[];
this.name=NULL;
this.info=0;
this.ivar_list=[];
this.ivar_store=function(){
};
this.ivar_dtable=this.ivar_store.prototype;
this.method_list=[];
this.method_store=function(){
};
this.method_dtable=this.method_store.prototype;
this.allocator=function(){
};
this._UID=-1;
};
objj_object=function(){
this.isa=NULL;
this._UID=-1;
};
class_getName=function(_345){
if(_345==Nil){
return "";
}
return _345.name;
};
class_isMetaClass=function(_346){
if(!_346){
return NO;
}
return ((_346.info&(_33c)));
};
class_getSuperclass=function(_347){
if(_347==Nil){
return Nil;
}
return _347.super_class;
};
class_setSuperclass=function(_348,_349){
_348.super_class=_349;
_348.isa.super_class=_349.isa;
};
class_addIvar=function(_34a,_34b,_34c){
var _34d=_34a.allocator.prototype;
if(typeof _34d[_34b]!="undefined"){
return NO;
}
var ivar=new objj_ivar(_34b,_34c);
_34a.ivar_list.push(ivar);
_34a.ivar_dtable[_34b]=ivar;
_34d[_34b]=NULL;
return YES;
};
class_addIvars=function(_34e,_34f){
var _350=0,_351=_34f.length,_352=_34e.allocator.prototype;
for(;_350<_351;++_350){
var ivar=_34f[_350],name=ivar.name;
if(typeof _352[name]==="undefined"){
_34e.ivar_list.push(ivar);
_34e.ivar_dtable[name]=ivar;
_352[name]=NULL;
}
}
};
class_copyIvarList=function(_353){
return _353.ivar_list.slice(0);
};
class_addMethod=function(_354,_355,_356,_357){
var _358=new objj_method(_355,_356,_357);
_354.method_list.push(_358);
_354.method_dtable[_355]=_358;
if(!((_354.info&(_33c)))&&(((_354.info&(_33c)))?_354:_354.isa).isa===(((_354.info&(_33c)))?_354:_354.isa)){
class_addMethod((((_354.info&(_33c)))?_354:_354.isa),_355,_356,_357);
}
return YES;
};
class_addMethods=function(_359,_35a){
var _35b=0,_35c=_35a.length,_35d=_359.method_list,_35e=_359.method_dtable;
for(;_35b<_35c;++_35b){
var _35f=_35a[_35b];
_35d.push(_35f);
_35e[_35f.name]=_35f;
}
if(!((_359.info&(_33c)))&&(((_359.info&(_33c)))?_359:_359.isa).isa===(((_359.info&(_33c)))?_359:_359.isa)){
class_addMethods((((_359.info&(_33c)))?_359:_359.isa),_35a);
}
};
class_getInstanceMethod=function(_360,_361){
if(!_360||!_361){
return NULL;
}
var _362=_360.method_dtable[_361];
return _362?_362:NULL;
};
class_getInstanceVariable=function(_363,_364){
if(!_363||!_364){
return NULL;
}
var _365=_363.ivar_dtable[_364];
return _365;
};
class_getClassMethod=function(_366,_367){
if(!_366||!_367){
return NULL;
}
var _368=(((_366.info&(_33c)))?_366:_366.isa).method_dtable[_367];
return _368?_368:NULL;
};
class_respondsToSelector=function(_369,_36a){
return class_getClassMethod(_369,_36a)!=NULL;
};
class_copyMethodList=function(_36b){
return _36b.method_list.slice(0);
};
class_getVersion=function(_36c){
return _36c.version;
};
class_setVersion=function(_36d,_36e){
_36d.version=parseInt(_36e,10);
};
class_replaceMethod=function(_36f,_370,_371){
if(!_36f||!_370){
return NULL;
}
var _372=_36f.method_dtable[_370],_373=NULL;
if(_372){
_373=_372.method_imp;
}
_372.method_imp=_371;
return _373;
};
var _374=function(_375){
var meta=(((_375.info&(_33c)))?_375:_375.isa);
if((_375.info&(_33c))){
_375=objj_getClass(_375.name);
}
if(_375.super_class&&!((((_375.super_class.info&(_33c)))?_375.super_class:_375.super_class.isa).info&(_33d))){
_374(_375.super_class);
}
if(!(meta.info&(_33d))&&!(meta.info&(_33e))){
meta.info=(meta.info|(_33e))&~(0);
objj_msgSend(_375,"initialize");
meta.info=(meta.info|(_33d))&~(_33e);
}
};
var _376=function(self,_377){
var isa=self.isa,_378=isa.method_dtable[_379];
if(_378){
var _37a=_378.method_imp.call(this,self,_379,_377);
if(_37a&&_37a!==self){
arguments[0]=_37a;
return objj_msgSend.apply(this,arguments);
}
}
_378=isa.method_dtable[_37b];
if(_378){
var _37c=isa.method_dtable[_37d];
if(_37c){
var _37e=_378.method_imp.call(this,self,_37b,_377);
if(_37e){
var _37f=objj_lookUpClass("CPInvocation");
if(_37f){
var _380=objj_msgSend(_37f,_381,_37e),_97=0,_382=arguments.length;
for(;_97<_382;++_97){
objj_msgSend(_380,_383,arguments[_97],_97);
}
_37c.method_imp.call(this,self,_37d,_380);
return objj_msgSend(_380,_384);
}
}
}
}
_378=isa.method_dtable[_385];
if(_378){
return _378.method_imp.call(this,self,_385,_377);
}
throw class_getName(isa)+" does not implement doesNotRecognizeSelector:. Did you forget a superclass for "+class_getName(isa)+"?";
};
class_getMethodImplementation=function(_386,_387){
if(!((((_386.info&(_33c)))?_386:_386.isa).info&(_33d))){
_374(_386);
}
var _388=_386.method_dtable[_387];
var _389=_388?_388.method_imp:_376;
return _389;
};
var _38a={};
objj_allocateClassPair=function(_38b,_38c){
var _38d=new objj_class(_38c),_38e=new objj_class(_38c),_38f=_38d;
if(_38b){
_38f=_38b;
while(_38f.superclass){
_38f=_38f.superclass;
}
_38d.allocator.prototype=new _38b.allocator;
_38d.ivar_dtable=_38d.ivar_store.prototype=new _38b.ivar_store;
_38d.method_dtable=_38d.method_store.prototype=new _38b.method_store;
_38e.method_dtable=_38e.method_store.prototype=new _38b.isa.method_store;
_38d.super_class=_38b;
_38e.super_class=_38b.isa;
}else{
_38d.allocator.prototype=new objj_object();
}
_38d.isa=_38e;
_38d.name=_38c;
_38d.info=_33b;
_38d._UID=objj_generateObjectUID();
_38e.isa=_38f.isa;
_38e.name=_38c;
_38e.info=_33c;
_38e._UID=objj_generateObjectUID();
return _38d;
};
var _2f7=nil;
objj_registerClassPair=function(_390){
_1[_390.name]=_390;
_38a[_390.name]=_390;
_1c6(_390,_2f7);
};
class_createInstance=function(_391){
if(!_391){
throw new Error("*** Attempting to create object with Nil class.");
}
var _392=new _391.allocator();
_392.isa=_391;
_392._UID=objj_generateObjectUID();
return _392;
};
var _393=function(){
};
_393.prototype.member=false;
with(new _393()){
member=true;
}
if(new _393().member){
var _394=class_createInstance;
class_createInstance=function(_395){
var _396=_394(_395);
if(_396){
var _397=_396.isa,_398=_397;
while(_397){
var _399=_397.ivar_list,_39a=_399.length;
while(_39a--){
_396[_399[_39a].name]=NULL;
}
_397=_397.super_class;
}
_396.isa=_398;
}
return _396;
};
}
object_getClassName=function(_39b){
if(!_39b){
return "";
}
var _39c=_39b.isa;
return _39c?class_getName(_39c):"";
};
objj_lookUpClass=function(_39d){
var _39e=_38a[_39d];
return _39e?_39e:Nil;
};
objj_getClass=function(_39f){
var _3a0=_38a[_39f];
if(!_3a0){
}
return _3a0?_3a0:Nil;
};
objj_getMetaClass=function(_3a1){
var _3a2=objj_getClass(_3a1);
return (((_3a2.info&(_33c)))?_3a2:_3a2.isa);
};
ivar_getName=function(_3a3){
return _3a3.name;
};
ivar_getTypeEncoding=function(_3a4){
return _3a4.type;
};
objj_msgSend=function(_3a5,_3a6){
if(_3a5==nil){
return nil;
}
var isa=_3a5.isa;
if(!((((isa.info&(_33c)))?isa:isa.isa).info&(_33d))){
_374(isa);
}
var _3a7=isa.method_dtable[_3a6];
var _3a8=_3a7?_3a7.method_imp:_376;
switch(arguments.length){
case 2:
return _3a8(_3a5,_3a6);
case 3:
return _3a8(_3a5,_3a6,arguments[2]);
case 4:
return _3a8(_3a5,_3a6,arguments[2],arguments[3]);
}
return _3a8.apply(_3a5,arguments);
};
objj_msgSendSuper=function(_3a9,_3aa){
var _3ab=_3a9.super_class;
arguments[0]=_3a9.receiver;
if(!((((_3ab.info&(_33c)))?_3ab:_3ab.isa).info&(_33d))){
_374(_3ab);
}
var _3ac=_3ab.method_dtable[_3aa];
var _3ad=_3ac?_3ac.method_imp:_376;
return _3ad.apply(_3a9.receiver,arguments);
};
method_getName=function(_3ae){
return _3ae.name;
};
method_getImplementation=function(_3af){
return _3af.method_imp;
};
method_setImplementation=function(_3b0,_3b1){
var _3b2=_3b0.method_imp;
_3b0.method_imp=_3b1;
return _3b2;
};
method_exchangeImplementations=function(lhs,rhs){
var _3b3=method_getImplementation(lhs),_3b4=method_getImplementation(rhs);
method_setImplementation(lhs,_3b4);
method_setImplementation(rhs,_3b3);
};
sel_getName=function(_3b5){
return _3b5?_3b5:"<null selector>";
};
sel_getUid=function(_3b6){
return _3b6;
};
sel_isEqual=function(lhs,rhs){
return lhs===rhs;
};
sel_registerName=function(_3b7){
return _3b7;
};
objj_class.prototype.toString=objj_object.prototype.toString=function(){
var isa=this.isa;
if(class_getInstanceMethod(isa,_3b8)){
return objj_msgSend(this,_3b8);
}
if(class_isMetaClass(isa)){
return this.name;
}
return "["+isa.name+" Object](-description not implemented)";
};
var _3b8=sel_getUid("description"),_379=sel_getUid("forwardingTargetForSelector:"),_37b=sel_getUid("methodSignatureForSelector:"),_37d=sel_getUid("forwardInvocation:"),_385=sel_getUid("doesNotRecognizeSelector:"),_381=sel_getUid("invocationWithMethodSignature:"),_3b9=sel_getUid("setTarget:"),_3ba=sel_getUid("setSelector:"),_383=sel_getUid("setArgument:atIndex:"),_384=sel_getUid("returnValue");
objj_eval=function(_3bb){
var url=_2.pageURL;
var _3bc=_2.asyncLoader;
_2.asyncLoader=NO;
var _3bd=_2.preprocess(_3bb,url,0);
if(!_3bd.hasLoadedFileDependencies()){
_3bd.loadFileDependencies();
}
_1._objj_eval_scope={};
_1._objj_eval_scope.objj_executeFile=_29c.fileExecuterForURL(url);
_1._objj_eval_scope.objj_importFile=_29c.fileImporterForURL(url);
var code="with(_objj_eval_scope){"+_3bd._code+"\n//*/\n}";
var _3be;
_3be=eval(code);
_2.asyncLoader=_3bc;
return _3be;
};
_2.objj_eval=objj_eval;
_15c();
var _3bf=new CFURL(window.location.href),_3c0=document.getElementsByTagName("base"),_3c1=_3c0.length;
if(_3c1>0){
var _3c2=_3c0[_3c1-1],_3c3=_3c2&&_3c2.getAttribute("href");
if(_3c3){
_3bf=new CFURL(_3c3,_3bf);
}
}
var _3c4=new CFURL(window.OBJJ_MAIN_FILE||"main.j"),_1c5=new CFURL(".",new CFURL(_3c4,_3bf)).absoluteURL(),_3c5=new CFURL("..",_1c5).absoluteURL();
if(_1c5===_3c5){
_3c5=new CFURL(_3c5.schemeAndAuthority());
}
_1ac.resourceAtURL(_3c5,YES);
_2.pageURL=_3bf;
_2.bootstrap=function(){
_3c6();
};
function _3c6(){
_1ac.resolveResourceAtURL(_1c5,YES,function(_3c7){
var _3c8=_1ac.includeURLs(),_97=0,_3c9=_3c8.length;
for(;_97<_3c9;++_97){
_3c7.resourceAtURL(_3c8[_97],YES);
}
_29c.fileImporterForURL(_1c5)(_3c4.lastPathComponent(),YES,function(){
_15d();
_3cf(function(){
var _3ca=window.location.hash.substring(1),args=[];
if(_3ca.length){
args=_3ca.split("/");
for(var i=0,_3c9=args.length;i<_3c9;i++){
args[i]=decodeURIComponent(args[i]);
}
}
var _3cb=window.location.search.substring(1).split("&"),_3cc=new CFMutableDictionary();
for(var i=0,_3c9=_3cb.length;i<_3c9;i++){
var _3cd=_3cb[i].split("=");
if(!_3cd[0]){
continue;
}
if(_3cd[1]==null){
_3cd[1]=true;
}
_3cc.setValueForKey(decodeURIComponent(_3cd[0]),decodeURIComponent(_3cd[1]));
}
main(args,_3cc);
});
});
});
};
var _3ce=NO;
function _3cf(_3d0){
if(_3ce){
return _3d0();
}
if(window.addEventListener){
window.addEventListener("load",_3d0,NO);
}else{
if(window.attachEvent){
window.attachEvent("onload",_3d0);
}
}
};
_3cf(function(){
_3ce=YES;
});
if(typeof OBJJ_AUTO_BOOTSTRAP==="undefined"||OBJJ_AUTO_BOOTSTRAP){
_2.bootstrap();
}
function _1bf(aURL){
if(aURL instanceof CFURL&&aURL.scheme()){
return aURL;
}
return new CFURL(aURL,_1c5);
};
objj_importFile=_29c.fileImporterForURL(_1c5);
objj_executeFile=_29c.fileExecuterForURL(_1c5);
objj_import=function(){
CPLog.warn("objj_import is deprecated, use objj_importFile instead");
objj_importFile.apply(this,arguments);
};
})(window,ObjectiveJ);
