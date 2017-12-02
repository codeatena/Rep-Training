//
//  VideoViewController.m
//  VideoApp
//
//  Created by AnCheng on 28/02/2017.
//  Copyright © 2017 RaduVila. All rights reserved.
//

#import "VideoViewController.h"
#import "ActivateViewController.h"

@interface VideoViewController ()


@end

@implementation VideoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    id tracker = [[GAI sharedInstance] defaultTracker];
    [tracker set:kGAIScreenName value:@"VideoViewController"];
    [tracker send:[[GAIDictionaryBuilder createScreenView] build]];
    
    _playerVC.view.backgroundColor = [UIColor whiteColor];
    if (_videoName == nil){
        
        _videoName = @"Welcome";
#ifdef rep2
        _videoName = @"Finished basement";
#endif
        
#ifdef repdelivery1
        _videoName = @"Table Time";
#endif

#ifdef repdelivery2
        _videoName = @"Damages";
#endif

#ifdef repdelivery3
        _videoName = @"Solution";
#endif

    }
    NSString *path = [[NSBundle mainBundle] pathForResource:_videoName ofType:@"mp4"];
    AVPlayer *player = [AVPlayer playerWithURL:[NSURL fileURLWithPath:path]];
    _playerVC.player = player;
    [player play];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [[NSNotificationCenter defaultCenter]addObserver:self
                                            selector:@selector(didBecomeForground)
                                                name:UIApplicationDidBecomeActiveNotification
                                              object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserverForName:SlideNavigationControllerDidClose object:nil queue:nil usingBlock:^(NSNotification *note) {
        [_playerVC.player play];

    }];
    
    [[NSNotificationCenter defaultCenter] addObserverForName:SlideNavigationControllerDidOpen object:nil queue:nil usingBlock:^(NSNotification *note) {
        [_playerVC.player pause];

    }];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIApplicationDidBecomeActiveNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:SlideNavigationControllerDidClose object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:SlideNavigationControllerDidOpen object:nil];

    
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    NSDate *expiredDate = [GVUserDefaults standardUserDefaults].expiredDate;
    if ([expiredDate compare:[NSDate date]] ==  NSOrderedAscending)
    {
        [self showActivate];
    }
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    if ([segue.identifier isEqualToString:@"playSegue"])
    {
        _playerVC = [segue destinationViewController];
    }
    else if ([segue.identifier isEqualToString:@"activateSegue"])
    {
        ActivateViewController *vc = (ActivateViewController *)[segue destinationViewController];
        switch ([GVUserDefaults standardUserDefaults].passCount) {
            case 0:
                vc.password = [GVUserDefaults standardUserDefaults].password1;
                break;
            case 1:
                vc.password = [GVUserDefaults standardUserDefaults].password2;
                break;
            case 2:
                vc.password = [GVUserDefaults standardUserDefaults].password3;
                break;
            case 3:
                vc.password = [GVUserDefaults standardUserDefaults].password4;
                break;
            case 4:
                vc.password = [GVUserDefaults standardUserDefaults].password5;
                break;
            default:
                break;
        }
    }
}

- (IBAction)toggleMenu:(id)sender
{
    [[SlideNavigationController sharedInstance] toggleLeftMenu];
}

- (void)showActivate
{
    [_playerVC.player pause];
    
    if ([GVUserDefaults standardUserDefaults].passCount == 5)
    {
        UIAlertController * alert=   [UIAlertController
                                      alertControllerWithTitle:@"Alert"
                                      message:TOKEN_EXPIRED
                                      preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* ok = [UIAlertAction
                             actionWithTitle:@"OK"
                             style:UIAlertActionStyleDefault
                             handler:^(UIAlertAction * action)
                             {
                                 exit(0);
                             }];

        [alert addAction:ok];
        [self presentViewController:alert animated:YES completion:nil];
    }
    else
        [self performSegueWithIdentifier:@"activateSegue" sender:nil];
}

- (void)didBecomeForground
{
    NSDate *expiredDate = [GVUserDefaults standardUserDefaults].expiredDate;
    if ([expiredDate compare:[NSDate date]] ==  NSOrderedAscending)
    {
        [self showActivate];
    }
}


@end
