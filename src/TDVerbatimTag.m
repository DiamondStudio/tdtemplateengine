//
//  TDVerbatimTag.m
//  TDTemplateEngine
//
//  Created by Todd Ditchendorf on 4/7/14.
//  Copyright (c) 2014 Todd Ditchendorf. All rights reserved.
//

#import "TDVerbatimTag.h"
#import <TDTemplateEngine/TDTemplateContext.h>

@implementation TDVerbatimTag

+ (NSString *)tagName {
    return @"verbatim";
}


+ (TDTagType)tagType {
    return TDTagTypeBlock;
}


- (void)dealloc {
    
    [super dealloc];
}


- (void)doTagInContext:(TDTemplateContext *)ctx {
    //NSLog(@"%s %@", __PRETTY_FUNCTION__, self);
    TDAssert(ctx);
    
    [ctx renderBody:self];
}

@end
