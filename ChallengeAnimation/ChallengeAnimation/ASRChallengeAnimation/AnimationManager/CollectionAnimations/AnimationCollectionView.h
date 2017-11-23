//  ChallengeAnimation
//  Created by Abhimanyu  on 21/11/17.

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>
#import "CollectionView.h"
@interface AnimationCollectionView : NSObject
@property(nonatomic)CGFloat animationSpeed;
@property(retain,nonatomic)CollectionView * collectionView;


-(instancetype)initWithAnimationCollectionView:(CollectionView *)view;
-(void)startAnimation:(BOOL)isSwipeleft indexTop:(int)indexTop cells:(NSMutableArray *)cells;
-(void)showAnimationOnSwipeAtIndex:(int)index cells:(NSMutableArray *)cells;
-(void)hideBottomView;
@end
