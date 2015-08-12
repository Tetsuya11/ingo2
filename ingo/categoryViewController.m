//
//  categoryViewController.m
//  ingo
//
//  Created by 一野哲也 on 2015/07/30.
//  Copyright (c) 2015年 TetsuyaIchino. All rights reserved.
//

#import "categoryViewController.h"
#import "AppDelegate.h"

@interface categoryViewController (){
    NSArray *_fesImages;
    NSArray *_fesName;
    
    NSArray *categories;
    
    NSArray *_cateAry;
 
    AppDelegate *_appDelegate;
    
}

@end

@implementation categoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSBundle* bundle = [NSBundle mainBundle];
    //読み込むファイルパスを指定
    NSString* path = [bundle pathForResource:@"Property List" ofType:@"plist"];
    
    NSDictionary* dic = [NSDictionary dictionaryWithContentsOfFile:path];//読み込み?
    
    _cateAry =[dic allKeys];
    NSLog(@"ここはどこだ=%@",_cateAry);
    for(int i=0;i<_cateAry.count;i++){
        NSLog(@"カテゴリー%@",_cateAry[i]);
    }
    
    
    
    self.myTableView.delegate = self;
    self.myTableView.dataSource = self;
    
    _appDelegate = [[UIApplication sharedApplication] delegate];
    
    // = @[@"合コン",@"プログラマー",@"相撲界",@"航空業界",@"大学"];
    
    
   _fesImages = @[@"goukonn.jpeg",@"pro.jpeg",@"sumou.jpeg",@"CA.jpeg",@"daigaku.jpeg",];
                    
}

-(NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{
    return _cateAry.count;//セル行
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    UILabel *nameLabel = (UILabel *)[cell viewWithTag:2];
    UIImageView *profaileImageView = (UIImageView *)[cell viewWithTag:1];
    
    
    
    nameLabel.text = _cateAry[indexPath.row];
    
    profaileImageView.image = [UIImage imageNamed:_fesImages[indexPath.row]];
    
    
    profaileImageView.clipsToBounds = YES;
    profaileImageView.layer.cornerRadius = 22.0f;
    
    return cell;
    
   }

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {//押された瞬間
    NSLog(@"タップ");
    
    _appDelegate.cateAry =_cateAry[indexPath.row];
    
    NSLog(@"ついにきた=%@",_appDelegate.cateAry);
    
    // AppDelegateのcategoryNameに値を渡します。
//    _appDelegate.categoryName = _fesName[indexPath.row];
//    
//    NSLog(@"まじか＝%@",_appDelegate.categoryName);
       _appDelegate.categoryImage = _fesImages[indexPath.row];
    
    _appDelegate.iPath = (int)indexPath.row;//テーブルの何番目かをipathに入れている　ここが押されるとDetail mへ
    NSLog(@"とは%@",indexPath);
   
    _appDelegate.largeCate = categories[indexPath.row];

    NSLog(@"なんでだろ〜%@",_appDelegate.largeCate);
    
    
}
//左右で型が違う為、indexPathをint型に変換

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
   
}


@end
