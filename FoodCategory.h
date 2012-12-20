//
//  Category.h
//  Alaminute
//
//  Created by Tom Adriaenssen on 21/12/12.
//  Copyright (c) 2012 Tom Adriaenssen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FoodCategory : NSObject

@property (nonatomic, strong) NSString* categoryId;
@property (nonatomic, strong) NSString* name;

+ (FoodCategory*)categoryWithId:(NSString*)categoryId name:(NSString*)name;

@end
