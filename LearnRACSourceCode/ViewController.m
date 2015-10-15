//
//  ViewController.m
//  LearnRACSourceCode
//
//  Created by wangzengdi on 15/10/14.
//  Copyright © 2015年 wangzengdi. All rights reserved.
//

#import "ViewController.h"
#import <ReactiveCocoa.h>

@interface ViewController ()

@property (nonatomic, strong) UITextField *textField;
@property (nonatomic, strong) UILabel *label;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];
    self.textField = [[UITextField alloc] initWithFrame:CGRectMake(0, 65, 200, 50)];
    self.textField.backgroundColor = [UIColor redColor];
    self.label = [[UILabel alloc] initWithFrame:CGRectMake(0, 200, 200, 50)];
    self.label.backgroundColor = [UIColor blueColor];
    [self.view addSubview:self.textField];
    [self.view addSubview:self.label];
    RAC(self.label, text, @"收到nil时就显示我") = self.textField.rac_textSignal;
    [RACObserve(self.label, text) subscribeNext:^(id x) {
        NSLog(@"%@",x);
    }];
    
    __block int aNumber = 0;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
