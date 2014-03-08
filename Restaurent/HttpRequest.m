//
//  HttpRequest.m
//  Restaurent
//
//  Created by NIrmal Thakur on 9/20/13.
//  Copyright (c) 2013 NIrmal Thakur. All rights reserved.
//

#import "HttpRequest.h"

@implementation HttpRequest

@synthesize requestData;


//Add a request paramter (name + value) to the XML contaning list of nvpairs
-(void)addParam:(NSString *)paramName addValue:(NSString *)paramValue;
{
	if(requestData == nil)
	{
		requestData = @"";
	}
    
	requestData = [requestData stringByAppendingString:paramName];
	requestData = [requestData stringByAppendingString:@"="];
	requestData = [requestData stringByAppendingString:paramValue];
	requestData = [requestData stringByAppendingString:@"&"];
}


//Return the XML string containing the request data
//If there are no parameters in the reqest, then nvpais is empty

-(NSString *) getRequestData
{
	if(requestData == nil)
	{
		requestData = @"";
	}
    
	return requestData;
}


- (void)dealloc {
    [requestData release];
    [super dealloc];
}


@end
