//
//  ViewController.m
//  XBAlert
//
//  Created by 许鑫博 on 2018/9/20.
//  Copyright © 2018年 XXB. All rights reserved.
//

#import "ViewController.h"
#import "XBAlert.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 普通样式
- (IBAction)firstBtnClick:(id)sender {
    [XBAlert alertOneConfirmTitle:@"普通样式" mesasge:@"普通样式" preferredStyle:UIAlertControllerStyleAlert confirmHandler:^(UIAlertAction *action) {
        NSLog(@"点击了确定");
    }];
}

#pragma mark - 没有取消按钮
- (IBAction)secondBtnClick:(id)sender {
    [XBAlert alertMesasge:@"普通样式" confirmHandler:^(UIAlertAction *action) {
        NSLog(@"点击了确定");
    }];
}

#pragma mark - 自定义标题 双按钮
- (IBAction)thirdBtnClick:(id)sender {
    [XBAlert alertTwoBtnTitle:@"标题" mesasge:@"信息" preferredStyle:UIAlertControllerStyleAlert confirmHandler:^(UIAlertAction *action) {
         NSLog(@"点击了确定");
    } cancleHandler:^(UIAlertAction *action) {
         NSLog(@"点击了取消");
    }];
}

#pragma mark - 按钮标题自定义 双按钮
- (IBAction)fourthBtnClick:(id)sender {
    [XBAlert alertTwoBtnTitle:@"标题" mesasge:@"信息" one_btnTitle:@"第一个按钮" two_btnTitle:@"第二个按钮" preferredStyle:UIAlertControllerStyleAlert one_btnHandler:^(UIAlertAction *action) {
        NSLog(@"点击了第一个按钮");
    } two_btnHandler:^(UIAlertAction *action) {
        NSLog(@"点击了第二个按钮");
    }];
}

#pragma mark - 带输入框
- (IBAction)fifthBtnClick:(id)sender {
    [XBAlert alertHaveTextFieldTitle:@"标题" mesasge:@"信息" preferredStyle:UIAlertControllerStyleAlert confirmHandler:^(UIAlertAction *alert, UITextField *textField) {
        NSLog(@"textField = %@",textField.text);
    } cancleHandler:^(UIAlertAction *action) {
        NSLog(@"点击了取消");
    } placeholder:@"占位字符"];
}



@end
