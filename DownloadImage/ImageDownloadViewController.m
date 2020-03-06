//
//  ImageDownloadViewController.m
//  DownloadImage
//
//  Created by Vladan Randjelovic on 01/03/2020.
//  Copyright © 2020 Vladan Randjelovic. All rights reserved.
//

#import "ImageDownloadViewController.h"
#import <AFURLSessionManager.h>

@implementation ImageDownloadViewController
@synthesize downloadLink;

- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view.
}


- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}


- (IBAction)download:(id)sender {
    [self createDownloadDirectory:@"DownloadedImages"];
//    NSURLComponents *components;
//    if (downloadLink.placeholderString != nil) {
//        components = [[NSURLComponents alloc] initWithString:downloadLink.placeholderString];
//    }
//    if (!components) {
//        NSLog(@"You must enter a valid url format for tracking domain!");
//    } else if (!components.scheme) {
//        if (([downloadLink.placeholderString rangeOfString:@"https://"].location == NSNotFound) || ([downloadLink.placeholderString rangeOfString:@"http://"].location == NSNotFound)) {
//        self.downloadLink.placeholderString = [NSString stringWithFormat:@"https://%@",downloadLink.placeholderString];
//        }
//    }
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
       AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];

       NSURL *URL = [NSURL URLWithString:downloadLink.stringValue];
       NSURLRequest *request = [NSURLRequest requestWithURL:URL];

       NSURLSessionDownloadTask *downloadTask = [manager downloadTaskWithRequest:request progress:nil destination:^NSURL *(NSURL *targetPath, NSURLResponse *response) {
           NSURL *documentsDirectoryURL = [[[NSFileManager defaultManager] URLForDirectory:NSDocumentDirectory inDomain:NSUserDomainMask appropriateForURL:nil create:NO error:nil] URLByAppendingPathComponent:@"DownloadedImages"];
           return [documentsDirectoryURL URLByAppendingPathComponent:[response suggestedFilename]];
       } completionHandler:^(NSURLResponse *response, NSURL *filePath, NSError *error) {
           NSLog(@"File downloaded to: %@", filePath);
       }];
       [downloadTask resume];
    
}

-(void)createDownloadDirectory:(NSString *)dirName {
    NSString *path;
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    path = [[paths objectAtIndex:0] stringByAppendingPathComponent:dirName];
    NSError *error;
    if (![[NSFileManager defaultManager] fileExistsAtPath:path])    //Does directory already exist?
    {
        if (![[NSFileManager defaultManager] createDirectoryAtPath:path
                                       withIntermediateDirectories:NO
                                                        attributes:nil
                                                             error:&error])
        {
            NSLog(@"Create directory error: %@", error);
        }
    }
}
@end
