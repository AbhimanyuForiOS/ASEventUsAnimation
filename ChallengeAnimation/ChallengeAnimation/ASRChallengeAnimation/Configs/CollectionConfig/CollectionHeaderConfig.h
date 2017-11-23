
//  Created by Abhimanyu  on 17/11/17.


#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <CoreGraphics/CoreGraphics.h>

@interface CollectionHeaderConfig : NSObject
-(instancetype)initWithMainConfig:(CollectionConfig *)config;

@property(retain,nonatomic)CollectionConfig * configMain;

@property(retain,nonatomic)UIColor *bgColor;
@property(nonatomic)CGFloat height;
@property(nonatomic)CGFloat gap;


@end
