//
//  ImageViewController.h
//  ViewController
//
//  Created by Ios8dian on 2017/9/22.
//  Copyright © 2017年 ping222s. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface ImageViewController : NSViewController{
    
    __weak IBOutlet NSImageView *imageView;
    
    __weak IBOutlet NSTextField *textView;
    
}

- (IBAction)openImageAction:(id)sender;
@end
