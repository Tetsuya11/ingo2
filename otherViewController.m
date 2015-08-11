//
//  otherViewController.m
//  ingo
//
//  Created by 一野哲也 on 2015/07/30.
//  Copyright (c) 2015年 TetsuyaIchino. All rights reserved.
//

#import "otherViewController.h"

@interface otherViewController (){
   
    NSArray *picurl;
}

@end

@implementation otherViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    picurl = [NSArray arrayWithObjects:
              @"http://36.media.tumblr.com/cbf9b40670f636521fc1417f801da79d/tumblr_n5gtdlvplp1qelgdho1_500.jpg",
              
              @"http://pbs.twimg.com/media/Bb9nEj7CYAE09Jr.jpg",
              
              @"https://pbs.twimg.com/media/B7Ch8SwCUAEv2l8.jpg",
              
              @"https://pbs.twimg.com/media/BslgzgPCAAAZDYS.jpg",
              
              @"https://s-media-cache-ak0.pinimg.com/736x/15/be/0b/15be0b2aa56636ac2f57ac44706331ae.jpg",
              
              nil];
    

    [self local_picLoad:@"sho2.jpg"];    //最後に表示するローカル画像
    [self picLoad:picurl];          //urlから非同期で画像を読み込む
    
}

//picture load
-(void)picLoad:(NSArray *)urls
{
    for (int i=0; i<[urls count]; i++) {
        
        //MDCSwipeToChooseViewのオプション設定と作成
        MDCSwipeToChooseViewOptions *options = [MDCSwipeToChooseViewOptions new];
        options.delegate = self;
        options.likedText = @"Keep";
        options.likedColor = [UIColor blueColor];
        options.nopeText = @"Delete";
        options.onPan = ^(MDCPanState *state){
            if (state.thresholdRatio == 1.f && state.direction == MDCSwipeDirectionLeft) {
                NSLog(@"Let go now to delete the photo!");
            }
        };
        MDCSwipeToChooseView *mdview = [[MDCSwipeToChooseView alloc] initWithFrame:self.view.bounds options:options];
        
        //addsubview読み込んだ画像をのせる
        long int cnt = [urls count]-1;
        NSString *imageURL = [urls objectAtIndex:(cnt-i)];
        dispatch_queue_t q_global = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
        dispatch_queue_t q_main = dispatch_get_main_queue();
        
        //一旦viewだけ作っている
        mdview.imageView.image = [UIImage imageNamed:@"load"];
        [self.view addSubview:mdview];
        
        dispatch_async(q_global, ^{
            
            UIImage *img = [UIImage imageWithData:[NSData dataWithContentsOfURL: [NSURL URLWithString: imageURL]]];
            
            dispatch_async(q_main, ^{
                mdview.imageView.image = img;
            });
        });
    }
    
}

//ローカル画像の読み込み
-(void)local_picLoad:(NSString *)url
{
    UIImageView *iv = [[UIImageView alloc] initWithImage:[UIImage imageNamed:url]];
    iv.frame = self.view.bounds;
    [self.view addSubview:iv];
}


#pragma mark - MDCSwipeToChooseDelegate Callbacks

// This is called when a user didn't fully swipe left or right.
- (void)viewDidCancelSwipe:(UIView *)view {
    NSLog(@"Couldn't decide, huh?");
}

// Sent before a choice is made. Cancel the choice by returning `NO`. Otherwise return `YES`.
- (BOOL)view:(UIView *)view shouldBeChosenWithDirection:(MDCSwipeDirection)direction {
    if (direction == MDCSwipeDirectionLeft) {
        NSLog(@"yes");
        return YES;
    } else {
        NSLog(@"no");
        // Snap the view back and cancel the choice.
        [UIView animateWithDuration:0.16 animations:^{
            view.transform = CGAffineTransformIdentity;
            view.center = [view superview].center;
        }];
        return YES;
    }
}

// This is called then a user swipes the view fully left or right.
- (void)view:(UIView *)view wasChosenWithDirection:(MDCSwipeDirection)direction {
    if (direction == MDCSwipeDirectionLeft) {
        NSLog(@"Photo deleted!");
    } else {
        NSLog(@"Photo saved!");
    }
}

@end
//}
//
//#pragma mark - MDCSwipeToChooseDelegate Callbacks
//
//- (void)viewDidcanceSwipe:(UIView *)view{
//    NSLog(@"決めた？");
//}
//
//- (BOOL)view:(UIView *)view shouldBeChosenWithDirection:(MDCSwipeDirection)direction{
//    if(direction ==MDCSwipeDirectionLeft){
//        return YES;
//    }else{
//        [UIView animateWithDuration:0.16 animations:^{
//            view.transform = CGAffineTransformIdentity;
//            view.center = [view superview].center;
//            
//        }];
//        return YES;
//        
//    }
//}
//
//-(void)view:(UIView *)view wasChoosenWithDirection:
//(MDCSwipeDirection)direction{
//    if(direction == MDCSwipeDirectionLeft){
//        NSLog(@"デリート");
//    }else{
//        NSLog(@"セーブ");
//        
//    }
//}
//- (void)didReceiveMemoryWarning {
//    [super didReceiveMemoryWarning];
//    // Dispose of any resources that can be recreated.
//}
//
///*
//#pragma mark - Navigation
//
//// In a storyboard-based application, you will often want to do a little preparation before navigation
//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
//    // Get the new view controller using [segue destinationViewController].
//    // Pass the selected object to the new view controller.
//}
//*/
//
//@end
