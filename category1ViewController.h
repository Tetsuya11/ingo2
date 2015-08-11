//
//  category1ViewController.h
//  ingo
//
//  Created by 一野哲也 on 2015/08/05.
//  Copyright (c) 2015年 TetsuyaIchino. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface category1ViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>

@property (weak,nonatomic) IBOutlet UITableView *myTableView2;
@end
