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
#import "UIViewController+LMSideBarController.h"
#import "MainNavigationController.h"

@interface SideViewController () <UITableViewDataSource ,UITableViewDelegate>

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

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [[NSNotificationCenter defaultCenter] addObserverForName:SlideNavigationControllerDidClose object:nil queue:nil usingBlock:^(NSNotification *note) {

    }];
    
    [[NSNotificationCenter defaultCenter] addObserverForName:SlideNavigationControllerDidOpen object:nil queue:nil usingBlock:^(NSNotification *note) {

    }];

}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:SlideNavigationControllerDidClose object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:SlideNavigationControllerDidOpen object:nil];
    
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
}

- (void)setPlayer
{
    VideoViewController *videoVC = (VideoViewController *)[self.navigationController.viewControllers objectAtIndex:0];
    [videoVC setPlayer:_videoName];
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.

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
    if ([VIDEO_TITLES[indexPath.row] isEqualToString:_videoName])
    {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    }
    else
    {
        cell.accessoryType = UITableViewCellAccessoryNone;

    }
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 75.0f;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    self.videoName = [VIDEO_TITLES objectAtIndex:indexPath.row];
    [self setPlayer];
}

@end
