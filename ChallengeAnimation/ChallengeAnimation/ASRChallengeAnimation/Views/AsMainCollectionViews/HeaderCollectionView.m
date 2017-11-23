
//  Created by Abhimanyu  on 17/11/17.

#import "HeaderCollectionView.h"

@implementation HeaderCollectionView

-(instancetype)initWithConfig:(CollectionConfig *)config onView:(UIView *)view {
    
    self = [super init];
    
    if(self){
        self.config = [[CollectionHeaderConfig alloc]initWithMainConfig:config];
        
        self.backgroundColor = self.config.bgColor;
        self.frame           = CGRectMake(0, 0, screen_width, self.config.height);
        [view addSubview:self];
        
     
        
        
        
        self.btnBack = [UIButton buttonWithType:UIButtonTypeCustom];
        
        CGFloat btnHeight  = self.config.height*0.35;
        
        
        self.btnBack.frame = CGRectMake(self.config.gap, self.config.height/2-btnHeight/2,btnHeight, btnHeight);
        self.btnBack.backgroundColor    = [UIColor clearColor];
        self.btnBack.tag  = 0;
        [self.btnBack setTitle:@"<" forState:UIControlStateNormal];
        [self.btnBack setTitleColor:[UIColor colorWithRed:71.0/255.0 green:66.0/255.0 blue:67.0/255.0 alpha:1.0] forState:UIControlStateNormal];
        self.btnBack.titleLabel.font                 = [UIFont boldSystemFontOfSize:screen_width*0.052];
        [self addSubview:self.btnBack];
        
        
        CGFloat w = self.bounds.size.width/2;
        
        self.lblTitle = [[UILabel alloc]initWithFrame:CGRectMake(w*2/2-w/2, self.config.height/2-btnHeight/2, w, btnHeight) ];
        
        self.lblTitle.textColor = [UIColor colorWithRed:71.0/255.0 green:66.0/255.0 blue:67.0/255.0 alpha:1.0];
        self.lblTitle.font      = [UIFont systemFontOfSize:screen_width*0.04];
        self.lblTitle.textAlignment = NSTextAlignmentCenter;
        self.lblTitle.text          = @"Events";
        [self addSubview:self.lblTitle];

        
        
        
        self.btnMenu = [UIButton buttonWithType:UIButtonTypeCustom];
        self.btnMenu.frame = CGRectMake(self.bounds.size.width-btnHeight-self.config.gap, self.config.height/2-btnHeight/2,btnHeight, btnHeight);
        self.btnMenu.backgroundColor    = [UIColor clearColor];
        self.btnMenu.tag  = 1;
        [self.btnMenu setBackgroundImage:[UIImage imageNamed:@"menuTable.png"] forState:UIControlStateNormal];
        [self.btnMenu setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [self addSubview:self.btnMenu];
        
        
        
    }
    return self;
    
}


@end
