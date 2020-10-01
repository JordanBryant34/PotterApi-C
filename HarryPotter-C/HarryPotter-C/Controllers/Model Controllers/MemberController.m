//
//  MemberController.m
//  HarryPotter-C
//
//  Created by Jordan Bryant on 10/1/20.
//  Copyright © 2020 Jordan Bryant. All rights reserved.
//

#import "MemberController.h"

@implementation MemberController

static NSString * const baseUrlString = @"https://www.potterapi.com/v1";
static NSString * const characterComponent = @"characters";
static NSString * const apiKey = @"$2a$10$czbyY8Pag6egkzhJZ.HZ2Obj.R7La/ZB8tcBJE5Of5TV3xZxMVqZ2";

+ (void)fetchMemberWithID:(NSString *)memberId completion:(void (^)(Member * _Nullable))completion {
    
    NSURL *baseUrl = [NSURL URLWithString:baseUrlString];
    NSURL *charactersUrl = [baseUrl URLByAppendingPathComponent:characterComponent];
    NSURL *memberUrl = [charactersUrl URLByAppendingPathComponent:memberId];
            
    NSMutableArray<NSURLQueryItem *> *queryItems = [NSMutableArray new];
    
    NSURLQueryItem *apiKeyQuery = [[NSURLQueryItem alloc] initWithName:@"key" value:apiKey];
    [queryItems addObject:apiKeyQuery];
    
    NSURLComponents *urlComponents = [[NSURLComponents alloc] initWithURL:memberUrl resolvingAgainstBaseURL:true];
    [urlComponents setQueryItems:queryItems];
    
    NSURL *finalUrl = [urlComponents URL];
    
    NSLog(@"%@", finalUrl.absoluteString);
    
    [[[NSURLSession sharedSession] dataTaskWithURL:finalUrl completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {

        if (error) {
            NSLog(@"Error fetching member: %@", error.localizedDescription);
            
            dispatch_async(dispatch_get_main_queue(), ^{
                completion(nil);
            });
        }
        
        if (!data) {
            NSLog(@"No data received from fetching member.");
        
            dispatch_async(dispatch_get_main_queue(), ^{
                completion(nil);
            });
        }
        
        NSDictionary *memberDictionary = [NSJSONSerialization JSONObjectWithData:data options: NSJSONReadingAllowFragments error: &error];
        
        NSLog(@"Dictionary for %@: %@", memberId, memberDictionary);
        
        if (memberDictionary == (NSDictionary *)[NSNull null]) {
            dispatch_async(dispatch_get_main_queue(), ^{
                completion(nil);
            });
        } else {
            Member *member = [[Member alloc] initWithDictionary:memberDictionary];
            
            dispatch_async(dispatch_get_main_queue(), ^{
                completion(member);
            });
        }
        
    }] resume];
}

@end
