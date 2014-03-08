//
//  SplashScreen.h
//  Restaurent
//
//  Created by NIrmal Thakur on 9/16/13.
//  Copyright (c) 2013 NIrmal Thakur. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RestaurentMediator.h"

@interface SplashScreen : UIViewController{
    
    NSArray *foodList1;
}

@property (nonatomic,retain) RestaurentMediator * restaurentMediator;
@property (nonatomic,retain) NSArray *foodList1;

-(void) setFoodList:(NSArray *) foodList;

@end
