
//  Created by Abhimanyu  on 17/11/17.


#import "CollectionView.h"
#import "CollectionConfig.h"

@implementation CollectionView
@synthesize header,footer,collectionView;

#pragma mark: Collection View Set Up
-(instancetype)initWithConfig:(CollectionConfig *)config onView:(UIView *)view{
    
    self = [super init];
    
    if(self){
        
        if(config)
            self.config = config;
        else
            self.config = [[CollectionConfig alloc]init];
        
        self.backgroundColor = [UIColor orangeColor];
        self.frame           = CGRectMake(0, 0, screen_width, screen_height);
        [view addSubview:self];
        
        self.collectionView = [[CollectionScroller alloc]initWithConfig: self.config onView:self];
        
        //header of collection
        self.header = [[HeaderCollectionView alloc]initWithConfig: self.config onView:self];
        [self.header.btnBack addTarget:self action:@selector(btnBackTaped:) forControlEvents:UIControlEventTouchUpInside];
        
        //footer of ocllection
         self.footer = [[FooterCollectionView alloc]initWithConfig: self.config onView:self];
    }
    
    return self;
}


#pragma mark:  TableViewDelegate method
-(void)itemClickedFromTable:(Item *)item withIndex:(int)index{
    [self setSwipers];
    
    [[AnimationManager shared].collectionAnimation startAnimation:true indexTop:index cells:self.config.cells];
   
    self.collectionView.backgroundColor = item.color;

    self.config.xAxis = index*screen_width;
    self.config.index = index;
    [self.collectionView setContentOffset:CGPointMake(index*screen_width, 0)];
    
}

-(void)setSwipers{
   
    //set swiper on this view left  /  right swipers
    [SwiperManager shared].viewCurrent = self.collectionView;
    [SwiperManager shared].delegate    = self.collectionView;
    [[SwiperManager shared]setHorizantalSwipersOnView:self];

}
#pragma mark:  UIButton Action from Header
-(void)btnBackTaped:(UIButton *)btn{

    [[AnimationManager shared].tblAnimation showTableViewfromLeftSide];
    //Hide your botton buttons for next animation on selection from table view 
    [[AnimationManager shared].collectionAnimation hideBottomView];
}


@end
