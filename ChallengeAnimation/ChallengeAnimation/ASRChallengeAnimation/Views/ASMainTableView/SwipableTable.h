
//  Created by Abhimanyu  on 21/11/17.


#import <UIKit/UIKit.h>
@protocol TableViewDelegate<NSObject>
-(void)itemClickedFromTable:(Item *)item withIndex:(int )index;
@end

@interface SwipableTable : UIScrollView<SwiperDelegate>


@property(retain,nonatomic) id<TableViewDelegate> delegateTbl;
@property(retain,nonatomic)TableConfig * config;

@property(retain,nonatomic)NSMutableArray * cells;

-(instancetype)initWithConfig:(TableConfig *)config onView:(UIView *)view;



@end
