//
//  KETableViewCell.m
//  kidkeeper-ios
//
//  Created by Edward Guo on 2015-08-15.
//  Copyright (c) 2015 Peiliang Guo. All rights reserved.
//

#import "KETableViewCell.h"

@implementation KETableViewCell{
    UIView* _statusIndicator;
    UILabel* _sensorNameLabel;
    UILabel* _sensorDataLabel;
}

- (void)awakeFromNib {
    // Initialization code
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        
        _sensorNameLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _sensorNameLabel.translatesAutoresizingMaskIntoConstraints = NO;
        _sensorNameLabel.backgroundColor = [UIColor clearColor];
        [self.contentView addSubview:_sensorNameLabel];
        
        //CGSize sensorNameLabelSize = [_sensorNameLabel sizeThatFits:CGSizeMake(CGFLOAT_MAX, CGFLOAT_MAX)];
        
        _statusIndicator = [[UIView alloc] initWithFrame:CGRectZero];
        _statusIndicator.translatesAutoresizingMaskIntoConstraints = NO;
        _statusIndicator.layer.cornerRadius = 10.0;
        
        _sensorDataLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _sensorDataLabel.translatesAutoresizingMaskIntoConstraints = NO;
        _sensorDataLabel.backgroundColor = [UIColor clearColor];
        [self.contentView addSubview:_sensorDataLabel];
        
        [self.contentView addSubview:_statusIndicator];
        [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:_statusIndicator attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant: 20.0]];
        [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:_statusIndicator attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0.0]];
        
        [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[indicator(==20)]-20-[textLabel]-(>=20)-[dataLabel]-20-|" options:0 metrics:nil views:@{@"indicator":_statusIndicator, @"textLabel":_sensorNameLabel, @"dataLabel":_sensorDataLabel}]];
        
        [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:_sensorNameLabel attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0.0]];
        [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:_sensorDataLabel attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0.0]];
        
        self.valueStatus = KEValueNormal;
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    //[super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated{
    
}

- (void)setValueStatus:(KESensorValueStatus)valueStatus{
    _valueStatus = valueStatus;
    switch (_valueStatus) {
        case KEValueDanger:
            _statusIndicator.backgroundColor = [UIColor redColor];
            break;
        
        case KEValueWarning:
            _statusIndicator.backgroundColor = [UIColor yellowColor];
            break;
            
        case KEValueNormal:
        default:
            _statusIndicator.backgroundColor = [UIColor greenColor];
            break;
    }
}

- (void)setSensorName:(NSString *)sensorName{
    _sensorNameLabel.text = sensorName;
}

- (void)setSensorData:(NSString *)sensorData{
    _sensorDataLabel.text = sensorData;
}

@end
