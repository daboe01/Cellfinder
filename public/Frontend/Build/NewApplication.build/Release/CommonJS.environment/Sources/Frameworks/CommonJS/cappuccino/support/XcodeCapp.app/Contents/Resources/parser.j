@STATIC;1.0;I;23;Foundation/Foundation.jt;9247;
objj_executeFile("Foundation/Foundation.j",NO);
var _1=require("file");
main=function(_2){
var _3=new CFURL(_2[1]),_4=new CFURL(_2[2]),_5=_1.read(_3,{charset:"UTF-8"}),_6=ObjectiveJ.Preprocessor.Flags.IncludeDebugSymbols|ObjectiveJ.Preprocessor.Flags.IncludeTypeSignatures,_7={};
_5=ObjectiveJ.preprocess(_5,_3,_6).code();
_5=_5.replace(/objj_allocateClassPair\([a-zA-Z_$](\w|$)*/g,function(_8){
var _9=_8.substr("objj_allocateClassPair(".length);
return "objj_allocateClassPair(\""+_9+"\", CPObject";
});
var _a=objj_allocateClassPair;
objj_allocateClassPair=function(_b){
_7[arguments[2]]=_b;
return _a(arguments[1],arguments[2]);
};
var _c=[],_d=objj_registerClassPair;
objj_registerClassPair=function(_e){
_e.actual_super_class;
_d(_e);
_c.push(_e);
};
objj_executeFile=function(){
};
eval(_5);
var _f="";
_c.forEach(function(_10){
var _11=[];
class_copyIvarList(_10).forEach(function(_12){
var _13=ivar_getTypeEncoding(_12).split(" ");
if(_13.indexOf("IBOutlet")!==CPNotFound||_13.indexOf("@outlet")!==CPNotFound){
_13.forEach(function(_14,_15){
if(_14==="@outlet"){
_13[_15]="IBOutlet";
}else{
if(_14!=="IBOutlet"){
_13[_15]=NSCompatibleClassName(_14,YES);
}
}
});
_11.push("    "+_13.join(" ")+" "+ivar_getName(_12)+";");
}
});
var _16=[];
class_copyMethodList(_10).forEach(function(_17){
var _18=_17.types,_19=_18[0];
if(_19==="IBAction"||_19==="@action"){
_16.push("- (IBAction)"+method_getName(_17)+"("+NSCompatibleClassName(_18[1]||"id",YES)+")aSender;");
}
});
var _1a=class_getName(_10),_1b=_7[_1a];
_f+="\n@interface "+class_getName(_10)+(_1b==="Nil"?"":(" : "+NSCompatibleClassName(_1b)))+"\n{\n"+_11.join("\n")+"\n}\n"+_16.join("\n")+"\n@end";
});
if(_f.length){
_1.write(_4,_f,{charset:"UTF-8"});
}
};
NSCompatibleClassName=function(_1c,_1d){
if(_1c==="var"||_1c==="id"){
return "id";
}
var _1e=_1c.substr(0,2),_1f=_1d?"*":"";
if(_1e!=="CP"){
return _1c+_1f;
}
var _20="NS"+_1c.substr(2);
if(_21[_20]){
return _20+_1f;
}
return _1c+_1f;
};
var _21={"NSAffineTransform":YES,"NSAppleEventDescriptor":YES,"NSAppleEventManager":YES,"NSAppleScript":YES,"NSArchiver":YES,"NSArray":YES,"NSAssertionHandler":YES,"NSAttributedString":YES,"NSAutoreleasePool":YES,"NSBlockOperation":YES,"NSBundle":YES,"NSCache":YES,"NSCachedURLResponse":YES,"NSCalendar":YES,"NSCharacterSet":YES,"NSClassDescription":YES,"NSCloneCommand":YES,"NSCloseCommand":YES,"NSCoder":YES,"NSComparisonPredicate":YES,"NSCompoundPredicate":YES,"NSCondition":YES,"NSConditionLock":YES,"NSConnection":YES,"NSCountCommand":YES,"NSCountedSet":YES,"NSCreateCommand":YES,"NSData":YES,"NSDate":YES,"NSDateComponents":YES,"NSDateFormatter":YES,"NSDecimalNumber":YES,"NSDecimalNumberHandler":YES,"NSDeleteCommand":YES,"NSDeserializer":YES,"NSDictionary":YES,"NSDirectoryEnumerator":YES,"NSDistantObject":YES,"NSDistantObjectRequest":YES,"NSDistributedLock":YES,"NSDistributedNotificationCenter":YES,"NSEnumerator":YES,"NSError":YES,"NSException":YES,"NSExistsCommand":YES,"NSExpression":YES,"NSFileHandle":YES,"NSFileManager":YES,"NSFileWrapper":YES,"NSFormatter":YES,"NSGarbageCollector":YES,"NSGetCommand":YES,"NSHashTable":YES,"NSHost":YES,"NSHTTPCookie":YES,"NSHTTPCookieStorage":YES,"NSHTTPURLResponse":YES,"NSIndexPath":YES,"NSIndexSet":YES,"NSIndexSpecifier":YES,"NSInputStream":YES,"NSInvocation":YES,"NSInvocationOperation":YES,"NSKeyedArchiver":YES,"NSKeyedUnarchiver":YES,"NSLocale":YES,"NSLock":YES,"NSLogicalTest":YES,"NSMachBootstrapServer":YES,"NSMachPort":YES,"NSMapTable":YES,"NSMessagePort":YES,"NSMessagePortNameServer":YES,"NSMetadataItem":YES,"NSMetadataQuery":YES,"NSMetadataQueryAttributeValueTuple":YES,"NSMetadataQueryResultGroup":YES,"NSMethodSignature":YES,"NSMiddleSpecifier":YES,"NSMoveCommand":YES,"NSMutableArray":YES,"NSMutableAttributedString":YES,"NSMutableCharacterSet":YES,"NSMutableData":YES,"NSMutableDictionary":YES,"NSMutableIndexSet":YES,"NSMutableSet":YES,"NSMutableString":YES,"NSMutableURLRequest":YES,"NSNameSpecifier":YES,"NSNetService":YES,"NSNetServiceBrowser":YES,"NSNotification":YES,"NSNotificationCenter":YES,"NSNotificationQueue":YES,"NSNull":YES,"NSNumber":YES,"NSNumberFormatter":YES,"NSObject":YES,"NSOperation":YES,"NSOperationQueue":YES,"NSOrthography":YES,"NSOutputStream":YES,"NSPipe":YES,"NSPointerArray":YES,"NSPointerFunctions":YES,"NSPort":YES,"NSPortCoder":YES,"NSPortMessage":YES,"NSPortNameServer":YES,"NSPositionalSpecifier":YES,"NSPredicate":YES,"NSProcessInfo":YES,"NSPropertyListSerialization":YES,"NSPropertySpecifier":YES,"NSProtocolChecker":YES,"NSProxy":YES,"NSPurgeableData":YES,"NSQuitCommand":YES,"NSRandomSpecifier":YES,"NSRangeSpecifier":YES,"NSRecursiveLock":YES,"NSRelativeSpecifier":YES,"NSRunLoop":YES,"NSScanner":YES,"NSScriptClassDescription":YES,"NSScriptCoercionHandler":YES,"NSScriptCommand":YES,"NSScriptCommandDescription":YES,"NSScriptExecutionContext":YES,"NSScriptObjectSpecifier":YES,"NSScriptSuiteRegistry":YES,"NSScriptWhoseTest":YES,"NSSerializer":YES,"NSSet":YES,"NSSetCommand":YES,"NSSocketPort":YES,"NSSocketPortNameServer":YES,"NSSortDescriptor":YES,"NSSpecifierTest":YES,"NSSpellServer":YES,"NSStream":YES,"NSString":YES,"NSTask":YES,"NSTextCheckingResult":YES,"NSThread":YES,"NSTimer":YES,"NSTimeZone":YES,"NSUnarchiver":YES,"NSUndoManager":YES,"NSUniqueIDSpecifier":YES,"NSURL":YES,"NSURLAuthenticationChallenge":YES,"NSURLCache":YES,"NSURLConnection":YES,"NSURLCredential":YES,"NSURLCredentialStorage":YES,"NSURLDownload":YES,"NSURLHandle":YES,"NSURLProtectionSpace":YES,"NSURLProtocol":YES,"NSURLRequest":YES,"NSURLResponse":YES,"NSUserDefaults":YES,"NSValue":YES,"NSValueTransformer":YES,"NSWhoseSpecifier":YES,"NSXMLDocument":YES,"NSXMLDTD":YES,"NSXMLDTDNode":YES,"NSXMLElement":YES,"NSXMLNode":YES,"NSXMLParser":YES,"NSActionCell":YES,"NSAffineTransform Additions":YES,"NSAlert":YES,"NSAnimation":YES,"NSAnimationContext":YES,"NSAppleScript Additions":YES,"NSApplication":YES,"NSArrayController":YES,"NSATSTypesetter":YES,"NSAttributedString Application Kit Additions":YES,"NSBezierPath":YES,"NSBitmapImageRep":YES,"NSBox":YES,"NSBrowser":YES,"NSBrowserCell":YES,"NSBundle Additions":YES,"NSButton":YES,"NSButtonCell":YES,"NSCachedImageRep":YES,"NSCell":YES,"NSCIImageRep":YES,"NSClipView":YES,"NSCoder Application Kit Additions":YES,"NSCollectionView":YES,"NSCollectionViewItem":YES,"NSColor":YES,"NSColorList":YES,"NSColorPanel":YES,"NSColorPicker":YES,"NSColorSpace":YES,"NSColorWell":YES,"NSComboBox":YES,"NSComboBoxCell":YES,"NSControl":YES,"NSController":YES,"NSCursor":YES,"NSCustomImageRep":YES,"NSDatePicker":YES,"NSDatePickerCell":YES,"NSDictionaryController":YES,"NSDockTile":YES,"NSDocument":YES,"NSDocumentController":YES,"NSDrawer":YES,"NSEPSImageRep":YES,"NSEvent":YES,"NSFileWrapper":YES,"NSFont":YES,"NSFontDescriptor":YES,"NSFontManager":YES,"NSFontPanel":YES,"NSForm":YES,"NSFormCell":YES,"NSGlyphGenerator":YES,"NSGlyphInfo":YES,"NSGradient":YES,"NSGraphicsContext":YES,"NSHelpManager":YES,"NSImage":YES,"NSImageCell":YES,"NSImageRep":YES,"NSImageView":YES,"NSLayoutManager":YES,"NSLevelIndicator":YES,"NSLevelIndicatorCell":YES,"NSMatrix":YES,"NSMenu":YES,"NSMenuItem":YES,"NSMenuItemCell":YES,"NSMenuView":YES,"NSMutableAttributedString Additions":YES,"NSMutableParagraphStyle":YES,"NSNib":YES,"NSNibConnector":YES,"NSNibControlConnector":YES,"NSNibOutletConnector":YES,"NSObjectController":YES,"NSOpenGLContext":YES,"NSOpenGLLayer":YES,"NSOpenGLPixelBuffer":YES,"NSOpenGLPixelFormat":YES,"NSOpenGLView":YES,"NSOpenPanel":YES,"NSOutlineView":YES,"NSPageLayout":YES,"NSPanel":YES,"NSParagraphStyle":YES,"NSPasteboard":YES,"NSPasteboardItem":YES,"NSPathCell":YES,"NSPathComponentCell":YES,"NSPathControl":YES,"NSPDFImageRep":YES,"NSPersistentDocument":YES,"NSPICTImageRep":YES,"NSPopUpButton":YES,"NSPopUpButtonCell":YES,"NSPredicateEditor":YES,"NSPredicateEditorRowTemplate":YES,"NSPrinter":YES,"NSPrintInfo":YES,"NSPrintOperation":YES,"NSPrintPanel":YES,"NSProgressIndicator":YES,"NSResponder":YES,"NSRuleEditor":YES,"NSRulerMarker":YES,"NSRulerView":YES,"NSRunningApplication":YES,"NSSavePanel":YES,"NSScreen":YES,"NSScroller":YES,"NSScrollView":YES,"NSSearchField":YES,"NSSearchFieldCell":YES,"NSSecureTextField":YES,"NSSecureTextFieldCell":YES,"NSSegmentedCell":YES,"NSSegmentedControl":YES,"NSShadow":YES,"NSSlider":YES,"NSSliderCell":YES,"NSSound":YES,"NSSpeechRecognizer":YES,"NSSpeechSynthesizer":YES,"NSSpellChecker":YES,"NSSplitView":YES,"NSStatusBar":YES,"NSStatusItem":YES,"NSStepper":YES,"NSStepperCell":YES,"NSString Application Kit Additions":YES,"NSTableColumn":YES,"NSTableHeaderCell":YES,"NSTableHeaderView":YES,"NSTableView":YES,"NSTabView":YES,"NSTabViewItem":YES,"NSText":YES,"NSTextAttachment":YES,"NSTextAttachmentCell":YES,"NSTextBlock":YES,"NSTextContainer":YES,"NSTextField":YES,"NSTextFieldCell":YES,"NSTextInputContext":YES,"NSTextList":YES,"NSTextStorage":YES,"NSTextTab":YES,"NSTextTable":YES,"NSTextTableBlock":YES,"NSTextView":YES,"NSTokenField":YES,"NSTokenFieldCell":YES,"NSToolbar":YES,"NSToolbarItem":YES,"NSToolbarItemGroup":YES,"NSTouch":YES,"NSTrackingArea":YES,"NSTreeController":YES,"NSTreeNode":YES,"NSTypesetter":YES,"NSURL Additions":YES,"NSUserDefaultsController":YES,"NSView":YES,"NSViewAnimation":YES,"NSViewController":YES,"NSWindow":YES,"NSWindowController":YES,"NSWorkspace":YES,"NSPopover":YES};
