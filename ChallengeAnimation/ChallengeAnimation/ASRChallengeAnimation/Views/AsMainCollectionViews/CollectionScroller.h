//
//  CollectionScroller.h
//  ChallengeAnimation
//
//  Created by Abhimanyu  on 22/11/17.
//  Copyright © 2017 Konstant. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CollectionScroller : UIScrollView<SwiperDelegate>
@property(retain,nonatomic)CollectionConfig * config;
@property(retain,nonatomic)NSMutableArray * cells;

-(instancetype)initWithConfig:(CollectionConfig *)config onView:(UIView *)view;





@end
