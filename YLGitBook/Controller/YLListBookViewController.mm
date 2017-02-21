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
    self.dataSource = [[CKCollectionViewDataSource alloc] initWithCollectionView:self.collectionView supplementaryViewDataSource:nil componentProvider:self.class context:nil cellConfigurationFunction:nil];
    CKArrayControllerSections sections;
    sections.insert(0);
    CKArrayControllerInputItems items;
    items.insert({0, 0}, @"");
    items.insert({0, 1}, @"");
    [self.dataSource enqueueChangeset:{sections, items} constrainedSize:{{0, 0}, {500,100}}];
}

- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(UICollectionViewLayout *)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return [self.dataSource sizeForItemAtIndexPath:indexPath];
}


+ (CKComponent *)componentForModel:(id<NSObject>)model context:(id<NSObject>)context
{
    return [YLListBookCellComponent newWithModel:model context:context];
}

@end
