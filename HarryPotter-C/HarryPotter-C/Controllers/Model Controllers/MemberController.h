//
//  MemberController.h
//  HarryPotter-C
//
//  Created by Jordan Bryant on 10/1/20.
//  Copyright © 2020 Jordan Bryant. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Member.h"

NS_ASSUME_NONNULL_BEGIN

@interface MemberController : NSObject

+(void)fetchMemberWithID:(NSString *)memberId completion:(void (^) (Member *_Nullable))completion;

@end

NS_ASSUME_NONNULL_END
