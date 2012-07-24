/*
 * AppController.j
 * NewApplication
 *
 * Created by You on November 16, 2011.
 * Copyright 2011, Your Company All rights reserved.
 *
 * <!> fixme
 * nothing to declare currently...
 *
 */

@import <Foundation/CPObject.j>
@import <Renaissance/Renaissance.j>
@import "StacksController.j"

@implementation ImageEditorCollectionItem: SimpleImageViewCollectionItem

- (void)imageDidLoad:(CPImage)image
{
	[_imgv bind:"value" toObject: _representedObject withKeyPath: "analysis.results" options:nil];
	[_imgv bind:"backgroundImage" toObject: self withKeyPath: "_img" options:nil];

	var myframe=[_imgv frame];
	var size=[image size];
	[_imgv setFrame: CPMakeRect(myframe.origin.x,myframe.origin.y, size.width, size.height)];

}
-(void) setSize:(insigned) someSize
{	[super setSize: someSize];
	[_imgv setScale: someSize];
}

- _createContentView
{	return [AnnotatedImageView new];
}

@end


/////////////////////////////////////////////////////////


@implementation Stacks2Controller: StacksController

-(CPString) _ressourceName
{	return "stacks2.gsmarkup";
}
@end
