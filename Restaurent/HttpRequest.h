//
//  HttpRequest.h
//  Restaurent
//
//  Created by NIrmal Thakur on 9/20/13.
//  Copyright (c) 2013 NIrmal Thakur. All rights reserved.
//
 
#import <Foundation/Foundation.h>

@interface HttpRequest : NSObject {
	NSString *requestData;
}

@property (nonatomic, strong) NSString *requestData;

-(void)addParam:(NSString *)paramName addValue:(NSString *)paramValue;

-(NSString *) getRequestData;

@end
