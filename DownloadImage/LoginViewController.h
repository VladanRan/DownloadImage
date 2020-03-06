//
//  ViewController.h
//  DownloadImage
//
//  Created by Vladan Randjelovic on 01/03/2020.
//  Copyright © 2020 Vladan Randjelovic. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface LoginViewController : NSViewController
@property (weak) IBOutlet NSTextField *userNameTF;
@property (weak) IBOutlet NSSecureTextField *passwordTF;

- (IBAction)loginUserName:(id)sender;
- (IBAction)loginPassword:(NSSecureTextField *)sender;
- (IBAction)login:(id)sender;

@end

