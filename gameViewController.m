//
//  gameViewController.m
//  ingo
//
//  Created by 一野哲也 on 2015/08/03.
//  Copyright (c) 2015年 TetsuyaIchino. All rights reserved.
//

#import "gameViewController.h"

@interface gameViewController (){
    NSDictionary *_dic;
    
    NSDictionary *_detailDic;
    
    NSArray *omikujiList;
    int rNum;
    NSString *_ary;
    
   
}

@end

@implementation gameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSBundle* bundle = [NSBundle mainBundle];
    
    NSString* path = [bundle pathForResource:@"quiz" ofType:@"plist"];
    
    _dic = [NSDictionary dictionaryWithContentsOfFile:path];
    
    
    
    NSArray *array = [_dic allKeys];//全体
    NSLog(@"arrayの中身=%@",array);

    int random_nummber;
    random_nummber = rand();
    
    for(int i=0; i <array.count; i++){
        int random_number;

        random_number = arc4random() % 2;//0～9の数値をランダムに取得

        //NSLog(@"random_number%d", random_number);
        int rNum = random_number;
        NSLog(@"random_numberを出します=%d",rNum);
        NSLog(@"rNum =%d",array[rNum]);
        _ary =array[rNum];
        
        
    }
    
    NSLog(@"_dicの中身を先ずは見る=%@",[_dic[@"問題１"]allKeys]);
    NSArray *ary = [_dic allKeys];
    
    
    for (int i = 0; i < ary.count; i++){
        NSLog(@"aryの中身を確認=%@",ary[i]);
        _detailDic = _dic[ary[i]];
        NSLog(@"選択１まで出す=%@",_detailDic);
        
    }

    self.myLabel.text =_dic[_ary][@"問題"];//ランダム取得
    NSLog(@"調べる=%@",_dic[_ary][@"選択"][@"選択1"]);
    
    [self.select1 setTitle:_dic[_ary][@"選択"][@"選択1"]forState:UIControlStateNormal];
    
      NSLog(@"奇跡的に、の時のみ１が出ないので確認、=%@",_dic[_ary][@"選択"][@"選択1"]);
    
    [self.select2 setTitle:_dic[_ary][@"選択"][@"選択2"]forState:UIControlStateNormal];
    
    [self.select3 setTitle:_dic[_ary][@"選択"][@"選択3"]forState:UIControlStateNormal];

    [self.select4 setTitle:_dic[_ary][@"選択"][@"選択4"]forState:UIControlStateNormal];
    
    self.myImage.image = [UIImage imageNamed:_dic[_ary][@"画像"]];

    

    

}
- (IBAction)selectBtn1:(id)sender {
}

- (IBAction)selectBtn2:(id)sender {
}

- (IBAction)selectBtn3:(id)sender {
}

- (IBAction)selectBtn4:(id)sender {
}

@end
