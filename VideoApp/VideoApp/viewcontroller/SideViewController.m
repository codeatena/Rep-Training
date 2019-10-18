//
//  SideViewController.m
//  VideoApp
//
//  Created by AnCheng on 28/02/2017.
//  Copyright © 2017 RaduVila. All rights reserved.
//

#import "SideViewController.h"
#import "MenuTableViewCell.h"
#import "VideoViewController.h"

@interface SideViewController ()

@end

@implementation SideViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    id tracker = [[GAI sharedInstance] defaultTracker];
    [tracker set:kGAIScreenName value:@"SideViewController"];
    [tracker send:[[GAIDictionaryBuilder createScreenView] build]];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDelegate ,UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return VIDEO_TITLES.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MenuTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"menuCell"];
    cell.nameLbl.text = [VIDEO_TITLES objectAtIndex:indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 75.0f;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIViewController *topVC = [SlideNavigationController sharedInstance].topViewController;
    if ([topVC isKindOfClass:[VideoViewController class]])
    {
        [(VideoViewController *)topVC playerVC].player = nil;
    }
    
    VideoViewController *videoVC = [self.storyboard instantiateViewControllerWithIdentifier:@"VideoViewController"];
    videoVC.videoName = [VIDEO_TITLES objectAtIndex:indexPath.row];
    [[SlideNavigationController sharedInstance] popAllAndSwitchToViewController:videoVC withSlideOutAnimation:YES andCompletion:^(void){
        
    }];

}

@end
