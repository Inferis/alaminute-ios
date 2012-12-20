//
//  Backend.m
//  Alaminute
//
//  Created by Tom Adriaenssen on 20/12/12.
//  Copyright (c) 2012 Tom Adriaenssen. All rights reserved.
//

#import "Backend.h"

@implementation Backend {
    NSArray* _food;
    NSArray* _categories;
}

- (NSArray *)allCategories {
    return _categories;
}

- (NSArray *)allFood {
    return _food;
}

- (void)updateWithProgress:(void(^)(NSString* progress))progress completion:(void(^)(NSError* error))completion {
    if (!progress) progress = ^(NSString* p) {};
    if (!completion) completion = ^(NSError* e) {};
    
    progress(@"Slicing...");
    [TIN get:@"categories" success:^(TinResponse *response) {
        if (response.parsedResponse) {
            _categories = [[response.parsedResponse allKeys] map:^id(id obj) {
                return [FoodCategory categoryWithId:obj name:response.parsedResponse[obj]];
            }];
            progress(@"Dicing...");
            [TIN get:@"food" success:^(TinResponse *response) {
                if (response.parsedResponse) {
                    _food = [response.parsedResponse map:^id(id obj) {
                        return [Food foodFromDictionary:obj];
                    }];
                    completion(nil);
                    return;
                }
                
                completion(response.error);
            }];
            return;
        }
        
        completion(response.error);
    }];
}

- (int)countFoodInCategory:(FoodCategory*)category {
    return [[_food select:^BOOL(Food* obj) {
        return [obj.category isEqual:category];
    }] count];
}

- (NSArray*)foodInCategory:(FoodCategory*)category {
    return [_food select:^BOOL(Food* obj) {
        return [obj.category isEqual:category];
    }];
}



@end