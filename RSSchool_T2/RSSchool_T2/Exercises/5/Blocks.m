#import "Blocks.h"

NSArray *array;

@implementation Blocks

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        __block NSArray *array = @[];
        _blockA = ^(NSArray *arr) {
            array = arr;
        };
        _blockA = [_blockA copy];
        _blockB = ^(Class class) {
            NSObject *res = [[NSObject alloc] init];
            NSString *strRes = @"";
             int valueRes = 0;
            NSDate *dateRes = [NSDate dateWithTimeIntervalSince1970:0];;
            for (int i = 0; i < [array count]; i++) {
                if ([[array objectAtIndex:i] isKindOfClass:class]) {
                    if ([[class description] isEqualToString: @"NSString"]) {
                        strRes = [strRes stringByAppendingString: [array objectAtIndex: i]];
                        res = strRes;
                    }
                    if ([[class description] isEqualToString: @"NSNumber"]) {
                        valueRes += [[array objectAtIndex: i] intValue];
                        res = [NSNumber numberWithInt: valueRes];
                    }
                    if ([[class description] isEqualToString: @"NSDate"]) {
                        
                        dateRes = [dateRes laterDate: [array objectAtIndex: i]];
                        NSDateFormatter *formater = [[NSDateFormatter alloc] init];
                        formater.dateFormat = @"dd.MM.yyyy";
                        res = [formater stringFromDate: dateRes];
                        
                    }
                }
            }
            _blockC(res);
        };
        _blockB = [_blockB copy];
        _blockC = ^(NSObject *result){};
    }
    return self;
}

@end

