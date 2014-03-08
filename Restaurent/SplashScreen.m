//
//  SplashScreen.m
//  Restaurent
//
//  Created by NIrmal Thakur on 9/16/13.
//  Copyright (c) 2013 NIrmal Thakur. All rights reserved.
//

#import "SplashScreen.h"
#import "RestaurentLocatonList.h"

@interface SplashScreen ()

@end

@implementation SplashScreen

@synthesize restaurentMediator, foodList1;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self showSuccess];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void) showSuccess{
   /*
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Supplier information"
                                                    message:@"Successfully submit!!"
                                                   delegate:nil
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    [alert show];
    [alert release];
    
    */
    RestaurentMediator *mediator = [[RestaurentMediator alloc] init];
    mediator.homeScreen = self;
    self.restaurentMediator = mediator;
    self.restaurentMediator.mainScreen = self;

    [mediator release];
    
    [RestaurentMediator detachNewThreadSelector:@selector (getFoodList:)
                                     toTarget:self.restaurentMediator
                                   withObject:nil];
    
}

-(void) setFoodList:(NSArray *)foodListObj{
    
  //  self.foodList = foodList1;
   NSLog(@"Received Food to main screen");
    self.foodList1 = foodListObj;
    
}


-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    NSLog(@" prepareForSegue Numbers of items %d " , [foodList1 count]);
    
    if([[segue identifier] isEqualToString:@"toFoodList"]){
        RestaurentLocatonList *restaurentLocList = [segue destinationViewController];
        NSArray *myArray = [NSArray arrayWithArray:self.foodList1];
        restaurentLocList.foodList = myArray;
        
    }
    
}

@end
