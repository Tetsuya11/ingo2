//
//  searchViewController.h
//  ingo
//
//  Created by 一野哲也 on 2015/08/05.
//  Copyright (c) 2015年 TetsuyaIchino. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

@interface searchViewController : UIViewController<UISearchBarDelegate>

@property(weak,nonatomic) IBOutlet UISearchBar *searchBar;
@property(weak,nonatomic) IBOutlet UITableView *tableView;

@property(weak,nonatomic) IBOutlet UILabel *myLabel;
- (IBAction)myBtn:(id)sender;

@end
