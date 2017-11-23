
//  Created by Abhimanyu  on 21/11/17.

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Item : NSObject
@property(retain,nonatomic)NSString  * heading;
@property(retain,nonatomic)NSString  * subHeading;
@property(retain,nonatomic)NSString  * imgName;
@property(retain,nonatomic)UIColor   * color;

-(instancetype)initWithHeadeing:(NSString *)heading subHeading:(NSString *)subHeading imgName:(NSString *)imgName color:(UIColor *)color;


@end
