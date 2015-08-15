//
//  KETableView.m
//  kidkeeper-ios
//
//  Created by Edward Guo on 2015-08-15.
//  Copyright (c) 2015 Peiliang Guo. All rights reserved.
//

#import "KETableView.h"

@implementation KETableView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        UIVisualEffect* blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
        UIVisualEffectView* blurView = [[UIVisualEffectView alloc] initWithEffect:blurEffect];
        self.backgroundView = blurView;
        self.backgroundColor = [UIColor clearColor];
        
        self.separatorEffect = [UIVibrancyEffect effectForBlurEffect:blurView];
    }
    return self;
}

@end
