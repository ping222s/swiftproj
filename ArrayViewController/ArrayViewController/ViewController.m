//
//  ViewController.m
//  ArrayViewController
//
//  Created by Ios8dian on 2017/9/22.
//  Copyright © 2017年 ping222s. All rights reserved.
//

#import "ViewController.h"
#import "TableViewController.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view.
    
    TableViewController *tabv = [[TableViewController alloc]initWithNibName:@"TableViewController" bundle:nil];
    [self.view addSubview:tabv.view];
    [tabv.view setFrame:self.view.bounds];
}


- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}


@end
