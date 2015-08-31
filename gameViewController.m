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
    
    int random_nummber;
    
    
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

    for(int i=0; i <_arra.count; i++){
        NSLog(@"先ずは問題1-5を順番に出す=%@",_arra);
        NSLog(@"先ずは問題1-5を順番に出す==%@",_arra[i]);
        NSLog(@"先ずは問題1-5を順番に出す=＝＝%@",_dic[_arra[i]][@"問題"]);//重複はなし　後はランダムに出す arrayに入れて
        NSMutableArray *detail = _dic[_arra[i]][@"問題"];
        

        int e =_arra.count;
//        NSLog(@"eの中身=%d",e);
        random_nummber = arc4random() % e;//_arra.count分(問題数分)、取得？
        NSLog(@"random_number出す%d",random_nummber);
        int g =random_nummber;
        NSLog(@"gを重複しないように出す=%i@",g);
        
        int x;
        //乱数を4個生成
        int t[4];
        
        //a[]の配列に０〜２までの別々の数値を入れる。
        for(int i = 0; i < 3; i++){
            t[i] = arc4random() % 3;
            int x = t[i];
            for( i = 0; i < 3 ; i++)
                if(t[i] ==x)
                    break;
        }

        
        
        
//        int rNum = random_number;
        
       // rNum = random_number;//int型に入れる
        NSLog(@"rNum =%d",rNum);//問題数をランダムで取得
        NSLog(@"rNum問題は =%@",_arra[rNum]);//問題をランダムで取得
        
        _ary =_arra[rNum];
        NSLog(@"_aryの中身を確認させて頂きます=%@",_ary);
    }
//    for(int i=0; i <_arra.count; i++){
//        int random_number;
//        NSLog(@"カウント=%lu",(unsigned long)_arra.count);
//        int e =_arra.count;
//        NSLog(@"eの中身=%d",e);
//        random_number = arc4random() % e;//_arra.count分(問題数分)、取得？
//        NSLog(@"random_number出す%d", random_number);
//        //        int rNum = random_number;
//        
//        rNum = random_number;//int型に入れる
//        NSLog(@"rNum =%d",rNum);//問題数をランダムで取得
//        NSLog(@"rNum問題は =%@",_arra[rNum]);//問題をランダムで取得
//        
//        _ary =_arra[rNum];
//        NSLog(@"_aryの中身を確認させて頂きます=%@",_ary);
//    }

    
    for (int i = 0; i < _arra.count; i++){
        NSLog(@"aryの中身を確認=%@",_arra[i]);//被らずに問題取得
        _detailDic = _dic[_arra[i]];
        NSLog(@"ランダム取得した問題をdic方式で出力=%@",_detailDic);
        NSLog(@"ランダムで問題を出す=%@",_detailDic[@"問題"]);
        //この時点で全五問の問題をランダムに順番に出力、出来ている
    }

    _array = [_dic[_ary][@"選択"]allKeys];
    NSLog(@"_arrayの中身=%@",_array);
    
    for (int i = 0; i< _array.count; i++) {
        NSLog(@"_arrayとして=%@",_dic[_ary][@"選択"][_array[i]]);
        
    }
    
    
    int x;
    //乱数を4個生成
    int t[4];
    
    //a[]の配列に０〜２までの別々の数値を入れる。
    for(int i = 0; i < 3; i++){
        t[i] = arc4random() % 3;
        int x = t[i];
        for( i = 0; i < 3 ; i++)
            if(t[i] ==x)
                break;
    }
    
    //NSLogで表示すると別々の表示がされる。
    NSLog(@"%d,%d,%d,%d",t[0],t[1],t[2],t[3]);

    int a = t[0];
    int b = t[1];
    int c = t[2];
    int d = t[3];
    
    NSLog(@"中身は=%d",a);//ランダムで数字は取れてる
    NSLog(@"_arrayの中身は=%@",_dic[_ary][@"選択"][_array[a]]);
    NSLog(@"_arrayの中身は=%@",_dic[_ary][@"選択"][_array[b]]);
    NSLog(@"_arrayの中身は=%@",_dic[_ary][@"選択"][_array[c]]);
    NSLog(@"_arrayの中身は=%@",_dic[_ary][@"選択"][_array[d]]);
    
   // NSDictionary *
    
    //NSLog(@"先ずはarray配列から=%@",_array);
    self.myLabel.text =_dic[_ary][@"問題"];//ランダム取得
    NSLog(@"問題は=%@",_dic[_ary][@"問題"]);
    
    
    NSLog(@"調べる=%@",_dic[_ary][@"選択"]);//_aryにはランダムで問題が出るようになっている
    
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
