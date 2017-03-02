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
    if ([_codeField.text isEqualToString:@"1"])
         _activateView.hidden = YES;
    else
        _failLbl.hidden = NO;
}

- (IBAction)onSuccess:(id)sender
{
    SlideNavigationController *navVc = (SlideNavigationController *)self.presentingViewController;
    VideoViewController *vc = (VideoViewController *)[navVc topViewController];
    [self dismissViewControllerAnimated:YES completion:^(void){
        
        [vc.playerVC.player play];
    }];
}

@end
