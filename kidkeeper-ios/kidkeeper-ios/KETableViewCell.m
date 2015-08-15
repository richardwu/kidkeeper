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
}

- (void)awakeFromNib {
    // Initialization code
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        
        
        _statusIndicator = [[UIView alloc] initWithFrame:CGRectZero];
        _statusIndicator.translatesAutoresizingMaskIntoConstraints = NO;
        
        [self.contentView addSubview:_statusIndicator];
        [_statusIndicator addConstraint:[NSLayoutConstraint constraintWithItem:_statusIndicator attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant: 20.0]];
        [_statusIndicator addConstraint:[NSLayoutConstraint constraintWithItem:_statusIndicator attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0.0]];
        
        [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[indicator(==20)]-20-[textLabel]-20-|" options:0 metrics:nil views:@{@"indicator":_statusIndicator, @"textLabel":self.textLabel}]];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
