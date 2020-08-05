//
//  MainNavigationController.h
//  Rep1Basement2019
//
//  Created by Admin on 2020/8/4.
//  Copyright © 2020 RaduVila. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VideoViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface MainNavigationController : UINavigationController

@property (nonatomic, strong) VideoViewController *videoViewController;

@property (nonatomic ,strong) NSString *videoName;

- (void)showVideoViewController;
@end

NS_ASSUME_NONNULL_END
