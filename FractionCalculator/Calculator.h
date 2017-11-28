//
//  Calculator.h
//  Fraction_Calculator
//
//  Created by Rolf Alexandro Casula on 20/10/2013.
//  Copyright © 2013 Rolf Alexandro Casula. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Fraction.h"

@interface Calculator : NSObject

#pragma mark - Properties

@property (strong, nonatomic) Fraction *operand1;
@property (strong, nonatomic) Fraction *operand2;
@property (strong, nonatomic) Fraction *accumulator;

#pragma mark - Methods

-(Fraction *) performOperation: (char) op;
-(void) clear;

@end
