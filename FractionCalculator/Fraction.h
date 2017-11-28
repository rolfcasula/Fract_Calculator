//
//  Fraction.h
//  Fraction_Calculator
//
//  Created by Rolf Alexandro Casula on 20/10/2013.
//  Copyright © 2015 Rolf Alexandro Casula. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Fraction : NSObject

#pragma mark - Properties

@property int numerator, denominator;

-(void)         setTo: (int) n over: (int) d;

#pragma mark - Methods

-(Fraction *)   add: (Fraction *) f;
-(Fraction *)   subtract: (Fraction *) f;
-(Fraction *)   multiply: (Fraction *) f;
-(Fraction *)   divide: (Fraction *) f;

-(void)         reduce;

-(double)       convertToNum;
-(NSString *)   convertToString;

-(Fraction *)   negativeNumber: (Fraction *) f;

@end
