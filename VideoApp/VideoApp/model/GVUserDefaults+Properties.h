//
//  GVUserDefaults+Properties.h
//  VideoApp
//
//  Created by AnCheng on 02/03/2017.
//  Copyright © 2017 RaduVila. All rights reserved.
//

#import <GVUserDefaults/GVUserDefaults.h>

@interface GVUserDefaults (Properties)

@property (nonatomic) BOOL isPasswordSet;
@property (nonatomic ,strong) NSDate *expiredDate;

@property (nonatomic ,strong) NSString *password1;
@property (nonatomic ,strong) NSString *password2;
@property (nonatomic ,strong) NSString *password3;
@property (nonatomic ,strong) NSString *password4;
@property (nonatomic ,strong) NSString *password5;

@property (nonatomic) NSInteger passCount;

@end
