
//  Created by Abhimanyu  on 21/11/17.


#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>
#import <UIKit/UIKit.h>
#import "TableView.h"

@interface AnimationTableView : NSObject
@property(nonatomic)CGFloat animationSpeed;
@property(retain,nonatomic)TableView * swiper;
-(instancetype)initWithAnimationTableView:(TableView *)view;
-(void)animateTableSwipeUp:(BOOL)isSwipeUp indexTop:(int)indexTop cells:(NSMutableArray *)cells;

/*
 These two methods are use full for navigation from one to another view..(TABLE / COLLECTION)
 */
-(void)hideTableViewLeftSide;
-(void)showTableViewfromLeftSide;

@end
