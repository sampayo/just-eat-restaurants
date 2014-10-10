//
//  ViewController.h
//  IntelligentposTest
//
//  Created by Ricardo Sampayo on 10/10/2014.
//  Copyright (c) 2014 Ricardo Sampayo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (nonatomic,weak) IBOutlet UITextField             * postcodeField;
@property (nonatomic,weak) IBOutlet UIButton                * sendButton;
@property (nonatomic,weak) IBOutlet UIActivityIndicatorView * indicator;


@end

