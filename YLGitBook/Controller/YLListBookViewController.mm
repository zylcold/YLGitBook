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
@interface YLListBookViewController ()<CKComponentProvider, UICollectionViewDelegateFlowLayout>
@property(nonatomic, strong) IBOutlet UICollectionView *collectionView;
@property(nonatomic, strong) CKCollectionViewDataSource *dataSource;
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
    [self.dataSource enqueueChangeset:{sections, {}} constrainedSize:{{0, 0}, {500,100}}];
    
    [ProgressHUD show];
    [[[YLClient sharedInstance] performRequest:[YLGetBookAllRequest new]]subscribeNext:^(YLBookAllResponses *x) {
        [ProgressHUD showSuccess];
        __block CKArrayControllerInputItems newItems;
        [x.list enumerateObjectsUsingBlock:^(YLBookInfo * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            newItems.insert({0, (NSInteger)idx}, obj);
        }];
        [self.dataSource enqueueChangeset:{{}, newItems} constrainedSize:{{0, 0}, {500,100}}];
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

+ (CKComponent *)componentForModel:(id<YLBookInfoItem>)model context:(id<CKNetworkImageDownloading>)context
{
    return [YLListBookCellComponent newWithModel:model context:context];
}

@end
