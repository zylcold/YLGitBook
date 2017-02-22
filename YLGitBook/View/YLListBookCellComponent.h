//
//  YLListBookCellComponent.h
//  YLGitBook
//
//  Created by Relly on 21/02/2017.
//  Copyright © 2017 YL. All rights reserved.
//

#import <ComponentKit/ComponentKit.h>
#import "YLBookInfoItem.h"
@interface YLListBookCellComponent : CKCompositeComponent
+ (CKComponent *)newWithModel:(id<YLBookInfoItem>)model context:(id<CKNetworkImageDownloading>)context;
@end
