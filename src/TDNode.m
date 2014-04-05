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

#import "TDNode.h"
#import <PEGKit/PKToken.h>

@interface TDNode ()
- (void)processFragment;
@end

@implementation TDNode

+ (instancetype)nodeWithToken:(PKToken *)frag {
    return [[[self alloc] initWithToken:frag] autorelease];
}


- (instancetype)initWithToken:(PKToken *)frag {
    NSParameterAssert(frag);
    self = [super initWithToken:frag];
    if (self) {
        [self processFragment];
    }
    return self;
}


- (void)dealloc {

    [super dealloc];
}


#pragma mark -
#pragma mark Public

- (void)processFragment {

}


- (void)renderInContext:(TDTemplateContext *)ctx {
    [self renderChildrenInContext:ctx];
}


#pragma mark -
#pragma mark Private

- (void)renderChildrenInContext:(TDTemplateContext *)ctx {
    for (TDNode *child in self.children) {
        [child renderInContext:ctx];
    }
}

@end
