@STATIC;1.0;t;181;
var OS=require("os");
exports.fontinfo=function(_1,_2){
var p=OS.popen(["fontinfo","-n",_1,_2||12]);
if(p.wait()===0){
return JSON.parse(p.stdout.read());
}else{
return null;
}
};
