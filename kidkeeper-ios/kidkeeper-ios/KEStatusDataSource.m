//
//  KEStatusDataSource.m
//  kidkeeper-ios
//
//  Created by Edward Guo on 2015-08-15.
//  Copyright (c) 2015 Peiliang Guo. All rights reserved.
//

#import "KEStatusDataSource.h"
#import "KETableViewCell.h"

@implementation KEStatusDataSource

- (instancetype)init
{
    self = [super init];
    if (self) {
        _sensors = [NSMutableArray arrayWithArray:@[@[@"GPS",@" "],@[@"Temperature",@""],@[@"Air Quality",@""],@[@"Brightness",@""],@[@"Sound",@""]]] ;
    }
    return self;
}

- (KETableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    KETableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell) {
        cell.sensorName = _sensors[indexPath.row][0];
        cell.sensorData = _sensors[indexPath.row][1];
    }
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.sensors.count;
}

@end
