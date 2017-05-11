//
//  Calculator.h
//  Fraction_Calculator
//
//  Created by Rolf Alexandro Casula on 26/11/2015.
//  Copyright © 2015 Rolf Alexandro Casula. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Fraction.h"

@interface Calculator : NSObject

// our two properties
@property (strong, nonatomic) Fraction *operand1;
@property (strong, nonatomic) Fraction *operand2;
@property (strong, nonatomic) Fraction *accumulator;


// our two methods
-(Fraction *) performOperation: (char) op;
-(void) clear;

@end
