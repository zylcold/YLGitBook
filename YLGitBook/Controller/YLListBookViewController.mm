//
//  YLListBookViewController.m
//  YLGitBook
//
//  Created by Relly on 21/02/2017.
//  Copyright © 2017 YL. All rights reserved.
//

#import "YLListBookViewController.h"
#import <ComponentKit/ComponentKit.h>
#import "YLListBookCellComponent.h"
#import "YLGetBookAllRequest.h"
#import "YLBookAllResponses.h"
#import "YLBookInfo.h"
#import "SDWebImageManager+CKNetworkImageDownloading.h"
#import "YLBookInfoItem.h"
#import "YLListBookCellLoadingComponent.h"
#import "UIScrollView+RefreshSignal.h"
#import "YLBookDetailsController.h"
@interface YLListBookViewController ()<CKComponentProvider, UICollectionViewDelegateFlowLayout>
@property(nonatomic, strong) IBOutlet UICollectionView *collectionView;
@property(nonatomic, strong) CKCollectionViewDataSource *dataSource;
@property(nonatomic, strong) NSMutableArray *datas;
@end

@implementation YLListBookViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"首页";
    self.collectionView.alwaysBounceVertical = YES;
    self.dataSource = [[CKCollectionViewDataSource alloc] initWithCollectionView:self.collectionView supplementaryViewDataSource:nil componentProvider:self.class context:[SDWebImageManager sharedManager] cellConfigurationFunction:nil];
    CKArrayControllerSections sections;
    sections.insert(0);
    
    CKArrayControllerInputItems items;
    items.insert({0, 0}, @"zzzzz");
    items.insert({0, 1}, @"zzzzz");
    [self.dataSource enqueueChangeset:{sections, items} constrainedSize:{{0, 0}, {500,100}}];
    
    
    [[[YLClient sharedInstance] performRequest:[YLGetBookAllRequest new]]subscribeNext:^(YLBookAllResponses *x) {
        __block CKArrayControllerInputItems newItems;
        
        newItems.remove({0, 0});
        newItems.remove({0, 1});
        
        [x.list enumerateObjectsUsingBlock:^(YLBookInfo * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            newItems.insert({0, (NSInteger)idx}, obj);
        }];
        [self.dataSource enqueueChangeset:{{}, newItems} constrainedSize:{{0, 0}, {500,100}}];
    }];
    
    self.collectionView.yl_pullToRefreshCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal * _Nonnull(id  _Nullable input) {
       
        return [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
            NSLog(@"-----");
//            [subscriber sendNext:@""];
            [subscriber sendCompleted];
            return nil;
        }];
    }];
    
    self.collectionView.yl_infinityScrollCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal * _Nonnull(id  _Nullable input) {
        return [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
            NSLog(@"<<<<<<<<<");
            [subscriber sendCompleted];
            return nil;
        }];
    }];
}

- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(UICollectionViewLayout *)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return [self.dataSource sizeForItemAtIndexPath:indexPath];
}

- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

- (void)collectionView:(UICollectionView *)collectionView didHighlightItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView cellForItemAtIndexPath:indexPath];
    [UIView animateWithDuration:0.15 animations:^{
        [cell setBackgroundColor:[UIColor colorFromHexRGB:@"cccccc"]];
    }];
    
}

- (void)collectionView:(UICollectionView *)collectionView didUnhighlightItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView cellForItemAtIndexPath:indexPath];
    [UIView animateWithDuration:0.15 animations:^{
        [cell setBackgroundColor:[UIColor clearColor]];
    }];
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    YLBookInfo *bookInfo = (YLBookInfo *)[self.dataSource modelForItemAtIndexPath:indexPath];
    YLBookDetailsController *bookDetailsVc = [[YLBookDetailsController alloc] init];
    bookDetailsVc.bookInfo = bookInfo;
    [self.navigationController pushViewController:bookDetailsVc animated:YES];
}

+ (CKComponent *)componentForModel:(id<YLBookInfoItem>)model context:(id<CKNetworkImageDownloading>)context
{
    if([model isKindOfClass:[NSString class]]) {
        return [YLListBookCellLoadingComponent newWithModel:model context:context];
    }
    return [YLListBookCellComponent newWithModel:model context:context];
}



@end
