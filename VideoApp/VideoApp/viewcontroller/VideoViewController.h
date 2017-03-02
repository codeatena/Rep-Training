//
//  VideoViewController.h
//  VideoApp
//
//  Created by AnCheng on 28/02/2017.
//  Copyright © 2017 RaduVila. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VideoViewController : UIViewController

@property (nonatomic ,strong) NSString *videoName;
@property (nonatomic ,strong) AVPlayerViewController *playerVC;

- (IBAction)toggleMenu:(id)sender;

@end
