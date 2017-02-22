//
//  YLListBookCellComponent.m
//  YLGitBook
//
//  Created by Relly on 21/02/2017.
//  Copyright © 2017 YL. All rights reserved.
//

#import "YLListBookCellComponent.h"
#import "YLBookInfo.h"
@implementation YLListBookCellComponent
+ (CKComponent *)newWithModel:(id<YLBookInfoItem>)model context:(id<CKNetworkImageDownloading>)context
{
    return [super newWithView:{} component:[CKStackLayoutComponent newWithView:{} size:{.width = [UIScreen mainScreen].bounds.size.width, .height = 100 } style:{.direction = CKStackLayoutDirectionHorizontal, .alignItems = CKStackLayoutAlignItemsStretch} children:{
        {
            .component = [CKNetworkImageComponent newWithURL:[NSURL URLWithString:model.cover.small] imageDownloader:context scenePath:nil size:{ .width = 60, .height = 80} options:{.defaultImage = self.defaultImage} attributes:{
            {CKComponentViewAttribute::LayerAttribute(@selector(setShadowOpacity:)), @(0.5)},
            {CKComponentViewAttribute::LayerAttribute(@selector(setShadowOffset:)), [NSValue valueWithCGSize:CGSizeMake(0, 0)]}}],
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

+ (CKComponent *)bookInfoWithModel:(id<YLBookInfoItem>)model context:(id<NSObject>)context
{
    return [CKInsetComponent newWithInsets:UIEdgeInsetsMake(10, 10, 10, 10) component:[CKStackLayoutComponent newWithView:{

    } size:{} style:{} children:{
        {
            .component = [CKLabelComponent newWithLabelAttributes:{.string = model.title, .maximumNumberOfLines = 1, .lineBreakMode = NSLineBreakByTruncatingTail, .font = [UIFont systemFontOfSize:16], .color = [UIColor colorFromHexRGB:@"333333"]} viewAttributes:{{CKComponentViewAttribute(@selector(setUserInteractionEnabled:)), @(NO)},{CKComponentViewAttribute(@selector(setBackgroundColor:)), [UIColor clearColor]}} size:{}],
        },
        {
            .component = [CKLabelComponent newWithLabelAttributes:{.string = model.name, .maximumNumberOfLines = 1, .lineBreakMode = NSLineBreakByTruncatingTail, .font = [UIFont systemFontOfSize:12], .color = [UIColor colorFromHexRGB:@"999999"]} viewAttributes:{{CKComponentViewAttribute(@selector(setUserInteractionEnabled:)), @(NO)}, {CKComponentViewAttribute(@selector(setBackgroundColor:)), [UIColor clearColor]}} size:{}],
            .spacingBefore = 5,
        },
        {
            .component = [CKLabelComponent newWithLabelAttributes:{.string = model.book_description, .maximumNumberOfLines = 0, .lineBreakMode = NSLineBreakByTruncatingTail, .font = [UIFont systemFontOfSize:14], .color = [UIColor colorFromHexRGB:@"333333"]} viewAttributes:{{CKComponentViewAttribute(@selector(setUserInteractionEnabled:)), @(NO)},{CKComponentViewAttribute(@selector(setBackgroundColor:)), [UIColor clearColor]}} size:{}],
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
