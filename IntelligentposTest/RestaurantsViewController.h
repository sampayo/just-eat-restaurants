//
//  RestaurantsViewController.h
//  IntelligentposTest
//
//  Created by Ricardo Sampayo on 10/10/2014.
//  Copyright (c) 2014 Ricardo Sampayo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RestaurantsViewController : UIViewController
@property (nonatomic,strong) NSMutableArray *datasource;
@property (nonatomic,weak) IBOutlet UITableView *tableView;
@end
