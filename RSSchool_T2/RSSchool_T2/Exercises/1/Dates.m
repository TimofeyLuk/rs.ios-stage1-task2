#import "Dates.h"

@implementation Dates

- (NSString *)textForDay:(NSString *)day month:(NSString *)month year:(NSString *)year {
    
    NSDateFormatter *formater = [[NSDateFormatter alloc] init];
    
    formater.dateFormat = @"dd-MM-yyyy";
    NSString *dateString = [NSString stringWithFormat:@"%@-%@-%@", day, month, year];
    
    NSDate *date = [formater dateFromString:dateString];
    formater.dateFormat = @"dd MMMM, EEEE";
    formater.locale = [NSLocale localeWithLocaleIdentifier: @"ru_RU"];
    NSString *res = [formater stringFromDate: date];
    
    if (res != nil) {
        return res;
    }
    
    return @"Такого дня не существует";
}

@end
