//
//  ViewController.m
//  IntelligentposTest
//
//  Created by Ricardo Sampayo on 10/10/2014.
//  Copyright (c) 2014 Ricardo Sampayo. All rights reserved.
//

#import "ViewController.h"
#import "RequestHelper.h"
#import "Restaurant.h"
#import "RestaurantsViewController.h"

@interface ViewController () <HttpAsyncDelegate>
@property (nonatomic,strong) RequestHelper *requestHelper;
@property (nonatomic,strong) NSMutableArray *listRestaurants;
@end

#define KUrlRestaurantJustEat @"http://api-interview.just-eat.com/restaurants?q="


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self prepareRequestHelper];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark UIAction
-(IBAction)sendPostcode:(UIButton*)sender
{
    if (![_postcodeField.text isEqualToString:@""] && _postcodeField.text) {
        [_requestHelper httpRequestAsynchronous:[self prepareURL:_postcodeField.text] andIdentifier:1];
        [_indicator startAnimating];
    }
}


#pragma mark Preparation
-(void)prepareRequestHelper
{
    _requestHelper = [[RequestHelper alloc] init];
    _requestHelper.delegate = self;
}

-(NSURL *)prepareURL:(NSString *)postcode
{
    postcode = [postcode stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSString * urlStr = [NSString stringWithFormat:@"%@%@",KUrlRestaurantJustEat,postcode];
    return [NSURL URLWithString:urlStr];
}

-(void)prepareListRestaurant
{
    if (!_listRestaurants) {
        _listRestaurants = [[NSMutableArray alloc] init];
    }
    [_listRestaurants removeAllObjects];
}

-(void)prepareRestaurantViewConroller
{
    RestaurantsViewController *rest = (RestaurantsViewController *)[self.storyboard instantiateViewControllerWithIdentifier:@"restaurantsViewController"];
    rest.datasource =_listRestaurants;
    [rest setTitle:@"Restaurants"];
    [self.navigationController pushViewController:rest animated:YES];
}
#pragma mark HttpAsyncDelegate
-(void)httpAsyncDelegate:(id)jsonInObject identifier:(NSInteger)identifier
{
    [self prepareListRestaurant];
    if ([jsonInObject isKindOfClass:[NSDictionary class]]) {
        NSArray *restaurants = [jsonInObject objectForKey:@"Restaurants"];
        
        for (NSDictionary *restaurantJSON in restaurants) {
            Restaurant *restaurant = [[Restaurant alloc] initWithJson:restaurantJSON];
            [_listRestaurants addObject:restaurant];
        }
        [_indicator stopAnimating];
        [self prepareRestaurantViewConroller];
        
    }
    
}
-(void)httpAsyncDelegateError:(id)error identifier:(NSInteger)identifier
{
    NSLog(@"Error: %@",error);
    [_indicator stopAnimating];
}






@end
