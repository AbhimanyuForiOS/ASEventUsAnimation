
//  Created by Abhimanyu  on 17/11/17.


#import "MainConfig.h"

@implementation MainConfig
@synthesize items;
-(instancetype)init{

    self = [super init];
    
    if(self){
        self.items            = [[NSMutableArray alloc]init];
 
        //fill some temp items for animation
        for (int i = 0; i<10; i++) {
            NSString * heading    =  [NSString stringWithFormat:@"Respect Coders %d ", i+1];
            NSString * subHeading =  [NSString stringWithFormat:@"AND HOLI FESTIVAL OF COLORS  %d ", i+1];
            NSString * imgName    =  [NSString stringWithFormat:@"%d.png",i+1];
            //generate random color ...
            NSInteger aRedValue = arc4random()%255;
            NSInteger aGreenValue = arc4random()%255;
            NSInteger aBlueValue = arc4random()%255;
            UIColor *randColor = [UIColor colorWithRed:aRedValue/255.0f green:aGreenValue/255.0f blue:aBlueValue/255.0f alpha:1.0f];
            Item * item           = [[Item alloc]initWithHeadeing:heading subHeading:subHeading imgName:imgName color:randColor];
            [self.items addObject:item];
            
        }
        
        
  
    }
    return self;
    
}

@end
