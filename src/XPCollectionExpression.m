//
//  XPCollectionExpression.m
//  TDTemplateEngine
//
//  Created by Todd Ditchendorf on 4/3/14.
//  Copyright (c) 2014 Todd Ditchendorf. All rights reserved.
//

#import "XPCollectionExpression.h"
#import <TDTemplateEngine/TDTemplateContext.h>

@interface XPCollectionExpression ()
@property (nonatomic, retain) NSArray *keys;
@property (nonatomic, retain) NSArray *values;
@property (nonatomic, assign) NSInteger current;
@property (nonatomic, assign) BOOL started;
@end

@implementation XPCollectionExpression

+ (instancetype)collectionExpressionWithVariable:(NSString *)var {
    return [[[self alloc] initWithVariable:var] autorelease];
}


- (instancetype)initWithVariable:(NSString *)var {
    self = [super init];
    if (self) {
        self.var = var;
    }
    return self;
}


- (void)dealloc {
    self.var = nil;
    self.keys = nil;
    self.values = nil;
    [super dealloc];
}


#pragma mark -
#pragma mark XPEnumeration

- (void)beginInContext:(TDTemplateContext *)ctx {
    TDAssert([_var length]);
    id col = [ctx resolveVariable:_var];
    
    if ([col isKindOfClass:[NSArray class]]) {
        self.keys = nil;
        self.values = col;
    } else if ([col isKindOfClass:[NSSet class]]) {
        self.keys = nil;
        self.values = [col allObjects];
    } else if ([col isKindOfClass:[NSDictionary class]]) {
        self.keys = [col allKeys];
        self.values = [col allObjects];
    } else {
        [NSException raise:@"" format:@""]; // TODO
    }
    
    self.current = 0;
}


- (id)evaluateInContext:(TDTemplateContext *)ctx; {
    if (!_started) {
        [self beginInContext:ctx];
        self.started = YES;
    }
    
    id result = nil;
    if ([self hasMore]) {
        if (_keys) {
            id key = _keys[_current];
            TDAssert(key);
            id val = _values[_current];
            TDAssert(val);
            result = @[key, val];
        } else {
            result = _values[_current];
            TDAssert(result);
        }
        self.current++;
    } else {
        self.started = NO;
    }
    
    return result;
}


- (BOOL)hasMore {
    return _current < [_values count];
}

@end