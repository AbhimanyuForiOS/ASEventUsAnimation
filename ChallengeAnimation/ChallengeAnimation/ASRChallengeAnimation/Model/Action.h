//
//  Action.h
//  ChallengeAnimation
//
//  Created by Abhimanyu  on 23/11/17.
//  Copyright © 2017 Konstant. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Action : NSObject
@property(retain,nonatomic)NSString  * title;
@property(retain,nonatomic)UIImage   * img;


-(instancetype)initWithTitle:(NSString *)title img:(UIImage *)img;



@end
