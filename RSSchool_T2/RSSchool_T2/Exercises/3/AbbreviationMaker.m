#import "AbbreviationMaker.h"

@implementation AbbreviationMaker
// Complete the abbreviation function below.
- (NSString *) abbreviationFromA:(NSString *)a toB:(NSString *)b {
    
    NSString *res = @"";
    NSMutableArray *copy = [NSMutableArray array];
    for (int i = 0; i < [a length]; i++) {
        NSString *currentCharacter = [a substringWithRange:NSMakeRange(i, 1)];
        [copy addObject: currentCharacter];
    }
    int index = -1;

    for (int i = 0; i < [b length]; i++) {
        
        NSString *currentCharacter = [b substringWithRange:NSMakeRange(i, 1)];
        int temp = (int)[copy indexOfObject:[currentCharacter lowercaseString]];
        if (temp == -1)
        {
            temp = (int)[copy indexOfObject:[currentCharacter uppercaseString]];
        }
        if (([a containsString:currentCharacter] || [a containsString: [currentCharacter uppercaseString]] || [a containsString: [currentCharacter lowercaseString]]) &&  temp > index && temp > -1) {
            res = [res stringByAppendingString: currentCharacter];
            index = temp;
        }
        
    }
    
    return  [res isEqual: b] ? @"YES" : @"NO";
}
@end
