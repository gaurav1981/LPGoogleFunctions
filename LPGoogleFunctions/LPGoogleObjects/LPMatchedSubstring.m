//
//  LPMatchedSubstring.m
//
//  Created by Luka Penger on 7/7/13.
//  Copyright (c) 2013 Luka Penger. All rights reserved.
//

#import "LPMatchedSubstring.h"

@implementation LPMatchedSubstring

- (id)initWithCoder:(NSCoder *)coder
{
	self = [LPMatchedSubstring new];
    if (self != nil)
	{
        self.length = [coder decodeIntegerForKey:@"length"];
        self.offset = [coder decodeIntegerForKey:@"offset"];
	}
	
	return self;
}

- (void)encodeWithCoder:(NSCoder *)coder
{
    [coder encodeInteger:self.length forKey:@"length"];
    [coder encodeInteger:self.offset forKey:@"offset"];
}

+ (id)matchedSubstringWithObjects:(NSDictionary*)dictionary
{
    LPMatchedSubstring *new = [LPMatchedSubstring new];
    
    if(![dictionary isKindOfClass:[NSNull class]])
    {
        if (![[dictionary objectForKey:@"length"] isKindOfClass:[NSNull class]] && [dictionary objectForKey:@"length"] != nil) {
            new.length=[[dictionary objectForKey:@"length"] intValue];
        }
        
        if (![[dictionary objectForKey:@"offset"] isKindOfClass:[NSNull class]] && [dictionary objectForKey:@"offset"] != nil) {
            new.offset=[[dictionary objectForKey:@"offset"] intValue];
        }
    }
    
    return new;
}

- (NSDictionary*)dictionary
{
    NSMutableDictionary *dictionary = [NSMutableDictionary dictionaryWithDictionary:[self dictionaryWithValuesForKeys:[NSArray arrayWithObjects:@"length",@"offset", nil]]];
    
    return dictionary;
}

- (NSString*)description
{
    return [self dictionary].description;
}

- (id)copyWithZone:(NSZone *)zone
{
    LPMatchedSubstring *new = [LPMatchedSubstring new];
    [new setLength:[self length]];
    [new setOffset:[self offset]];
    return new;
}

@end
