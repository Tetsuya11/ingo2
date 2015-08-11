//
//  searchViewController.m
//  ingo
//
//  Created by 一野哲也 on 2015/08/05.
//  Copyright (c) 2015年 TetsuyaIchino. All rights reserved.
//

#import "searchViewController.h"
#import <SVProgressHUD/SVProgressHUD.h>


@interface searchViewController ()<UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate, UISearchDisplayDelegate>{

    CGSize _screenSize;
    
}
@end

@implementation searchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.myLabel.hidden = YES;
    
    NSDate *now = [NSDate date];
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSUInteger flags;
    NSDateComponents *comps;
    
    flags = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSHourCalendarUnit ;
    comps = [calendar components:flags fromDate:now];
    
    NSInteger year = comps.year;
    NSInteger month = comps.month;
    NSInteger day = comps.day;
    NSInteger hour = comps.hour - 2;
    
    NSString *orign = @"http://tepco-usage-api.appspot.com";
    NSString *url = [NSString stringWithFormat:@"%@/%ld/%ld/%ld/%ld.json",orign,year,month,day,hour];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:url]];
    NSData *json = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    NSArray *array = [NSJSONSerialization JSONObjectWithData:json options:NSJSONReadingAllowFragments error:nil];
    NSLog(@"供給可能最大電力：%@万kW　消費電力：%@万kW", [array valueForKeyPath:@"capacity"], [array valueForKeyPath:@"usage"]);
    
    
    // 画面のサイズを取得 (width,heigth 両方)
    _screenSize = [[UIScreen mainScreen] bounds].size;
    NSLog(@"w%f : h%f",_screenSize.width,_screenSize.height);
    
    self.searchBar.delegate = self;
    
    // キーボードのイベントを取得する
    // キーボードが表示された時の通知を登録する
    // 書き方には2種類あります
    
    // 準備
    NSNotificationCenter *center; // 通知取得用のオブジェクト定義
    center = [NSNotificationCenter defaultCenter]; // 初期化
    
    // パターン１ - 表示されたとき
    [center addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    
    // パターン２ - 閉じるとき
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
}
- (void)keyboardWillShow:(NSNotification *)notification {
    NSLog(@"keyboardWiilShow");
    
    NSTimeInterval animationDuration = [[[notification userInfo] objectForKey:UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    
    UIViewAnimationCurve animationCurve = [[[notification userInfo] objectForKey:UIKeyboardAnimationCurveUserInfoKey] intValue];
    
    UIViewAnimationOptions animationOptions = animationCurve << 16;
    
    [UIView animateWithDuration:animationDuration
                          delay:0.0
                        options:animationOptions
                     animations:^{
                         // キーボードのフレーム
                         CGSize keyboardFrameSize = [[[notification userInfo] objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue].size;
                         NSLog(@"kw%f : kh%f",keyboardFrameSize.width,keyboardFrameSize.height);
                         
                         _searchBar.translatesAutoresizingMaskIntoConstraints = YES;
                         _searchBar.frame = CGRectMake(0, (_screenSize.height - (keyboardFrameSize.height + 44)), _screenSize.width, 44);
                         self.searchBar.showsCancelButton = YES;
                     }
                     completion:^(BOOL finished) {
                         NSLog(@"finished animation");
                     }];
    
    
}

- (void)keyboardWillHide:(NSNotification *)notification {
    NSLog(@"keyboardWiilHide");
    
    NSTimeInterval animationDuration = [[[notification userInfo] objectForKey:UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    
    UIViewAnimationCurve animationCurve = [[[notification userInfo] objectForKey:UIKeyboardAnimationCurveUserInfoKey] intValue];
    
    UIViewAnimationOptions animationOptions = animationCurve << 16;
    
    [UIView animateWithDuration:animationDuration
                          delay:0.0
                        options:animationOptions
                     animations:^{
                         
                         _searchBar.translatesAutoresizingMaskIntoConstraints = YES;
                         _searchBar.frame = CGRectMake(0, _screenSize.height - 44, _screenSize.width, 44);
                         self.searchBar.showsCancelButton = NO;
                     }
                     completion:^(BOOL finished) {
                         NSLog(@"finished animation");
                     }];
    
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    NSLog(@"Search button clicked");
    NSLog(@"search text = %@",_searchBar.text);
}

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar {
    NSLog(@"Cancel button clicked");
    [_searchBar resignFirstResponder];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
- (IBAction)myBtn:(id)sender{
    [SVProgressHUD show];
    dispatch_queue_attr_t global_q = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT,0);//裏側で処理を動かすキュー作成
    
    dispatch_queue_t mail_q = dispatch_get_main_queue();//グローバルなキューが終了時に呼ばれるキューを作成
    dispatch_async(global_q,^{//重たい処理をさせる
        NSString *urlString = @"http://ja.wikipedia.org/w/api.php?format=json&action=query&prop=revisions&titles=%E3%82%A8%E3%83%9E%E3%83%BB%E3%83%AF%E3%83%88%E3%82%BD%E3%83%B3&rvprop=content";
        
        NSURL *url = [NSURL URLWithString:urlString];
        NSURLRequest *request = [NSURLRequest requestWithURL:url];
        
        NSData *jsonData = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
        NSError *error = nil;
        
        NSDictionary *jsonObject = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingAllowFragments error:&error];
        
        NSLog(@"%@",jsonObject);
        
        NSString *str = jsonObject[@"query"][@"pages"][@"128948"][@"title"];//エマがstrに入った
        
        dispatch_async(mail_q,^{
            
            self.myLabel.text = str;
            self.myLabel.hidden = NO;
            
            [SVProgressHUD dismiss];
            
            //globalの処理が終わった際にやりたい処理
            //FBでは画像の読み込みと表示の処理は別ものの処理
            
        });
    });
    //apiを叩く処理⇨時間のかかる重たい処理
    //プログレスビューを消す処理⇨重たい処理が終了した時
    
    
}
@end
