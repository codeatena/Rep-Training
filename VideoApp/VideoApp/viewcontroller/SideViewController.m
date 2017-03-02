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
    VideoViewController *videoVC = [self.storyboard instantiateViewControllerWithIdentifier:@"VideoViewController"];
    videoVC.videoName = [VIDEO_TITLES objectAtIndex:indexPath.row];
    [[SlideNavigationController sharedInstance] popAllAndSwitchToViewController:videoVC withSlideOutAnimation:YES andCompletion:^(void){
        
    }];
}

@end
