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
	[_imgv bind:"scale" toObject: self withKeyPath: "size" options:nil];
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
{	var o= [AnnotatedImageView new];
	[o setDelegate: self];
	[o setStyleFlags: [o styleFlags] | AIVStyleNumbers ];
	return o;
}

-(void) annotatedImageView: someView dot: someDot movedToPoint: newPoint
{	var cv=[self collectionView];
	var items=[cv items];
	var i,j=[items count];
	var dotIndex=[someView indexOfDot: [someDot data]];
	for(i=0;i<j;i++)
	{	var o=items[i];
		var aiv=[[o view] contentView];
		if(someView !== aiv)
		{	var dots=[aiv objectValue];
alert(dotIndex +" "+ [dots count])
			if(dotIndex > [dots count]-1)		//  add point, that is not yet present in other view
			{	var mydot=[[DotView alloc] initWithCentroid: newPoint];
				var obV=[self addToModelPoint: [mydot objectValue]];	// register newly created point with backend
				[aiv addToModelPoint: [mydot objectValue]]
			}
		}
	}
}

@end


/////////////////////////////////////////////////////////


@implementation Stacks2Controller: StacksController

-(CPString) _ressourceName
{	return "stacks2.gsmarkup";
}

@end
