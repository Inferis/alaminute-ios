//
//  Backend.h
//  Alaminute
//
//  Created by Tom Adriaenssen on 20/12/12.
//  Copyright (c) 2012 Tom Adriaenssen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FoodCategory.h"
#import "Food.h"

@interface Backend : NSObject

@property (nonatomic, strong, readonly) NSArray* allCategories;
@property (nonatomic, strong, readonly) NSArray* allFood;

- (void)updateWithProgress:(void(^)(NSString* progress))progress completion:(void(^)(NSError* error))completion;

- (int)countFoodInCategory:(FoodCategory*)category;
- (NSArray*)foodInCategory:(FoodCategory*)category;


@end
