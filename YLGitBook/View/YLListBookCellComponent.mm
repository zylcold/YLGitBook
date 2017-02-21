//
//  YLListBookCellComponent.m
//  YLGitBook
//
//  Created by Relly on 21/02/2017.
//  Copyright © 2017 YL. All rights reserved.
//

#import "YLListBookCellComponent.h"

@implementation YLListBookCellComponent
+ (CKComponent *)newWithModel:(id)model context:(id)context
{
    return [super newWithView:{} component:[CKStackLayoutComponent newWithView:{} size:{.width = [UIScreen mainScreen].bounds.size.width, .height = 100 } style:{.direction = CKStackLayoutDirectionHorizontal, .alignItems = CKStackLayoutAlignItemsStretch} children:{
        {.component = [CKImageComponent newWithImage:self.defaultImage]},
        {.component = [self bookInfoWithModel:model context:context],
        .flexGrow = YES
        }
    }]];
}

+ (CKComponent *)bookInfoWithModel:(id)model context:(id)context
{
    return [CKInsetComponent newWithInsets:UIEdgeInsetsMake(10, 10, 10, 10) component:[CKStackLayoutComponent newWithView:{
        [UIView class],
        {{@selector(setBackgroundColor:), [UIColor yellowColor]}}
    } size:{} style:{} children:{
        {.component = [CKLabelComponent newWithLabelAttributes:{.string = @"HHHHH"} viewAttributes:{} size:{}]}
    }]];
}

+ (UIImage *)defaultImage
{
    static UIImage *defaultImage = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        CGSize size = CGSizeMake(100.0, 100.0);
        UIGraphicsBeginImageContextWithOptions(size, NO, 0.0);
        CGContextRef context = UIGraphicsGetCurrentContext();

        CGContextSetFillColorWithColor(context, [UIColor colorWithRed:216/255.0 green:216/255.0 blue:216/255.0 alpha:1].CGColor);
        CGContextFillRect(context, CGRectMake(0.f, 0.f, size.width, size.height));
        UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        defaultImage = image;
    });
    return defaultImage;
}
@end
