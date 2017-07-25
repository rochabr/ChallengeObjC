//
//  LoginViewController.m
//  Challenge
//
//  Created by Fernando Rocha Silva on 7/25/17.
//  Copyright © 2017 ropetech. All rights reserved.
//

#import "LoginViewController.h"

@import FBSDKCoreKit;
@import FBSDKLoginKit;
@import Firebase;
@import GoogleSignIn;

@interface LoginViewController ()
@property(strong, nonatomic) FIRAuthStateDidChangeListenerHandle handle;
@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [GIDSignIn sharedInstance].delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)facebookLogin:(id)sender{
    FBSDKLoginManager *loginManager = [[FBSDKLoginManager alloc] init];
    
    [loginManager logInWithReadPermissions:@[@"public_profile", @"email", @"user_friends"] fromViewController:self handler:^(FBSDKLoginManagerLoginResult *result, NSError *error) {
        if (error == nil){
            FBSDKAccessToken *token = result.token;
            if (token){
                FIRAuthCredential *credential = [FIRFacebookAuthProvider
                                                 credentialWithAccessToken:token.tokenString];
                [[FIRAuth auth] signInWithCredential:credential
                                          completion:^(FIRUser *user, NSError *error) {
                                              if (error) {
                                                  NSLog(@"%@", error.description);
                                                  return;
                                              }else{
                                                  NSLog(@"signed in as %@", user.displayName);
//                                                  [self handleLogin];
//                                                  [self navigateToMemoryViewer];
                                              }
                                          }];
                
            }else{
                NSLog(@"%@", error.description);
            }
        }
    }];
}

- (IBAction)googleSignIn:(id)sender{
    [GIDSignIn sharedInstance].uiDelegate = self;
    [[GIDSignIn sharedInstance] signIn];
    
    self.handle = [[FIRAuth auth]
                   addAuthStateDidChangeListener:^(FIRAuth *_Nonnull auth, FIRUser *_Nullable user) {
                       if (user) {
//                           [self handleLogin];
//                           [self navigateToMemoryViewer];
                       }
                   }];
}

- (void)signIn:(GIDSignIn *)signIn didSignInForUser:(GIDGoogleUser *)user withError:(NSError *)error {
    // ...
    if (error == nil) {
        GIDAuthentication *authentication = user.authentication;
        FIRAuthCredential *credential =
        [FIRGoogleAuthProvider credentialWithIDToken:authentication.idToken
                                         accessToken:authentication.accessToken];
        // ...
    } else {
        // ...
    }
}

- (void)signIn:(GIDSignIn *)signIn didDisconnectWithUser:(GIDGoogleUser *)user withError:(NSError *)error {
    // Perform any operations when the user disconnects from app here.
    // ...
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
