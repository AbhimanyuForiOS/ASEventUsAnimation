
//  Created by Abhimanyu  on 17/11/17.


#import <UIKit/UIKit.h>

@interface CView : UIView
-(instancetype)initWithConfig:(MainConfig *)config onView:(UIView *)view;


@property(retain,nonatomic)MainConfig * config;
@property(retain,nonatomic)CollectionView * vCollection;
@property(retain,nonatomic)TableView * vTbl;



@end
