//
//  Calculator.m
//  Fraction_Calculator
//
//  Created by Rolf Alexandro Casula on 26/11/2015.
//  Copyright © 2015 Rolf Alexandro Casula. All rights reserved.
//

#import "Calculator.h"

@implementation Calculator

@synthesize operand1, operand2, accumulator;              // the three properties that will be used in every single operation

/* ----------------------------------------------------------------------------------------------------------------------- */

-(id) init {                             // when this init method get called the three properties get allocated and initiated
    self = [super init];
    
    if (self) {
        operand1 = [[Fraction alloc] init];
        operand2 = [[Fraction alloc] init];
        accumulator = [[Fraction alloc] init];
    }
    return self;
}

/* ----------------------------------------------------------------------------------------------------------------------- */

-(void) clear {                                           // by calling this method we are basically resetting our calculator
    accumulator.numerator = 0;
    accumulator.denominator = 0;
}

/* ----------------------------------------------------------------------------------------------------------------------- */

// we call this method every time we have to perform one of the four basic arithmetic operation between two fractions and that returns a fraction called "accumulator"

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

@end
