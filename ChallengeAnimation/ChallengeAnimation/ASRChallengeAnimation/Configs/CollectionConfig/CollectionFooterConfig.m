
//  Created by Abhimanyu  on 17/11/17.


#import "CollectionFooterConfig.h"

@implementation CollectionFooterConfig
@synthesize height,bgColor;

@synthesize  gap,btnHeight,lblHeight,views;



-(instancetype)initWithMainConfig:(CollectionConfig *)config{
    
    self = [super init];
    if (self) {
        self.configMain = config;
     
        self.bgColor = [UIColor clearColor];

        
        self.btnHeight = self.height*0.60;
        self.lblHeight = self.height*0.40;
        
        self.gap       = config.gap;
        self.views     = [[NSMutableArray alloc]init];
        
        
         Action * a1 = [[Action alloc]initWithTitle:@"Save" img:[UIImage imageNamed:@""]];
         Action * a2 = [[Action alloc]initWithTitle:@"Photo" img:[UIImage imageNamed:@""]];
         Action * a3 = [[Action alloc]initWithTitle:@"Program" img:[UIImage imageNamed:@""]];
         Action * a4 = [[Action alloc]initWithTitle:@"URL" img:[UIImage imageNamed:@""]];
         Action * a5 = [[Action alloc]initWithTitle:@"Share" img:[UIImage imageNamed:@""]];
        
   
        self.actions = [[NSMutableArray alloc]initWithObjects:a1,a2,a3,a4,a5, nil];
        self.height =  screen_width/self.actions.count;

    }
    return self;
    
    
}

@end
