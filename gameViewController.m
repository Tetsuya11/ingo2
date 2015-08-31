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
    
    NSString *_ary;
    
    NSArray *_array;
    
    NSArray *_arra;
    
    int rNum;
    
    int count;
    
    int faultCnt;
    
    int cnt;
    
    
    NSArray *_test;
}

@end

@implementation gameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSBundle* bundle = [NSBundle mainBundle];
    
    NSString* path = [bundle pathForResource:@"quiz" ofType:@"plist"];
    
    _dic = [NSDictionary dictionaryWithContentsOfFile:path];
    
    
    
    _arra = [_dic allKeys];//全体
    NSLog(@"arrayの中身=%@",_arra);

    int random_nummber;
    random_nummber = rand();
    
    for(int i=0; i <_arra.count; i++){
        int random_number;

        random_number = arc4random() % 3;//0～9の数値をランダムに取得

        //NSLog(@"random_number%d", random_number);
//        int rNum = random_number;
        rNum = random_number;

        
        NSLog(@"random_numberを出します=%d",rNum);
        NSLog(@"rNum =%d",_arra[rNum]);
        _ary =_arra[rNum];
        
   
    }
    
    NSLog(@"_dicの中身を先ずは見る=%@",[_dic[@"問題１"]allKeys]);
    NSArray *ary = [_dic allKeys];
    
    for (int i = 0; i < ary.count; i++){
        NSLog(@"aryの中身を確認=%@",ary[i]);
        _detailDic = _dic[ary[i]];
        NSLog(@"選択１まで出す=%@",_detailDic);
    }

    _array = [_dic[_ary][@"選択"]allKeys];
    NSLog(@"_arrayの中身=%@",_array);
    
    for (int i = 0; i< _array.count; i++) {
        NSLog(@"_arrayとして=%@",_dic[_ary][@"選択"][_array[i]]);
        
    }
    
    int k[4];
    int l,i,s;
    for (s=1; s<4; s++) {
        k[s]=4;
    }
    for (i=0; i<4; i++) {
        k[i] = arc4random_uniform(4);
        for (l=0; l<4; l++) {
            if (l==i) {
                l++;
            }
            while (k[i]==k[l]) {
                k[i] = arc4random_uniform(4);
                l=0;
            }
        }
    }
    NSLog(@"%d %d %d %d ",k[0],k[1],k[2],k[3]);
    int a = k[0];
    int b = k[1];
    int c = k[2];
    int d = k[3];
    
    NSLog(@"中身は=%d",a);//ランダムで数字は取れてる
    NSLog(@"_arrayの中身は=%@",_dic[_ary][@"選択"][_array[a]]);
    NSLog(@"_arrayの中身は=%@",_dic[_ary][@"選択"][_array[b]]);
    NSLog(@"_arrayの中身は=%@",_dic[_ary][@"選択"][_array[c]]);
    NSLog(@"_arrayの中身は=%@",_dic[_ary][@"選択"][_array[d]]);
    
   // NSDictionary *
    
    //NSLog(@"先ずはarray配列から=%@",_array);
    
    self.myLabel.text =_dic[_ary][@"問題"];//ランダム取得
    NSLog(@"問題は=%@",_dic[_ary][@"問題"]);
    
    NSLog(@"調べる=%@",_dic[_ary][@"選択"]);
    
    [self.select1 setTitle:_dic[_ary][@"選択"][_array[a]]forState:UIControlStateNormal];
    
    [self.select2 setTitle:_dic[_ary][@"選択"][_array[b]]forState:UIControlStateNormal];
    
    [self.select3 setTitle:_dic[_ary][@"選択"][_array[c]]forState:UIControlStateNormal];

    [self.select4 setTitle:_dic[_ary][@"選択"][_array[d]]forState:UIControlStateNormal];
    
    self.myImage.image = [UIImage imageNamed:_dic[_ary][@"画像"]];
    
    count = 0;
    faultCnt = 0;
    cnt = 0;
    
    self.myCorect.text = [NSString stringWithFormat:@"%d",count];
    self.myTotal.text =[NSString stringWithFormat:@"%d",cnt+1];

    _test=[_dic allKeys];
    NSLog(@"次は=%@",_test);
    

}


- (IBAction)selectBtn1:(id)sender {

    NSLog(@"Aの選択肢:%@",self.select1.currentTitle);
    NSLog(@"plistの正解のValue(選択肢1) %@",_dic[_ary][@"選択"][@"選択1"]);
    if([self.select1.currentTitle isEqualToString:_dic[_ary][@"選択"][@"選択1"] ]){//もしA選択欄とPlistの選択1
        // 正解の処理を書く
        NSLog(@"正解");
        count = count + 1;
        self.myCorect.text = [NSString stringWithFormat:@"%d",count];
    }else{
        // 不正解の処理を書く
        NSLog(@"不正解");
        faultCnt = faultCnt + 1;
//        faultCnt ++;
        self.myFault.text = [NSString stringWithFormat:@"%d",faultCnt];
    }
    
    for (int o =0;o<_arra.count;o++) {
        NSLog(@"日本語表示=%@",_arra[cnt]);
    
    }
    cnt++;
    self.myTotal.text= [NSString stringWithFormat:@"%d",cnt+1];
    NSLog(@"cnt中身=%@",_arra[cnt]);//問題１⇨問題２の順で表示
    self.myLabel.text =_dic[_ary][@"問題"];
    NSLog(@"問題は=%@",_dic[_ary][@"問題"]);
    
    


    
}

- (IBAction)selectBtn2:(id)sender {
    
    NSLog(@"Bの選択肢:%@",self.select2.currentTitle);
    NSLog(@"plistの正解のValue(選択肢1) %@",_dic[_ary][@"選択"][@"選択1"]);

    if([self.select2.currentTitle isEqualToString:_dic[_ary][@"選択"][@"選択1"] ]){
        // 正解の処理を書く
        NSLog(@"正解");
        count = count + 1;
        self.myCorect.text = [NSString stringWithFormat:@"%d",count];
    }else{
        // 不正解の処理を書く
        NSLog(@"不正解");
        faultCnt = faultCnt + 1;
        //        faultCnt ++;
        self.myFault.text = [NSString stringWithFormat:@"%d",faultCnt];
    }
    cnt++;
    self.myTotal.text= [NSString stringWithFormat:@"%d",cnt+1];
    
   
}

- (IBAction)selectBtn3:(id)sender {
    NSLog(@"Cの選択肢:%@",self.select3.currentTitle);
    NSLog(@"plistの正解のValue(選択肢1) %@",_dic[_ary][@"選択"][@"選択1"]);
    if([self.select3.currentTitle isEqualToString:_dic[_ary][@"選択"][@"選択1"] ]){
        // 正解の処理を書く
        NSLog(@"正解");
        count = count + 1;
        self.myCorect.text = [NSString stringWithFormat:@"%d",count];
    }else{
        // 不正解の処理を書く
        NSLog(@"不正解");
        faultCnt = faultCnt + 1;
        //        faultCnt ++;
        self.myFault.text = [NSString stringWithFormat:@"%d",faultCnt];
        
        
    }
    cnt++;
    self.myTotal.text= [NSString stringWithFormat:@"%d",cnt+1];
    

}

- (IBAction)selectBtn4:(id)sender {
    NSLog(@"Dの選択肢:%@",self.select4.currentTitle);
    NSLog(@"plistの正解のValue(選択肢1) %@",_dic[_ary][@"選択"][@"選択1"]);
    if([self.select4.currentTitle isEqualToString:_dic[_ary][@"選択"][@"選択1"] ]){
        // 正解の処理を書く
        NSLog(@"正解");
        count = count + 1;
        self.myCorect.text = [NSString stringWithFormat:@"%d",count];
    }else{
        // 不正解の処理を書く
        NSLog(@"不正解");
        faultCnt = faultCnt + 1;
        //        faultCnt ++;
        self.myFault.text = [NSString stringWithFormat:@"%d",faultCnt];
    }
    cnt++;
    self.myTotal.text= [NSString stringWithFormat:@"%d",cnt+1];
   
}

@end
