
//  Created by Abhimanyu  on 17/11/17.

#import "CollectionConfig.h"


@implementation CollectionConfig
@synthesize fBottomBegin,fBottomFinal;
@synthesize fHeadingBegin,fHeadingFinal;
@synthesize fSubHeadingBegin,fSubHeadingFinal;
#pragma mark: initialization of this file
-(instancetype)initWithMainConfig:(MainConfig *)config{
    
    self = [super init];
    if (self){
    
        
        
        
        self.configMain     = config;
        self.colorBg        = [UIColor cyanColor];
    
        
        self.collectionBgColor      = [UIColor yellowColor];
        self.cells                   = [[NSMutableArray alloc]init];
        self.cellHeight         = screen_height;
        self.cellWidth          = screen_width;
        self.xAxis              = 0.0;
        self.index              = 0;
        self.gap                =  screen_width*0.05;
        self.txtColorHeading    = [UIColor whiteColor];
        self.txtColorSubHeading = [UIColor whiteColor];
    
    }
    return self;
}


@end
