// The MIT License (MIT)
//
// Copyright (c) 2014 Todd Ditchendorf
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

#import "TDTag.h"
#import "TDNode.h"

@interface TDTag ()
@property (nonatomic, assign) BOOL incomplete;
@property (nonatomic, assign) TDNode *node; // node backpointer. weakref
@end

@implementation TDTag

+ (NSString *)tagName {
    NSAssert2(0, @"%s is an abstract method and must be implemented in %@", __PRETTY_FUNCTION__, [self class]);
    return nil;
}


+ (TDTagType)tagType {
    NSAssert2(0, @"%s is an abstract method and must be implemented in %@", __PRETTY_FUNCTION__, [self class]);
    return 0;
}


- (void)dealloc {
    self.expression = nil;
    self.parent = nil;
    self.children = nil;
    self.node = nil;
    [super dealloc];
}


- (void)doTagInContext:(TDTemplateContext *)ctx {
    NSAssert2(0, @"%s is an abstract method and must be implemented in %@", __PRETTY_FUNCTION__, [self class]);
}


- (TDTag *)firstAncestorOfTagName:(NSString *)tagName {
    NSParameterAssert([tagName length]);

    TDTag *result = _parent;
    while (result && ![result.tagName isEqualToString:tagName]) {
        result = result.parent;
    }
    return result;
}


- (NSString *)tagName {
    return [[self class] tagName];
}


- (void)addChild:(TDTag *)child {
    TDAssert(child);
    if (!_children) {
        self.children = [NSMutableArray array];
    }
    [_children addObject:child];
}

@end
