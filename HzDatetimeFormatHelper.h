//
//  HzDatetimeFormatHelper.h
//  FastcompanyiPhone
//
//  Created by Zander Harrison on 14/12/15.
//  Copyright (c) 2014年 kevin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HzDatetimeFormatHelper : NSObject

+ (NSString *)dateStringFromSource:(NSString *)source withFormat:(NSString *)sourceFormat toFormat:(NSString *)destFormat;
+ (NSString *)dateStringForTimestamp:(NSTimeInterval)timeStamp withFormat:(NSString *)format;
+ (NSTimeInterval)timeFromDatestring:(NSString *)source withFormat:(NSString *)sourceFormat;

@end
