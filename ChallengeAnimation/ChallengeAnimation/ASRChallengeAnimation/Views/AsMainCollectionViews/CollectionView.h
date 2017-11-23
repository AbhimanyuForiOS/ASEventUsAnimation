
//  Created by Abhimanyu  on 17/11/17.

#import <UIKit/UIKit.h>



@interface CollectionView : UIView<TableViewDelegate>

@property(retain,nonatomic)CollectionConfig * config;

@property(retain,nonatomic)HeaderCollectionView * header;
@property(retain,nonatomic)FooterCollectionView * footer;
@property(retain,nonatomic)CollectionScroller * collectionView;


-(instancetype)initWithConfig:(CollectionConfig *)config onView:(UIView *)view;




@end
