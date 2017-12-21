//
//  AppDelegate.h
//  TOWORK
//
//  Created by Pisces on 2017/12/19.
//  Copyright © 2017年 Pisces. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

