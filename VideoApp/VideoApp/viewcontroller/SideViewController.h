//
//  SideViewController.h
//  VideoApp
//
//  Created by AnCheng on 28/02/2017.
//  Copyright © 2017 RaduVila. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SideViewController : UIViewController <UITableViewDelegate ,UITableViewDataSource> {
    id playerTimer;
}

@property (nonatomic ,strong) NSString *videoName;

- (void)setPlayer;

@end
