
//  Created by Abhimanyu  on 17/11/17.


#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <CoreGraphics/CoreGraphics.h>
#import "TableHeaderConfig.h"

@interface TableConfig : NSObject

-(instancetype)initWithMainConfig:(MainConfig *)config;
@property(retain,nonatomic)MainConfig * configMain;
/*
 Header configuration object
 */

@property(retain,nonatomic)TableHeaderConfig * configTblHeader;



/*
 Table View Up/Down Scroller  configuration object
 */

@property(retain,nonatomic)UIColor *tblBgColor;

@property(retain,nonatomic)NSMutableArray * cells;

@property(retain,nonatomic)UIColor *txtColorHeading;
@property(retain,nonatomic)UIColor *txtColorSubHeading;






@property(nonatomic)CGFloat cellHeight;
@property(nonatomic)CGFloat cellWidth;

@property(nonatomic)CGFloat yAxis;

@property(nonatomic)int index;
@property(nonatomic)CGFloat gap;

@property(nonatomic)CGFloat btnHeight;



@end
