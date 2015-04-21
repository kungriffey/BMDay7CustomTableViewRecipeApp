//
//  DetailViewController.h
//  BMDaySevenCustomTableAssignment
//
//  Created by Kunwardeep Gill on 2015-04-16.
//  Copyright (c) 2015 ProjectDGW. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Recipe.h"

@interface DetailViewController : UIViewController

@property (strong, nonatomic) IBOutlet UILabel *recipeDetail;
@property (strong, nonatomic) IBOutlet UIImageView *recipeImageOutlet;
@property (strong, nonatomic) IBOutlet UILabel *prepTimeLabel;
@property (strong, nonatomic) IBOutlet UITextView *ingredientsTextView;

//@property (strong, nonatomic) NSString *recipeName;
//@property (strong, nonatomic) UIImage *recipeImage;

@property (nonatomic, strong) Recipe *recipe;

@end
