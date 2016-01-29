//
//  ViewController.m
//  纯代码自定义Cell
//
//  Created by ma on 16/1/18.
//  Copyright (c) 2016年 Chenghui. All rights reserved.
//

#import "ViewController.h"
#import "TableViewCell.h"

// 屏幕宽 和 高
#define ScrW self.view.bounds.size.width
#define ScrH self.view.bounds.size.height

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 20, ScrW, ScrH) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    
    _tableView.rowHeight = 200;
    
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 20;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * cellid = @"cell";
    TableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellid];
    if (cell == nil) {
        cell = [[TableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellid];
    }
    
    cell.titleLabel.text = @"我是主标题";
    cell.subTitleLabel.text = @"我是副标题";
    cell.iconImageView.image = [UIImage imageNamed:@"guideHome.png"];
    
    // 给代码赋值 (回调)
    cell.btnClick = ^(){
        
        // 当你给代码块赋值时，在这边，就可以知道，点击了个cell了
        NSLog(@"点击了那一行：%ld",(long)indexPath.row);
    };
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"%ld------",(long)indexPath.row);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
