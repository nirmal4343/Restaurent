//
//  RestaurentMediator.h
//  Restaurent
//
//  Created by NIrmal Thakur on 9/20/13.
//  Copyright (c) 2013 NIrmal Thakur. All rights reserved.
//

#import <Foundation/Foundation.h>

@class SplashScreen;

@interface RestaurentMediator : NSThread {
    
    SplashScreen *homeScreen;
    NSArray * foodList;
    NSArray * locationList;
    
}

- (void) getFoodList :(NSDictionary *)dict;
- (void) getLocationList :(NSDictionary *)dict;

@property (nonatomic,retain) UIViewController *mainScreen;
@property (nonatomic,retain) SplashScreen *homeScreen;
@property (nonatomic,retain) NSArray * foodList;
@property (nonatomic,retain) NSArray * locationList;

@end
