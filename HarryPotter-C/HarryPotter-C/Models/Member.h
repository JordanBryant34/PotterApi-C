//
//  Member.h
//  HarryPotter-C
//
//  Created by Jordan Bryant on 10/1/20.
//  Copyright © 2020 Jordan Bryant. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Member : NSObject

@property (nonatomic, copy, readonly) NSString * name;
@property (nonatomic, copy, readonly) NSString * _Nullable role;

-(instancetype)initWithName:(NSString *)name role:(NSString * _Nullable)role;

@end

@interface Member (JSONConvertable)

-(instancetype)initWithDictionary:(NSDictionary<NSString *, id> *)dictionary;

@end

NS_ASSUME_NONNULL_END
