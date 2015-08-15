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
        _sensors = [NSMutableArray arrayWithArray:@[@[@"GPS",@" ",@"n"],@[@"Temperature",@"",@"n"],@[@"Air Quality",@"",@"n"],@[@"Brightness",@"",@"n"],@[@"Sound",@"",@"n"]]] ;
    }
    return self;
}

- (KETableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    KETableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell) {
        cell.sensorName = _sensors[indexPath.row][0];
        cell.sensorData = _sensors[indexPath.row][1];
        if ([_sensors[indexPath.row][2] isEqualToString:@"n"]) {
            cell.valueStatus = KEValueNormal;
        }
        if ([_sensors[indexPath.row][2] isEqualToString:@"d"]) {
            cell.valueStatus = KEValueDanger;
        }
        if ([_sensors[indexPath.row][2] isEqualToString:@"w"]) {
            cell.valueStatus = KEValueWarning;
        }
    }
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.sensors.count;
}

@end
