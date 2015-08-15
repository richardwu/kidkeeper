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

@end

@implementation LoginViewController

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
        vc.teleID = [self.emailField.text integerValue];
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

@end
