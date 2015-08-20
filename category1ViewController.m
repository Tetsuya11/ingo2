////
//  category1ViewController.m
//  ingo
//
//  Created by 一野哲也 on 2015/08/05.
//  Copyright (c) 2015年 TetsuyaIchino. All rights reserved.
//

#import "category1ViewController.h"
#import "AppDelegate.h"



@interface category1ViewController (){
    
NSDictionary *_largDic;
    
NSArray *_categoryAry;
    
NSDictionary*_dic;
    

    
NSArray *_ary;
    
NSArray *_wordDict;
    
NSArray *arr2;

AppDelegate *_appDelegate;
}

@end

@implementation category1ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.myTableView2.delegate = self;
    self.myTableView2.dataSource = self;
    
    _appDelegate = [[UIApplication sharedApplication]delegate];
    
    NSString *testCategory = _appDelegate.categoryName;//前ページで作ったやつ
    NSLog(@"testCateoryの中身 = %@", testCategory);
    
    NSBundle* bundle = [NSBundle mainBundle];
  
    NSString* path = [bundle pathForResource:@"Category" ofType:@"plist"];
    
    _dic = [NSDictionary dictionaryWithContentsOfFile:path];//読み込み?
    
    
    _wordDict= [_dic[_appDelegate.categoryName][@"用語"] allKeys];
    
    NSLog(@"_wordDict=%@",_wordDict);
    
    
    NSLog(@"用語のみ=%@",_dic[_appDelegate.categoryName][@"用語"]);
   
    }

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _wordDict.count;
    
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if(cell == nil){
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    //    cell.textLabel.text = [NSString stringWithFormat:@"行 = %ld",(long)indexPath.row];
    cell.textLabel.text = _wordDict[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {//押された瞬間
    _appDelegate.detail = [_dic[_appDelegate.categoryName][@"用語"]allKeys][indexPath.row];
    
    NSLog(@"detail =%@",_appDelegate.detail);
    
    
    
    
        
}


@end