//
//  AppDelegate.m
//  App-Objective-C
//
//  Created by 鈴木航 on 2020/03/08.
//  Copyright © 2020 WataruSuzuki. All rights reserved.
//

#import "AppDelegate.h"
#import "HogeFuga/HogeFuga-Swift.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [[HogeFuga new] printHello];
    return YES;
}



@end
