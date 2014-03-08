//
//  LocationList.h
//  Restaurent
//
//  Created by NIrmal Thakur on 9/21/13.
//  Copyright (c) 2013 NIrmal Thakur. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LocationList : UITableViewController  <UISearchBarDelegate>	{
    
    NSArray * locationList;
    NSMutableArray * results;
}

@property (nonatomic, retain) NSArray * locationList;
@property (retain, nonatomic)  NSMutableArray * results;
@property (retain, nonatomic) IBOutlet UISearchBar *searchBar;

@end
