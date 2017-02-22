//
//  WPObjectsSerializer.h
//  Wordpress
//
//  Created by Evgeniy Yurtaev on 31/12/14.
//  Copyright (c) 2014 Evgeniy Yurtaev. All rights reserved.
//

#import <Foundation/Foundation.h>
@interface WPObjectsSerializer : NSObject

- (id)serializeWithObjectClass:(Class)objectClass fromDictionary:(NSDictionary *)dictionary error:(NSError **)error;

- (NSDictionary *)deserializeObject:(id)object error:(NSError **)error;

@end

@class RACSignal;
@interface WPObjectsSerializer (RACExtension)

// rac_serializeWithObjectClass:fromDictionary: -> RACSignal objectClass
- (RACSignal *)rac_serializeWithObjectClass:(Class)objectClass fromDictionary:(NSDictionary *)dictionary;

// rac_deserializeObject: : -> RACSignal NSDictionary
- (RACSignal *)rac_deserializeObject:(id)object;

@end
