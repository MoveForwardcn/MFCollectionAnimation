//
//  MFRootViewController.m
//  MFCollectionAnimation
//
//  Created by htkg on 17/3/24.
//  Copyright © 2017年 MF. All rights reserved.
//

#import "MFRootViewController.h"
#import "MFCollectionViewCell.h"

static NSString * collectionCell = @"collectionCell";

@interface MFRootViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property (nonatomic,strong,nonnull) UICollectionView * collectionView;
@end

@implementation MFRootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.collectionView];
    // Do any additional setup after loading the view.
}
-(UICollectionView*)collectionView{
    if (!_collectionView) {
        UICollectionViewFlowLayout * layout = [[UICollectionViewFlowLayout alloc]init];
        layout.itemSize = CGSizeMake(MFCellWidth, MFCellHeight);
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
//        layout.minimumInteritemSpacing = 10.0;
        layout.sectionInset = UIEdgeInsetsMake(-64, 10, 0, 10);
        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, MFScreenHeight-MFCollectionHeight, MFScreenWidth, MFCollectionHeight) collectionViewLayout:layout];
        [_collectionView registerNib:[UINib nibWithNibName:@"MFCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:collectionCell];
        _collectionView.delegate=self;
        _collectionView.backgroundColor = [UIColor cyanColor];
        _collectionView.dataSource=self;
        
        return _collectionView;
    }
    return _collectionView;
}
-(__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    MFCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:collectionCell forIndexPath:indexPath];
    cell.backgroundColor = [UIColor redColor];
    return cell;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 10;
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    MFCollectionViewCell * cell = (MFCollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
    CABasicAnimation * basic = [CABasicAnimation animationWithKeyPath:@"animation"];

}
-(BOOL)collectionView:(UICollectionView *)collectionView canMoveItemAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}
-(void)collectionView:(UICollectionView *)collectionView moveItemAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath{
  
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
