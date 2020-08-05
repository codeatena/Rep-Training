//
//  SideBarController.m
//  Rep1Basement2019
//
//  Created by Admin on 2020/8/4.
//  Copyright © 2020 RaduVila. All rights reserved.
//

#import "SideBarController.h"
#import "SideViewController.h"
#import "MainNavigationController.h"
#import "LMSideBarDepthStyle.h"

@implementation SideBarController

- (void)awakeFromNib
{
    [super awakeFromNib];
    
    // Init side bar styles
    LMSideBarDepthStyle *sideBarDepthStyle = [LMSideBarDepthStyle new];
    CGFloat width = CGRectGetWidth(self.view.bounds);
    sideBarDepthStyle.menuWidth = width;
    
    // Init view controllers
    SideViewController *sideViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"SideViewController"];
    MainNavigationController *navigationController = [self.storyboard instantiateViewControllerWithIdentifier:@"MainNavigationController"];
    
    // Setup side bar controller
    [self setPanGestureEnabled:YES];
    [self setDelegate:self];
    [self setMenuViewController:sideViewController forDirection:LMSideBarControllerDirectionLeft];
    [self setSideBarStyle:sideBarDepthStyle forDirection:LMSideBarControllerDirectionLeft];
    [self setContentViewController:navigationController];
}

- (void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation
{
    CGFloat width = CGRectGetWidth(self.view.bounds);
    LMSideBarDepthStyle *sideBarDepthStyle = [LMSideBarDepthStyle new];
    sideBarDepthStyle.menuWidth = width;
    
    // Init view controllers
    SideViewController *sideViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"SideViewController"];
    MainNavigationController *navigationController = [self.storyboard instantiateViewControllerWithIdentifier:@"MainNavigationController"];
    
    // Setup side bar controller
    [self setPanGestureEnabled:YES];
    [self setDelegate:self];
    [self setMenuViewController:sideViewController forDirection:LMSideBarControllerDirectionLeft];
    [self setSideBarStyle:sideBarDepthStyle forDirection:LMSideBarControllerDirectionLeft];
    [self setContentViewController:navigationController];
    
}

#pragma mark - SIDE BAR DELEGATE

- (void)sideBarController:(LMSideBarController *)sideBarController willShowMenuViewController:(UIViewController *)menuViewController
{
    
}

- (void)sideBarController:(LMSideBarController *)sideBarController didShowMenuViewController:(UIViewController *)menuViewController
{
    
}

- (void)sideBarController:(LMSideBarController *)sideBarController willHideMenuViewController:(UIViewController *)menuViewController
{
    
}

- (void)sideBarController:(LMSideBarController *)sideBarController didHideMenuViewController:(UIViewController *)menuViewController
{
    
}

@end
