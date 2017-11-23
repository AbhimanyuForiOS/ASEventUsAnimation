
//  Created by Abhimanyu  on 17/11/17.


#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <CoreGraphics/CoreGraphics.h>

@interface CollectionFooterConfig : NSObject
-(instancetype)initWithMainConfig:(CollectionConfig *)config;

@property(retain,nonatomic)CollectionConfig * configMain;
@property(retain,nonatomic)UIColor *bgColor;
@property(nonatomic)CGFloat height;
@property(nonatomic)CGFloat gap;

@property(nonatomic)CGFloat btnHeight;
@property(nonatomic)CGFloat lblHeight;
@property(retain,nonatomic)NSMutableArray * actions;
@property(retain,nonatomic)NSMutableArray * views;








@end
