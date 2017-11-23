
//  Created by Abhimanyu  on 21/11/17.

#import "Item.h"

@implementation Item
@synthesize          subHeading;
@synthesize          heading;
@synthesize          imgName;
@synthesize          color;

-(instancetype)initWithHeadeing:(NSString *)heading subHeading:(NSString *)subHeading imgName:(NSString *)imgName color:(UIColor *)color{
    
    self = [super init];
    
    if(self){
        self.heading     = heading;
        self.subHeading  = subHeading;
        self.imgName     = imgName;
        self.color       = color;
    }

    return self;
}




@end
