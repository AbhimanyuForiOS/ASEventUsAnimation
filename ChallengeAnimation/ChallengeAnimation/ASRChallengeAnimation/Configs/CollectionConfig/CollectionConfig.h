
//  Created by Abhimanyu  on 17/11/17.


#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <CoreGraphics/CoreGraphics.h>
@interface CollectionConfig : NSObject

@property(retain,nonatomic)UIColor * colorBg;


-(instancetype)initWithMainConfig:(MainConfig *)config;
@property(retain,nonatomic)MainConfig * configMain;






/*
 Collection View left/right Scroller  configuration object
*/

@property(retain,nonatomic)UIColor *collectionBgColor;
@property(retain,nonatomic)NSMutableArray * cells;

@property(retain,nonatomic)UIColor *txtColorHeading;
@property(retain,nonatomic)UIColor *txtColorSubHeading;



@property(nonatomic)CGFloat cellHeight;
@property(nonatomic)CGFloat cellWidth;
@property(nonatomic)CGFloat xAxis;
@property(nonatomic)int index;
@property(nonatomic)CGFloat gap;


@property(nonatomic)CGRect fHeadingBegin;
@property(nonatomic)CGRect fHeadingFinal;


@property(nonatomic)CGRect fSubHeadingBegin;
@property(nonatomic)CGRect fSubHeadingFinal;


@property(nonatomic)CGRect fBottomBegin;
@property(nonatomic)CGRect fBottomFinal;













@end
