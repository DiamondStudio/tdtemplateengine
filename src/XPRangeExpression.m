//
//  XPRangeExpression.m
//  TDTemplateEngine
//
//  Created by Todd Ditchendorf on 4/2/14.
//  Copyright (c) 2014 Todd Ditchendorf. All rights reserved.
//

#import "XPRangeExpression.h"

@interface XPRangeExpression ()
@property (nonatomic, retain) NSArray *range;
@property (nonatomic, assign) NSInteger current;
@end

@implementation XPRangeExpression

+ (instancetype)rangeExpressionWithStart:(XPExpression *)start stop:(XPExpression *)stop by:(XPExpression *)by {
    return [[[self alloc] initWithStart:start stop:stop by:by] autorelease];
}


- (instancetype)initWithStart:(XPExpression *)start stop:(XPExpression *)stop by:(XPExpression *)by {
    self = [super init];
    if (self) {
        self.start = start;
        self.stop = stop;
        self.by = by;
    }
    return self;
}


- (void)dealloc {
    self.start = nil;
    self.stop = nil;
    self.by = nil;
    self.range = nil;
    [super dealloc];
}


#pragma mark -
#pragma mark XPEnumeration

- (void)beginInContext:(TDTemplateContext *)ctx {
    NSInteger start = [_start evaluateAsNumberInContext:ctx];
    NSInteger stop = [_stop evaluateAsNumberInContext:ctx];
    NSInteger step = [_by evaluateAsNumberInContext:ctx];
    
    NSMutableArray *range = [NSMutableArray array];
    NSInteger val = 0;
    
    BOOL(^test)(NSInteger);
    
    if (step > 0) {
        test = ^BOOL(NSInteger val) {
            return val < stop;
        };
    } else if (step < 0) {
        test = ^BOOL(NSInteger val) {
            return val > stop;
        };
    } else {
        [NSException raise:@"" format:@""]; // TODO
        return;
    }

    // For a positive step, the contents of a range r are determined by the formula
    // `r[i] = start + step*i` where `i >= 0 && r[i] < stop`.
    
    // For a negative step, the contents of the range are still determined by the formula
    // `r[i] = start + step*i`, but the constraints are `i >= 0 && r[i] > stop`.

    for (NSInteger i = 0; ; ++i) {
        val = start + step*i;
        if (i >= 0 && test(val)) {
            [range addObject:@(val)];
        } else {
            break;
        }
    }

    self.range = range;
    self.current = 0;
}


- (id)next {
    id result = nil;
    if ([self hasMore]) {
        result = _range[_current];
        self.current++;
    }
    return result;
}


- (BOOL)hasMore {
    return _current < [_range count];
}

@end
