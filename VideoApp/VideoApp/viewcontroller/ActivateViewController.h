//
//  ActivateViewController.h
//  VideoApp
//
//  Created by AnCheng on 02/03/2017.
//  Copyright © 2017 RaduVila. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ActivateViewController : UIViewController

@property (nonatomic ,weak) IBOutlet UIView *activateView;
@property (nonatomic ,weak) IBOutlet UILabel *failLbl;
@property (nonatomic ,weak) IBOutlet UITextField *codeField;

- (IBAction)onActivate:(id)sender;
- (IBAction)onSuccess:(id)sender;

@end
