//
//  categoryViewController.h
//  ingo
//
//  Created by 一野哲也 on 2015/07/30.
//  Copyright (c) 2015年 TetsuyaIchino. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface categoryViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>


@property (weak, nonatomic) IBOutlet UITableView *myTableView;


@end
