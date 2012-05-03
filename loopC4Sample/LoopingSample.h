//
//  LoopingSample.h
//  loopC4Sample
//
//  Created by Travis Kirton on 12-05-03.
//  Copyright (c) 2012 POSTFL. All rights reserved.
//

#import "C4Sample.h"

@interface LoopingSample : C4Sample
-(void)startLoop;
-(void)stopLoop;
@property (readwrite, nonatomic) CGFloat loopStartTime, loopDuration;
@end
