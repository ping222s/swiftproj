//
//  ViewController.m
//  ViewController
//
//  Created by Ios8dian on 2017/9/22.
//  Copyright © 2017年 ping222s. All rights reserved.
//

#import "ViewController.h"
#import "Masonry.h"

@implementation ViewController

enum // popup tag choices
{
    kImageView = 0,
    kTableView,
    kVideoView,
};

NSString *const kViewTitle		= @"ImageViewController";
NSString *const kTableTitle		= @"TableViewController";
NSString *const kVideoTitle		= @"VideoViewController";

- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view.
    
    [self changeViewController:kImageView];
}


- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}

- (void)videoReady:(NSNotification *)notif
{
    // we have been notified by CustomVideoViewController that the video is ready to play
    [self.videoViewController start:YES];
}

- (void)changeViewController:(NSInteger)whichViewTag
{
    
    [_myCurrentViewController.view removeFromSuperview];
    
    if ([self.myCurrentViewController view] != nil)
    {
        [[self.myCurrentViewController view] removeFromSuperview];	// remove the current view

        if ([self.myCurrentViewController isKindOfClass:[VideoViewController class]])
        {
            // stop playing the video
            [(VideoViewController *)self.myCurrentViewController start:NO];
            
            // no longer interested in this notification
            [[NSNotificationCenter defaultCenter] removeObserver:self name:kVideoReadyNotification object:nil];
        }
    }
    
    switch (whichViewTag) {
        case kImageView:
        {
            if (self.imageViewController == nil) {
                _imageViewController = [[ImageViewController alloc] initWithNibName:kViewTitle bundle:nil];
            }
            _myCurrentViewController = self.imageViewController;
            [self setTitle:kViewTitle];
            
            [_myTargetView addSubview:_myCurrentViewController.view];
            
            [_myCurrentViewController.view mas_makeConstraints:^(MASConstraintMaker *make) {
                make.edges.equalTo(_myTargetView);
            }];
        }
            break;
            
        case kTableView:
        {
            if (self.tableViewController == nil){
                _tableViewController = [[TableViewController alloc] initWithNibName:kTableTitle bundle:nil];
            }
            
            _myCurrentViewController = _tableViewController;
            [self setTitle:kTableTitle];
            
            [_myTargetView addSubview:_myCurrentViewController.view];
            
            [_myCurrentViewController.view mas_makeConstraints:^(MASConstraintMaker *make) {
                make.edges.equalTo(_myTargetView);
            }];
        }
            break;
            
        case kVideoView:
        {
            if (self.videoViewController == nil){
                _videoViewController = [[VideoViewController alloc] initWithNibName:kVideoTitle bundle:nil];
            }
            
            // listen for when the video is ready to play (used for initial loading)
            [[NSNotificationCenter defaultCenter] addObserver:self
                                                     selector:@selector(videoReady:)
                                                         name:kVideoReadyNotification
                                                       object:nil];

            _myCurrentViewController = _videoViewController;
            [self setTitle:kVideoTitle];
            
            [_myTargetView addSubview:_myCurrentViewController.view];
            
            [_myCurrentViewController.view mas_makeConstraints:^(MASConstraintMaker *make) {
                make.edges.equalTo(_myTargetView);
            }];
        }
            break;
        default:
            break;
    }
    
    [self setRepresentedObject:[NSNumber numberWithUnsignedInteger:[[[self.myCurrentViewController view] subviews] count]]];
    
}

- (IBAction)clickChoice:(id)sender {
    [self changeViewController:[[sender selectedCell] tag]];
}

@end
