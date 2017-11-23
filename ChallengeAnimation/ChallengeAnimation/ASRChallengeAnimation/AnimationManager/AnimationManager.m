
//  Created by Abhimanyu  on 21/11/17.

#import "AnimationManager.h"
static AnimationManager * objAnimation = nil;
@implementation AnimationManager
@synthesize tblAnimation,collectionAnimation,animationSpeed;

+(AnimationManager *)shared{
    
    if (objAnimation == nil){
        objAnimation  =   [[AnimationManager alloc]init];
        objAnimation.animationSpeed = 0.5;
    }
    return objAnimation;
}

//register all animation on table and collection for sevral objects....
-(void)setAnimationForTableView:(TableView *)tblView andCollectionView:(CollectionView *)collectionView{
    
    objAnimation.tblAnimation        =  [[AnimationTableView alloc]initWithAnimationTableView:tblView];
    objAnimation.collectionAnimation =  [[AnimationCollectionView alloc]initWithAnimationCollectionView:collectionView];
    
    [AnimationManager shared].tblAnimation.swiper.tblView.delegateTbl = collectionView;

    
    
    
}


@end
