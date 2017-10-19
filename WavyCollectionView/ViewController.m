//
//  ViewController.m
//  WavyCollectionView
//
//  Created by Olga on 10/19/17.
//  Copyright © 2017 Olga Nesterova. All rights reserved.
//

#import "ViewController.h"
#import "ONECollectionViewCell.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (nonatomic) UICollectionViewFlowLayout *defaultLayout;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.collectionView.dataSource = self;
    [self setupDefaultLayout];
    
    
    
}

-(void)setupDefaultLayout {
    self.defaultLayout = [[UICollectionViewFlowLayout alloc] init];
    
    self.defaultLayout.itemSize = CGSizeMake(100, 100); // Set size of cell
    self.defaultLayout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);  // "Border around each section"
    self.defaultLayout.minimumInteritemSpacing = 15;  // Minimum horizontal spacing between cells
    self.defaultLayout.minimumLineSpacing = 10;  // Minimum vertical spacing
        
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 10;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (__kindof UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    ONECollectionViewCell *cell = [self.collectionView dequeueReusableCellWithReuseIdentifier:@"purpleCell" forIndexPath:indexPath];
    
    NSString *labelText = [NSString stringWithFormat:@"%ld-%ld", (long)indexPath.section, (long)indexPath.row];
    
    cell.purpleViewLabel.text = labelText;
    
    return cell;
}



@end
