//
//  YLListBookCellLoadingComponent.m
//  YLGitBook
//
//  Created by Yun on 22/02/2017.
//  Copyright © 2017 YL. All rights reserved.
//

#import "YLListBookCellLoadingComponent.h"
#import <Shimmer/FBShimmeringView.h>


@implementation YLListBookCellLoadingComponent
+ (instancetype)newWithModel:(id)model context:(id<NSObject>)context
{
    
    UIImageView *imageView = [[UIImageView alloc] initWithImage:self.defaultImage];
    
    return [super newWithView:{} component:[CKStackLayoutComponent newWithView:{} size:{.width = [UIScreen mainScreen].bounds.size.width, .height = 100 } style:{.direction = CKStackLayoutDirectionHorizontal, .alignItems = CKStackLayoutAlignItemsStretch} children:{
        {
            .component = [self shimmeringContentView:imageView size:{60, 80}],
            .alignSelf = CKStackLayoutAlignSelfCenter,
            .spacingBefore = 15
        },
        {
            .component = [self bookInfoWithModel:model context:context],
            .flexGrow = YES,
            .flexShrink = YES
        }
    }]];
}


+ (CKComponent *)shimmeringContentView:(UIView *)contentView size:(CGSize)size
{
    return [CKCompositeComponent newWithView:{
        [FBShimmeringView class],
        {
            {CKComponentViewAttribute::LayerAttribute(@selector(setShadowOpacity:)), @(0.5)},
            {CKComponentViewAttribute::LayerAttribute(@selector(setShadowOffset:)), [NSValue valueWithCGSize:CGSizeMake(0, 0)]},
            {CKComponentViewAttribute(@selector(setContentView:)), contentView },
            {CKComponentViewAttribute(@selector(setShimmering:)), @(YES)}
        },
        
    } component:[CKComponent newWithView:{} size:{60, 80}]];
}


+ (CKComponent *)bookInfoWithModel:(id)model context:(id<NSObject>)context
{
    return [CKInsetComponent newWithInsets:UIEdgeInsetsMake(10, 10, 10, 10) component:[CKStackLayoutComponent newWithView:{
        
    } size:{} style:{} children:{
        {
            .component = [CKLabelComponent newWithLabelAttributes:{.string = @"ZZZZZZZZZZZZ", .maximumNumberOfLines = 1, .lineBreakMode = NSLineBreakByTruncatingTail, .font = [UIFont systemFontOfSize:16], .color = [UIColor colorFromHexRGB:@"333333"]} viewAttributes:{{CKComponentViewAttribute(@selector(setUserInteractionEnabled:)), @(NO)},{CKComponentViewAttribute(@selector(setBackgroundColor:)), [UIColor clearColor]}} size:{}],
        },
        {
            .component = [CKLabelComponent newWithLabelAttributes:{.string = @"zzzzzzzzzz", .maximumNumberOfLines = 1, .lineBreakMode = NSLineBreakByTruncatingTail, .font = [UIFont systemFontOfSize:12], .color = [UIColor colorFromHexRGB:@"999999"]} viewAttributes:{{CKComponentViewAttribute(@selector(setUserInteractionEnabled:)), @(NO)}, {CKComponentViewAttribute(@selector(setBackgroundColor:)), [UIColor clearColor]}} size:{}],
            .spacingBefore = 5,
        },
        {
            .component = [CKLabelComponent newWithLabelAttributes:{.string = @"xxxxxxxxx", .maximumNumberOfLines = 0, .lineBreakMode = NSLineBreakByTruncatingTail, .font = [UIFont systemFontOfSize:14], .color = [UIColor colorFromHexRGB:@"333333"]} viewAttributes:{{CKComponentViewAttribute(@selector(setUserInteractionEnabled:)), @(NO)},{CKComponentViewAttribute(@selector(setBackgroundColor:)), [UIColor clearColor]}} size:{}],
            .spacingBefore = 5,
            .flexShrink = YES
        }
    }]];
}

        
+ (UIImage *)defaultImage
{
    static UIImage *defaultImage = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        CGSize size = CGSizeMake(60.0, 80.0);
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
