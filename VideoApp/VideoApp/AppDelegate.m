//
//  AppDelegate.m
//  VideoApp
//
//  Created by AnCheng on 28/02/2017.
//  Copyright © 2017 RaduVila. All rights reserved.
//

#import "AppDelegate.h"
#import "SideViewController.h"
#import <GoogleAnalytics/GAI.h>

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    GAI *gai = [GAI sharedInstance];
    [gai trackerWithTrackingId:@"UA-110389296-1"];
    gai.dispatchInterval = 30;

#ifdef DEBUG
    gai.logger.logLevel = kGAILogLevelVerbose;
#endif
    
//    UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle: nil];
//    SideViewController *vc = [mainStoryboard instantiateViewControllerWithIdentifier:@"SideViewController"];
//    [SlideNavigationController sharedInstance].leftMenu = vc;
//    [SlideNavigationController sharedInstance].leftBarButtonItem.tintColor = [UIColor whiteColor];
//    [[SlideNavigationController sharedInstance] setEnableSwipeGesture:NO];
//    [SlideNavigationController sharedInstance].portraitSlideOffset = 400.0f;
//    [SlideNavigationController sharedInstance].landscapeSlideOffset = 656.0f;
//    [SlideNavigationController sharedInstance].enableShadow = NO;
//    [SlideNavigationController sharedInstance].avoidSwitchingToSameClassViewController = NO;
    
    [self generatePassword];
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    // Saves changes in the application's managed object context before the application terminates.
    [self saveContext];
}


#pragma mark - Core Data stack

@synthesize persistentContainer = _persistentContainer;

- (NSPersistentContainer *)persistentContainer {
    // The persistent container for the application. This implementation creates and returns a container, having loaded the store for the application to it.
    @synchronized (self) {
        if (_persistentContainer == nil) {
            _persistentContainer = [[NSPersistentContainer alloc] initWithName:@"VideoApp"];
            [_persistentContainer loadPersistentStoresWithCompletionHandler:^(NSPersistentStoreDescription *storeDescription, NSError *error) {
                if (error != nil) {
                    // Replace this implementation with code to handle the error appropriately.
                    // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                    
                    /*
                     Typical reasons for an error here include:
                     * The parent directory does not exist, cannot be created, or disallows writing.
                     * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                     * The device is out of space.
                     * The store could not be migrated to the current model version.
                     Check the error message to determine what the actual problem was.
                    */
                    NSLog(@"Unresolved error %@, %@", error, error.userInfo);
                    abort();
                }
            }];
        }
    }
    
    return _persistentContainer;
}

#pragma mark - Core Data Saving support

- (void)saveContext {
    NSManagedObjectContext *context = self.persistentContainer.viewContext;
    NSError *error = nil;
    if ([context hasChanges] && ![context save:&error]) {
        // Replace this implementation with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        NSLog(@"Unresolved error %@, %@", error, error.userInfo);
        abort();
    }
}

- (void)generatePassword
{
    if (![GVUserDefaults standardUserDefaults].isPasswordSet)
    {
        [GVUserDefaults standardUserDefaults].isPasswordSet = YES;
        [GVUserDefaults standardUserDefaults].expiredDate = [[NSDate date] dateByAddingTimeInterval:TOKEN_EXPIRE_DURATION * 2];
        [GVUserDefaults standardUserDefaults].passCount = 0;
        
        [GVUserDefaults standardUserDefaults].password1 = PASSWORD1;
        [GVUserDefaults standardUserDefaults].password2 = PASSWORD2;
        [GVUserDefaults standardUserDefaults].password3 = PASSWORD3;
        [GVUserDefaults standardUserDefaults].password4 = PASSWORD4;
        [GVUserDefaults standardUserDefaults].password5 = PASSWORD5;
    }
}

@end
