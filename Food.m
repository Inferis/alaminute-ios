//
//  Food.m
//  Alaminute
//
//  Created by Tom Adriaenssen on 21/12/12.
//  Copyright (c) 2012 Tom Adriaenssen. All rights reserved.
//

#import "Food.h"

@implementation Food

+ (Food*)foodFromDictionary:(NSDictionary*)dictionary {
    Food* food = [Food new];
    food.foodId = dictionary[@"id"];
    food.name = dictionary[@"name"];
    NSString* categoryId = [[dictionary[@"category"] allKeys] first];
    food.category = [FoodCategory categoryWithId:categoryId name:dictionary[@"category"][categoryId]];
    food.ingredients = [NSArray array]; // TODO
    return food;
}


@end
