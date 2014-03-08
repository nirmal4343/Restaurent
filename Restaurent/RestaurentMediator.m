//
//  RestaurentMediator.m
//  Restaurent
//
//  Created by NIrmal Thakur on 9/20/13.
//  Copyright (c) 2013 NIrmal Thakur. All rights reserved.
//

#import "RestaurentMediator.h"
#import "HttpRequest.h"
#import "HttpConnectionManager.h"

@implementation RestaurentMediator
@synthesize mainScreen,homeScreen,foodList,locationList;


-(void) getFoodList :(NSDictionary *)dict;
{
    
    NSLog(@"Inside Food List Mediator");
    
    HttpRequest *requestObject = [[HttpRequest alloc] init];
    [requestObject addParam:@"foodList" addValue:@"xxxxx"];
    
    HttpConnectionManager * httpConn = [HttpConnectionManager getHTTPConnectionMgr];
    
    NSData *response = [httpConn postFoodList:requestObject];
        
    NSString *string = [[[NSString alloc] initWithData:response encoding:NSUTF8StringEncoding] autorelease];
    
    NSLog(@"Received Response ** %@ " , string);
    
    if (response) {
        NSError *error = nil;
        id jsonObjects = [NSJSONSerialization JSONObjectWithData:response options:NSJSONReadingMutableContainers error:&error];
        
        if (error) {
            NSLog(@"error is %@", [error localizedDescription]);
            // Handle Error and return
            return;
        }
        
        NSArray *keys = [jsonObjects allKeys];
        
        // values in foreach loop
        
        for (NSString *key in keys) {
            NSLog(@"%@ is %@",key, [jsonObjects objectForKey:key]);
            
            foodList = [jsonObjects objectForKey:key];
            
           
       }
        
    } else {
        // Handle Error
    }
    
    
    
    //NSRange range = [[NSString stringWithFormat:@"%@",string] rangeOfString:@"food"];
    
   // if (range.location != NSNotFound) {
        [self performSelectorOnMainThread:@selector(showFoodList:) withObject:foodList waitUntilDone:NO];
   // }
   // else{
   //     [self performSelectorOnMainThread:@selector(showFail) withObject:nil waitUntilDone:NO];
   // }
   //  */
    
}

-(void) getLocationList :(NSDictionary *)dict{
    
    
    NSLog(@"Inside Location List Mediator");
    
    HttpRequest *requestObject = [[HttpRequest alloc] init];
    [requestObject addParam:@"location" addValue:@"34"];
    
    HttpConnectionManager * httpConn = [HttpConnectionManager getHTTPConnectionMgr];
    
    NSData *response = [httpConn postLocationList:requestObject];
    
    NSString *string = [[[NSString alloc] initWithData:response encoding:NSUTF8StringEncoding] autorelease];
    
    NSLog(@"Received Response ** %@ " , string);
    
    
    if (response) {
        NSError *error = nil;
        id jsonObjects = [NSJSONSerialization JSONObjectWithData:response options:NSJSONReadingMutableContainers error:&error];
        
        if (error) {
            NSLog(@"error is %@", [error localizedDescription]);
            // Handle Error and return
            return;
        }
        
        NSArray *keys = [jsonObjects allKeys];
        
        // values in foreach loop
        
        for (NSString *key in keys) {
            NSLog(@"%@ is %@",key, [jsonObjects objectForKey:key]);
            
            locationList = [jsonObjects objectForKey:key];
            
            /*
             for(int i = 0 ; i < [foodList count] ; i++){
             NSDictionary *food = [foodList objectAtIndex:i];
             NSLog(@" Name ::: %@ " , [food objectForKey:@"name"]);
             }
             */
            
        }
        
    } else {
        // Handle Error
    }

    
    [self performSelectorOnMainThread:@selector(showLocationList:) withObject:locationList waitUntilDone:NO];
    
}

-(void) showFoodList:(NSArray *) items{
    
    [homeScreen setFoodList:items];
    NSLog(@"Inside *****");
    
    [mainScreen performSegueWithIdentifier:@"toFoodList" sender:self];
}

-(void) showLocationList:(NSArray *) items{
    
     NSLog(@"Inside *****");
    
    [mainScreen setLocationList:items];
   
    [mainScreen performSegueWithIdentifier:@"toLocationList" sender:self];
}

-(void) showFail{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Supplier information"
                                                    message:@"Failed!!"
                                                   delegate:nil
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    [alert show];
    [alert release];
}

@end
