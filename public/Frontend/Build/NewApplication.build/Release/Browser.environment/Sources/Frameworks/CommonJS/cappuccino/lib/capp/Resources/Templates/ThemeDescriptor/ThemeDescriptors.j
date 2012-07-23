@STATIC;1.0;I;28;BlendKit/BKThemeDescriptor.jt;929;
objj_executeFile("BlendKit/BKThemeDescriptor.j",NO);
var _1=objj_allocateClassPair(Nil,"__project"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_2,[new objj_method(sel_getUid("themeName"),function(_3,_4){
with(_3){
return "__project.name__";
}
}),new objj_method(sel_getUid("themedButton"),function(_5,_6){
with(_5){
var _7=objj_msgSend(objj_msgSend(CPButton,"alloc"),"initWithFrame:",CGRectMake(0,0,100,20));
objj_msgSend(_7,"setValue:forThemeAttribute:",objj_msgSend(CPColor,"blueColor"),"bezel-color");
objj_msgSend(_7,"setValue:forThemeAttribute:inState:",objj_msgSend(CPColor,"greenColor"),"bezel-color",CPThemeStateHighlighted);
objj_msgSend(_7,"setValue:forThemeAttribute:",objj_msgSend(CPColor,"redColor"),"text-color");
objj_msgSend(_7,"setValue:forThemeAttribute:inState:",objj_msgSend(CPColor,"yellowColor"),"text-color",CPThemeStateHighlighted);
objj_msgSend(_7,"setTitle:","Yikes!");
return _7;
}
})]);
