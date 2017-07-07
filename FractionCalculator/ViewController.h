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

-(IBAction) clickDigit: (UIButton *) sender;

-(IBAction) clickPlus;
-(IBAction) clickMinus;
-(IBAction) clickMultiply;
-(IBAction) clickDivide;

-(IBAction) clickOver;
-(IBAction) clickEquals;
-(IBAction) convertToNumber;
-(IBAction) clickClear;

-(void) commonStatements;
-(int) setOldOp: (int) op;
-(void) processDigit: (int) digit;
-(void) processOp: (char) theOp;
-(void) storeFracPart;

@end

