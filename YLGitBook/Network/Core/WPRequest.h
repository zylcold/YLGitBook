//
//  WPRequest.h
//  Wordpress
//
//  Created by Evgeniy Yurtaev on 31/12/14.
//  Copyright (c) 2014 Evgeniy Yurtaev. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YLRouteObject: NSObject
@end

@interface WPRequest : NSObject
//路由参数
@property (strong, nonatomic) YLRouteObject *routeObject;
//路由路径
+ (NSString *)pathPattern;
//请求方式
+ (NSString *)method;
//返回类型
+ (Class)responseClass;

@end
