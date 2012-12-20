//
//  Food.h
//  Alaminute
//
//  Created by Tom Adriaenssen on 21/12/12.
//  Copyright (c) 2012 Tom Adriaenssen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Food : NSObject

@property (nonatomic, strong) NSString* foodId;
@property (nonatomic, strong) NSString* name;
@property (nonatomic, strong) FoodCategory* category;
@property (nonatomic, strong) NSArray* ingredients;

+ (Food*)foodFromDictionary:(NSDictionary*)dictionary;

@end
