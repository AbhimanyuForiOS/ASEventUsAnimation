
//  Created by Abhimanyu  on 17/11/17.


#import "TableHeaderConfig.h"

@implementation TableHeaderConfig
@synthesize height,bgColor;

-(instancetype)init{
    
    self = [super init];
    if (self) {
        self.height =  height_headers;
        self.bgColor = [UIColor whiteColor];
           self.gap                =  screen_width*0.03;
    }
    return self;
    
    
}


@end
