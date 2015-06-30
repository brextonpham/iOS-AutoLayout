//
//  ViewController.m
//  AutoLayout
//
//  Created by Brexton Pham on 6/25/15.
//  Copyright (c) 2014 BrextonPham. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    [self addConstraints];
}

- (void) addConstraints {
    
    //remove automatically generated constraints
    [self.view removeConstraints:self.view.constraints];
    UILabel *firstName = self.firstName;
    UILabel *lastName = self.lastName;
    UIImageView *imageView = self.imageView;
    UITextView *comment = self.textView;
    
    NSDictionary *views = NSDictionaryOfVariableBindings(firstName,lastName,imageView,comment);
    NSDictionary *metrics = @{@"width": @160.0, @"horizontalSpacing":@15.0, @"verticalSpacing":@10};
    NSArray *constraints = [NSLayoutConstraint constraintsWithVisualFormat:
                            @"H:|-[imageView(100)]-horizontalSpacing-[firstName(>=width)]-|"
                                                                   options:NSLayoutFormatAlignAllTop //honors first hardcoded constraint
                                                                   metrics:metrics
                                                                     views:views];
    constraints = [constraints arrayByAddingObjectsFromArray:
                   [NSLayoutConstraint constraintsWithVisualFormat:
                    @"H:[imageView]-horizontalSpacing-[lastName(>=width)]-|"
                                                           options:0
                                                           metrics:metrics
                                                             views:views]];
    constraints = [constraints arrayByAddingObjectsFromArray:
                   [NSLayoutConstraint constraintsWithVisualFormat:
                    @"H:[imageView]-horizontalSpacing-[comment(>=width)]-|"
                                                           options:NSLayoutFormatAlignAllBottom
                                                           metrics:metrics
                                                             views:views]];
    constraints = [constraints arrayByAddingObjectsFromArray:
                   [NSLayoutConstraint constraintsWithVisualFormat:
                    @"V:|-50-[firstName]-verticalSpacing-[lastName]-verticalSpacing-[comment]"
                                                           options:0
                                                           metrics:metrics
                                                             views:views]];

    [self.view addConstraints:constraints];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end











