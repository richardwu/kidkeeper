//
//  KETableViewCell.h
//  kidkeeper-ios
//
//  Created by Edward Guo on 2015-08-15.
//  Copyright (c) 2015 Peiliang Guo. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, KESensorValueStatus){
    KEValueNormal,
    KEValueWarning,
    KEValueDanger
};

@interface KETableViewCell : UITableViewCell
@property(nonatomic) KESensorValueStatus valueStatus;
@property(nonatomic) NSString* sensorName;
@property(nonatomic) NSString* sensorData;
@end
