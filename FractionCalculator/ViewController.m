//
//  ViewController.m
//  Fraction_Calculator
//
//  Created by Rolf Alexandro Casula on 26/11/2015.
//  Copyright © 2015 Rolf Alexandro Casula. All rights reserved.
//

#import "ViewController.h"
#import "Calculator.h"

@interface ViewController ()

@end

@implementation ViewController
{
    char op, oldOp;
    int currentNumber;
    BOOL clickOverPressed;
    BOOL operationPressed;
    
    BOOL firstOperand, isNumerator;
    BOOL isNegative;
    BOOL denominatorEqualToZero;
    BOOL processOpAlreadyUsed;
    Calculator *myCalculator;
    NSMutableString *displayString;
    BOOL digitClicked;
}

#pragma mark - Property

@synthesize display;

/* ----------------------------------------------------------------------------------------------------------------------- */

#pragma mark - IBAction

/* ----------------------------------------------------------------------------------------------------------------------- */

#pragma mark

- (IBAction) clickDigit: (UIButton *) sender
{
    int digit = (int) sender.tag;
    
    [self processDigit: digit];
    digitClicked = YES;
}

/* ----------------------------------------------------------------------------------------------------------------------- */

#pragma mark

-(IBAction) clickPlus
{
    [self processOp: '+'];
}

-(IBAction) clickMinus
{
    if (!clickOverPressed && isNumerator && !operationPressed) {
       [self processOp: '-'];
        clickOverPressed = YES;
    }
    
    else if ((firstOperand && isNumerator && !digitClicked) || (!firstOperand && isNumerator && !digitClicked)) {
        [displayString appendString:@"-"];
        display.text = displayString;
        isNegative = YES;
        clickOverPressed = NO;
        operationPressed = NO;
    }
    else {
        [self processOp: '-'];
    }
}

-(IBAction) clickMultiply
{
    [self processOp: '*'];
}

-(IBAction) clickDivide
{
    [self processOp: '/'];
}


/* ----------------------------------------------------------------------------------------------------------------------- */

#pragma mark

// Creation of a fraction (e.g. 1/3) that can be used as an operand in further arithmetic operations (e.g. 1/3 + 1/2 = 5/6)

-(IBAction) clickOver
{
    [self storeFracPart];
    isNumerator = NO;
    [displayString appendString: @"/"];
    display.text = displayString;
}

/* ----------------------------------------------------------------------------------------------------------------------- */

#pragma mark

// The result will be a reduced fraction instead of a floating point number 

-(IBAction) clickEquals
{
    [self storeFracPart];
    
    if (processOpAlreadyUsed == NO) {
        if (isNegative == YES && firstOperand) {
            myCalculator.operand1 = [myCalculator.operand1 negativeNumber: myCalculator.operand1];
        }
        if (myCalculator.operand1.denominator == 0 ) {
            displayString = [NSMutableString stringWithString: @"Error"];
            display.text = displayString;
            [self commonStatements];
            return;
        }
        
        [displayString appendString: @" = "];
        [displayString appendString: [myCalculator.operand1 convertToString]];
        display.text = displayString;
        [self commonStatements];
        return;
    }
    if (isNegative == YES) {
        myCalculator.operand2 = [myCalculator.operand2 negativeNumber: myCalculator.operand2];
    }
    if (myCalculator.operand2.denominator == 0  || (op == '/' && currentNumber == 0)) {
        displayString = [NSMutableString stringWithString: @"Error"];
        display.text = displayString;
        [self commonStatements];
        return;
    }
    [myCalculator performOperation: op];
    [displayString appendString: @" = "];
    [displayString appendString: [myCalculator.accumulator convertToString]];
    display.text = displayString;
    [self commonStatements];
}

/* ----------------------------------------------------------------------------------------------------------------------- */

#pragma mark

// The result will be a floating-point number instead of a fraction

-(IBAction) convertToNumber
{
    if ( firstOperand == NO ) {
        [self storeFracPart];
        [myCalculator performOperation: op];
        [displayString appendString:[NSString stringWithFormat: @" = %g", [myCalculator.accumulator convertToNum]]];
    }
    else {
        [self storeFracPart];
        [displayString appendString:[NSString stringWithFormat: @" = %g", [myCalculator.operand1 convertToNum]]];
    }
    display.text = displayString;
    [self commonStatements];
}

/* ----------------------------------------------------------------------------------------------------------------------- */

#pragma mark

-(IBAction) clickClear
{
    isNumerator = YES;
    firstOperand = YES;
    currentNumber = 0;
    [myCalculator clear];
    
    [displayString setString: @""];
    display.text = displayString;
    processOpAlreadyUsed = NO;
}

/* ----------------------------------------------------------------------------------------------------------------------- */

#pragma mark - UIViewController Methods

/* ----------------------------------------------------------------------------------------------------------------------- */

#pragma mark

-(void) viewDidLoad
{
    clickOverPressed = NO;
    operationPressed = NO;
    
    firstOperand = YES;
    isNumerator = YES;
    denominatorEqualToZero = NO;
    processOpAlreadyUsed = NO;
    displayString = [NSMutableString stringWithCapacity: 40];
    myCalculator = [[Calculator alloc] init];
    digitClicked = NO;
}

/* ----------------------------------------------------------------------------------------------------------------------- */

#pragma mark

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

/* ----------------------------------------------------------------------------------------------------------------------- */

#pragma mark - Helper Methods

/* ----------------------------------------------------------------------------------------------------------------------- */

#pragma mark

-(void) commonStatements
{
    currentNumber = 0;
    isNumerator = YES;
    firstOperand = YES;
    [displayString setString: @""];
    processOpAlreadyUsed = NO;                      
    isNegative = NO;
}

/* ----------------------------------------------------------------------------------------------------------------------- */

#pragma mark

-(int) setOldOp: (int) ip
{
    return oldOp = ip;
}

/* ----------------------------------------------------------------------------------------------------------------------- */

#pragma mark

-(void) processDigit: (int) digit
{
    currentNumber = currentNumber * 10 + digit;
    [displayString appendString: [NSString stringWithFormat: @"%i", digit]];
    display.text = displayString;
}

/* ----------------------------------------------------------------------------------------------------------------------- */

#pragma mark

-(void) processOp: (char) theOp
{
    NSString *opStr;
    
    op = theOp;
    
    switch (theOp) {
        case '+':
            opStr = @" + ";
            break;
        case '-':
            opStr = @" – ";
            break;
        case '*':
            opStr = @" × ";
            break;
        case '/':
            opStr = @" ÷ ";
            break;
    }
    [self storeFracPart];
    
    if (isNegative == YES && firstOperand) {
        myCalculator.operand1 = [myCalculator.operand1 negativeNumber: myCalculator.operand1];
    }
    
    if (myCalculator.operand1.denominator == 0) {
        displayString = [NSMutableString stringWithString: @"Error"];
        display.text = displayString;
        [self commonStatements];
        return;
    }
    
    if (processOpAlreadyUsed) {
        
        if (isNegative == YES) {
            myCalculator.operand2 = [myCalculator.operand2 negativeNumber: myCalculator.operand2];
        }
        if (myCalculator.operand2.denominator == 0) {
            displayString = [NSMutableString stringWithString: @"Error"];
            display.text = displayString;
            [self commonStatements];
            return;
        }
        [myCalculator performOperation: oldOp];
        
        currentNumber = myCalculator.accumulator.numerator;
        firstOperand = YES;
        [self storeFracPart];
        myCalculator.operand1.numerator = myCalculator.accumulator.numerator;
        
        isNumerator = NO;
        currentNumber = myCalculator.accumulator.denominator;
        [self storeFracPart];
        myCalculator.operand1.denominator = myCalculator.accumulator.denominator;
        currentNumber = 0;
        [myCalculator clear];
    }
    firstOperand = NO;
    isNumerator = YES;
    [displayString appendString: opStr];
    display.text = displayString;
    isNegative = NO;
    processOpAlreadyUsed = YES;
    oldOp = [self setOldOp: op];
    
    clickOverPressed = NO;
    operationPressed = YES;
    digitClicked = NO;
}

/* ----------------------------------------------------------------------------------------------------------------------- */

#pragma mark 

-(void) storeFracPart
{
    if (firstOperand) {
        if (isNumerator) {
            myCalculator.operand1.numerator = currentNumber;
            myCalculator.operand1.denominator = 1; // e.g. 3 * 4/5 =
        }
        else {
            myCalculator.operand1.denominator = currentNumber;
        }
    }
    else if (isNumerator) {
        myCalculator.operand2.numerator = currentNumber;
        myCalculator.operand2.denominator = 1; // e.g. 3/2 * 4 =
    }
    else {
        myCalculator.operand2.denominator = currentNumber;
        
        //firstOperand = YES;
    }
    currentNumber = 0;
}

/* ----------------------------------------------------------------------------------------------------------------------- */


@end
