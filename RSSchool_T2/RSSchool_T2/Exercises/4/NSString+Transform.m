#import "NSString+Transform.h"

@implementation NSString (Transform)

-(NSString*)transform {
    
    NSCharacterSet *setOfVowels = [NSCharacterSet characterSetWithCharactersInString:@"aeiouyAEIOUY"];
    NSCharacterSet *setOfConsonants = [NSCharacterSet characterSetWithCharactersInString:@"bcdfghjklmnpqrstvxzwBCDFGHJKLMNPQRSTVXZW"];
    NSMutableArray *arr = [NSMutableArray arrayWithArray: [self componentsSeparatedByString:@" "]];
    NSMutableArray *res = [[NSMutableArray alloc] init];
    
    if ([self isPangram]) {
        
        for (NSString *word in arr) {
            int coutOfVowels = 0;
            NSMutableString *changeForWord = [NSMutableString stringWithString: word];
            for (int i = 0; i < word.length; i++) {
                
                if ([setOfVowels isSupersetOfSet:[NSCharacterSet characterSetWithCharactersInString: [word substringWithRange:NSMakeRange(i, 1)]]]) {
                coutOfVowels++;
                [changeForWord replaceCharactersInRange:NSMakeRange(i, 1) withString:[[word substringWithRange:NSMakeRange(i, 1)] uppercaseString]];
                }
            }
            
             if (![changeForWord isEqualToString:@""]) {
                    changeForWord = [[NSString stringWithFormat:@"%d",coutOfVowels] stringByAppendingString: changeForWord];
                               [res addObject: changeForWord];
                           }
        }
        
        [res sortUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
            
            NSString *first = (NSString *)obj1;
            NSString *second = (NSString *)obj2;
            
            return [[first substringWithRange:NSMakeRange(0, 1)] compare:[second substringWithRange:NSMakeRange(0, 1)] options:NSCaseInsensitiveSearch];
        }];
        return [res count] != 0 ? [res componentsJoinedByString:@" "] : @"";
    }
    else
    {
        for (NSString *word in arr) {
                int coutOfConsonants = 0;
                NSMutableString *changeForWord = [NSMutableString stringWithString: word];
                for (int i = 0; i < word.length; i++) {
                    
                    if ([setOfConsonants isSupersetOfSet:[NSCharacterSet characterSetWithCharactersInString: [word substringWithRange:NSMakeRange(i, 1)]]]) {
                    coutOfConsonants++;
                    [changeForWord replaceCharactersInRange:NSMakeRange(i, 1) withString:[[word substringWithRange:NSMakeRange(i, 1)] uppercaseString]];
                    }
                }
                
                if (![changeForWord isEqualToString:@""]) {
                    changeForWord = [[NSString stringWithFormat:@"%d",coutOfConsonants] stringByAppendingString: changeForWord];
                    [res addObject: changeForWord];
                }
                
            }
            
            [res sortUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
                
                NSString *first = (NSString *)obj1;
                NSString *second = (NSString *)obj2;
                
                return [[first substringWithRange:NSMakeRange(0, 1)] compare:[second substringWithRange:NSMakeRange(0, 1)] options:NSCaseInsensitiveSearch];
            }];
            return [res count] != 0 ? [res componentsJoinedByString:@" "] : @"";;
    }
    
}

-(BOOL) isPangram {
    NSCharacterSet *setOfAlphabet = [NSCharacterSet characterSetWithCharactersInString:@"abcdefghijklmnopqrstuvwxyz"];
    return [[NSCharacterSet characterSetWithCharactersInString:[self lowercaseString]] isSupersetOfSet:setOfAlphabet];
}
@end
