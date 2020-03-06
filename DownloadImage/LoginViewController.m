//
//  ViewController.m
//  DownloadImage
//
//  Created by Vladan Randjelovic on 01/03/2020.
//  Copyright © 2020 Vladan Randjelovic. All rights reserved.
//

#import "LoginViewController.h"

@implementation LoginViewController
@synthesize userNameTF;
@synthesize passwordTF;
@synthesize credentialsDictionary;
NSString * username;
NSString * password;
NSString * usernameMsg =@"Username cant be empty and must contain at least 4 characters!";
NSString *passMsg =@"Password cant be empty and must contain at least 4 characters!";

- (void)viewDidLoad {
    [super viewDidLoad];

    credentialsDictionary = [[NSDictionary alloc] initWithObjects:[NSArray arrayWithObjects:@"password", nil] forKeys:[NSArray arrayWithObjects:@"username", nil]];
    // Do any additional setup after loading the view.
}


- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}


- (IBAction)loginUserName:(id)sender {
    username = userNameTF.placeholderString;
}

- (IBAction)loginPassword:(NSSecureTextField *)sender {
    password = passwordTF.placeholderString;
}

- (IBAction)login:(id)sender {
    if ([[credentialsDictionary objectForKey:userNameTF.placeholderString] isEqualTo:passwordTF.placeholderString]) {
        [self showSimpleCriticalAlert:passMsg];
    }
    if ([self validateUsername:username andPassword:password]) {
        NSViewController *mainController = [self.storyboard instantiateControllerWithIdentifier:@"mainView"];
        [self.view.window setContentViewController:mainController];
//        [self presentViewControllerAsModalWindow:mainController];
    }

}

-(BOOL)validateUsername:(NSString *)username andPassword:(NSString *) password {
    if([username isEqual:NULL] || ([username length] < 4)) {
        [self showSimpleCriticalAlert:usernameMsg];
        return NO;
    } else if([password isEqual:NULL] || ([password length] < 4)) {
        [self showSimpleCriticalAlert:passMsg];
        return NO;
    } else {
        return YES;
    }
}

-(void)showSimpleCriticalAlert:(NSString *) message
{
 NSAlert *alert = [[NSAlert alloc] init];
 [alert addButtonWithTitle:@"OK"];
 [alert setMessageText:@"Alert"];
 [alert setInformativeText:message];
    [alert setAlertStyle:NSAlertStyleCritical];
 [alert beginSheetModalForWindow:[self.view window] modalDelegate:self didEndSelector:@selector(alertDidEnd:returnCode:contextInfo:) contextInfo:nil];
}
- (void)alertDidEnd:(NSAlert *)alert returnCode:(NSInteger)returnCode contextInfo:(void *)contextInfo
{
    if (returnCode == NSModalResponseOK)
 {
 NSLog(@"(returnCode == NSOKButton)");
 }
    else if (returnCode == NSModalResponseCancel)
 {
 NSLog(@"(returnCode == NSCancelButton)");
 }
 else if(returnCode == NSAlertFirstButtonReturn)
 {
 NSLog(@"if (returnCode == NSAlertFirstButtonReturn)");
 }
 else if (returnCode == NSAlertSecondButtonReturn)
 {
 NSLog(@"else if (returnCode == NSAlertSecondButtonReturn)");
 }
 else if (returnCode == NSAlertThirdButtonReturn)
 {
 NSLog(@"else if (returnCode == NSAlertThirdButtonReturn)");
 }
 else
 {
     NSLog(@"All Other return code %ld",(long)returnCode);
 }
}

@end
