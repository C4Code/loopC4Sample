//
//  C4WorkSpace.m
//  loopC4Sample
//
//  Created by Travis Kirton on 12-05-03.
//  Copyright (c) 2012 POSTFL. All rights reserved.
//

#import "C4WorkSpace.h"
#import "LoopingSample.h"

@implementation C4WorkSpace {
    LoopingSample *ls; 
}

-(void)setup {
    ls = [[LoopingSample alloc] initWithSampleName:@"loop1.wav"];
    [ls prepareToPlay];
    ls.loopStartTime = 2.0;
    ls.loopDuration = 2.0f;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    if(!ls.isPlaying) {
        [ls play];
    }
    [ls startLoop];
}
@end