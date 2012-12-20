//
//  FoodCell.m
//  Alaminute
//
//  Created by Tom Adriaenssen on 20/12/12.
//  Copyright (c) 2012 Tom Adriaenssen. All rights reserved.
//

#import "FoodCell.h"

@implementation FoodCell

- (id)initWithReuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
    if (self) {
        self.textLabel.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:17];
    }
    
    return self;
}

- (void)configure:(Food*)food {
    self.textLabel.text = [food name];
}

@end
