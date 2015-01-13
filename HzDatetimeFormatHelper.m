//
//  HzDatetimeFormatHelper.m
//  FastcompanyiPhone
//
//  Created by Zander Harrison on 14/12/15.
//  Copyright (c) 2014年 kevin. All rights reserved.
//

#import "HzDatetimeFormatHelper.h"

@interface HzDatetimeFormatHelper ()

@property (strong, nonatomic) NSDateFormatter *dateFormatter;

+ (instancetype)sharedInstance;

@end

@implementation HzDatetimeFormatHelper

#pragma mark - Private Interfaces

+ (instancetype)sharedInstance{
    static HzDatetimeFormatHelper *instance = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        instance = [[self alloc] init];
        instance.dateFormatter = [[NSDateFormatter alloc] init];
        [instance.dateFormatter setTimeZone:[NSTimeZone timeZoneWithName:@"Asia/Hong_Kong"]];
        
    });
    
    return instance;
}

#pragma mark - Public Interfaces

+ (NSString *)dateStringFromSource:(NSString *)source withFormat:(NSString *)sourceFormat toFormat:(NSString *)destFormat{
    HzDatetimeFormatHelper *helper = [HzDatetimeFormatHelper sharedInstance];
    if (!source || !sourceFormat || !destFormat) {
        return nil;
    }
    
    [helper.dateFormatter setDateFormat:sourceFormat];
    NSDate *tempDate = [helper.dateFormatter dateFromString:source];
    [helper.dateFormatter setDateFormat:destFormat];
    return [helper.dateFormatter stringFromDate:tempDate];
}

+ (NSString *)dateStringForTimestamp:(NSTimeInterval)timeStamp withFormat:(NSString *)format{
    NSString *expectedFormat = format;
    if (!format || format.length == 0) {
        expectedFormat = @"yyyy-MM-dd";
    }
    HzDatetimeFormatHelper *helper = [HzDatetimeFormatHelper sharedInstance];
    [helper.dateFormatter setDateFormat:expectedFormat];
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:timeStamp];
    return [helper.dateFormatter stringFromDate:date];
}

+ (NSTimeInterval)timeFromDatestring:(NSString *)source withFormat:(NSString *)sourceFormat{
    if (!source) {
        return 0.0;
    }
    
    NSString *expectedFormat = sourceFormat;
    if (!sourceFormat || sourceFormat.length == 0) {
        expectedFormat = @"yyyy-MM-dd";
    }
    HzDatetimeFormatHelper *helper = [HzDatetimeFormatHelper sharedInstance];
    [helper.dateFormatter setDateFormat:expectedFormat];
    NSDate *date = [helper.dateFormatter dateFromString:source];
    return [date timeIntervalSince1970];
}

@end
