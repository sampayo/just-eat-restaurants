//
//  Restaurant.h
//  IntelligentposTest
//
//  Created by Ricardo Sampayo on 10/10/2014.
//  Copyright (c) 2014 Ricardo Sampayo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@interface Restaurant : NSObject
@property (nonatomic,strong) NSString *name;
@property (nonatomic,strong) NSNumber *ratingStars;
@property (nonatomic,strong) NSString *urlLogo;

@property (nonatomic,strong) UIImage *logo;

- (id)initWithJson:(NSDictionary *)json;

@end
