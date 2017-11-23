
//  Created by Abhimanyu  on 17/11/17.


#import "TableHeaderView.h"

@implementation TableHeaderView

-(instancetype)initWithConfig:(TableHeaderConfig *)config onView:(UIView *)view {
    
    self = [super init];
    
    if(self){
        if(config)
            self.config = config;
        else
            self.config = [[TableHeaderConfig alloc]init];
        
        
        self.backgroundColor = self.config.bgColor;
        self.frame           = CGRectMake(0, 0, screen_width, self.config.height);
        [view addSubview:self];
        
        self.btnSearch = [UIButton buttonWithType:UIButtonTypeCustom];
        
        CGFloat btnHeight  = self.config.height*0.35;
        
        
        self.btnSearch.frame = CGRectMake(self.config.gap, self.config.height/2-btnHeight/2,btnHeight, btnHeight);
        self.btnSearch.backgroundColor    = [UIColor clearColor];
        self.btnSearch.tag  = 0;
        [self.btnSearch setBackgroundImage:[UIImage imageNamed:@"searchTable.png"] forState:UIControlStateNormal];
        [self.btnSearch setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [self addSubview:self.btnSearch];
        
        
        CGFloat w = self.bounds.size.width/2;
        
        self.lblTitle = [[UILabel alloc]initWithFrame:CGRectMake(w*2/2-w/2, self.config.height/2-btnHeight/2, w, btnHeight) ];
        
        self.lblTitle.textColor = [UIColor colorWithRed:71.0/255.0 green:66.0/255.0 blue:67.0/255.0 alpha:1.0];
        self.lblTitle.font      = [UIFont systemFontOfSize:screen_width*0.03];
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
