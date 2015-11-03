//
//  HBRequest.m
//  ShopperApp
//
//  Created by root-mac on 15/11/1.
//  Copyright © 2015年 清大世纪好班项目组. All rights reserved.
//

#import "HBRequest.h"
#import "HBHttpClient.h"

@implementation HBRequest

+ (void)getCouresListUrlApi:(NSString *)url
                 parameters:(NSDictionary *)parameter
                    success:(void (^) (id responseObject) )success
                    failure:(void (^)(NSError *error))failure{
    
    NSString *urlString = [NSString stringWithFormat:@"%@%@",BaseApi,url];
    [self postURLString:urlString parameters:parameter success:^(id responseObject) {
        success(responseObject);
    } failure:^(NSError *error) {
        failure(error);
    }];

}



#pragma mark - private

+ (void)postURLString:(NSString *)urlString
           parameters:(NSDictionary *)params
              success:(void (^)(id responseObject))success
              failure:(void (^)(NSError *error))failure{
    [[HBHttpClient shareManager] POST:urlString
                           parameters:params
                              success:^(NSURLSessionDataTask *task, id responseObject) {
                                  success(responseObject);
                              } failure:^(NSURLSessionDataTask *task, NSError *error) {
                                  failure(error);
                              }];
}


+ (NSURLSessionDataTask *)getURLString:(NSString *)urlString
                            parameters:(NSDictionary *)params
                           requestHead:(NSDictionary *)header
                               success:(void (^)(id responseObject))success
                               failure:(void (^)(NSError *error))failure{
    
    HBHttpClient *httpClient = [HBHttpClient shareManager];
    httpClient.requestSerializer = [AFHTTPRequestSerializer serializer];
    httpClient.responseSerializer = [AFHTTPResponseSerializer serializer];
    httpClient.securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
    httpClient.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/x-javascript",@"application/json",@"application/json", @"text/json", @"text/javascript", nil];
    for (NSString *key in header.allKeys) {
        [httpClient.requestSerializer setValue:header[key] forHTTPHeaderField:key];
    }
    
    return [httpClient GET:urlString
                parameters:params
                   success:^(NSURLSessionDataTask *task, id responseObject) {
                       success(responseObject);
                   }
                   failure:^(NSURLSessionDataTask *task, NSError *error) {
                       failure(error);
                   }];
}
@end
