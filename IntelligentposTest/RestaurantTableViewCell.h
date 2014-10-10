//
//  RestaurantTableViewCell.h
//  IntelligentposTest
//
//  Created by Ricardo Sampayo on 10/10/2014.
//  Copyright (c) 2014 Ricardo Sampayo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RestaurantTableViewCell : UITableViewCell
@property (weak,nonatomic) IBOutlet UIImageView  *imageRestaurant;
@property (weak,nonatomic) IBOutlet UILabel      *nameRestaurant;
@property (weak,nonatomic) IBOutlet UILabel      *rateRestaurant;

@end
