
//  Created by Abhimanyu  on 21/11/17.


#import "SwiperManager.h"
static SwiperManager * objSManager = nil;
@implementation SwiperManager

@synthesize viewCurrent,swipersUpDown,swipersLeftRight,delegate;



#pragma mark: Single Tone Object
+(SwiperManager *)shared{
    if (objSManager == nil){
        objSManager              = [[SwiperManager alloc]init];
        objSManager.swipersUpDown     = [[NSMutableArray alloc]init];
        objSManager.swipersLeftRight     = [[NSMutableArray alloc]init];
    }
    return objSManager;
}



#pragma mark: Vertical Swipers On Current View
-(void)setVerticalSwipersOnView:(UIView *)view{
    
    if (view != nil){
        [objSManager.swipersUpDown removeAllObjects];
    
        
                //Add Gestures on current view .....
                for (int i = 0; i<2; i++) {
                    
                    UISwipeGestureRecognizer * swipe = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(handleSwipe:)];
                    
                    if (i == 0)
                        swipe.direction = UISwipeGestureRecognizerDirectionUp;
                    else
                        swipe.direction = UISwipeGestureRecognizerDirectionDown;
                    
                    [view addGestureRecognizer:swipe];
                    
                    [objSManager.swipersUpDown addObject:swipe];
                }
        
    
    }
}



-(void)setHorizantalSwipersOnView:(UIView *)view{
    
    if (view != nil){

        [objSManager.swipersLeftRight removeAllObjects];
        //Add Gestures on current view .....
        for (int i = 0; i<2; i++) {
            
            UISwipeGestureRecognizer * swipe = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(handleSwipe:)];
            
            if (i == 0)
                swipe.direction = UISwipeGestureRecognizerDirectionLeft;
            else
                swipe.direction = UISwipeGestureRecognizerDirectionRight;
            
            [view addGestureRecognizer:swipe];
            
            [objSManager.swipersLeftRight addObject:swipe];
        }
    }
}



#pragma mark:- Remove Swiper Manager and its sub objects
-(void)removeSwipers{
    if(objSManager != nil){

        [objSManager.swipersUpDown removeAllObjects];
         [objSManager.swipersLeftRight removeAllObjects];
        objSManager.viewCurrent = nil;
        objSManager = nil;
        objSManager.delegate = nil;
        
    }
    
}



#pragma mark:- Animate entire  animation
-(void)handleSwipe:(UISwipeGestureRecognizer *)gesture{

                //get gesture up/down actions....
                if (gesture.direction == UISwipeGestureRecognizerDirectionDown){
                 
                    if(objSManager.delegate != nil){
                        [objSManager.delegate swiperIsGoingUp:false];
                    }
                }else if (gesture.direction == UISwipeGestureRecognizerDirectionUp){
              
                    if(objSManager.delegate != nil){
                        [objSManager.delegate swiperIsGoingUp:true];
                    }
                }
    
    
    
                else if (gesture.direction == UISwipeGestureRecognizerDirectionLeft){
                  
                    if(objSManager.delegate != nil){
                        [objSManager.delegate swiperIsGoingLeft:true];
                    }
                }else if (gesture.direction == UISwipeGestureRecognizerDirectionRight){
                
                    if(objSManager.delegate!= nil){
                        [objSManager.delegate swiperIsGoingLeft:false];
                    }
                }
    
    
    
}







@end
