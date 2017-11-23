
//  Created by Abhimanyu  on 21/11/17.


#import "SwipableTable.h"

@implementation SwipableTable
@synthesize config,delegateTbl;

-(instancetype)initWithConfig:(TableConfig *)config onView:(UIView *)view {
    
    self = [super init];
    
    if(self){
        if(config)
            self.config = config;
        else
            self.config = [[TableConfig alloc]init];
        
        
        self.backgroundColor = self.config.tblBgColor;
        self.frame           = CGRectMake(0, self.config.configTblHeader.height, view.frame.size.width, view.frame.size.height-self.config.configTblHeader.height);
        self.scrollEnabled   = false;
        [view addSubview:self];
        
        [self setCellsOnScroller];
    
    }
    return self;
}


#pragma mark:  add views on scroller
-(void)setCellsOnScroller{
    
    //expand scroller first
    self.contentSize = CGSizeMake(self.config.cellWidth, self.config.cellHeight*self.config.configMain.items.count);
    
    
    CGFloat top  = 0.0;
    CGFloat left = 0.0;
    
    //make cells and load on scroller
    for (int i = 0 ; i<self.config.configMain.items.count; i++) {
        //fetch information from server object ..
        Item * item                     = (Item *)[self.config.configMain.items objectAtIndex:i];
        
        CellSwipableTable * cell        = [[CellSwipableTable alloc]init];
        cell.frame                      = CGRectMake(left, top, self.config.cellWidth, self.config.cellHeight);
        cell.backgroundColor            = [UIColor clearColor];
        cell.image                      = [UIImage imageNamed:item.imgName];
        cell.tag                        = i;
        cell.contentMode                = UIViewContentModeScaleToFill;
        cell.userInteractionEnabled       = true;
        [self addSubview:cell];
        
        //set heading
        cell.heading            = [[UILabel alloc]init];
        cell.heading.frame                = CGRectMake( self.config.gap, cell.bounds.size.height*0.60, cell.bounds.size.width,screen_width*0.08);
        cell.heading.backgroundColor      = [UIColor clearColor];
        cell.heading.text                 = item.heading;
        cell.heading.font                 = [UIFont systemFontOfSize:screen_width*0.033];
        cell.heading.textColor             = self.config.txtColorHeading;
        
        [cell addSubview:cell.heading];
        
        
        CGFloat hSubHeading  = cell.bounds.size.height - (cell.bounds.size.height*0.60+cell.heading.bounds.size.height+self.config.gap/2);
        
        
        //set sub heading
        cell.subHeading            = [[UILabel alloc]init];
        cell.subHeading.frame                = CGRectMake( self.config.gap, cell.bounds.size.height*0.60+cell.heading.bounds.size.height, cell.bounds.size.width/2,hSubHeading);
        cell.subHeading.backgroundColor      = [UIColor clearColor];
        cell.subHeading.text                 = item.subHeading;
        cell.subHeading.font                 = [UIFont boldSystemFontOfSize:screen_width*0.052];
        cell.subHeading.adjustsFontSizeToFitWidth = true;
        cell.subHeading.minimumScaleFactor   = 0.5;
        cell.subHeading.numberOfLines        = 0;
        cell.subHeading.textColor             = self.config.txtColorSubHeading;
        [cell addSubview:cell.subHeading];
        [self.config.cells addObject:cell];
        
        cell.btn = [UIButton buttonWithType:UIButtonTypeCustom];
        cell.btn.frame = CGRectMake(0,0, cell.bounds.size.width,  cell.bounds.size.height);
        cell.btn.tag            = i;
        cell.btn.backgroundColor = [UIColor clearColor];
        [cell.btn addTarget:self action:@selector(didSelected:) forControlEvents:UIControlEventTouchUpInside];
        [cell addSubview:cell.btn];
        
        top += self.config.cellHeight;
    }
    

        [self setSwipers];

}
-(void)setSwipers{
    //set swiper on this view left  /  right swipers

    [SwiperManager shared].viewCurrent = self;
    [SwiperManager shared].delegate    = self;
    [[SwiperManager shared]setVerticalSwipersOnView:self];
}


-(void)didSelected:(UIButton *)btn{
  
    [[AnimationManager shared].tblAnimation hideTableViewLeftSide];
    if (self.delegateTbl != nil){
        [self.delegateTbl itemClickedFromTable:[self.config.configMain.items objectAtIndex:btn.tag] withIndex:btn.tag];
    }
}


-(void)swiperIsGoingLeft:(BOOL)isLeft{
    
}
-(void)swiperIsGoingUp:(BOOL)isUp{
    
    if (isUp){
            NSLog(@"up");
    
            if (self.config.yAxis < self.contentSize.height-self.bounds.size.height-self.config.gap){
                self.config.yAxis += self.config.cellHeight;
                self.config.index++;
                
                [self setContentOffset:CGPointMake(0, self.config.yAxis) animated:true];
                [[AnimationManager shared].tblAnimation animateTableSwipeUp:isUp indexTop:self.config.index cells:self.config.cells];
            }
    }
    else{
            NSLog(@"Down");
        
            if (self.config.yAxis >= self.config.cellHeight-self.config.gap){
                
                self.config.yAxis -= self.config.cellHeight;
                self.config.index--;
                
                [self setContentOffset:CGPointMake(0, self.config.yAxis) animated:true];
                [[AnimationManager shared].tblAnimation animateTableSwipeUp:isUp indexTop:self.config.index cells:self.config.cells];
            }
    }
    
    //animate your cells here ...:)
    NSLog(@"self.config.index %d",self.config.index);
}


@end
