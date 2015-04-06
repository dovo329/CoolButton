//
//  ViewController.m
//  coolButton
//
//  Created by Douglas Voss on 4/6/15.
//  Copyright (c) 2015 Doug. All rights reserved.
//

#import "ViewController.h"
#import "CoolButton.h"

@interface ViewController ()

@property UILabel *hueLabel;
@property UILabel *saturationLabel;
@property UILabel *brightnessLabel;

@property UISlider *hueSlider;
@property UISlider *saturationSlider;
@property UISlider *brightnessSlider;

@end


@implementation ViewController

-(void)OrientationDidChange:(NSNotification*)notification
{
    UIDeviceOrientation Orientation=[[UIDevice currentDevice]orientation];
    
    [self redoFrames];
    NSLog(@"Orientation changed!");
    
    if(Orientation==UIDeviceOrientationLandscapeLeft || Orientation==UIDeviceOrientationLandscapeRight)
    {
    }
    else if(Orientation==UIDeviceOrientationPortrait)
    {
    }
}

- (void)coolButtonHandler {
    NSLog(@"You pressed the coolButton!");
    //self.coolButton.hue = 0.3;
    //coolButton.saturation = 0.8;
    //coolButton.brightness = 0.7;
}

- (void)redoFrames
{
    int statusBarOffsetInPoints = 20.0;
    int standardRectLeftOffset = self.view.frame.size.width/16.0;
    int standardRectWidth = self.view.frame.size.width*(14.0/16.0);
    int standardRectHeight = self.view.frame.size.height*(2.0/16.0);
    int standardInterRectSpacing = self.view.frame.size.height*(2.0/128.0);
    
    self.coolButton.frame = CGRectMake(standardRectLeftOffset, statusBarOffsetInPoints+1.0, standardRectWidth, standardRectHeight);

    CGRect hueLabelFrame = CGRectMake(standardRectLeftOffset, statusBarOffsetInPoints+1.0+(1.0*(standardRectHeight+standardInterRectSpacing)), standardRectWidth, standardRectHeight);
    [self.hueLabel setFrame:hueLabelFrame];
    
    CGRect hueSliderFrame = CGRectMake(standardRectLeftOffset, statusBarOffsetInPoints+1.0+(2.0*(standardRectHeight+standardInterRectSpacing)), standardRectWidth, standardRectHeight);
    [self.hueSlider setFrame:hueSliderFrame];
    
    
    CGRect saturationLabelFrame = CGRectMake(standardRectLeftOffset, statusBarOffsetInPoints+1.0+(3.0*(standardRectHeight+standardInterRectSpacing)), standardRectWidth, standardRectHeight);
    [self.saturationLabel setFrame:saturationLabelFrame];
    
    CGRect saturationSliderFrame = CGRectMake(standardRectLeftOffset, statusBarOffsetInPoints+1.0+(4.0*(standardRectHeight+standardInterRectSpacing)), standardRectWidth, standardRectHeight);
    [self.saturationSlider setFrame:saturationSliderFrame];
    
    CGRect brightnessLabelFrame = CGRectMake(standardRectLeftOffset, statusBarOffsetInPoints+1.0+(5.0*(standardRectHeight+standardInterRectSpacing)), standardRectWidth, standardRectHeight);
    [self.brightnessLabel setFrame:brightnessLabelFrame];
    
    CGRect brightnessSliderFrame = CGRectMake(standardRectLeftOffset, statusBarOffsetInPoints+1.0+(6.0*(standardRectHeight+standardInterRectSpacing)), standardRectWidth, standardRectHeight);
    [self.brightnessSlider setFrame:brightnessSliderFrame];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    // Do any additional setup after loading the view from its nib.
    self.coolButton = [[CoolButton alloc] init];
    [self.coolButton addTarget:self
               action:@selector(coolButtonHandler)
     forControlEvents:UIControlEventTouchUpInside];
    [self.coolButton setTitle:@"Show View" forState:UIControlStateNormal];
    
    self.hueLabel = [[UILabel alloc] init];
    self.hueLabel.text = @"Hue";
    self.hueLabel.textColor = [UIColor orangeColor];
    self.hueLabel.textAlignment = NSTextAlignmentCenter;  //(for iOS 6.0)
    self.hueLabel.tag = 10;
    self.hueLabel.backgroundColor = [UIColor clearColor];
    self.hueLabel.font = [UIFont fontWithName:@"MarkerFelt-Thin" size:14.0];
    self.hueLabel.hidden = NO;
    self.hueLabel.highlighted = YES;
    self.hueLabel.highlightedTextColor = [UIColor blueColor];
    self.hueLabel.lineBreakMode = YES;
    self.hueLabel.numberOfLines = 0;
    
    
    self.hueSlider = [[UISlider alloc] init];
    [self.hueSlider addTarget:self action:@selector(hueValueChanged:) forControlEvents:UIControlEventValueChanged];
    self.hueSlider.value = self.coolButton.hue;
    
    
    self.saturationLabel = [[UILabel alloc] init];
    self.saturationLabel.text = @"Saturation";
    self.saturationLabel.textColor = [UIColor orangeColor];
    self.saturationLabel.textAlignment = NSTextAlignmentCenter;  //(for iOS 6.0)
    self.saturationLabel.tag = 10;
    self.saturationLabel.backgroundColor = [UIColor clearColor];
    self.saturationLabel.font = [UIFont fontWithName:@"MarkerFelt-Thin" size:14.0];
    self.saturationLabel.hidden = NO;
    self.saturationLabel.highlighted = YES;
    self.saturationLabel.highlightedTextColor = [UIColor blueColor];
    self.saturationLabel.lineBreakMode = YES;
    self.saturationLabel.numberOfLines = 0;

    
    
    self.saturationSlider = [[UISlider alloc] init];
    self.saturationSlider.value = self.coolButton.saturation;
    [self.saturationSlider addTarget:self action:@selector(saturationValueChanged:) forControlEvents:UIControlEventValueChanged];
    

    self.brightnessLabel = [[UILabel alloc] init];
    self.brightnessLabel.text = @"Brightness";
    self.brightnessLabel.textColor = [UIColor orangeColor];
    self.brightnessLabel.textAlignment = NSTextAlignmentCenter;  //(for iOS 6.0)
    self.brightnessLabel.tag = 10;
    self.brightnessLabel.backgroundColor = [UIColor clearColor];
    self.brightnessLabel.font = [UIFont fontWithName:@"MarkerFelt-Thin" size:14.0];
    self.brightnessLabel.hidden = NO;
    self.brightnessLabel.highlighted = YES;
    self.brightnessLabel.highlightedTextColor = [UIColor blueColor];
    self.brightnessLabel.lineBreakMode = YES;
    self.brightnessLabel.numberOfLines = 0;
    
    self.brightnessSlider = [[UISlider alloc] init];
    self.brightnessSlider.value = self.coolButton.brightness;
    [self.brightnessSlider addTarget:self action:@selector(brightnessValueChanged:) forControlEvents:UIControlEventValueChanged];
    
    
    
    [self.view addSubview:self.coolButton];
    [self.view addSubview:self.hueLabel];
    [self.view addSubview:self.hueSlider];
    [self.view addSubview:self.saturationLabel];
    [self.view addSubview:self.saturationSlider];
    [self.view addSubview:self.brightnessLabel];
    [self.view addSubview:self.brightnessSlider];
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(OrientationDidChange:) name:UIDeviceOrientationDidChangeNotification object:nil];
    
    [self redoFrames];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)hueValueChanged:(id)sender
{
    UISlider * slider = (UISlider *) sender;
    self.coolButton.hue = slider.value;
}

- (IBAction)saturationValueChanged:(id)sender
{
    UISlider * slider = (UISlider *)sender;
    self.coolButton.saturation = slider.value;
}

- (IBAction)brightnessValueChanged:(id)sender
{
    UISlider * slider = (UISlider *)sender;
    self.coolButton.brightness = slider.value;
}

@end
