//
//  ImageViewController.m
//  ViewController
//
//  Created by Ios8dian on 2017/9/22.
//  Copyright © 2017年 ping222s. All rights reserved.
//

#import "ImageViewController.h"

@interface ImageViewController ()

@end

@implementation ImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do view setup here.
}

// -------------------------------------------------------------------------------
//	configureImage:imagePathStr
// -------------------------------------------------------------------------------
- (void)configureImage:(NSString *)imagePathStr
{
    // load the image from the given path string and set is to the NSImageView
    NSImage* image = [[NSImage alloc] initWithContentsOfFile:imagePathStr];
    [imageView setImage:image];
    [textView setStringValue:[imagePathStr lastPathComponent]];	// display the file name
}

// -------------------------------------------------------------------------------
//	awakeFromNib
// -------------------------------------------------------------------------------
- (void)awakeFromNib
{
    // load the default image from our bundle
    NSString *imagePathStr = [[NSBundle mainBundle] pathForResource:@"LakeDonPedro" ofType:@"jpg"];
    [self configureImage:imagePathStr];
}

- (IBAction)openImageAction:(id)sender {
    NSOpenPanel *openPanel = [NSOpenPanel openPanel];
    
    NSArray *fileTypes = [NSArray arrayWithObjects:@"jpg", @"gif", @"png", @"tiff", nil];
    [openPanel setAllowsMultipleSelection:NO];
    [openPanel setMessage:@"Choose an image file to display:"];
    [openPanel setAllowedFileTypes:fileTypes];
    [openPanel setDirectoryURL:[NSURL fileURLWithPath:@"/Library/Desktop Pictures/"]];
    [openPanel beginSheetModalForWindow:self.view.window completionHandler:^(NSInteger result) {
        if (result == NSOKButton)
        {
            if ([[openPanel URL] isFileURL])
            {
                [self configureImage:[[openPanel URL] path]];
            }
        }
    }];
}

@end
