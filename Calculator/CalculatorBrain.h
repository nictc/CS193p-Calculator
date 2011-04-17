//
//  CalculatorBrain.h
//  Calculator
//
//  Created by Nico Friedrich on 14.04.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface CalculatorBrain : NSObject {
    double operand; 
    double tempStore;
    NSString *waitingOperation;
    double waitingOperand;
}
//@property(nonatomic, retain) NSString* operation;
@property(nonatomic) double tempStore;
@property(nonatomic) double waitingOperand;
- (void)setOperand: (double) anOperand;
- (double)perfomOperation:(NSString *)operation; 


@end