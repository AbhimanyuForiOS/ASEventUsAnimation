
//  Created by Abhimanyu  on 17/11/17.


#import "ControllerConfig.h"
#import <UIKit/UIKit.h>
@implementation ControllerConfig

+(void)setUpNav:(UIViewController *)vc{

    vc.navigationController.navigationBar.hidden                         = true;
    vc.navigationController.navigationItem.hidesBackButton               = true;
    vc.view.backgroundColor                                              = [UIColor redColor];
}
@end
