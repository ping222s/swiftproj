//
//  Document.h
//  ViewController
//
//  Created by Ios8dian on 2017/9/25.
//  Copyright © 2017年 ping222s. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "User.h"

@interface Document : NSDocument

@property(strong,nonatomic)NSMutableArray<User *> *dataArr;

@end
