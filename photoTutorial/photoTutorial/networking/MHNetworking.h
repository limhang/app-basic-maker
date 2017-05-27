//
//  MHNetworking.h
//  Miusky
//
//  Created by 李明航 on 16/11/3.
//  Copyright © 2016年 COOLBOY. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MHNetworking : NSObject

+ (MHNetworking *)share;

- (void)getUrl:(NSString *)url WithRequestData:(NSDictionary *)params Success:(void (^)(id json))success fail:(void (^)(NSError *error))failure;

- (void)postUrl:(NSString *)url WithRequesData:(NSDictionary *)params Success:(void (^)(id json))success fali:(void (^)(NSError *error))failure;

@end
