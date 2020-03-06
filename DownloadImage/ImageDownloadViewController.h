//
//  ImageDownloadViewController.h
//  DownloadImage
//
//  Created by Vladan Randjelovic on 01/03/2020.
//  Copyright © 2020 Vladan Randjelovic. All rights reserved.
//
#import <Cocoa/Cocoa.h>

@interface ImageDownloadViewController : NSViewController
@property (weak) IBOutlet NSTextField *downloadLink;

- (IBAction)download:(id)sender;

@end
