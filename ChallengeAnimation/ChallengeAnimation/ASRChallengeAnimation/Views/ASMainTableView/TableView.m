
//  Created by Abhimanyu  on 17/11/17.

#import "TableView.h"

@implementation TableView


#pragma mark: TableView Set Up
-(instancetype)initWithConfig:(TableConfig *)config onView:(UIView *)view{
    
    self = [super init];
    
    if(self){
        
        if(config)
            self.config = config;
        else
            self.config = [[TableConfig alloc]init];
        
        
        
        self.backgroundColor = [UIColor clearColor];
        self.frame           = CGRectMake(0, 0, screen_width, screen_height);
        [view addSubview:self];
        
        
        //header of table 
        self.header = [[TableHeaderView alloc]initWithConfig:self.config.configTblHeader onView:view];
        
        //set UP/DOWN Scroller  below header of top "TableView"....
        self.tblView = [[SwipableTable alloc]initWithConfig:self.config onView:self];
        
        
        self.btnPlus = [UIButton buttonWithType:UIButtonTypeCustom];
        self.btnPlus.frame = CGRectMake(screen_width-self.config.btnHeight-self.config.gap, self.bounds.size.height-self.config.btnHeight-self.config.gap, self.config.btnHeight, self.config.btnHeight);
        self.btnPlus.layer.cornerRadius = self.btnPlus.bounds.size.width/2;
        self.btnPlus.backgroundColor    = [UIColor whiteColor];
        [self.btnPlus setTitle:@"+" forState:UIControlStateNormal];
        [self.btnPlus setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        self.btnPlus.titleLabel.font                 = [UIFont boldSystemFontOfSize:screen_width*0.052];
        
        [self addSubview:self.btnPlus];
        
        [self bringSubviewToFront:self.btnPlus];
    
    }
    return self;
    
}


#pragma mark:- ASButton Delegate
-(void)buttonClicked:(UIButton *)btn{
    
    
}





@end
