//
//  ActivateViewController.m
//  VideoApp
//
//  Created by AnCheng on 02/03/2017.
//  Copyright © 2017 RaduVila. All rights reserved.
//

#import "ActivateViewController.h"
#import "VideoViewController.h"

@interface ActivateViewController ()

@end

@implementation ActivateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    id tracker = [[GAI sharedInstance] defaultTracker];
    [tracker set:kGAIScreenName value:@"ActivateViewController"];
    [tracker send:[[GAIDictionaryBuilder createScreenView] build]];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)onActivate:(id)sender
{
    if ([_codeField.text isEqualToString:_password])
    {
        NSInteger count = [GVUserDefaults standardUserDefaults].passCount;
        [GVUserDefaults standardUserDefaults].passCount = count + 1;
        [GVUserDefaults standardUserDefaults].expiredDate = [[NSDate date] dateByAddingTimeInterval:TOKEN_EXPIRE_DURATION];
        SlideNavigationController *navVc = (SlideNavigationController *)self.presentingViewController;
        VideoViewController *vc = (VideoViewController *)[navVc topViewController];
        [self dismissViewControllerAnimated:YES completion:^(void){
            
            [vc.playerVC.player play];
        }];
    }
    else
        _failLbl.hidden = NO;

}

- (IBAction)onSuccess:(id)sender
{
    _activateView.hidden = NO;
    _alertView.hidden = YES;
}

@end
