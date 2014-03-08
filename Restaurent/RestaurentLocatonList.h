//
//  RestaurentLocatonList.h
//  Restaurent
//
//  Created by NIrmal Thakur on 9/16/13.
//  Copyright (c) 2013 NIrmal Thakur. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RestaurentLocatonList : UITableViewController{
    
    NSArray * foodList;
    NSArray * locationListObj1;
    
}

@property (nonatomic,retain) NSArray *foodList;
@property (nonatomic,retain) NSArray *locationListObj1;
-(void) setLocationList:(NSArray *) locationListObj;

@end
