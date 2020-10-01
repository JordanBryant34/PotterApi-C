//
//  House.h
//  HarryPotter-C
//
//  Created by Jordan Bryant on 10/1/20.
//  Copyright © 2020 Jordan Bryant. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface House : NSObject

@property (nonatomic, copy, readonly) NSString * name;
@property (nonatomic, copy, readonly) NSString * headOfHouse;
@property (nonatomic, copy, readonly) NSString * founder;
@property (nonatomic, copy, readonly) NSArray<NSString *> * members;

-(instancetype)initWithName:(NSString *)name headOfHouse:(NSString *)headOfHouse founder:(NSString *)founder members:(NSArray<NSString *> *)members;

@end

@interface House (JSONConvertable)

-(instancetype)initWithDictionary:(NSDictionary<NSString *, id> *)dictionary;

@end

NS_ASSUME_NONNULL_END
