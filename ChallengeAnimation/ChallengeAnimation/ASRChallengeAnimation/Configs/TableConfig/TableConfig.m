
//  Created by Abhimanyu  on 17/11/17.

#import "TableConfig.h"

@implementation TableConfig
@synthesize configTblHeader,yAxis,gap;
@synthesize txtColorHeading,txtColorSubHeading,btnHeight;

-(instancetype)initWithMainConfig:(MainConfig *)config{

     self = [super init];
    if (self) {
        
        self.configMain = config;
        
        self.configTblHeader =  [[TableHeaderConfig alloc]init];
        self.tblBgColor      = [UIColor yellowColor];
        
        self.cells            = [[NSMutableArray alloc]init];
   
      
        CGFloat sHeight         = screen_height-self.configTblHeader.height;
        self.cellHeight         = sHeight/3;
        self.cellWidth          = screen_width;
        self.yAxis              = 0.0;
        self.index              = 0;
        self.gap                =  screen_width*0.05;
        self.txtColorHeading    = [UIColor whiteColor];
        self.txtColorSubHeading = [UIColor whiteColor];
        self.btnHeight          = screen_width*0.13;
        
        
    
    }
    
    return self;
}

- (UIColor *)randomColor
{
    int red = arc4random() % 255 / 255.0;
    int green = arc4random() % 255 / 255.0;
    int blue = arc4random() % 255 / 255.0;
    UIColor *color = [UIColor colorWithRed:red green:green blue:blue alpha:1.0];
    NSLog(@"%@", color);
    return color;
}



@end
