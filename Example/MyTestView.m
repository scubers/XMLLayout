//
//  MyTestView.m
//  XMLLayout_Example
//
//  Created by 王俊仁 on 2018/8/26.
//  Copyright © 2018年 scubers. All rights reserved.
//

#import "MyTestView.h"
@import XMLLayout;

@interface MyTestView ()

@property (nonatomic, strong) UILabel *labelA;
@property (nonatomic, strong) UILabel *textfieldA;
@property (nonatomic, strong) UIScrollView *scrollView;

@property (nonatomic, strong) UIView *root;

@property (nonatomic, strong) UIButton *button;


@end

@implementation MyTestView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        XLLayoutContext *context = [[XLLayoutLoader new] loadXMLFile:@"/Users/Jrwong/Desktop/testcc/xml/test.xml" fileHolder:self];
        _root = context.finalView;
        [self addSubview:_root];
        [_button setTitle:@"button" forState:UIControlStateNormal];
        [_button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        
    }
    return self;
}


- (void)layoutSubviews {
    [super layoutSubviews];
    _root.frame = self.bounds;
}

@end
