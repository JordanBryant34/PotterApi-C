//
//  House.m
//  HarryPotter-C
//
//  Created by Jordan Bryant on 10/1/20.
//  Copyright © 2020 Jordan Bryant. All rights reserved.
//

#import "House.h"

@implementation House

static NSString * const nameKey = @"name";
static NSString * const headOfHouseKey = @"headOfHouse";
static NSString * const founderKey = @"founder";
static NSString * const membersKey = @"members";

- (instancetype)initWithName:(NSString *)name headOfHouse:(NSString *)headOfHouse founder:(NSString *)founder members:(NSArray<NSString *> *)members {
    
    self = [super init];
    
    if (self) {
        _name = name;
        _headOfHouse = headOfHouse;
        _founder = founder;
        _members = members;
    }
    
    return self;
}

@end

@implementation House (JSONConvertable)

- (instancetype)initWithDictionary:(NSDictionary<NSString *,id> *)dictionary {
    NSString *name = dictionary[nameKey];
    NSString *headOfHouse = dictionary[headOfHouseKey];
    NSString *founder = dictionary[founderKey];
    NSArray<NSString *> *members = dictionary[membersKey];
    
    return [[House alloc] initWithName:name headOfHouse:headOfHouse founder:founder members:members];
}

@end
