//
//  AppDelegate.h
//  VideoApp
//
//  Created by AnCheng on 28/02/2017.
//  Copyright © 2017 RaduVila. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

