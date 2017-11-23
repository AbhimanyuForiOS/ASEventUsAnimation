
//  Created by Abhimanyu  on 21/11/17.

#import "AnimationTableView.h"

@implementation AnimationTableView
@synthesize animationSpeed,swiper;

-(instancetype)initWithAnimationTableView:(TableView *)view{
    self = [super init];
    
    if(self){
        self.swiper = view;
         self.animationSpeed = [AnimationManager shared].animationSpeed;
    }
    return  self;
}

-(void)animateTableSwipeUp:(BOOL)isSwipeUp indexTop:(int)indexTop cells:(NSMutableArray *)cells{

    if (isSwipeUp)
         [self swipUpAnimationCellFirst:(CellSwipableTable *)[cells objectAtIndex:indexTop-1] andCellL:(CellSwipableTable *)[cells objectAtIndex:indexTop+2]];
    else
        [self swipDownAnimationCellFirst:(CellSwipableTable *)[cells objectAtIndex:indexTop] andCellL:(CellSwipableTable *)[cells objectAtIndex:indexTop+3]];
    
    [self rotatePlusButton:isSwipeUp];
}
-(void)rotatePlusButton:(BOOL)isSwipeUp{
   
    if (isSwipeUp){
        
        //rotate right
        [UIView animateWithDuration:self.animationSpeed delay:0 options: UIViewAnimationOptionCurveLinear animations:^{
            self.swiper.btnPlus.transform = CGAffineTransformRotate(self.swiper.btnPlus.transform, M_PI);
        }  completion:^(BOOL finished) {
        }];
        
    }else{
        
        //rotate left
        [UIView animateWithDuration:self.animationSpeed delay:0 options: UIViewAnimationOptionCurveLinear animations:^{
            self.swiper.btnPlus.transform = CGAffineTransformRotate(self.swiper.btnPlus.transform, -M_PI/2);
        }  completion:^(BOOL finished) {
        }];
    }
}
-(void)swipUpAnimationCellFirst:(CellSwipableTable *)cellF andCellL:(CellSwipableTable *)cellL{
    
    NSLog(@"cellF heading  %@",cellF.heading.text);

                    cellL.heading.frame =  CGRectMake(cellL.heading.frame.origin.x+screen_width,cellF.heading.frame.origin.y , cellF.heading.bounds.size.width, cellL.heading.bounds.size.height);
                    cellL.subHeading.frame =  CGRectMake(cellL.subHeading.frame.origin.x+screen_width,cellF.subHeading.frame.origin.y , cellF.subHeading.bounds.size.width, cellL.subHeading.bounds.size.height);
    
    
                    //first cell  will go left side & hide there
                    [UIView animateWithDuration:self.animationSpeed animations:^{
                       
                        
                        cellF.heading.frame =  CGRectMake(cellF.heading.frame.origin.x-screen_width,cellF.heading.frame.origin.y , cellF.heading.bounds.size.width, cellF.heading.bounds.size.height);
                        cellF.subHeading.frame =  CGRectMake(cellF.subHeading.frame.origin.x-screen_width,cellF.subHeading.frame.origin.y , cellF.subHeading.bounds.size.width, cellF.subHeading.bounds.size.height);
                        
                        
                       
                        //last cell will come in front from right to left ..
                        cellL.heading.frame =  CGRectMake(cellF.heading.frame.origin.x+screen_width,cellF.heading.frame.origin.y , cellF.heading.bounds.size.width, cellL.heading.bounds.size.height);
                        cellL.subHeading.frame =  CGRectMake(cellF.subHeading.frame.origin.x+screen_width,cellF.subHeading.frame.origin.y , cellF.subHeading.bounds.size.width, cellL.subHeading.bounds.size.height);
                        
                    } completion:^(BOOL finished) {
                        
                    }];

}

-(void)swipDownAnimationCellFirst:(CellSwipableTable *)cellF andCellL:(CellSwipableTable *)cellL{
    
    
                    //first cell  will go left side & hide there
                    [UIView animateWithDuration:self.animationSpeed animations:^{
                        
                        
                        cellF.heading.frame =  CGRectMake(cellF.heading.frame.origin.x+screen_width,cellF.heading.frame.origin.y , cellF.heading.bounds.size.width, cellF.heading.bounds.size.height);
                        
                        cellF.subHeading.frame =  CGRectMake(cellF.subHeading.frame.origin.x+screen_width,cellF.subHeading.frame.origin.y , cellF.subHeading.bounds.size.width, cellF.subHeading.bounds.size.height);
                        
                        
                        //last cell will go in front from left  to right and vanished ..
                        cellL.heading.frame =  CGRectMake(cellL.heading.frame.origin.x+screen_width,cellF.heading.frame.origin.y , cellF.heading.bounds.size.width, cellF.heading.bounds.size.height);
                        
                        cellL.subHeading.frame =  CGRectMake(cellL.subHeading.frame.origin.x+screen_width,cellF.subHeading.frame.origin.y , cellF.subHeading.bounds.size.width, cellF.subHeading.bounds.size.height);
                        
                  
                    } completion:^(BOOL finished) {
                        
                    }];
}


-(void)hideTableViewLeftSide{

    //first cell  will go left side & hide there
    [UIView animateWithDuration:self.animationSpeed animations:^{
        
        self.swiper.header.frame = CGRectMake(0, self.swiper.header.frame.origin.y-self.swiper.header.frame.size.height, self.swiper.header.frame.size.width, self.swiper.header.frame.size.height);
        self.swiper.frame =  CGRectMake(-self.swiper.frame.size.width, self.swiper.frame.origin.y, self.swiper.frame.size.width, self.swiper.frame.size.height);
        
        
    } completion:^(BOOL finished) {
    }];

}


-(void)showTableViewfromLeftSide{
    
    self.swiper.header.frame = CGRectMake(0, self.swiper.header.frame.origin.y+self.swiper.header.frame.size.height, self.swiper.header.frame.size.width, self.swiper.header.frame.size.height);
    self.swiper.frame =  CGRectMake(0, self.swiper.frame.origin.y, self.swiper.frame.size.width, self.swiper.frame.size.height);

    //set swiper on this view left  /  right swipers
    
    [SwiperManager shared].viewCurrent =   self.swiper.tblView;
    [SwiperManager shared].delegate    = self.swiper.tblView;
 
    
    
}



@end
