//
//  MoveAroundBy.m
//  Proto
//
//  Created by Rooney Jung on 10. 4. 10..
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "MoveAroundBy.h"

@implementation MoveAroundBy

+ (id)actionWithDuration:(ccTime)t anchor:(CGPoint)p angle:(float)a {
	return [[[self alloc] initWithDuration:t anchor:p angle:a] autorelease];
}

- (id)initWithDuration:(ccTime)t anchor:(CGPoint)p angle:(float)a {
	if ((self = [super initWithDuration:t])) {
		anchorPosition = p;
		angle = a;
	}
	return self;
}

- (id)copyWithZone:(NSZone *)zone {
	return [[[self class] allocWithZone:zone] initWithDuration:duration anchor:anchorPosition angle:angle];
}

- (void)startWithTarget:(id)aTarget {
	[super startWithTarget:aTarget];
	CGPoint position = [target position];
	startPosition.x = position.x - anchorPosition.x;
	startPosition.y = position.y - anchorPosition.y;
}

- (void)update: (ccTime)t {	
	float a = angle * t;
	float q = a * M_PI / 180;
	float cosq = cos(q);
	float sinq = sin(q);
	float x = anchorPosition.x - (startPosition.x * cosq - startPosition.y * sinq);
	float y = anchorPosition.y + (startPosition.x * sinq + startPosition.y * cosq);
	[target setRotation:a];
	[target setPosition:ccp(x, y)];
}

- (CCIntervalAction *)reverse {
	return [[self class] actionWithDuration:duration anchor:anchorPosition angle:-angle];
}

@end
