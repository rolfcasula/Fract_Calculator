//
//  ViewController.h
//  Fraction_Calculator
//
//  Created by Rolf Alexandro Casula on 20/10/2013.
//  Copyright © 2013 Rolf Alexandro Casula. All rights reserved.
//

// https://github.com/expressionistartist/FractCalculator

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

#pragma mark - Outlet

@property (strong, nonatomic) IBOutlet UILabel *display;

#pragma mark - Actions

-(IBAction) clickDigit: (UIButton *) sender;

-(IBAction) clickPlus;
-(IBAction) clickMinus;
-(IBAction) clickMultiply;
-(IBAction) clickDivide;

-(IBAction) clickOver;
-(IBAction) clickEquals;
-(IBAction) convertToNumber;
-(IBAction) clickClear;

#pragma mark - Methods

-(void) commonStatements;
-(int) setOldOp: (int) op;
-(void) processDigit: (int) digit;
-(void) processOp: (char) theOp;
-(void) storeFracPart;

@end

