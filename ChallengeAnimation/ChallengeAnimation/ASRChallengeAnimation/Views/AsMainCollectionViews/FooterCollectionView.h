
//  Created by Abhimanyu  on 17/11/17.


#import <UIKit/UIKit.h>

@interface FooterCollectionView : UIView
@property(retain,nonatomic)CollectionFooterConfig * config;
-(instancetype)initWithConfig:(CollectionConfig *)config onView:(UIView *)v;

@end
