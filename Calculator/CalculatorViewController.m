//
//  CalculatorViewController.m
//  Calculator
//
//  Created by Nico Friedrich on 14.04.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "CalculatorViewController.h"

@implementation CalculatorViewController
- (CalculatorBrain *)brain
{
    if (!brain){ 
        brain = [[CalculatorBrain alloc] init];
    }
    return brain;

}
- (IBAction)digitPressed:(UIButton *)sender{ 
    NSString *digit = sender.titleLabel.text; 
    if (userIsInTheMiddleOfTypingANumber) { 
        // This should prevent illegal floating point numbers from being input 
        // NOT(digit is "." AND "." is in display) 
        if (!([digit isEqual:@"."] && ([display.text rangeOfString:@"."].location != 
                                       NSNotFound))) { 
            display.text = [display.text stringByAppendingString:digit]; 
        } 
    } else { 
        
        if ([digit isEqual:@"."]) { 
            display.text = @"0."; 
        } else { 
            
            display.text = digit; 
        } 
        
        userIsInTheMiddleOfTypingANumber = YES; 
    } 
} 
- (IBAction)operationPressed:(UIButton *)sender
{
    if (userIsInTheMiddleOfTypingANumber) {
        [[self brain] setOperand:[[display text]doubleValue]];
        userIsInTheMiddleOfTypingANumber = NO;
    }
    NSString *operation = [[sender titleLabel] text];

    double result = [[self brain] perfomOperation:operation];
    [display setText:[NSString stringWithFormat:@"%g",result]];
	return; 

}

@end
