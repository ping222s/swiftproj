//
//  VideoViewController.m
//  ViewController
//
//  Created by Ios8dian on 2017/9/22.
//  Copyright © 2017年 ping222s. All rights reserved.
//

#import "VideoViewController.h"

NSString *kVideoReadyNotification = @"videoReadyNotification";

@interface VideoViewController ()

@end

@implementation VideoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do view setup here.
}

// -------------------------------------------------------------------------------
//	awakeFromNib
//
//	Load the movie from out bundle and set it to play back and forth.
// -------------------------------------------------------------------------------
- (void)awakeFromNib
{
    NSString *moviePathStr = [[NSBundle mainBundle] pathForResource:@"adam" ofType:@"mov"];
    
    player = [[AVPlayer alloc] init];
    
    NSArray *keys = @[@"duration"];
    AVURLAsset *file = [AVURLAsset assetWithURL:[NSURL fileURLWithPath:moviePathStr isDirectory:NO]];
    [file loadValuesAsynchronouslyForKeys:keys completionHandler:^(void) {
        
        // The asset invokes its completion handler on an arbitrary queue when loading is complete.
        // Because we want to access our AVPlayer in our ensuing set-up,
        // we must dispatch our handler to the main queue.
        //
        dispatch_async(dispatch_get_main_queue(), ^(void) {
            
            // create an AVPlayerLayer and add it to the player view if there is video,
            // but hide it until it's ready for display
            //
            AVPlayerLayer *newPlayerLayer = [AVPlayerLayer playerLayerWithPlayer:player];
            [newPlayerLayer setFrame:[[self.view layer] bounds]];
            [newPlayerLayer setAutoresizingMask:kCALayerWidthSizable | kCALayerHeightSizable];
            [[self.view layer] addSublayer:newPlayerLayer];
            
            // create a new AVPlayerItem and make it our player's current item
            AVPlayerItem *playerItem = [AVPlayerItem playerItemWithAsset:file];
            [player replaceCurrentItemWithPlayerItem:playerItem];
            
            _videoIsReady = YES;
            [[NSNotificationCenter defaultCenter] postNotificationName:kVideoReadyNotification object:nil];
            
            // play the video with a palindrome effect
            _playingForward = YES;
            [[NSNotificationCenter defaultCenter] addObserverForName:AVPlayerItemDidPlayToEndTimeNotification
                                                              object:playerItem
                                                               queue:nil
                                                          usingBlock:^(NSNotification *note)
             {
                 if (self.playingForward)
                 {
                     [player seekToTime:CMTimeMultiplyByFloat64(playerItem.duration, 0.99f)];
                     [player play];
                     player.rate = -1;
                     _playingForward = NO;
                 }
                 else
                 {
                     [player seekToTime:kCMTimeZero];
                     [player play];
                     player.rate = 1;
                     _playingForward = YES;
                 }
             }];
        });
    }];
}

- (void)start:(BOOL)start
{
    if (start)
        [player play];
    else
        [player pause];
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:AVPlayerItemDidPlayToEndTimeNotification
                                                  object:nil];
}


- (void)viewWillDisappear{
    NSLog(@"viewWillDisappear");
}

- (void)viewDidDisappear{
    [super viewDidDisappear];
    NSLog(@"viewDidDisappear");
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:AVPlayerItemDidPlayToEndTimeNotification
                                                  object:nil];
}

@end
