//
//  Fraction.m
//  Fraction_Calculator
//
//  Created by Rolf Alexandro Casula on 26/11/2015.
//  Copyright © 2015 Rolf Alexandro Casula. All rights reserved.
//

#import "Fraction.h"

@implementation Fraction
{
    BOOL denominatorsAreEqual;
}

@synthesize numerator, denominator;

/* ----------------------------------------------------------------------------------------------------------------------- */

// let's set the value of the numerator and denominater of our fraction

-(void) setTo: (int) n over: (int) d
{
    numerator = n;
    denominator = d;
}

/* ----------------------------------------------------------------------------------------------------------------------- */

-(void) print
{
    NSLog (@"%i/%i", numerator, denominator);
}

/* ----------------------------------------------------------------------------------------------------------------------- */

// By calling this method we cast a double in order to return as a final result a floating point number instead of a fraction

-(double) convertToNum
{
    if (denominator != 0)
        return (double) numerator / denominator;
    else
        return NAN;
}

/* ----------------------------------------------------------------------------------------------------------------------- */

// Converting an int into a string in order it can be displayed in our calculator

-(NSString *) convertToString
{
    if (numerator == denominator)
        if (numerator == 0)
            return @"0";
        else
            return @"1";
    else if (denominator == 1)
        return [NSString stringWithFormat: @"%i", numerator];
    else
        return [NSString stringWithFormat: @"%i/%i", numerator, denominator];
}

/* ----------------------------------------------------------------------------------------------------------------------- */

// add a Fraction to the receiver

-(Fraction *) add: (Fraction *) f
{
    
    // To add two fractions:
    // a/b + c/d = ((a*d) + (b*c)) / (b * d)
    
    // result will store the result of the addition
    
    Fraction *result = [[Fraction alloc] init];
    
    result.numerator = numerator * f.denominator + denominator * f.numerator;
    result.denominator = denominator * f.denominator;
    
    [result reduce];
    return result;
}

-(Fraction *) subtract: (Fraction *) f;
{
    Fraction *result = [[Fraction alloc] init];
    
    result.numerator = numerator * f.denominator - denominator * f.numerator;
    result.denominator = denominator * f.denominator;
    
    [result reduce];
    return result;
}

-(Fraction *) multiply: (Fraction *) f
{
    Fraction *result = [[Fraction alloc] init];
    
    result.numerator = numerator * f.numerator;
    result.denominator = denominator * f.denominator;
    
    [result reduce];
    return result;
}

-(Fraction *) divide: (Fraction *) f
{
    Fraction *result = [[Fraction alloc] init];
    
    result.numerator = numerator * f.denominator;
    result.denominator = denominator * f.numerator;
    
    [result reduce];
    return result;
}

/* ----------------------------------------------------------------------------------------------------------------------- */

// We want to find the greatest common divisor (gcd); this method will be called every time we perform an arithmetic operation

- (void) reduce
{
    int u = numerator;
    int v = denominator;
    int temp;
    
    if (u <0)
        u = -u;
    
    while (v != 0) {
        temp = u % v;
        u = v;
        v = temp;
    }
    
    numerator /= u;
    denominator /= u;
}

/* ----------------------------------------------------------------------------------------------------------------------- */

// Created this method to operate with negative numbers

-(Fraction *) negativeNumber: (Fraction *) f
{
    Fraction *result = [[Fraction alloc] init];
    result.numerator = -f.numerator;
    result.denominator = f.denominator;
    return result;
}

@end
