
//  Created by Abhimanyu  on 17/11/17.


#import "CView.h"

@implementation CView
@synthesize vCollection,vTbl,config;

-(instancetype)initWithConfig:(MainConfig *)config onView:(UIView *)view{
    
    self = [super init];
    
    if(self){
        
        if(config)
            self.config = config;
        else
            self.config = [[MainConfig alloc]init];
    
        self.backgroundColor = [UIColor yellowColor];
        self.frame           = CGRectMake(0, 0, screen_width, screen_height);
        [view addSubview:self];
    
        
        
        //set up collection view on main view ......
        self.vCollection     = [[CollectionView alloc]initWithConfig:[[CollectionConfig alloc]initWithMainConfig:self.config] onView:self];
        
        
        
        //set up collection view on main view ......
        self.vTbl     = [[TableView alloc]initWithConfig:[[TableConfig alloc]initWithMainConfig:self.config] onView:self];
        
        
        //set shared  animator for future use....
        [[AnimationManager shared ]setAnimationForTableView:vTbl andCollectionView:vCollection];
        
    

    }
    return self;
    
}



@end
