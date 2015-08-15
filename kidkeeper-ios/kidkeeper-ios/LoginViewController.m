//
//  LoginViewController.m
//  kidkeeper-ios
//
//  Created by Edward Guo on 2015-08-15.
//  Copyright (c) 2015 Peiliang Guo. All rights reserved.
//

#import "LoginViewController.h"
#import "ViewController.h"

@interface LoginViewController ()
- (IBAction)tryLogin:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;
@property (weak, nonatomic) IBOutlet UITextField *urlField;

@end

@implementation LoginViewController{
    NSURLSession* _session;
    NSURL* _url;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"login"]) {
        ViewController* vc = (ViewController*)[segue destinationViewController];
        vc.teleID = 404;
        vc.serverURL = _url;
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (NSURLSession*)session{
    if (!_session) {
        NSURLSessionConfiguration* sessionConfig = [NSURLSessionConfiguration defaultSessionConfiguration];
        _session = [NSURLSession sessionWithConfiguration:sessionConfig];
    }
    return _session;
}

- (IBAction)tryLogin:(id)sender {
    if (!_loging) {
        _loging = YES;
        __weak LoginViewController* wee = self;
        _url = [NSURL URLWithString:self.urlField.text];
        NSString *post = [NSString stringWithFormat:@"user[email]=%@&user[password]=%@",self.emailField.text,self.passwordField.text];
        NSMutableURLRequest* request = [NSMutableURLRequest requestWithURL:[_url URLByAppendingPathComponent:@"users/sign_in.json"]];
        request.HTTPMethod = @"POST";
        request.HTTPBody = [post dataUsingEncoding:NSUTF8StringEncoding];
        NSURLSessionDataTask* task =  [[self session] dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
            NSHTTPURLResponse* http = (NSHTTPURLResponse*)response;
            if (http.statusCode == 200){
                NSString* status = (NSString*) [(NSDictionary*)[NSJSONSerialization JSONObjectWithData:data options:0 error:nil] objectForKey:@"status"];
                if ([status isEqualToString:@"success"]) {
                    dispatch_async(dispatch_get_main_queue(), ^{
                        [wee performSegueWithIdentifier:@"login" sender:wee];
                    });
                }
                
            }
            wee.loging = NO;
        }];
        [task resume];
    }
    
}
@end
