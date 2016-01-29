//
//  TableViewCell.m
//  纯代码自定义Cell
//
//  Created by ma on 16/1/18.
//  Copyright (c) 2016年 Chenghui. All rights reserved.
//
// iOS 自定义UITableViewCell上添加UIButton按钮如何确定点击了哪一行，代码块实现
// http://www.ithao123.cn/content-949108.html

#import "TableViewCell.h"

@implementation TableViewCell

// 构造方法 -- 只调用一次 （套路来的！务必记住！）
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        // qq 聊天 不设置 大小
        _iconImageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 120, 80)];
        [self.contentView addSubview:_iconImageView];
        self.contentView.backgroundColor = [UIColor colorWithRed:23/255.0 green:103/255.0 blue:23/255.0 alpha:0.8];
        
        // 大标题
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(140, 5, 200, 40)];
        _titleLabel.textColor = [UIColor redColor];
        _titleLabel.font = [UIFont boldSystemFontOfSize:20];
        [self.contentView addSubview:_titleLabel];
        
        
        // 订阅按钮
        _button = [UIButton buttonWithType:UIButtonTypeCustom];
        _button.frame = CGRectMake(255, 10, 50, 30);
        [_button setTitle:@"订阅" forState:UIControlStateNormal];
        [_button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:_button];
        
        // 子标题
        _subTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(140, 50, 200, 40)];
        _subTitleLabel.textColor = [ UIColor orangeColor];
        [self.contentView addSubview:_subTitleLabel];
     
        
        // 添加scrollerView（里面存放图片）
        _scroView = [[UIScrollView alloc] initWithFrame:CGRectMake(5, 100, self.frame.size.width - 10, 98)];
        _scroView.contentSize = CGSizeMake(100*18, 98);
        _scroView.pagingEnabled = YES;
        
        for (int i = 0; i < 18; i++) {
             _scrollerViewImg = [[UIImageView alloc] initWithFrame:CGRectMake(i*110, 0, 100, 98)];
            _scrollerViewImg.backgroundColor = [UIColor grayColor];

            [_scroView addSubview:_scrollerViewImg];
            
        }
        
        
        [self.contentView addSubview:_scroView];
        
    }
    
    return self;
    
}



- (void)buttonClick:(UIButton*)sender
{
    // 调用代码块
    if (self.btnClick) {
        self.btnClick();
        NSLog(@"%@",self.btnClick);
    }
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
