//
//  category1ViewController.m
//  ingo
//
//  Created by 一野哲也 on 2015/08/05.
//  Copyright (c) 2015年 TetsuyaIchino. All rights reserved.
//

#import "category1ViewController.h"
#import "AppDelegate.h"


@interface category1ViewController (){
    
NSArray *_categoryName1;
    
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
    
    
    NSBundle* bundle = [NSBundle mainBundle];
    //読み込むファイルパスを指定
    NSString* path = [bundle pathForResource:@"Property List" ofType:@"plist"];
    
    NSDictionary* dic = [NSDictionary dictionaryWithContentsOfFile:path];//読み込み?
    
    NSString *cate = @""; //*tstの空箱

    if(_appDelegate.iPath == 0){
        cate = @"合コン";
    }else if(_appDelegate.iPath == 1){
        cate = @"プログラマー";
    }else if(_appDelegate.iPath == 2){
        cate = @"相撲界";
    }else if(_appDelegate.iPath == 3){
        cate = @"航空業界";
    }else if(_appDelegate.iPath == 4){
        cate =@"大学";
    }
    
    NSLog(@"ここは　＝　(int)%@",dic[cate]);
    
    NSLog(@"わけわからん=%@",dic[cate][@"ゴッホ"]);
    
    NSLog(@"わけわからんくなってきた=%@",[dic[cate] allKeys]);
    NSLog(@"がんばれ=%@",[dic[cate] allKeys]);


    
//    NSString *goukon = @"合コン";
//    
//    NSLog(@"全件 = %@",dic);
//    NSLog(@"合コン用語 = %@",dic[goukon]);
//    
//    NSString *seki = @"関ヶ原";
//    NSString *cate = @"";
//   
 //   NSLog(@"%@",dic[cate][seki]);
//    
//    NSLog(@"合コンのkey = %@",[dic[goukon] allKeys]);
//
    //_appDelegate.arr =dic[cate][@"関ヶ原"];
    
   arr2 =dic[cate];
    
//    NSLog(@"なんじゃ=%@",_appDelegate.arr);
//    NSLog(@"おい=%@",arr2);
//    NSLog(@"おいおい=%@",[dic[cate] allKeys]);
//    NSLog(@"おいおいおい=%@",[dic[cate] allKeys][0]);
//    NSString *oi =[dic[cate] allKeys][0];
//    NSLog(@"おいおいおいおい=%@",[dic[cate] allKeys][1]);
    
    //NSLog(@"おいおいおいお=%@",[dic[cate] allKeys[0]])
//    NSLog(@"なゃ=%@",arr[0]);
    
    
    NSArray *ary =[dic[cate] allKeys];
   
    NSLog(@"何入ってんだ=%@",ary);
    
    for (int i = 0; i < ary.count; i++) {
        NSLog(@"ary %i = %@", i,ary[i]);
        
    
    }
    
//    NSLog(@"キーのary = %@",ary[1]);
//
    _categoryName1 = ary;
    
    NSLog(@"中身は=%@",_categoryName1);
//    
//    NSLog(@"ary%@",_categoryName1);
//    

    
}

-(NSInteger)tableView:(UITableView *)tableView
numberOfRowsInSection:(NSInteger)section
{
   return _categoryName1.count;//セル行
   // return 20;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    UILabel *nameLabel = (UILabel *)[cell viewWithTag:1];
    
    nameLabel.text = _categoryName1[indexPath.row];
    
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {//押された瞬間
    NSLog(@"タップしよ");
    
    _appDelegate.categoryName1 =_categoryName1[indexPath.row];
    
            NSLog(@"入ってないだと=%@",_categoryName1);//ゴッホ
    
     _appDelegate.iPath2 = (int)indexPath.row;//テーブルの何番目かをipathに入れている　押されるとDetail mへ
    
            NSLog(@"インデックスパスとは%@",indexPath);
}

    - (void)didReceiveMemoryWarning {
        [super didReceiveMemoryWarning];
        
    }

@end
