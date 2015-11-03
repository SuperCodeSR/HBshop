//
//  HBHttpClient.m
//  ShopperApp
//
//  Created by root-mac on 15/11/1.
//  Copyright © 2015年 清大世纪好班项目组. All rights reserved.
//

#import "HBHttpClient.h"
#import <CommonCrypto/CommonKeyDerivation.h>
#import "NSDictionary+JSONString.h"
#import <CommonCrypto/CommonCrypto.h>
#import <CommonCrypto/CommonHMAC.h>


@implementation HBHttpClient

+ (instancetype)shareManager{

    static HBHttpClient *_httpClient = nil;
    static dispatch_once_t onceDispatch;
    dispatch_once(&onceDispatch, ^{
        _httpClient = [[HBHttpClient alloc]initWithBaseURL:[NSURL URLWithString:BaseApi]];
        
    });
    
    return _httpClient;
}

- (instancetype)initWithBaseURL:(NSURL *)url {
    self = [super initWithBaseURL:url];
    if (!self) { 
        return nil;
    }

    self.responseSerializer = [AFHTTPResponseSerializer serializer];
    self.requestSerializer = [AFHTTPRequestSerializer serializer];
    
    self.securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
    self.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/x-javascript",@"application/json",@"text/plain",@"text/html", nil];
    
    
    
    return self;
}


- (NSURLSessionDataTask *)GET:(NSString *)URLString
                   parameters:(id)parameters
                      success:(void (^)(NSURLSessionDataTask *task, id responseObject))success
                      failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure{

    return [super GET:URLString parameters:parameters success:success failure:failure];
}

- (NSURLSessionDataTask *)POST:(NSString *)URLString
                    parameters:(id)parameters
                       success:(void (^)(NSURLSessionDataTask *task, id responseObject))success
                       failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure{
    
    //对这个param
    
    NSString *str = [NSString stringWithFormat:@"%@%@",BaseApi,URLString];
    
    //  DLog(@"%@",str);
    
    //在这里要包裹一个json＝
   NSString *jsonStr =  [parameters jsonStringWithPrettyPrint:YES];
    jsonStr = [jsonStr stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    jsonStr = [jsonStr stringByReplacingOccurrencesOfString:@"\r" withString:@""];
    jsonStr = [jsonStr stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    NSDictionary *tempParameter = @{@"json":jsonStr};
    
    
    
    //请求头 要加密
    
    
    NSString *signKey = [self jiami:str json:tempParameter];
    
   // DLog(@"signKey ==%@",signKey);
    
    [self.requestSerializer setValue:signKey forHTTPHeaderField:@"X-Sign-Id"];

    
    return [super POST:str parameters:tempParameter success:success failure:failure];
}


// Makes a random 256-bit salt
- (NSData*)generateSalt256 {
    unsigned char salt[32];
    for (int i=0; i<32; i++) {
        salt[i] = (unsigned char)arc4random();
    }

    return [NSData dataWithBytes:salt length:32];
}
-(NSString *)ret32bitString
{
    char data[32];
    for (int x=0;x<32;data[x++] = (char)('a' + (arc4random_uniform(26))) );
    return [[NSString alloc] initWithBytes:data length:32 encoding:NSUTF8StringEncoding];
}


- (NSString *)jiami:(NSString *)url  json:(NSDictionary *)dic{

    url = [url substringFromIndex:BaseApi.length];
    NSString *str = [url substringWithRange:NSMakeRange(url.length-1, 1)];
    if ([str isEqualToString:@"/"]) {
        url = [url substringToIndex:(url.length-1)];  // 去掉／
    }else{
        
    }
    
    
    NSString* data = nil;
    if (dic) {
        NSString *longDataStr = [dic objectForKey:@"json"];
        data  = [NSString stringWithFormat:@"%@%@",longDataStr,url];
    }else{
        data = url;
    }

    NSString *salt = [self ret32bitString];
    
    NSString *key128BitsAndauthKey = [NSString stringWithFormat:@"%@%@",salt,Auth_Key];
    const char *cKey  = [key128BitsAndauthKey cStringUsingEncoding:NSASCIIStringEncoding];

    const char *cData = [data cStringUsingEncoding:NSUTF8StringEncoding];
    
    Byte cHMAC[CC_SHA256_BLOCK_BYTES];
    
    CCHmac(kCCHmacAlgSHA256, cKey, strlen(cKey), cData, strlen(cData), cHMAC);
    
    
    NSString *hash;
    NSMutableString* output = [NSMutableString stringWithCapacity:CC_SHA256_DIGEST_LENGTH * 2];
    for(int i = 0; i < CC_SHA256_DIGEST_LENGTH; i++)
        [output appendFormat:@"%02x", cHMAC[i]];
    hash = output;
    
    NSString *signKey = [NSString stringWithFormat:@"%@%@",hash,salt];
    return signKey;
}



@end
