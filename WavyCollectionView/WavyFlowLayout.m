//
//  WavyFlowLayout.m
//  WavyCollectionView
//
//  Created by Olga on 10/19/17.
//  Copyright © 2017 Olga Nesterova. All rights reserved.
//

#import "WavyFlowLayout.h"

@implementation WavyFlowLayout

- (void)prepareLayout {
    self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    self.itemSize = CGSizeMake(100, 50);
    // Set minimum interitem spacing to be huge to force all items to be on their own line
    self.minimumInteritemSpacing = CGFLOAT_MAX;
}

- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect
{
    NSArray<UICollectionViewLayoutAttributes *> *superAttrs = [super layoutAttributesForElementsInRect:rect];
    
    // Need to copy attrs from super to avoid cached frame mismatch
    NSMutableArray<UICollectionViewLayoutAttributes *> *newAttrs = [[NSMutableArray alloc] init];
    
    for (UICollectionViewLayoutAttributes *attribute in superAttrs) {
        [newAttrs addObject:attribute];
        
        //create random number for y
        CGFloat randomY = arc4random_uniform(attribute.frame.origin.y)+200;
        CGFloat previousWidth = attribute.frame.size.width;
        CGFloat previousHeight = attribute.frame.size.height;
        CGFloat proportionalHeight = (previousHeight - randomY)/2;
        CGFloat previousX = attribute.frame.origin.x;
        attribute.frame = CGRectMake(previousX, randomY, previousWidth, proportionalHeight);
        
    }
    
    
    
    return newAttrs;
}

@end
