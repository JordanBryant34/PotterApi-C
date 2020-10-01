//
//  Member.m
//  HarryPotter-C
//
//  Created by Jordan Bryant on 10/1/20.
//  Copyright © 2020 Jordan Bryant. All rights reserved.
//

#import "Member.h"

@implementation Member

static NSString * const nameKey = @"name";
static NSString * const roleKey = @"role";

- (instancetype)initWithName:(NSString *)name role:(NSString *)role {
    
    self = [super init];
    
    if (self) {
        _name = name;
        _role = role;
    }
    
    return self;
}

@end

@implementation Member (JSONConvertable)

- (instancetype)initWithDictionary:(NSDictionary<NSString *,id> *)dictionary {
    NSString *name = dictionary[nameKey];
    NSString * _Nullable role = dictionary[roleKey];

    return [[Member alloc] initWithName:name role:role];
}

@end
