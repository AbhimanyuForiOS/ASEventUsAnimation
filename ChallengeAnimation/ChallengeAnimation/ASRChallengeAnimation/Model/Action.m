
//  Created by Abhimanyu  on 23/11/17.


#import "Action.h"

@implementation Action
@synthesize          title;
@synthesize          img;


-(instancetype)initWithTitle:(NSString *)title img:(UIImage *)img{
    
    self = [super init];
    
    if(self){
        self.title        = title;
        self.img          = img;
    }
    
    return self;
}


@end
