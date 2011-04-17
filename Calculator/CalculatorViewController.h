//
//  CalculatorViewController.h
//  Calculator
//
//  Created by Nico Friedrich on 14.04.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CalculatorBrain.h"
@interface CalculatorViewController : UIViewController {
    IBOutlet UILabel *display;
    CalculatorBrain *brain;
    BOOL userIsInTheMiddleOfTypingANumber;
    IBOutlet UILabel *memDisplay; //our stored memory display window upper left corner
    IBOutlet UILabel *operandDisplay;//additional operationDisplay
    UIButton *mr;
 
}
@property (retain,nonatomic) UILabel *memDisplay;
@property (retain,nonatomic) UILabel *operandDisplay;
@property double tempStore;
@property double waitingOperand;
//@property(nonatomic) NSString* operation;
- (IBAction)digitPressed:(UIButton *)sender;
- (IBAction)operationPressed:(UIButton *)sender;

@end
