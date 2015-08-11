//
//  category2ViewController.m
//  ingo
//
//  Created by 一野哲也 on 2015/08/04.
//  Copyright (c) 2015年 TetsuyaIchino. All rights reserved.
//

#import "category2ViewController.h"
#import "AppDelegate.h"

@interface category2ViewController (){
    AppDelegate *_appDelegate;
}

@end

@implementation category2ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    _appDelegate = [[UIApplication sharedApplication] delegate];//初期化
    NSLog(@"トモを呼び出す=%@",_appDelegate.categoryName1);
    
    
    NSBundle* bundle = [NSBundle mainBundle];
    //読み込むファイルパスを指定
    NSString* path = [bundle pathForResource:@"Property List" ofType:@"plist"];
    
    NSDictionary* dic = [NSDictionary dictionaryWithContentsOfFile:path];//読み込み?
    
    NSString *cate2 =@"";
    
    
    
    //self.title = _appDelegate.categoryImage;
    
    self.profaileImageView.image = [UIImage imageNamed:_appDelegate.categoryImage];
    
    self.myTaxtLabel.text =_appDelegate.categoryCommentary[_appDelegate.iPath2];
    
    //self.myTaxtLabel.text = [_appDelegate.iPath2];
    //NSLog(@"なんだと=%@",_appDelegate.iPath2);
    
    //NSLog(@"中身は%=@",);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
