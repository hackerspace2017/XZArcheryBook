//
//  AppDelegate.m
//  XZArcheryBook
//
//  Created by liwenxiang on 2017/7/4.
//  Copyright © 2017年 祥子. All rights reserved.
//

#import "AppDelegate.h"

#import "XZHomeVC.h"

#import "XZUIManager.h"

#import "XZToolHeader.h"


@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    
    interfaceLayer();
    
    // 先把数据库创建出来 这个是UserDB数据库
    if (!serverLayer().userDatabase.isOpenSuccess) {
        
        [serverLayer().userDatabase openDataBase];
        
    }
    
    [self savePublicData];
    
    XZHomeVC *homeVC = [[XZHomeVC alloc] init];
    
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:homeVC];
    
    self.window.rootViewController = nav;
    
    
    
    return YES;
}

// 保存码表公共数据
- (void)savePublicData
{
    xz_async_block(^{
        
        // 1.保存射箭类型公共码表数据
        NSArray *archeryTypeArr = [serverLayer().userDatabase getAllArcheryTypeTable];
        
        if (archeryTypeArr.count < 4) {
            archeryTypeArr = @[@"反曲弓", @"复合弓", @"光弓", @"传统弓"];
            for (int i = 0; i < archeryTypeArr.count; i ++) {
                
                ArcheryTypeTable *archeryTypeTable = [[ArcheryTypeTable alloc] init];
                
                archeryTypeTable.archeryName = archeryTypeArr[i];
                archeryTypeTable.archeryCode = [NSString stringWithFormat:@"%d", 100 + i];
                
                [serverLayer().userDatabase saveArcheryTypeTable:archeryTypeTable];
                
            }
            
        }
        
        // 2.保存射击距离公共码表数据
        NSArray *distanceArr = [serverLayer().userDatabase getAllDistanceTable];
        
        if (distanceArr.count < 8) {
            distanceArr = @[@"8米", @"10米", @"18米", @"30米", @"40米", @"50米", @"70米", @"90米"];
            for (int i = 0; i < distanceArr.count; i ++) {
                
                DistanceTable *distanceTable = [[DistanceTable alloc] init];
                
                distanceTable.distance = distanceArr[i];
                distanceTable.distanceCode = [NSString stringWithFormat:@"%d", 1000 + i];
                
                [serverLayer().userDatabase saveDistanceTable:distanceTable];
                
            }
            
        }
        
        // 3.保存射击环数公共码表数据
        NSArray *loopNumArr = [serverLayer().userDatabase getAllLoopNumTable];
        
        if (loopNumArr.count < 8) {
            loopNumArr = @[@"40三联", @"40全环", @"60半环", @"60全环", @"80半环", @"80全环", @"122全环", @"完美300"];
            for (int i = 0; i < loopNumArr.count; i ++) {
                
                LoopNumTable *loopNumTable = [[LoopNumTable alloc] init];
                
                loopNumTable.LoopNum = loopNumArr[i];
                loopNumTable.LoopNumCode = [NSString stringWithFormat:@"%d", 10000 + i];
                
                [serverLayer().userDatabase saveLoopNumTable:loopNumTable];
                
            }
            
        }
        
        // 4.保存 组数/每组箭数量/总共箭数 公共码表数据
        NSArray *archeryGroupNumArr = [serverLayer().userDatabase getAllArcheryGroupNumTable];
        
        if (archeryGroupNumArr.count < 5) {
            archeryGroupNumArr = @[@"5组/每组3支箭/共15支箭", @"5组/每组6支箭/共30支箭", @"6组/每组6支箭/共36支箭", @"10组/每组6支箭/共60支箭", @"12组/每组6支箭/共72支箭"];
            for (int i = 0; i < archeryGroupNumArr.count; i ++) {
                
                ArcheryGroupNumTable *archeryGroupNumTable = [[ArcheryGroupNumTable alloc] init];
                
                archeryGroupNumTable.archeryGroupNum = archeryGroupNumArr[i];
                archeryGroupNumTable.archeryGroupNumCode = [NSString stringWithFormat:@"%d", 100000 + i];
                
                [serverLayer().userDatabase saveArcheryGroupNumTable:archeryGroupNumTable];
                
            }
            
        }
        
        
        
    });
    
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
}


@end
