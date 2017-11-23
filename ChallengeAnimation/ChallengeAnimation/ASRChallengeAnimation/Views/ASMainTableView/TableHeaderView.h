
//  Created by Abhimanyu  on 17/11/17.


#import <UIKit/UIKit.h>

@interface TableHeaderView : UIView

@property(retain,nonatomic)TableHeaderConfig * config;
-(instancetype)initWithConfig:(TableHeaderConfig *)config onView:(UIView *)view;

@property(retain,nonatomic)UIButton * btnSearch;

@property(retain,nonatomic)UILabel  * lblTitle;
@property(retain,nonatomic)UIButton * btnMenu;



@end
