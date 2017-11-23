
//  Created by Abhimanyu  on 17/11/17.


#import <UIKit/UIKit.h>


@interface HeaderCollectionView : UIView
@property(retain,nonatomic)CollectionHeaderConfig * config;
-(instancetype)initWithConfig:(CollectionConfig *)config onView:(UIView *)v;

@property(retain,nonatomic)UIButton * btnBack;

@property(retain,nonatomic)UILabel  * lblTitle;
@property(retain,nonatomic)UIButton * btnMenu;
@end
