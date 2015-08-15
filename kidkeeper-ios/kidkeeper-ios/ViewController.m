//
//  ViewController.m
//  kidkeeper-ios
//
//  Created by Edward Guo on 2015-08-15.
//  Copyright (c) 2015 Peiliang Guo. All rights reserved.
//

#import "ViewController.h"
#import "KETableView.h"
#import "KETableViewCell.h"
#import "KEStatusDataSource.h"

@interface ViewController ()

@end

@implementation ViewController{
    KETableView* _tableView;
    KEStatusDataSource* _statusDataSource;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _tableView = [[KETableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    _tableView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:_tableView];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[tableView]-0-|" options:NSLayoutFormatDirectionLeadingToTrailing metrics:nil views:@{@"tableView":_tableView}]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[tableView(==200)]-0-|" options:NSLayoutFormatDirectionLeadingToTrailing metrics:nil views:@{@"tableView":_tableView}]];
    [_tableView registerClass:[KETableViewCell class] forCellReuseIdentifier:@"cell"];
    
    _statusDataSource = [[KEStatusDataSource alloc] init];
    _tableView.dataSource = _statusDataSource;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
