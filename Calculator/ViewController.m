//
//  ViewController.m
//  Calculator
//
//  Created by Fevin Patel on 2023-09-28.
//

#import "ViewController.h"
#import "Model/CalcBrain.h"

@interface ViewController ()
@property (nonatomic) CalcBrain *calc;
@property bool isNewNumber;
@property double result;

//Outlet for label to display inputs & result
@property (weak, nonatomic) IBOutlet UILabel *calcDisplay;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.isNewNumber = YES;
    //Initializer
    self.calc = [[CalcBrain alloc]init];
}

// Actions:
// Action for enter button press
- (IBAction)Enter_pressed:(UIButton *)sender {
    [self.calc pushltem:self.calcDisplay.text.doubleValue];
    self.isNewNumber = YES;
    self.calcDisplay.text = @"0";
}

// Action for operands buttons press
- (IBAction)oprator_pressed:(UIButton *)sender {
    self.calcDisplay.text = sender.titleLabel.text;
    
    // Calculates 2 numbers as per pressed operands using calculate()
    self.result = [self.calc calculate:self.calcDisplay.text];
    
    // Converts the result from doubnle to String to put it into label
    NSString *resultInString = [NSString stringWithFormat:@"%.3f", self.result];
    self.calcDisplay.text = resultInString;
}

// Action for numeric buttons press
- (IBAction)DigitPressed:(UIButton *)sender {
    if(self.isNewNumber){
        self.calcDisplay.text = sender.titleLabel.text;
        self.isNewNumber = NO;
    }
    else {
        // Appends to string if the some number is already pressed and into the label
        self.calcDisplay.text = [NSString stringWithFormat:@"%@%@", self.calcDisplay.text, sender.titleLabel.text];
    }
}

@end
