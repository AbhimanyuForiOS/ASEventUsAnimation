
//  Created by Abhimanyu  on 17/11/17.


#import <UIKit/UIKit.h>
@interface TableView : UIView




@property(retain,nonatomic)TableConfig * config;
-(instancetype)initWithConfig:(TableConfig *)config onView:(UIView *)view;

@property(retain,nonatomic)TableHeaderView * header;
@property(retain,nonatomic)SwipableTable   * tblView;



@property (retain, nonatomic) UIButton *btnPlus;





@end
