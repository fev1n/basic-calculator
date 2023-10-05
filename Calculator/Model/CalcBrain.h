//
//  CalcBrain.h
//  Lab2
//
//  Created by Fevin Patel on 2023-09-18.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CalcBrain : NSObject

-(void) pushltem: (double) number;
-(double) calculate: (NSString*) operation;

@end

NS_ASSUME_NONNULL_END
