//
//  Restaurant.m
//  IntelligentposTest
//
//  Created by Ricardo Sampayo on 10/10/2014.
//  Copyright (c) 2014 Ricardo Sampayo. All rights reserved.
//

#import "Restaurant.h"

@implementation Restaurant

-(void)parseJson:(NSDictionary *)json
{
    if ([json objectForKey:@"Name"] && [[json objectForKey:@"Name"] isKindOfClass:[NSString class]]) {
        _name =[json objectForKey:@"Name"];
    }
    if ([json objectForKey:@"RatingStars"] && [[json objectForKey:@"RatingStars"] isKindOfClass:[NSNumber class]]) {
        _ratingStars =[json objectForKey:@"RatingStars"];
    }
    
    if ([json objectForKey:@"Logo"] && [[json objectForKey:@"Logo"] isKindOfClass:[NSArray class]]) {
        NSArray *array = [json objectForKey:@"Logo"];
        
        if (array.count>0) {
            if ([[array objectAtIndex:0] objectForKey:@"StandardResolutionURL"]) {
                _urlLogo =[[array objectAtIndex:0] objectForKey:@"StandardResolutionURL"];
            }
        }
    }
    
    
}

- (id)initWithJson:(NSDictionary *)json
{
    self = [super init];
    if (self) {
        [self parseJson:json];
    }
    return self;
}
@end
