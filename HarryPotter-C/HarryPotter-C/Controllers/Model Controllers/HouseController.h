//
//  HouseController.h
//  HarryPotter-C
//
//  Created by Jordan Bryant on 10/1/20.
//  Copyright © 2020 Jordan Bryant. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "House.h"

NS_ASSUME_NONNULL_BEGIN

@interface HouseController : NSObject

+(void)fetchHouses:(void (^) (NSArray<House *> *_Nullable))completion;

@end

NS_ASSUME_NONNULL_END
