//
//  ViewController.m
//  NFPlaceholderTextView
//
//  Created by jiangpengcheng on 18/3/16.
//  Copyright © 2016年 ninefivefly. All rights reserved.
//

#import "ViewController.h"
#import "NFPlaceholderTextView.h"

@interface ViewController ()

@property(nonatomic, weak)IBOutlet NFPlaceholderTextView* mTextView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.mTextView.placeHolder = @"请输入内容";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
