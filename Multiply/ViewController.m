//
//  ViewController.m
//  Multiply
//
//  Created by Iván Mervich on 7/21/14.
//  Copyright (c) 2014 Mobile Makers. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *myNumber;
@property (weak, nonatomic) IBOutlet UILabel *myMultiplier;
@property (weak, nonatomic) IBOutlet UILabel *myAnswer;

@property (weak, nonatomic) IBOutlet UISlider *myNumberChangeSlider;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

    // set slider
    self.myNumberChangeSlider.maximumValue = 30;
    self.myNumberChangeSlider.minimumValue = -30;
    self.myNumber.text = [NSString stringWithFormat:@"%d", (int)self.myNumberChangeSlider.value];
}

- (IBAction)onCalculateButtonPressed:(id)sender {

    int myNumber = [self.myNumber.text intValue];
    int myMultiplier = [self.myMultiplier.text intValue];
    int result = myNumber * myMultiplier;

    // change color
    if (result > 20) {
        self.view.backgroundColor = [UIColor greenColor];
    } else if (result < 20) {
        self.view.backgroundColor = [UIColor whiteColor];
    }

    // set myAnswer
    if (result % 3 == 0 && result % 5 == 0) {
        self.myAnswer.text = @"fizzbuzz";
    } else if (result % 3 == 0) {
        self.myAnswer.text = @"fizz";
    } else if (result % 5 == 0) {
        self.myAnswer.text = @"buzz";
    } else {
        self.myAnswer.text = [NSString stringWithFormat:@"%d", result];
    }
}

- (IBAction)onNumberSliderValueChanged:(id)sender {
    // set myNumber according to slider
    self.myNumber.text = [NSString stringWithFormat:@"%d", (int) self.myNumberChangeSlider.value];
}

@end
