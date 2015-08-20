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
    
    NSDictionary *_dic;
}
@end

@implementation category2ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
_appDelegate = [[UIApplication sharedApplication] delegate];//初期化
    
    NSBundle* bundle = [NSBundle mainBundle];
    NSString* path = [bundle pathForResource:@"Category" ofType:@"plist"];
    
    _dic = [NSDictionary dictionaryWithContentsOfFile:path];//読み込み?
    
    NSLog(@"用語のdetail=%@",_dic[_appDelegate.categoryName][@"用語"][_appDelegate.detail][@"詳細"]);
    
    
    self.myText.text = _dic[_appDelegate.categoryName][@"用語"][_appDelegate.detail][@"詳細"];
    
    self.myImage.image = [UIImage imageNamed:_dic[_appDelegate.categoryName][@"用語"][_appDelegate.detail][@"画像名"]];
    
    //self.myLabel.text = _dic[_appDelegate.categoryName][@"用語"][_appDelegate.detail][@"画像名"];
    
   }



@end
