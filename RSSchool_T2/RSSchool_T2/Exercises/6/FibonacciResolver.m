#import "FibonacciResolver.h"

@implementation FibonacciResolver
- (NSArray*)productFibonacciSequenceFor:(NSNumber*)number {
    
    int firs = 0;
    int second = 1;

    while (firs * second <= [number intValue]) {
        
        if (firs * second == [number intValue]) {
            return @[[NSNumber numberWithInt: firs], [NSNumber numberWithInt: second], @1];
        }
        
        int temp = firs + second;
        firs = second;
        second = temp;
    }
    return @[[NSNumber numberWithInt: firs], [NSNumber numberWithInt: second], @0];;
}
@end
