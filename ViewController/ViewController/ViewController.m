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

- (void)changeViewController:(NSInteger)whichViewTag
{
    
    [_myCurrentViewController.view removeFromSuperview];
    
    if ([self.myCurrentViewController view] != nil)
    {
        [[self.myCurrentViewController view] removeFromSuperview];	// remove the current view
//
//        if ([self.myCurrentViewController isKindOfClass:[VideoViewController class]])
//        {
//            // stop playing the video
////            [(VideoViewController *)self.myCurrentViewController start:NO];
//            
//            // no longer interested in this notification
////            [[NSNotificationCenter defaultCenter] removeObserver:self name:kVideoReadyNotification object:nil];
//        }
    }
    
    switch (whichViewTag) {
        case kImageView:
        {
            _imageViewController = [[ImageViewController alloc] initWithNibName:kViewTitle bundle:nil];
            _myCurrentViewController = self.imageViewController;
            [self.myCurrentViewController setTitle:kViewTitle];
            
            [_myTargetView addSubview:_myCurrentViewController.view];
            
            [_myCurrentViewController.view mas_makeConstraints:^(MASConstraintMaker *make) {
                make.edges.equalTo(_myTargetView);
            }];
        }
            break;
            
        case kTableView:
        {
            _tableViewController = [[TableViewController alloc] initWithNibName:kTableTitle bundle:nil];
            _myCurrentViewController = _tableViewController;
            [self.myCurrentViewController setTitle:kTableTitle];
            
            [_myTargetView addSubview:_myCurrentViewController.view];
            
            [_myCurrentViewController.view mas_makeConstraints:^(MASConstraintMaker *make) {
                make.edges.equalTo(_myTargetView);
            }];
        }
            break;
        default:
            break;
    }
    
}

- (IBAction)clickChoice:(id)sender {
    [self changeViewController:[[sender selectedCell] tag]];
}

@end
