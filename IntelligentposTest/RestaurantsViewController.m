//
//  RestaurantsViewController.m
//  IntelligentposTest
//
//  Created by Ricardo Sampayo on 10/10/2014.
//  Copyright (c) 2014 Ricardo Sampayo. All rights reserved.
//

#import "RestaurantsViewController.h"
#import "RestaurantTableViewCell.h"
#import "Restaurant.h"

@interface RestaurantsViewController ()<UITableViewDataSource>
@property (nonatomic,strong) NSOperationQueue *queue;
@end

@implementation RestaurantsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self prepareSorterArray];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark DsDTableView

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_datasource count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    RestaurantTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"restaurantTableViewCell"];
    if (!cell) {
        cell = [[RestaurantTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"restaurantTableViewCell"];
    }
    Restaurant *rest = [_datasource objectAtIndex:indexPath.row];
    
    
    [cell.imageRestaurant setImage:nil];
    cell.nameRestaurant.text = rest.name;
    cell.rateRestaurant.text = [NSString stringWithFormat:@"Rating: %.2f",[rest.ratingStars floatValue]];
    [cell.imageRestaurant setImage:rest.logo];
    [self prepareImageCell:rest cellForRowAtIndexPath:indexPath];
    
    return cell;
}
#pragma preparation
-(void)prepareSorterArray
{
    _datasource = [[_datasource sortedArrayUsingComparator:^NSComparisonResult(Restaurant *a, Restaurant *b) {
        NSNumber *first = [a ratingStars];
        NSNumber *second = [b ratingStars];
        return [second compare:first];
    }] mutableCopy];
}
-(void)prepareQueue
{
    if (!_queue) {
        _queue =[[NSOperationQueue alloc] init];
    }
}
-(void)prepareImageCell:(Restaurant *)rest cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (!rest.logo) {
        [self prepareQueue];
        [_queue addOperationWithBlock:^{
            NSURL *url=    [NSURL URLWithString:rest.urlLogo];
            rest.logo = [UIImage imageWithData:[NSData dataWithContentsOfURL:url]];
            [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                RestaurantTableViewCell * cell = ( RestaurantTableViewCell * )[self.tableView cellForRowAtIndexPath:indexPath];
                [cell.imageRestaurant setImage:rest.logo];
            }];
        }];
    }
//    else
//    {
//        RestaurantTableViewCell * cell = ( RestaurantTableViewCell * )[self.tableView cellForRowAtIndexPath:indexPath];
//        [cell.imageRestaurant setImage:rest.logo];
//        
//    }

}
@end
