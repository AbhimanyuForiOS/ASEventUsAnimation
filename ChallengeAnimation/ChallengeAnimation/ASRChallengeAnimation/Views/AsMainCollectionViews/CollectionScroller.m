//
//  CollectionScroller.m
//  ChallengeAnimation
//
//  Created by Abhimanyu  on 22/11/17.
//  Copyright © 2017 Konstant. All rights reserved.
//

#import "CollectionScroller.h"

@implementation CollectionScroller

@synthesize config;

-(instancetype)initWithConfig:(CollectionConfig *)config onView:(UIView *)view {
    
    self = [super init];
    
    if(self){
        
        if(config)
            self.config = config;
        else
            self.config = [[CollectionConfig alloc]init];
        
        self.backgroundColor = self.config.collectionBgColor;
        self.frame           = CGRectMake(0, 0, view.frame.size.width, view.frame.size.height);
        self.scrollEnabled   = false;
        [view addSubview:self];
        
        
      self.config.fHeadingBegin    = CGRectMake(self.config.gap, self.bounds.size.height*0.10,
                                                self.bounds.size.width,self.bounds.size.width*0.08 );
        
      self.config.fSubHeadingBegin = CGRectMake(-self.bounds.size.width/2, self.bounds.size.height/2-self.bounds.size.width*0.20/2,
                                                self.bounds.size.width/2,self.bounds.size.width*0.20 );
      self.config.fSubHeadingFinal = CGRectMake(self.config.gap, self.bounds.size.height/2-self.bounds.size.width*0.20/2,
                                                self.bounds.size.width/2,self.bounds.size.width*0.20 );
       
        
      self.config.fHeadingFinal    = CGRectMake(self.config.gap,  self.config.fSubHeadingFinal.origin.y-self.bounds.size.width*0.08,              self.bounds.size.width,self.bounds.size.width*0.08 );
        
        
       self.config.fBottomBegin     = CGRectMake(self.config.gap, self.bounds.size.height,
                                                  self.bounds.size.width,self.bounds.size.width*0.25 );
       self.config.fBottomFinal     = CGRectMake(self.config.gap, self.config.fSubHeadingFinal.origin.y+self.config.fSubHeadingFinal.size.height, self.bounds.size.width,self.bounds.size.width*0.25 );
        
      //  [self removeSubOnjects];
        [self setCellsOnScroller];
    
    }
    return self;
}

-(void)removeSubOnjects{
    
    for (UIImageView * v in self.subviews) {
        [v removeFromSuperview];
    }
 
}

#pragma mark:  add views on scroller
-(void)setCellsOnScroller{
    
     self.config.cells = [[NSMutableArray alloc]init];
    [self.config.cells removeAllObjects];
    
    //expand scroller first
    self.contentSize = CGSizeMake(self.config.cellWidth*self.config.configMain.items.count, self.config.cellHeight);
    self.pagingEnabled = true;

    CGFloat top  = 0.0;
    CGFloat left = 0.0;

    
    //make cells and load on scroller
    for (int i = 0 ; i<self.config.configMain.items.count; i++) {
    
        //fetch information from server object ..
        Item * item                     = (Item *)[self.config.configMain.items objectAtIndex:i];
        
        CellCollection * cell        = [[CellCollection alloc]init];
        cell.frame                      = CGRectMake(left, top, self.config.cellWidth, self.config.cellHeight);
        cell.backgroundColor            = [UIColor clearColor];
        cell.image                      = [UIImage imageNamed:item.imgName];
        cell.contentMode                = UIViewContentModeScaleToFill;
        cell.tag                        = i;
        cell.userInteractionEnabled       = true;
        cell.clipsToBounds = true;
        [self addSubview:cell];
        
        //set heading
        cell.heading                        = [[UILabel alloc]init];
        cell.heading.frame                  = self.config.fHeadingBegin;
        cell.heading.backgroundColor        = [UIColor clearColor];
        cell.heading.text                   = item.heading;
        
        cell.heading.font                    = [UIFont systemFontOfSize:screen_width*0.033];
        cell.heading.textColor              = self.config.txtColorHeading;

        [cell addSubview:cell.heading];

        //set sub heading
        cell.subHeading                      = [[UILabel alloc]init];
        cell.subHeading.backgroundColor      = [UIColor clearColor];
        cell.subHeading.text                 = item.subHeading;
        cell.subHeading.font                 = [UIFont boldSystemFontOfSize:screen_width*0.052];
        cell.subHeading.adjustsFontSizeToFitWidth = true;
        cell.subHeading.minimumScaleFactor   = 0.5;
        cell.subHeading.numberOfLines        = 0;
        cell.subHeading.textColor             = self.config.txtColorSubHeading;
        [cell addSubview:cell.subHeading];
        [self.config.cells addObject:cell];
        
    
       cell.bottomView             = [[UIView alloc]init];
       cell.bottomView.frame       = self.config.fBottomBegin;
       cell.bottomView.backgroundColor = [UIColor clearColor];
       [cell addSubview:cell.bottomView];
        
        
        
        
        
        //set heading
        UILabel *lbl                     = [[UILabel alloc]init];
        lbl.frame                  = CGRectMake(0, screen_width*0.02,self.config.fBottomBegin.size.width , self.config.fBottomBegin.size.height*0.30);
        lbl.backgroundColor        = [UIColor clearColor];
        lbl.text                   = item.heading;
        lbl.font                    = [UIFont systemFontOfSize:screen_width*0.043];
        lbl.textColor              = self.config.txtColorHeading;
        lbl.adjustsFontSizeToFitWidth = true;
        lbl.minimumScaleFactor   = 0.5;
        lbl.numberOfLines        = 0;
        [cell.bottomView addSubview:lbl];
        
        
         left += self.config.cellWidth;
    
    }
}

#pragma mark: SwiperDelegate
-(void)swiperIsGoingLeft:(BOOL)isLeft{

    if (isLeft){
        NSLog(@"up");
        
        if (self.config.xAxis < self.contentSize.width-self.bounds.size.width){
            self.config.xAxis += self.config.cellWidth;
            
            
            self.config.index++;
          
            [self setContentOffset:CGPointMake(self.config.xAxis, 0) animated:true];
            [[AnimationManager shared].collectionAnimation showAnimationOnSwipeAtIndex:self.config.index cells:self.config.cells];
        }
        
    }
    else{
        NSLog(@"Down");
        
        if (self.config.xAxis >= self.config.cellWidth){
            
            self.config.xAxis -= self.config.cellWidth;
            self.config.index--;
            
            [self setContentOffset:CGPointMake( self.config.xAxis,0) animated:true];
            [[AnimationManager shared].collectionAnimation showAnimationOnSwipeAtIndex:self.config.index cells:self.config.cells];
        }
    }
    
    //animate your cells here ...:)
    NSLog(@"self.config.index %d",self.config.index);
    
    
    
    
}


@end
