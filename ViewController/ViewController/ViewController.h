//
//  ViewController.h
//  ViewController
//
//  Created by Ios8dian on 2017/9/22.
//  Copyright © 2017年 ping222s. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "ImageViewController.h"
#import "TableViewController.h"
#import "VideoViewController.h"

@interface ViewController : NSViewController

@property (nonatomic, strong) VideoViewController *videoViewController;
@property (nonatomic, strong) TableViewController *tableViewController;
@property (nonatomic, strong) ImageViewController *imageViewController;

@property (nonatomic, assign) NSViewController *myCurrentViewController;
@property (weak) IBOutlet NSView *myTargetView;

@end

