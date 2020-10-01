//
//  HouseController.m
//  HarryPotter-C
//
//  Created by Jordan Bryant on 10/1/20.
//  Copyright © 2020 Jordan Bryant. All rights reserved.
//

#import "HouseController.h"

@implementation HouseController

static NSString * const baseUrlString = @"https://www.potterapi.com/v1";
static NSString * const housesComponent = @"houses";
static NSString * const apiKey = @"$2a$10$czbyY8Pag6egkzhJZ.HZ2Obj.R7La/ZB8tcBJE5Of5TV3xZxMVqZ2";

+ (void)fetchHouses:(void (^)(NSArray<House *> * _Nullable))completion {
    
    NSURL *baseUrl = [NSURL URLWithString:baseUrlString];
    NSURL *housesUrl = [baseUrl URLByAppendingPathComponent:housesComponent];
    
    NSMutableArray<NSURLQueryItem *> *queryItems = [NSMutableArray new];
    
    NSURLQueryItem *apiKeyQuery = [[NSURLQueryItem alloc] initWithName:@"key" value:apiKey];
    [queryItems addObject:apiKeyQuery];
    
    NSURLComponents *urlComponents = [[NSURLComponents alloc] initWithURL:housesUrl resolvingAgainstBaseURL:true];
    [urlComponents setQueryItems:queryItems];
    
    NSURL *finalUrl = [urlComponents URL];
        
    [[[NSURLSession sharedSession] dataTaskWithURL:finalUrl completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {

        if (error) {
            NSLog(@"Error fetching houses: %@", error.localizedDescription);
            
            dispatch_async(dispatch_get_main_queue(), ^{
                completion(nil);
            });
        }
        
        if (!data) {
            NSLog(@"No data received from fetching houses.");
        
            dispatch_async(dispatch_get_main_queue(), ^{
                completion(nil);
            });
        }
        
        NSDictionary *topLevelDictionary = [NSJSONSerialization JSONObjectWithData:data options: NSJSONReadingAllowFragments error: &error];
        NSMutableArray *housesArray = [NSMutableArray array];
                
        for (NSDictionary *houseDictionary in topLevelDictionary) {
            [housesArray addObject: [[House alloc] initWithDictionary:houseDictionary]];
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
            completion(housesArray);
        });
        
    }] resume];
}

@end
