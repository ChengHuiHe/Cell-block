//
//  TableViewCell.h
//  纯代码自定义Cell
//
//  Created by ma on 16/1/18.
//  Copyright (c) 2016年 Chenghui. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewCell : UITableViewCell

// 继承 UITableViewCell 并自定义 控件
@property (retain,nonatomic)UILabel * titleLabel;
@property (retain,nonatomic)UIImageView * iconImageView;
@property (retain,nonatomic)UILabel * subTitleLabel;
@property (retain,nonatomic)UIImageView *scrollerViewImg;
@property (retain,nonatomic)UIButton *button;


@property (retain,nonatomic)  UIScrollView *scroView;

// 用代码块的方式实现自定义cell上添加UIButton按钮，并实现点击了哪一行。
@property (nonatomic,strong)void(^btnClick)();


@end
