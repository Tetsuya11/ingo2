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
 
    AppDelegate *_appDelegate;
    
    NSDictionary *_dic;
    
    NSArray *_ary;
}

@end

@implementation categoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.myTableView.delegate = self;
    self.myTableView.dataSource= self;
    _appDelegate = [[UIApplication sharedApplication] delegate];//初期化
    
    NSBundle* bundle = [NSBundle mainBundle];
    //読み込むファイルパスを指定
    NSString* path = [bundle pathForResource:@"Property List" ofType:@"plist"];
    
    _dic = [NSDictionary dictionaryWithContentsOfFile:path];//大元なんでDctionary型
    NSLog(@"dic=%@",_dic);
    _ary = [_dic allKeys]; //カテゴリーの表示のみであればこれで表示可能
    NSLog(@"ary =%@",_ary);//array型でキーのみ取得
    
    for (int i = 0; i < _ary.count; i++){
        NSLog(@"ary : %i =%@",i,_ary[i]);
        NSLog(@"ary[i]=%@",_ary[i]);
        NSLog(@"ary[i] dic有=%@",_dic[_ary[i]]);
        NSDictionary *detailKey =_dic[_ary[i]];//画像の表示をさせる為にもDictionary型で全体図を作る
        NSLog(@"画像表示=%@",detailKey);
        
    }
  }

-(NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{
    return _ary.count;//セル行
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    
    UILabel *nameLabel = (UILabel *)[cell viewWithTag:2];
    
    nameLabel.text = _ary[indexPath.row];
    
    UIImageView *profaileImageView = (UIImageView *)[cell viewWithTag:1];//celの番号
    
    profaileImageView.image = [UIImage imageNamed:_dic[_ary[indexPath.row]][@"画像名"]];
    
    profaileImageView.clipsToBounds = YES;
    profaileImageView.layer.cornerRadius = 22.0f;
    
    return cell;
    
   }

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {//押された瞬間
    NSLog(@"タップ");
    
    NSDictionary *dataDictionary = _dic[_ary[indexPath.row]];//Dectionary型に大元のDic[dictionary型]、array型keyを入れる(何番が押されたかはindexPathで)
    NSLog(@"dataDictionary=%@",dataDictionary[@"用語"]);
    
    AppDelegate *appDelete = [[UIApplication sharedApplication] delegate];//?????????????????
    appDelete.categoryName = _dic[_ary[indexPath.row]];


}
@end
