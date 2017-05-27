//
//  MHNetworking.m
//  Miusky
//
//  Created by 李明航 on 16/11/3.
//  Copyright © 2016年 COOLBOY. All rights reserved.
//

#import "MHNetworking.h"
#import "AFNetworking.h"

@implementation MHNetworking

+ (MHNetworking *)share
{
    static MHNetworking *httpManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        httpManager = [[MHNetworking alloc]init];
    });
    return httpManager;
}

- (void)getUrl:(NSString *)url WithRequestData:(NSDictionary *)params Success:(void (^)(id))success fail:(void (^)(NSError *))failure
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:url parameters:params success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
        if(success){
            success(responseObject);
        }
    } failure:^(AFHTTPRequestOperation * _Nullable operation, NSError * _Nonnull error) {
        if(failure){
            failure(error);
        }
    }];
}

- (void)postUrl:(NSString *)url WithRequesData:(NSDictionary *)params Success:(void (^)(id))success fali:(void (^)(NSError *))failure
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    //post请求发送json格式对象的时候需要这个解析方法
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    [manager POST:url parameters:params success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
        if(success){
            success(responseObject);
        }
    } failure:^(AFHTTPRequestOperation * _Nullable operation, NSError * _Nonnull error) {
        if(failure){
            failure(error);
        }
    }];
}

@end
