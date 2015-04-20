//
//  DetailViewController.m
//  BMDaySevenCustomTableAssignment
//
//  Created by Kunwardeep Gill on 2015-04-16.
//  Copyright (c) 2015 ProjectDGW. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
  
  self.recipeDetail.text = self.recipe.recipeName;
  self.prepTimeLabel.text = self.recipe.prepTime;
  //image view
  self.recipeImageOutlet.image = [UIImage imageNamed:self.recipe.recipeImage];
  self.navigationItem.title = (self.recipeDetail.text);
  
  //Ingredients List TextView
  NSMutableString *ingredientsText = [NSMutableString string];
    for (NSString* ingredient in self.recipe.ingredients) {
      [ingredientsText appendFormat:@"%@\n", ingredient];
  }
  
  self.ingredientsTextView.text = ingredientsText;
  
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
