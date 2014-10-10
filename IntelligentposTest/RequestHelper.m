//
//  RequestHelper.m
//  IntelligentposTest
//
//  Created by Ricardo Sampayo on 10/10/2014.
//  Copyright (c) 2014 Ricardo Sampayo. All rights reserved.
//

#import "RequestHelper.h"

#define KAutorizationJustEat @"Basic VGVjaFRlc3RBUEk6dXNlcjI="
@implementation RequestHelper


-(void)httpRequestAsynchronous:(NSURL*)urlString
                           andIdentifier:(NSInteger)identifier
{
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:urlString];
    
    [request setTimeoutInterval: 20];
    [request setValue:@"application/json"   forHTTPHeaderField:@"Content-type"];
    [request setValue:@"utf-8"              forHTTPHeaderField:@"Accept-Charset"];
    [request setValue:@"UK"                 forHTTPHeaderField:@"Accept-Tenant"];
    [request setValue:@"en-GB"              forHTTPHeaderField:@"Accept-Language"];
    [request setValue:KAutorizationJustEat  forHTTPHeaderField:@"Authorization"];

    
    
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *r, NSData *data, NSError *e)
     {
         
         if (e || !data){
             if ([self.delegate respondsToSelector:@selector(httpAsyncDelegateError:identifier:)]) {
                 [self.delegate httpAsyncDelegateError:e identifier:1];
             }
             return;
         }
         
         NSError *jsonParsingError = nil;
         
         NSMutableDictionary *jsonArray = [NSJSONSerialization JSONObjectWithData:data
                                                                          options:NSJSONReadingMutableContainers|NSJSONReadingAllowFragments|kNilOptions error:&jsonParsingError];
         
         [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
                  if ([self.delegate respondsToSelector:@selector(httpAsyncDelegate:identifier:)]) {
                      [self.delegate httpAsyncDelegate:jsonArray identifier:identifier];
                  }

     }];
    
}
@end
