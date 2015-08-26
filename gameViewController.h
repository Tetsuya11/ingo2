//
//  gameViewController.h
//  ingo
//
//  Created by 一野哲也 on 2015/08/03.
//  Copyright (c) 2015年 TetsuyaIchino. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface gameViewController : UIViewController{

}

@property (weak, nonatomic) IBOutlet UILabel *myLabel;

@property (weak, nonatomic) IBOutlet UIImageView *myImage;

@property (weak, nonatomic) IBOutlet UIButton *select1;
- (IBAction)selectBtn1:(id)sender;//これが正解

@property (weak, nonatomic) IBOutlet UIButton *select2;
- (IBAction)selectBtn2:(id)sender;

@property (weak, nonatomic) IBOutlet UIButton *select3;
- (IBAction)selectBtn3:(id)sender;

@property (weak, nonatomic) IBOutlet UIButton *select4;
- (IBAction)selectBtn4:(id)sender;



@property (weak, nonatomic) IBOutlet UILabel *myCorect;

@property (weak, nonatomic) IBOutlet UILabel *myFault;

@property (weak, nonatomic) IBOutlet UILabel *myTotal;


@end
