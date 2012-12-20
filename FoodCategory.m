//
//  Category.m
//  Alaminute
//
//  Created by Tom Adriaenssen on 21/12/12.
//  Copyright (c) 2012 Tom Adriaenssen. All rights reserved.
//

#import "FoodCategory.h"

@implementation FoodCategory

+ (FoodCategory*)categoryWithId:(NSString*)categoryId name:(NSString*)name {
    FoodCategory* cat = [FoodCategory new];
    cat.categoryId = categoryId;
    cat.name = name;
    return cat;
}

- (BOOL)isEqual:(id)object {
    return [object isKindOfClass:[FoodCategory class]] && [[object categoryId] isEqualToString:self.categoryId];
}

- (NSUInteger)hash {
    return [[self categoryId] hash];
}

@end
