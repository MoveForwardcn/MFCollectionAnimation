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
@property (nonatomic,strong,nonnull) NSMutableArray * items;
@property (nonatomic, strong) CALayer *colorLayer;
@property (nonatomic, strong) UIView *colorView;

@end

@implementation MFRootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.collectionView];
    UIBarButtonItem * item = [[UIBarButtonItem alloc]initWithTitle:@"123" style:UIBarButtonItemStyleDone target:self action:@selector(change)];
    self.navigationItem.rightBarButtonItem=item;
    // Do any additional setup after loading the view.
    _items = [[NSMutableArray alloc]initWithObjects:@"1",@"2",@"3",@"4",@"5",@"6", nil];
    
    //create a red layer
    self.colorLayer = [CALayer layer];
    self.colorLayer.frame = CGRectMake(0, 0, 100, 100);
    self.colorLayer.position = CGPointMake(self.view.bounds.size.width/2.0, self.view.bounds.size.height/2.0);
    self.colorLayer.backgroundColor = [UIColor redColor].CGColor;
    [self.view.layer addSublayer:self.colorLayer];
    
    self.colorView = [[UIView alloc] init];
    self.colorView.bounds = CGRectMake(0, 0, 100, 100);
    self.colorView.center = CGPointMake(self.view.bounds.size.width / 2, self.view.bounds.size.height / 2);
    self.colorView.backgroundColor = [UIColor blueColor];
    [self.view addSubview:self.colorView];
}
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    //perform the animation
    [UIView animateWithDuration:1.0 delay:0.0
                        options:UIViewAnimationOptionCurveEaseOut
                     animations:^{
                         //set the position
                         self.colorView.center = [[touches anyObject] locationInView:self.view];
                     }
                     completion:NULL];
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
    animation.keyPath = @"backgroundColor";
    animation.duration = 2.0;
    animation.values = @[
                         (__bridge id)[UIColor blueColor].CGColor,
                         (__bridge id)[UIColor redColor].CGColor,
                         (__bridge id)[UIColor greenColor].CGColor,
                         (__bridge id)[UIColor blueColor].CGColor ];
    //add timing function
    CAMediaTimingFunction *fn = [CAMediaTimingFunction functionWithName: kCAMediaTimingFunctionEaseIn];
    animation.timingFunctions = @[fn, fn, fn];
    //apply animation to layer
    [self.colorLayer addAnimation:animation forKey:nil];
    
}
//- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
//{
//    //configure the transaction
//    [CATransaction begin];
//    [CATransaction setAnimationDuration:1.0];
//    [CATransaction setAnimationTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut]];
//    //set the position
//    self.colorLayer.position = [[touches anyObject] locationInView:self.view];
//    //commit transaction
//    [CATransaction commit];
//}

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
    
    
    CGAffineTransform transform = CGAffineTransformIdentity;
    transform = CGAffineTransformScale(transform, 0.8, 0.8); 
    cell.layer.affineTransform=transform;

    
    
}
-(void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath{
    MFCollectionViewCell * cell = (MFCollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
    CGAffineTransform transform = CGAffineTransformIdentity;
    transform = CGAffineTransformScale(transform, 1, 1);
    cell.layer.affineTransform=transform;
}
-(BOOL)collectionView:(UICollectionView *)collectionView canMoveItemAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}
-(void)collectionView:(UICollectionView *)collectionView moveItemAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath{
  
}
-(void)change{
   
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
