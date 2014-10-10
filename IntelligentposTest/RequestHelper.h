//
//  RequestHelper.h
//  IntelligentposTest
//
//  Created by Ricardo Sampayo on 10/10/2014.
//  Copyright (c) 2014 Ricardo Sampayo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@protocol HttpAsyncDelegate <NSObject>

-(void)httpAsyncDelegate:(id)jsonInObject identifier:(NSInteger)identifier;

@optional
-(void)httpAsyncDelegateError:(id)error identifier:(NSInteger)identifier;

@end



@interface RequestHelper : NSObject
@property (nonatomic,strong) id<HttpAsyncDelegate> delegate;


-(void)httpRequestAsynchronous:(NSURL*)urlString
                 andIdentifier:(NSInteger)identifier;
@end
