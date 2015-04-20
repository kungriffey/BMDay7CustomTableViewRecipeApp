//
//  Recipe.h
//  BMDaySevenCustomTableAssignment
//
//  Created by Kunwardeep Gill on 2015-04-20.
//  Copyright (c) 2015 ProjectDGW. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Recipe : NSObject

@property (strong, nonatomic) NSString *recipeName;
@property (strong, nonatomic) NSString *recipeImage;
@property (strong, nonatomic) NSString *prepTime;
@property (strong, nonatomic) NSArray *ingredients;



@end
