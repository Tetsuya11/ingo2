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
 
    AppDelegate *_appDelegate;
    
}

@end

@implementation categoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.myTableView.delegate = self;
    self.myTableView.dataSource = self;
    
    _appDelegate = [[UIApplication sharedApplication] delegate];
    
    _fesName = @[@"合コン",@"プログラマー",@"相撲界",@"航空業界",@"大学"];
                    
    _fesImages = @[@"goukonn.jpeg",@"pro.jpeg",@"sumou.jpeg",@"CA.jpeg",@"daigaku.jpeg",];
                    
}

-(NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{
    return _fesName.count;//セル行
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    UILabel *nameLabel = (UILabel *)[cell viewWithTag:2];
    UIImageView *profaileImageView = (UIImageView *)[cell viewWithTag:1];
    
    
    
    nameLabel.text = _fesName[indexPath.row];
    
    profaileImageView.image = [UIImage imageNamed:_fesImages[indexPath.row]];
    
    
    profaileImageView.clipsToBounds = YES;
    profaileImageView.layer.cornerRadius = 22.0f;
    
    return cell;
    
   }

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {//押された瞬間
    NSLog(@"タップ");
    // AppDelegateのcategoryNameに値を渡します。
    _appDelegate.categoryName = _fesName[indexPath.row];
    
    NSLog(@"まじか＝%@",_appDelegate.categoryName);
    
    _appDelegate.categoryImage = _fesImages[indexPath.row];
    
    _appDelegate.iPath = (int)indexPath.row;//テーブルの何番目かをipathに入れている　ここが押されるとDetail mへ
    NSLog(@"とは%@",indexPath);
    
}        //左右で型が違う為、indexPathをint型に変換

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
   
}


@end
