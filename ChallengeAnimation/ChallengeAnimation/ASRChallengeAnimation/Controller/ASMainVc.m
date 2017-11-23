//  ASMainVc.m
//  ChallengeAnimation
//  Created by Abhimanyu  on 17/11/17.

#import "ASMainVc.h"


#pragma mark:- Interface

@interface ASMainVc ()
@end

@implementation ASMainVc
@synthesize v;

#pragma mark: View Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [ControllerConfig setUpNav:self];

    //start animation
    v = [[CView alloc]initWithConfig:[[MainConfig alloc]init] onView:self.view];
}


#pragma mark: Memory Management Method
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


#pragma mark:Hide Status Bar
-(BOOL)prefersStatusBarHidden{
    return true;
}


@end
