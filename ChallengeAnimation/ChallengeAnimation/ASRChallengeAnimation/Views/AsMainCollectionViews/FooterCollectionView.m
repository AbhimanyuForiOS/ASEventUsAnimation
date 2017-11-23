
//  Created by Abhimanyu  on 17/11/17.


#import "FooterCollectionView.h"

@implementation FooterCollectionView

-(instancetype)initWithConfig:(CollectionConfig *)config onView:(UIView *)view {
    
    self = [super init];
    
    if(self){
        
        self.config = [[CollectionFooterConfig alloc]initWithMainConfig:config];
        self.backgroundColor = self.config.bgColor;
        self.frame           = CGRectMake(0, screen_height-self.config.height, screen_width, self.config.height);
        self.clipsToBounds   = false;
        [view addSubview:self];
        [self makeButtons];
        
    }
    return self;
}

-(void)makeButtons{
    
    CGFloat top    = self.bounds.size.height;
    CGFloat left   = 0;
    
    for (int i = 0; i<self.config.actions.count; i++) {
        
        //action information
        Action * a = (Action *)[self.config.actions objectAtIndex:i];
        
        //set objects in view  for animation
        ActionView * v = [[ActionView alloc]initWithFrame:CGRectMake(left, top, self.config.height, self.config.height)];
        [self addSubview:v];
        
        CGFloat btnHeight = self.config.height*0.60;
        
        
        //set button with image round
        v.btn       = [UIButton buttonWithType:UIButtonTypeCustom];
        v.btn.frame = CGRectMake(v.bounds.size.width/2-btnHeight/2,0, btnHeight, btnHeight);
        v.btn.layer.cornerRadius = btnHeight/2;
        v.btn.backgroundColor = [UIColor clearColor];
        [v.btn setImage:[UIImage imageNamed:[NSString stringWithFormat:@"a%d.png",i]] forState:UIControlStateNormal];
        [v addSubview:v.btn];
        
        
        CGFloat lblHeight = self.config.height*0.40;
    
        v.lblTitle       = [[UILabel alloc]init];
        v.lblTitle.frame = CGRectMake(v.bounds.size.width/2-v.bounds.size.width/2,btnHeight, v.bounds.size.width, lblHeight);
        v.lblTitle.backgroundColor = [UIColor clearColor];
        v.lblTitle.text     = a.title;
        v.lblTitle.textColor = [UIColor whiteColor];
        v.lblTitle.textAlignment =  NSTextAlignmentCenter;
        v.lblTitle.font          = [UIFont systemFontOfSize:screen_width*0.03];
        [v addSubview:v.lblTitle];
        [self.config.views addObject:v];
    
        left += self.config.height;
    
    }
}




@end
