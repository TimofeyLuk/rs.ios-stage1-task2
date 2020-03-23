#import "TimeConverter.h"

@implementation TimeConverter
// Complete the following function
- (NSString*)convertFromHours:(NSString*)hours minutes:(NSString*)minutes {
    
    NSNumber *numberValue = [NSNumber numberWithInt: [hours intValue]];
    NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
    [numberFormatter setNumberStyle:NSNumberFormatterSpellOutStyle];
    NSString *hoursToWord = [numberFormatter stringFromNumber:numberValue];
    
    if ([minutes intValue] == 0) {
        hoursToWord = [hoursToWord stringByAppendingString: @" o' clock"];
    }
    if ([minutes intValue] > 0 && [minutes intValue] < 15) {
        numberValue = [NSNumber numberWithInt: [minutes intValue]];
        NSString *minutsToWord = [numberFormatter stringFromNumber:numberValue];
        hoursToWord = [[minutsToWord stringByAppendingString:@" minutes past "] stringByAppendingString: hoursToWord];
    }
    if ([minutes intValue] == 15) {
        hoursToWord = [@"quarter past " stringByAppendingString: hoursToWord];
    }
    if ([minutes intValue] == 30) {
        hoursToWord = [@"half past " stringByAppendingString: hoursToWord];
    }
    if ([minutes intValue] > 30 && [minutes intValue] != 45) {
        
        numberValue = [NSNumber numberWithInt: [hours intValue] + 1];
        hoursToWord = [numberFormatter stringFromNumber:numberValue];
        numberValue = [NSNumber numberWithInt: 60 - [minutes intValue]];
        NSMutableString *minutsToWord =  [[NSMutableString alloc] initWithFormat: [numberFormatter stringFromNumber:numberValue]];
        
        minutsToWord = [minutsToWord stringByReplacingOccurrencesOfString:@"-" withString:@" "];
        
        hoursToWord = [[minutsToWord stringByAppendingString:@" minutes to "] stringByAppendingString: hoursToWord];
    }
    if ([minutes intValue] == 45) {
        numberValue = [NSNumber numberWithInt: [hours intValue] + 1];
        hoursToWord = [numberFormatter stringFromNumber:numberValue];
        hoursToWord = [@"quarter to " stringByAppendingString: hoursToWord];
    }
    if ([minutes intValue] > 59 || [hours intValue] > 12) {
        return @"";
    }
    
    
    return hoursToWord;
}
@end
