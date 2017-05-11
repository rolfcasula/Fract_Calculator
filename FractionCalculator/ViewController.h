//
//  ViewController.h
//  Fraction_Calculator
//
//  Created by Rolf Alexandro Casula on 26/11/2015.
//  Copyright © 2015 Rolf Alexandro Casula. All rights reserved.
//

// https://github.com/expressionistartist/FractCalculator

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (strong, nonatomic) IBOutlet UILabel *display;

// New methods just added later (to fix a few bugs with negative numbers)

-(int) setOldOp: (int) op;
-(void) processDigit: (int) digit;
-(void) processOp: (char) theOp;
-(void) storeFracPart;

// Numeric keys

-(IBAction) clickDigit: (UIButton *) sender;

// Arithmetic Operation keys

-(IBAction) clickPlus;
-(IBAction) clickMinus;
-(IBAction) clickMultiply;
-(IBAction) clickDivide;

// Misc. Keys

-(IBAction) clickOver;
-(IBAction) clickEquals;
-(IBAction) convertToNumber;
-(IBAction) clickClear;
-(void) commonStatements;

@end

