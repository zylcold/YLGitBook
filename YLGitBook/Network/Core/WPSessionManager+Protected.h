//
//  WPSessionManager+Protected.h
//  Wordpress
//
//  Created by Evgeniy Yurtaev on 31/12/14.
//  Copyright (c) 2014 Evgeniy Yurtaev. All rights reserved.
//

#import "WPSessionManager.h"

@interface WPSessionManager (Protected)

- (void)prepareRequestParams:(NSMutableDictionary *)params;

- (NSError *)checkResponseObjectOnError:(id)responseObject;

@end
