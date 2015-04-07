//
//  ViewController.h
//  CoolButton
//
//  Created by Douglas Voss on 4/6/15.
//  Copyright (c) 2015 Doug. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CoolButton;

@interface ViewController : UIViewController

-(NSUInteger)supportedInterfaceOrientations;

@property (nonatomic, strong) IBOutlet CoolButton * coolButton;

- (IBAction)hueValueChanged:(id)sender;
- (IBAction)saturationValueChanged:(id)sender;
- (IBAction)brightnessValueChanged:(id)sender;
@end
