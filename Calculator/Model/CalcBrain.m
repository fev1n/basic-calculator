//
//  CalcBrain.m
//  Lab2
//
//  Created by Fevin Patel on 2023-09-18.
//

#import "CalcBrain.h"

// Making the items array private by putting it in @interface block in main file
@interface CalcBrain()
@property (nonatomic, strong) NSMutableArray* items;
@end

@implementation CalcBrain

-(NSMutableArray*)items{
    if(_items==nil) {
        _items = [[NSMutableArray alloc]init];
    }
    return _items;
}

// Adds a new number to MuttableArray "items"
-(void) pushltem: (double) number {
    [self.items addObject: [[NSNumber alloc]initWithDouble:number]];
}

// Removes last number from the array called "items"
-(double)popItem {
    double result = [[self.items lastObject] doubleValue];
    [self.items removeLastObject];
    return result;
}

// Add, Subtract, Multiply and Divide operations to caluculate as required
-(double) calculate:(NSString *)operation {
    
    // Creating the double types variables while assigning the value to popItem() method
    double number1 = [self popItem];
    double number2 = [self popItem];
    
    // Why "isEqualToString" and not "==" for comparison?
    // Explanation: Using the "isEqualToString" function ensures that the contents of both strings are being compared without making strong checks between them, such as checking whether their memory locations are the same. If we use "==" to compare them, it will check if both string objects are the same instance in memory.

    if([operation isEqualToString:@"+"]){
        return number1 + number2;
    }
    else if([operation isEqualToString:@"-"]){
        return number2 - number1;
    }
    else if([operation isEqualToString:@"/"] || [operation isEqualToString:@"÷"]){
        if(number2 != 0){
            return number2 / number1;
        }
        else {
            NSLog(@"Error: Division by 0!");
            return -1;
        }
    }
    else if([operation isEqualToString:@"*"] || [operation isEqualToString:@"x"]) {
        return number2 * number1;
    }
    else {
        NSLog(@"Error: Invalid operation symbol input! Please select one from [ + , - , * or / ]\n");
    }
    return -1;
}
@end
