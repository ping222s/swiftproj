//
//  TableViewController.h
//  ViewController
//
//  Created by Ios8dian on 2017/9/22.
//  Copyright © 2017年 ping222s. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface TableViewController : NSViewController
@property (weak) IBOutlet NSTableView *tableview;

- (IBAction)clickRemove:(id)sender;
- (IBAction)clickAdd:(id)sender;
@end
