//
//  TableViewController.m
//  ArrayViewController
//
//  Created by Ios8dian on 2017/9/22.
//  Copyright © 2017年 ping222s. All rights reserved.
//

#import "TableViewController.h"

@interface TableViewController ()
@property (strong) IBOutlet NSArrayController *ArrayController;

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do view setup here.
}

- (void)awakeFromNib
{
    // add the default set of items to our table
    [_ArrayController addObjects: [NSArray arrayWithObjects:
                               [NSDictionary dictionaryWithObjectsAndKeys:
                                @"Keith", @"name",
                                nil],
                               [NSDictionary dictionaryWithObjectsAndKeys:
                                @"Craig", @"name",
                                nil],
                               [NSDictionary dictionaryWithObjectsAndKeys:
                                @"Eric", @"name",
                                nil],
                               nil]];
}

@end
