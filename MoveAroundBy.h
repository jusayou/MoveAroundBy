//
//  MoveAroundBy.h
//  Proto
//
//  Created by Rooney Jung on 10. 4. 10..
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "cocos2d.h"

@interface MoveAroundBy : CCIntervalAction <NSCopying> {
	float angle;
	CGPoint anchorPosition;
	CGPoint startPosition;
}

+ (id)actionWithDuration:(ccTime)duration anchor:(CGPoint)anchorPoint angle:(float)deltaAngle;

- (id)initWithDuration:(ccTime)duration anchor:(CGPoint)anchorPoint angle:(float)deltaAngle;

@end
