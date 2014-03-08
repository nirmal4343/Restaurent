//
//  RestaurentLocatonList.m
//  Restaurent
//
//  Created by NIrmal Thakur on 9/16/13.
//  Copyright (c) 2013 NIrmal Thakur. All rights reserved.
//

#import "RestaurentLocatonList.h"
#import "RestaurentMediator.h"
#import "LocationList.h"

@interface RestaurentLocatonList ()

@end

@implementation RestaurentLocatonList

@synthesize foodList,locationListObj1;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.hidesBackButton = YES;

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [foodList count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if(cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:CellIdentifier];
    }
    
    NSDictionary *food = [foodList objectAtIndex:[indexPath row]];
    cell.textLabel.text = [food objectForKey:@"name"];
    cell.imageView.	image = [UIImage imageNamed:[food objectForKey:@"image"]];
    cell.accessoryType = UITableViewCellSelectionStyleBlue;
    return cell;
    
    
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSLog(@"ROW SELECTED **** ");
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     [detailViewController release];
     */
    RestaurentMediator *mediator = [[RestaurentMediator alloc] init];
    mediator.mainScreen = self;
    [RestaurentMediator detachNewThreadSelector:@selector (getLocationList:)
                                   toTarget:mediator
                                 withObject:nil];

   // [self performSegueWithIdentifier:@"toLocationList" sender:self];
    

}



-(void) setLocationList:(NSArray *) locationListObj{
    
    NSLog(@"*** Inside LocationList ****");
    self.locationListObj1 = locationListObj;
    NSLog(@" prepareForSegue Numbers of items %d " , [locationListObj1 count]);
    
}
-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    NSLog(@"Preparing for segue **** for loaction List");
    
    if([[segue identifier] isEqualToString:@"toLocationList"]){
        LocationList *locationList = [segue destinationViewController];
        NSArray *myArray = [NSArray arrayWithArray:self.locationListObj1];
        locationList.locationList = myArray;
        
    }
}

@end
