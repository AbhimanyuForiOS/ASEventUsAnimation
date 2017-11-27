# ASEventUsAnimation

This is the Animation Gif taken from Dribble.com and we created this in to Objective-c ,any of my friend can use this in Objective-c code with a single line and this animation is fully loaded with configuration properties .

This Animation can Give Rich User Interface to  your iOS Mobile Application application  for any device.

Developer can hold Dynamic Data and fill that data in to this Animation According to His/Her Need.

Fully customize with few Configuration files for doing changes in User Interface according to developer need.


![challenge](https://user-images.githubusercontent.com/7630897/33175837-faada6c4-d082-11e7-9ddd-82036d60c7bc.gif)

How you will you  Configure this animation in to your existing Project.



STEP 1 :-
Download this Project "ChallengeAnimation" in to your mac system and open it in to "XCode 9.0" and above.


STEP 2 :-
Copy "PrefixHeader.pch"  and paste it in your existing Project where you want to implement this animation.
Go to Project and search Project->Settings->Prefix Header and then set "../ChallengeAnimation/PrefixHeader.pch" there on Path.


STEP 3 :-
Drag the whole "ChallengeAnimation" yellow Folder from "ChallengeAnimation" Project to your existing Xcode Project where you want to implement it.

That's it for animation files set up!!


STEP 4 :-
Create  An UIViewController and give name  “AnimationVc”.
Xcode will Create AnimationVc.h & AnimationVc.m files.

Now you have to Do 2 things :- 

STEP 4.1 :-  In to AnimationVc.h file create main property of animation view.

`
@interface AnimationVc : UIViewController
@property(retain,nonatomic)CView *v ;
@end

`

![hfile](https://user-images.githubusercontent.com/7630897/33254120-41896c62-d36d-11e7-83a8-90e942872133.png)


STEP 4.2:- in AnimationVc.m file set some functions.

`
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
`


![mfile](https://user-images.githubusercontent.com/7630897/33254138-56614178-d36d-11e7-99ed-f82f93012c45.png)




Now you can set this view in front of any navigation controller flow of your application and it will load your animation.


Happy Coding!!! 







