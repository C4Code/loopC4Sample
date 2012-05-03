//
//  LoopingSample.m
//  loopC4Sample
//
//  Created by Travis Kirton on 12-05-03.
//  Copyright (c) 2012 POSTFL. All rights reserved.
//

#import "LoopingSample.h"

@interface LoopingSample ()
-(void)goToStartTimeAndBeginLoop;
@property (readwrite, strong) NSTimer *loopTimer;
@property (readwrite, strong) NSDate *pauseDate, *prevFireDate;
@property (readwrite, getter = isPaused) BOOL paused;
@end

@implementation LoopingSample

@synthesize loopDuration, loopStartTime, loopTimer, pauseDate, prevFireDate, paused;

-(void)startLoop {
    [self stopLoop];
    self.loopTimer = [NSTimer timerWithTimeInterval:self.loopDuration target:self selector:@selector(goToStartTimeAndBeginLoop) userInfo:nil repeats:YES];
    [[NSRunLoop mainRunLoop] addTimer:self.loopTimer forMode:NSDefaultRunLoopMode];
    [loopTimer fire];
}

-(void)stopLoop {
    if([self.loopTimer isValid]) {
        [self.loopTimer invalidate];
    }
}

-(void)pause {
    if (!self.isPaused) {
        [super pause];
        if([self.loopTimer isValid]) {
            self.paused = YES;
            pauseDate = [NSDate dateWithTimeIntervalSinceNow:0];
            prevFireDate = [loopTimer fireDate];
            loopTimer.fireDate = [NSDate distantFuture];
        }
    }
}

-(void)play {
    [super play];
    if(self.isPaused && [self.loopTimer isValid]) {
        [self.loopTimer setFireDate:[self.prevFireDate initWithTimeInterval:-1*[pauseDate timeIntervalSinceNow] 
                                                             sinceDate:self.prevFireDate]];
    }
    self.paused = NO;
}

-(void)stop {
    [super stop];
    [self stopLoop];
    self.paused = NO;
}
          
-(void)goToStartTimeAndBeginLoop {
    self.currentTime = self.loopStartTime;
    if(!self.isPlaying) [self play];
    C4Log(@"loopStartedAt:%4.2f",self.loopStartTime);
}
@end
