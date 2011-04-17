//
//  CalculatorViewController.m
//  Calculator
//
//  Created by Nico Friedrich on 14.04.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "CalculatorViewController.h"

@implementation CalculatorViewController
@synthesize tempStore;
@synthesize memDisplay;
@synthesize operandDisplay;
@synthesize waitingOperand;
//@synthesize operation;
- (CalculatorBrain *)brain
{
    if (!brain){ 
        brain = [[CalculatorBrain alloc] init];
      
    }
      return brain;
}

- (IBAction)digitPressed:(UIButton *)sender{ 
    NSString *digit = sender.titleLabel.text;
    memDisplay.text = [NSString stringWithFormat:@"%g", [brain tempStore]]; //special UIOutlet show content of calculator mem
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
- (void) dealloc
{
    [brain release];
    [super dealloc];
}
- (IBAction)operationPressed:(UIButton *)sender
{
    memDisplay.text = [NSString stringWithFormat:@"%g", [brain tempStore]];//special UIOutlet show content of calculator mem
    
    if (userIsInTheMiddleOfTypingANumber) {
        [[self brain] setOperand:[[display text]doubleValue]];
        userIsInTheMiddleOfTypingANumber = NO;
       // operandDisplay.text = [NSString stringWithFormat:@"%g",[brain operation]]; must be implemented yet
    }
    if ([brain tempStore] != 0){
        mr.selected = TRUE;}
        else {
            mr.selected = FALSE;
        }
    NSString *operation = [[sender titleLabel] text];

    double result = [[self brain] perfomOperation:operation];
    [display setText:[NSString stringWithFormat:@"%g",result]];
	return; 
    
    }



@end
