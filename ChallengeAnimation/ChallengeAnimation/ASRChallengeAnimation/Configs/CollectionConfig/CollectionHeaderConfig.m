
//  Created by Abhimanyu  on 17/11/17.


#import "CollectionHeaderConfig.h"

@implementation CollectionHeaderConfig
@synthesize height,bgColor,gap;

-(instancetype)initWithMainConfig:(CollectionConfig *)config{
    
    self = [super init];
    if (self) {
        self.configMain = config;
        self.height =  height_headers;
        self.bgColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.20];
        self.gap                =  screen_width*0.03;
    }
    return self;
    
    
}

@end
