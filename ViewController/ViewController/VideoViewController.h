//
//  VideoViewController.h
//  ViewController
//
//  Created by Ios8dian on 2017/9/22.
//  Copyright © 2017年 ping222s. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <AVFoundation/AVFoundation.h>

extern NSString *kVideoReadyNotification;

@interface VideoViewController : NSViewController{
    AVPlayer *player;
}

@property (readonly) BOOL videoIsReady;
@property (readonly) BOOL playingForward;

- (void)start:(BOOL)start;

@end
