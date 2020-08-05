//
//  MainNavigationController.m
//  Rep1Basement2019
//
//  Created by Admin on 2020/8/4.
//  Copyright © 2020 RaduVila. All rights reserved.
//

#import "MainNavigationController.h"

@implementation MainNavigationController

#pragma mark - PROPERTIES

- (VideoViewController *)videoViewController
{
    if (!_videoViewController) {
        _videoViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"VideoViewController"];
        _videoViewController.videoName = _videoName;
    }
    return _videoViewController;
}

#pragma mark - SHOW VIEW CONTROLLERS

- (void)showVideoViewController
{
    [self setViewControllers:@[self.videoViewController] animated:YES];
}


@end
