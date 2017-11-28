//
//  Calculator.m
//  Fraction_Calculator
//
//  Created by Rolf Alexandro Casula on 20/10/2013.
//  Copyright © 2015 Rolf Alexandro Casula. All rights reserved.
//

#import "Calculator.h"

@implementation Calculator

#pragma mark - Properties

@synthesize operand1, operand2, accumulator;

#pragma mark - Initializer

-(id) init {
    self = [super init];
    if (self) {
        operand1 = [[Fraction alloc] init];
        operand2 = [[Fraction alloc] init];
        accumulator = [[Fraction alloc] init];
    }
    return self;
}

#pragma mark - Perform Arithmetic Operation Method

-(Fraction *) performOperation: (char) op
{
    Fraction *result;
    
    switch (op) {
        case '+':
            result = [operand1 add: operand2];
            break;
        case '-':
            result = [operand1 subtract: operand2];
            break;
        case '*':
            result = [operand1 multiply: operand2];
            break;
        case '/':
            result = [operand1 divide: operand2];
            break;
    }
    accumulator.numerator = result.numerator;
    accumulator.denominator = result.denominator;
    
    return accumulator;
}

#pragma mark - Clear Method

-(void) clear {
    accumulator.numerator = 0;
    accumulator.denominator = 0;
}

@end
