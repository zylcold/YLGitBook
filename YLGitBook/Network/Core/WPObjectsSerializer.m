//
//  WPObjectsSerializer.m
//  Wordpress
//
//  Created by Evgeniy Yurtaev on 31/12/14.
//  Copyright (c) 2014 Evgeniy Yurtaev. All rights reserved.
//

#import <ReactiveObjC/ReactiveObjC.h>

#import "WPObjectsSerializer.h"

#import <YYModel/YYModel.h>

@implementation WPObjectsSerializer

- (id)serializeWithObjectClass:(Class)objectClass fromDictionary:(NSDictionary *)dictionary error:(NSError *__autoreleasing *)error
{
    return [objectClass yy_modelWithDictionary:dictionary];
}

- (NSDictionary *)deserializeObject:(id)object error:(NSError *__autoreleasing *)error
{
    return [object yy_modelToJSONObject];
}

@end

@implementation WPObjectsSerializer (RACExtension)

- (RACSignal *)rac_serializeWithObjectClass:(Class)objectClass fromDictionary:(NSDictionary *)dictionary
{
    return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        
        NSError *error;
        id object = [self serializeWithObjectClass:objectClass fromDictionary:dictionary error:&error];
        
        if (!error) {
            [subscriber sendNext:object];
            [subscriber sendCompleted];
        } else {
            [subscriber sendError:error];
        }
        
        return nil;
    }];
}

- (RACSignal *)rac_deserializeObject:(id)object
{
    return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        
        NSError *error;
        NSDictionary *dictionary = [self deserializeObject:object error:&error];
        
        if (!error) {
            [subscriber sendNext:dictionary];
            [subscriber sendCompleted];
        } else {
            [subscriber sendError:error];
        }
        
        return nil;
    }];
}

@end
