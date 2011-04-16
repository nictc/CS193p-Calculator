//
//  CalculatorBrain.m
//  Calculator
//
//  Created by Nico Friedrich on 14.04.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "CalculatorBrain.h"


@implementation CalculatorBrain

- (void)setOperand: (double) anOperand
{
    operand = anOperand;
}
- (void)performWaitingOperation
{
    if ([@"+" isEqual:waitingOperation]) 
    {
        operand = waitingOperand + operand;
    } 
    else if ([@"-" isEqual:waitingOperation]) 
    {
        operand = waitingOperand - operand;
    } else if ([@"*" isEqual:waitingOperation]) {
        operand = waitingOperand * operand;
    } else if ([@"/" isEqual:waitingOperation]) {
        if (operand)//Dividieren durch 0
        {operand = waitingOperand / operand;}
        if (operand == 0) {UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Fehler" message:@"Division durch null" delegate:self cancelButtonTitle:nil otherButtonTitles:@"zurück", nil];
            [alert show];
            [alert release];  
        } 
        } 
    }
    
- (double)perfomOperation:(NSString *)operation
{
    if ([operation isEqual:@"sqrt"]) {
        operand = sqrt(operand);
    }
        else if ([@"+/-" isEqual:operation])
        {
            operand = - operand;
        }
        else if ([@"1/x" isEqual:operation]){
            if (operand == 0){printf("error\n");            } 
            else
            operand = 1/ operand;
        }
        else if ([@"sin" isEqual:operation]){
            operand = sinf(operand);}
            else if ([@"cos" isEqual:operation]){
                operand = cosf(operand);
        }
            else if ([@"m+" isEqual:operation]){
                tempStore = tempStore + operand;}
            else if ([@"m-" isEqual:operation]){
                tempStore = tempStore - operand;}
            else if ([@"mr" isEqual:operation]){
                operand = tempStore;}
            else if ([@"mc" isEqual:operation]){
                tempStore = 0.0;}
            else if ([@"C" isEqual:operation]){
                tempStore = 0.0;
                operand = 0.0;
                waitingOperand = 0.0;
                waitingOperation = nil;
            }

              else {
        [self performWaitingOperation];
        waitingOperation = operation;
        waitingOperand = operand;
    }
    return operand;
}
@end
