//
//  XLViewController.m
//  XMLLayout
//
//  Created by scubers on 08/26/2018.
//  Copyright (c) 2018 scubers. All rights reserved.
//

#import "XLViewController.h"
@import XMLLayout;
#import "MyTestView.h"

@interface XLViewController ()

@end

@implementation XLViewController


- (void)viewDidLoad
{
    [super viewDidLoad];

    // Do any additional setup after loading the view, typically from a nib.

    MyTestView *v = [[MyTestView alloc] initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, 300)];

    [self.view addSubview:v];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
