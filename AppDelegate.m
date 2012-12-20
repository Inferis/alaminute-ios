//
//  AppDelegate.m
//  Alaminute
//
//  Created by Tom Adriaenssen on 20/12/12.
//  Copyright (c) 2012 Tom Adriaenssen. All rights reserved.
//

#import "AppDelegate.h"
#import "IIViewDeckController.h"
#import "IISideController.h"
#import "AllFoodViewController.h"
#import "CartViewController.h"

@implementation AppDelegate {
    Backend* _backend;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    AllFoodViewController* foodController = [[AllFoodViewController alloc] initWithNibName:@"AllFoodViewController" bundle:nil];
    UINavigationController* foodNavController = [[UINavigationController alloc] initWithRootViewController:foodController];
    foodNavController.navigationBar.tintColor = [UIColor colorWithHex:0xadd653];

    CartViewController* cartController = [[CartViewController alloc] initWithNibName:@"CartViewController" bundle:nil];
    IISideController* sideCartController = [[IISideController alloc] initWithViewController:cartController];

    IIViewDeckController* deckController = [[IIViewDeckController alloc] initWithCenterViewController:foodNavController leftViewController:sideCartController];
    deckController.sizeMode = IIViewDeckViewSizeMode;
    deckController.panningMode = IIViewDeckNoPanning;
    [deckController openLeftViewAnimated:NO];
    deckController.resizesCenterView = YES;
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.rootViewController = deckController;
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    NSMutableDictionary *titleBarAttributes = [NSMutableDictionary dictionaryWithDictionary: [[UINavigationBar appearance] titleTextAttributes]];
    [titleBarAttributes setValue:[UIFont fontWithName:@"HelveticaNeue-Bold" size:20] forKey:UITextAttributeFont];
    [titleBarAttributes setValue:[UIColor colorWithHex:0x666666] forKey:UITextAttributeTextColor];
    [titleBarAttributes setValue:[UIColor colorWithWhite:1 alpha:0.5] forKey:UITextAttributeTextShadowColor];
    [titleBarAttributes setValue:[NSValue valueWithCGSize:(CGSize) { 0, 1 }] forKey:UITextAttributeTextShadowOffset];
    [[UINavigationBar appearance] setTitleTextAttributes:titleBarAttributes];
    
    return YES;
}

- (Tin*)tin {
    Tin* tin = [Tin new];
    tin.baseURI = @"http://hummercatch.herokuapp.com";
    return tin;
}

- (Backend*)backend {
    if (!_backend)
        _backend = [Backend new];
    return _backend;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
