
//  Created by Abhimanyu  on 21/11/17.


#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>
#import "CollectionView.h"
#import "TableView.h"

@interface AnimationManager : NSObject

+(AnimationManager *)shared;

@property(nonatomic)CGFloat animationSpeed;

@property(retain,nonatomic)AnimationTableView * tblAnimation;
@property(retain,nonatomic)AnimationCollectionView * collectionAnimation;

-(void)setAnimationForTableView:(TableView *)tblView andCollectionView:(CollectionView *)collectionView;



@end
