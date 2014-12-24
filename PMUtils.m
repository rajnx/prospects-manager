//
//  PMUtils.m
//  prospects-manager
//
//  Created by Rajneesh . on 12/23/14.
//  Copyright (c) 2014 HCL-MSFT. All rights reserved.
//

#import "PMUtils.h"

@implementation PMUtils

+ (NSString *)sentenceCapitalizedString :(NSString*) string
{
    if (![string length])
    {
        return [NSString string];
    }
    
    NSString *uppercase = [[string substringToIndex:1] uppercaseString];
    NSString *lowercase = [[string substringFromIndex:1] lowercaseString];
    
    return [uppercase stringByAppendingString:lowercase];
}

@end
