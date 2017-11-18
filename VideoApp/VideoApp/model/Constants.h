//
//  Constants.h
//  VideoApp
//
//  Created by AnCheng on 02/03/2017.
//  Copyright © 2017 RaduVila. All rights reserved.
//

#ifndef Constants_h
#define Constants_h

#define   PASSWORD1   @"password1"
#define   PASSWORD2   @"password2"
#define   PASSWORD3   @"password3"
#define   PASSWORD4   @"password4"
#define   PASSWORD5   @"password5"

#define   TOKEN_EXPIRED @"Sorry you have used all of your access tokens"

#define  TOKEN_EXPIRE_DURATION  3600 * 24 * 14

#ifdef rep1

#define VIDEO_TITLES   @[@"Welcome" , @"Tools" ,@"Area of interest" , @"moving around inspection" ,@"Affected items",@"Home Owners Stuff" ,@"Mold Test" ,@"Lift Test" ,@"Mechanicals" ,@"Electric" ,@"Dehumidifier" ,@"Wrapping it up" ,@"Exterior inspection"]

#endif

#ifdef rep2

#define VIDEO_TITLES   @[@"Finished basement" ,@"Getting started" , @"Under _ Behind finished" ,@"Taking down paneling" ,@"coming from help" ,@"Flashlight mold test" ,@"Moving around finished basment" ,@"Exterior inspection"]

#endif

#ifdef repdelivery1

#define VIDEO_TITLES   @[@"Table Time" ,@"Credentials" ,@"How Built" ,@"Materials" ,@"Stages" ,@"Four ways"]

#endif

#ifdef repdelivery2

#define VIDEO_TITLES   @[@"Damages"  ,@"Report" ,@"Accomplish"]

#endif

#ifdef repdelivery3

#define VIDEO_TITLES   @[@"Solution"  ,@"Asking for the order" ,@"The button"]

#endif

#endif /* Constants_h */
