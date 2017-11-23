
//  Created by Abhimanyu  on 21/11/17.


#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@protocol SwiperDelegate<NSObject>

@optional
-(void)swiperIsGoingUp:(BOOL)isUp;
-(void)swiperIsGoingLeft:(BOOL)isLeft;
@end

@interface SwiperManager : NSObject


#pragma mark: Related Properties
@property(retain,nonatomic)UIView * viewCurrent;

@property(retain,nonatomic)NSMutableArray  * swipersUpDown;
@property(retain,nonatomic)NSMutableArray  * swipersLeftRight;
@property(retain,nonatomic) id<SwiperDelegate> delegate;


#pragma mark: Single Tone Object
+(SwiperManager *)shared;



#pragma mark: Vertical Swipers On Current View
-(void)setVerticalSwipersOnView:(UIView *)view;
-(void)removeSwipers;


-(void)setHorizantalSwipersOnView:(UIView *)view;



@end
