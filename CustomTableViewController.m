//
//  CustomTableViewController.m
//  BMDaySevenCustomTableAssignment
//
//  Created by Kunwardeep Gill on 2015-04-14.
//  Copyright (c) 2015 ProjectDGW. All rights reserved.
//

#import "CustomTableViewController.h"
#import "CustomTableViewCell.h"
#import "DetailViewController.h"
#import "Recipe.h"
@interface CustomTableViewController ()

@end

@implementation CustomTableViewController
{
  NSArray *recipes;
  
  NSMutableArray *recipeNames;
  NSMutableArray *recipeImages;
  NSMutableArray *recipePrepTime;
  BOOL recipeChecked[16];
}

- (void)viewDidLoad {
  [super viewDidLoad];
  // Initialize the recipes array
  Recipe *recipe1 = [Recipe new];
  recipe1.recipeName = @"Egg Benedict";
  recipe1.prepTime = @"30 min";
  recipe1.recipeImage = @"egg_benedict.jpg";
  
  Recipe *recipe2 = [Recipe new];
  recipe2.recipeName = @"Mushroom Risotto";
  recipe2.prepTime = @"30 min";
  recipe2.recipeImage = @"mushroom_risotto.jpg";
  
  Recipe *recipe3 = [Recipe new];
  recipe3.recipeName = @"Full Breakfast";
  recipe3.prepTime = @"20 min";
  recipe3.recipeImage = @"full_breakfast.jpg";
  
  Recipe *recipe4 = [Recipe new];
  recipe4.recipeName = @"Hamburger";
  recipe4.prepTime = @"30 min";
  recipe4.recipeImage = @"hamburger.jpg";
  
  Recipe *recipe5 = [Recipe new];
  recipe5.recipeName = @"Ham and Egg Sandwich";
  recipe5.prepTime = @"10 min";
  recipe5.recipeImage = @"ham_and_egg_sandwich.jpg";
  
  Recipe *recipe6 = [Recipe new];
  recipe6.recipeName = @"Creme Brelee";
  recipe6.prepTime = @"1 hour";
  recipe6.recipeImage = @"creme_brelee.jpg";
  
  Recipe *recipe7 = [Recipe new];
  recipe7.recipeName = @"White Chocolate Donut";
  recipe7.prepTime = @"45 min";
  recipe7.recipeImage = @"white_chocolate_donut.jpg";
  
  Recipe *recipe8 = [Recipe new];
  recipe8.recipeName = @"Starbucks Coffee";
  recipe8.prepTime = @"5 min";
  recipe8.recipeImage = @"starbucks_coffee.jpg";
  
  Recipe *recipe9 = [Recipe new];
  recipe9.recipeName = @"Vegetable Curry";
  recipe9.prepTime = @"30 min";
  recipe9.recipeImage = @"vegetable_curry.jpg";
  
  Recipe *recipe10 = [Recipe new];
  recipe10.recipeName = @"Instant Noodle with Egg";
  recipe10.prepTime = @"8 min";
  recipe10.recipeImage = @"instant_noodle_with_egg.jpg";
  
  Recipe *recipe11 = [Recipe new];
  recipe11.recipeName = @"Noodle with BBQ Pork";
  recipe11.prepTime = @"20 min";
  recipe11.recipeImage = @"noodle_with_bbq_pork.jpg";
  
  Recipe *recipe12 = [Recipe new];
  recipe12.recipeName = @"Japanese Noodle with Pork";
  recipe12.prepTime = @"20 min";
  recipe12.recipeImage = @"japanese_noodle_with_pork.jpg";
  
  Recipe *recipe13 = [Recipe new];
  recipe13.recipeName = @"Green Tea";
  recipe13.prepTime = @"5 min";
  recipe13.recipeImage = @"green_tea.jpg";
  
  Recipe *recipe14 = [Recipe new];
  recipe14.recipeName = @"Thai Shrimp Cake";
  recipe14.prepTime = @"1.5 hours";
  recipe14.recipeImage = @"thai_shrimp_cake.jpg";
  
  Recipe *recipe15 = [Recipe new];
  recipe15.recipeName = @"Angry Birds Cake";
  recipe15.prepTime = @"4 hours";
  recipe15.recipeImage = @"angry_birds_cake.jpg";
  
  Recipe *recipe16 = [Recipe new];
  recipe16.recipeName = @"Ham and Cheese Panini";
  recipe16.prepTime = @"10 min";
  recipe16.recipeImage = @"ham_and_cheese_panini.jpg";
  
  
  
  //Using Plist
  //Retrieve the plist path
  NSString *path = [[NSBundle mainBundle]pathForResource:@"recipes" ofType:@"plist"];
  //create a dictionary that connects to the file we made
  NSMutableDictionary *dict = [[NSMutableDictionary alloc]initWithContentsOfFile:path];
  
  //specify key value pairs for the dictionary and the arrays in the plist
  recipeNames = [dict objectForKey:@"Name"];
  recipeImages = [dict objectForKey:@"Image"];
  recipePrepTime = [dict objectForKey:@"PrepTime"];
  
  
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
  
  return [recipeNames count];
  
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
  
  static NSString *cellIdentifier = @"Cell";
  CustomTableViewCell *cell = (CustomTableViewCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
  
  cell.nameLabel.text = [recipeNames objectAtIndex:indexPath.row];
  cell.prepTimeLabel.text = [recipePrepTime objectAtIndex:indexPath.row];
  cell.thumbnailImageView.image = [UIImage imageNamed:[recipeImages objectAtIndex:indexPath.row]];
  
  //Solving the duplicate checkmark issue
  if (recipeChecked[indexPath.row]) {
    cell.accessoryType = UITableViewCellAccessoryCheckmark;
  } else{
    cell.accessoryType = UITableViewCellAccessoryNone;
  }
  
  
  return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
  NSString *selectedRecipe = [recipeNames objectAtIndex:indexPath.row];
  //UIAlertView *messageAlert = [[UIAlertView alloc]initWithTitle:@"Row Selected" message:selectedRecipe delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
  
  //Display Alert
  //[messageAlert show];
  
  
  //Adding a checkmark

  UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
  
  //toggling the checkmark
  if (recipeChecked [indexPath.row]) {
    recipeChecked [indexPath.row] = NO;
    cell.accessoryType = UITableViewCellAccessoryNone;
  } else {
    recipeChecked [indexPath.row] = YES;
    cell.accessoryType = UITableViewCellAccessoryCheckmark;
  }
  
  [tableView deselectRowAtIndexPath:indexPath animated:YES];

}

- (void)tableView:(UITableView *)tableView commitEditingStyle:
(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
  
  [recipeNames removeObjectAtIndex:indexPath.row];
  [recipePrepTime removeObjectAtIndex:indexPath.row];
  [recipeImages removeObjectAtIndex:indexPath.row];
  
  //Reload the Table View
  [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationTop];
}

//segue for the detail view
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
  if ([segue.identifier isEqualToString:@"showRecipeDetail"]) {
    NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
    DetailViewController *destViewController = segue.destinationViewController;
    destViewController.recipeName = [recipeNames objectAtIndex:indexPath.row];
    destViewController.recipeImage = [UIImage imageNamed:[recipeImages objectAtIndex:indexPath.row]];
  }
}


/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
