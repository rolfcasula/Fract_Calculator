//
//  Fraction.m
//  Fraction_Calculator
//
//  Created by Rolf Alexandro Casula on 20/10/2013.
//  Copyright © 2013 Rolf Alexandro Casula. All rights reserved.
//

#import "Fraction.h"

@implementation Fraction
{
    BOOL denominatorsAreEqual;
}

#pragma mark - Properties

@synthesize numerator, denominator;

#pragma mark - Setter

-(void) setTo: (int) n over: (int) d
{
    numerator = n;
    denominator = d;
}

#pragma mark - Arithmetic Operations Methods

-(Fraction *) add: (Fraction *) f
{
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

#pragma mark - Reduce (fraction in lowest terms) Method

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

#pragma mark - Conversion Methods

-(double) convertToNum
{
    if (denominator != 0)
        return (double) numerator / denominator;
    else
        return NAN;
}

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

#pragma mark - Negative Number Method

-(Fraction *) negativeNumber: (Fraction *) f
{
    Fraction *result = [[Fraction alloc] init];
    result.numerator = -f.numerator;
    result.denominator = f.denominator;
    return result;
}

@end
