//
//  CalculatorBrain.h
//  Calculator
//
//  Created by Nico Friedrich on 14.04.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AudioToolbox/AudioToolbox.h>


@interface CalculatorBrain : NSObject {
    double operand; 
    double tempStore;
    NSString *waitingOperation;
    double waitingOperand;
}
- (void)setOperand: (double) anOperand;
- (double)perfomOperation:(NSString *)operation; 


@end
