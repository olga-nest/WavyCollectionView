//
//  ViewController.m
//  WavyCollectionView
//
//  Created by Olga on 10/19/17.
//  Copyright © 2017 Olga Nesterova. All rights reserved.
//

#import "ViewController.h"
#import "ONECollectionViewCell.h"
#import "WavyFlowLayout.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.collectionView.dataSource = self;
    
    WavyFlowLayout *wavyFlowLayout = [[WavyFlowLayout alloc]init];
    self.collectionView.collectionViewLayout = wavyFlowLayout;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 10;
}

- (__kindof UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    ONECollectionViewCell *cell = [self.collectionView dequeueReusableCellWithReuseIdentifier:@"purpleCell" forIndexPath:indexPath];
    
    NSString *labelText = [NSString stringWithFormat:@"%ld-%ld", (long)indexPath.section, (long)indexPath.row];
    
    cell.purpleViewLabel.text = labelText;
    
    return cell;
}



@end
