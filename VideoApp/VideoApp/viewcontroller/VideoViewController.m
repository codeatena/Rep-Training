//
//  VideoViewController.m
//  VideoApp
//
//  Created by AnCheng on 28/02/2017.
//  Copyright © 2017 RaduVila. All rights reserved.
//

#import "VideoViewController.h"

@interface VideoViewController ()


@end

@implementation VideoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _playerVC.view.backgroundColor = [UIColor whiteColor];
    if (_videoName == nil) _videoName = @"Affected items";
    NSString *path = [[NSBundle mainBundle] pathForResource:_videoName ofType:@"mp4"];
    AVPlayer *player = [AVPlayer playerWithURL:[NSURL fileURLWithPath:path]];
    _playerVC.player = player;
    [player play];
    
    [self performSelector:@selector(showActivate) withObject:nil afterDelay:3.0f];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
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
}

- (IBAction)toggleMenu:(id)sender
{
    [[SlideNavigationController sharedInstance] toggleLeftMenu];
}

- (void)showActivate
{
    [_playerVC.player pause];
    [self performSegueWithIdentifier:@"activateSegue" sender:nil];
}

@end
