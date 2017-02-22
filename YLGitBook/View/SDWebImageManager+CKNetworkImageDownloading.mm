//
//  SDWebImageManager+CKNetworkImageDownloading.m
//  Wordpress
//
//  Created by Evgeniy Yurtaev on 27/06/15.
//  Copyright (c) 2015 Evgeniy Yurtaev. All rights reserved.
//

#import "SDWebImageManager+CKNetworkImageDownloading.h"

@implementation SDWebImageManager (CKNetworkImageDownloading)

- (id)downloadImageWithURL:(NSURL *)URL
                 scenePath:(id)scenePath
                    caller:(id)caller
             callbackQueue:(dispatch_queue_t)callbackQueue
     downloadProgressBlock:(void (^)(CGFloat progress))downloadProgressBlock
                completion:(void (^)(CGImageRef image, NSError *error))completion;
{
    return [self loadImageWithURL:URL
        options:0
        progress:^(NSInteger receivedSize, NSInteger expectedSize, NSURL * _Nullable targetURL) {
            if (downloadProgressBlock) {
                dispatch_async(callbackQueue, ^{
                    CGFloat progress = (CGFloat)receivedSize / expectedSize;
                    downloadProgressBlock(progress);
                });
            }

        } completed:^(UIImage * _Nullable image, NSData * _Nullable data, NSError * _Nullable error, SDImageCacheType cacheType, BOOL finished, NSURL * _Nullable imageURL) {
            if (completion) {
                dispatch_async(callbackQueue, ^{
                    completion([image CGImage], error);
                });
            }
        }];
}
- (void)cancelImageDownload:(id<SDWebImageOperation>)download
{
    [download cancel];
}

@end
