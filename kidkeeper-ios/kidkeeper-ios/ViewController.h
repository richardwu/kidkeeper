//
//  ViewController.h
//  kidkeeper-ios
//
//  Created by Edward Guo on 2015-08-15.
//  Copyright (c) 2015 Peiliang Guo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "KETableView.h"
#import "KEStatusDataSource.h"

@interface ViewController : UIViewController


- (IBAction)refresh:(id)sender;
@property(nonatomic) NSInteger teleID;
@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property(nonatomic) BOOL loading;
@property(nonatomic) MKPointAnnotation* annotation;
@property(nonatomic) KETableView* tableView;
@property(nonatomic) KEStatusDataSource* statusDataSource;
@end

