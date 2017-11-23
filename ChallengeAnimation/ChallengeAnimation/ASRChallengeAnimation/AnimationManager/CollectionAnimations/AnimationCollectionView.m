//  Created by Abhimanyu  on 21/11/17.


#import "AnimationCollectionView.h"

@implementation AnimationCollectionView
@synthesize animationSpeed,collectionView;
-(instancetype)initWithAnimationCollectionView:(CollectionView *)view{
    
    self = [super init];
    if(self){
        self.collectionView = view;
        self.animationSpeed = [AnimationManager shared].animationSpeed;
    }
    return  self;
}

-(void)startAnimation:(BOOL)isSwipeleft indexTop:(int)indexTop cells:(NSMutableArray *)cells{
    
    NSLog(@" isSwipeleft %d ",isSwipeleft);
    NSLog(@" indexTop %d ",indexTop);
    [self showLeftStyleAnimation:(CellCollection *)[cells objectAtIndex:indexTop]];
    [self startAndJumpBottomBarOnce];
}
-(void)showAnimationOnSwipeAtIndex:(int)index cells:(NSMutableArray *)cells{
     [self showLeftStyleAnimation:(CellCollection *)[cells objectAtIndex:index]];
}


-(void)showLeftStyleAnimation:(CellCollection *)cell{
    
    
    cell.heading.frame    = self.collectionView.collectionView.config.fHeadingBegin;
    cell.subHeading.frame = self.collectionView.collectionView.config.fSubHeadingBegin;
    cell.bottomView.frame = self.collectionView.collectionView.config.fBottomBegin;
    [self buttonsJumpOnSwipLeftRight];
    
    [UIView animateWithDuration:self.animationSpeed animations:^{
        
             cell.subHeading.frame = self.collectionView.collectionView.config.fSubHeadingFinal;
             cell.heading.frame    = self.collectionView.collectionView.config.fHeadingFinal;
             cell.bottomView.frame = self.collectionView.collectionView.config.fBottomFinal;
       
       
    }];
    
}


-(void)hideBottomView{
    
    
    FooterCollectionView * footer =   [AnimationManager shared].collectionAnimation.collectionView.footer;
    
    for (int i = 0; i<footer.config.views.count; i++) {
        ActionView * v  =  (ActionView *)[footer.config.views objectAtIndex:(footer.config.views.count-1)-i];
        [UIView animateWithDuration: self.animationSpeed animations:^{
            v.frame  = CGRectMake(v.frame.origin.x,footer.bounds.size.height, v.bounds.size.width, v.bounds.size.height);
        }];
  }
    
}


-(void)startAndJumpBottomBarOnce{
    
    FooterCollectionView * footer =   [AnimationManager shared].collectionAnimation.collectionView.footer;
    
    for (int i = 0; i<footer.config.views.count; i++) {
        ActionView * v  =  (ActionView *)[footer.config.views objectAtIndex:(footer.config.views.count-1)-i];
        
        [UIView animateWithDuration:self.animationSpeed/2*i animations:^{
        
            v.frame  = CGRectMake(v.frame.origin.x,-screen_width*0.03 , v.bounds.size.width, v.bounds.size.height);
       
        } completion:^(BOOL finished) {
            
                    [UIView animateWithDuration: self.animationSpeed animations:^{
                          v.frame  = CGRectMake(v.frame.origin.x,0, v.bounds.size.width, v.bounds.size.height);
                    }];
        }];
    }
}

-(void)buttonsJumpOnSwipLeftRight{
    
    FooterCollectionView * footer =   [AnimationManager shared].collectionAnimation.collectionView.footer;
    
    for (int i = 0; i<footer.config.views.count; i++) {
        ActionView * v  =  (ActionView *)[footer.config.views objectAtIndex:(footer.config.views.count-1)-i];
        
     
        
        [UIView animateWithDuration:self.animationSpeed/4*i animations:^{
            v.btn.frame  = CGRectMake(v.btn.frame.origin.x,-screen_width*0.06 , v.btn.bounds.size.width, v.btn.bounds.size.height);
        } completion:^(BOOL finished) {
            
            [UIView animateWithDuration: self.animationSpeed animations:^{
                v.btn.frame  = CGRectMake(v.btn.frame.origin.x,0, v.btn.bounds.size.width, v.btn.bounds.size.height);
            }];
        }];
    }
}





@end
