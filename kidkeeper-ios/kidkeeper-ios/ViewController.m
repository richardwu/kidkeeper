//
//  ViewController.m
//  kidkeeper-ios
//
//  Created by Edward Guo on 2015-08-15.
//  Copyright (c) 2015 Peiliang Guo. All rights reserved.
//

#import "ViewController.h"
#import "KETableViewCell.h"
#import <Parse/Parse.h>


@interface ViewController ()

@end

@implementation ViewController{
    
    NSURLSession* _urlSession;
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
    
    NSURLSessionConfiguration* sessionConfig = [NSURLSessionConfiguration defaultSessionConfiguration];
    _urlSession = [NSURLSession sessionWithConfiguration:sessionConfig];
    _loading = NO;
    [self refresh:nil];
    [NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(reloadData) userInfo:nil repeats:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)reloadData{
    [self refresh:nil];
}

- (IBAction)refresh:(id)sender {
    if (!_loading) {
        __weak ViewController* weakSelf =  self;
        _loading = YES;
        NSURLSessionDataTask* task = [_urlSession dataTaskWithURL:[_serverURL URLByAppendingPathComponent:[NSString stringWithFormat:@"telemetries/%ld.json",(long)_teleID]] completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
            NSHTTPURLResponse* http = (NSHTTPURLResponse*) response;
            NSError* err;
            if (http.statusCode == 200) {
                NSDictionary* dict = [NSJSONSerialization JSONObjectWithData:data options:0 error:&err];
                dispatch_async(dispatch_get_main_queue(), ^{
                    CLLocationCoordinate2D cood = CLLocationCoordinate2DMake([(NSNumber*)dict[@"latitude"] doubleValue],[(NSNumber*)dict[@"longitude"] doubleValue]);
                    
                    BOOL flag = YES;
                    
                    if (weakSelf.annotation) {
                        MKMapPoint point1 = MKMapPointForCoordinate(cood);
                        MKMapPoint point2 = MKMapPointForCoordinate(weakSelf.annotation.coordinate);
                        CLLocationDistance distance = MKMetersBetweenMapPoints(point1, point2);
                        if (distance < 200){
                            flag = NO;
                        }
                    }
                    
                    if (flag) {
                        NSLog(@"NEW");
                        CLLocationCoordinate2D f_cood = CLLocationCoordinate2DMake([(NSNumber*)dict[@"latitude"] doubleValue],[(NSNumber*)dict[@"longitude"] doubleValue]);
                        if (f_cood.latitude > 0) {
                            f_cood.latitude -= 0.005;
                        }else{
                            f_cood.latitude -= 0.005;
                        }
                        MKCoordinateRegion region = [weakSelf.mapView regionThatFits:MKCoordinateRegionMakeWithDistance(f_cood, 2000, 2000)];
                        [weakSelf.mapView setRegion:region];
                        if (!weakSelf.annotation) {
                            weakSelf.annotation = [[MKPointAnnotation alloc] init];
                            [weakSelf.mapView addAnnotation:weakSelf.annotation];
                        }
                        weakSelf.annotation.coordinate = cood;
                    }
                    
                    
                    weakSelf.statusDataSource.sensors[0] = @[@"GPS",[NSString stringWithFormat:@"Lat:%.2f, Long: %.2f",cood.latitude,cood.longitude],@"n"];
                    
                    NSString* air_quality;
                    if ([dict[@"air_quality"] containsString:@"High"] || [dict[@"air_quality"] containsString:@"Alert"]){
                        air_quality = @"d";
                    } else if ([dict[@"air_quality"] containsString:@"Low"]){
                        air_quality = @"w";
                    } else {
                        air_quality = @"n";
                    }
                    weakSelf.statusDataSource.sensors[2] = @[@"Air Quality",dict[@"air_quality"],air_quality];
                    
                    if ([dict[@"light"] isEqualToString:@"Dark"] || [dict[@"light"] isEqualToString:@"Bright"]) {
                        weakSelf.statusDataSource.sensors[3] = @[@"Brightness",dict[@"light"],@"w"];
                    } else {
                        weakSelf.statusDataSource.sensors[3] = @[@"Brightness",dict[@"light"],@"n"];
                    }
                    
                    if ([dict[@"sound"] containsString:@"Little"]) {
                        weakSelf.statusDataSource.sensors[4] = @[@"Sound",dict[@"sound"],@"w"];
                    } else if ([dict[@"sound"] containsString:@"High"] || [dict[@"sound"] containsString:@"Noisy"]) {
                        weakSelf.statusDataSource.sensors[4] = @[@"Sound",dict[@"sound"],@"d"];
                    } else {
                        weakSelf.statusDataSource.sensors[4] = @[@"Sound",dict[@"sound"],@"n"];
                    }
                    
                    
                    
                    if ([dict[@"temp_str"] containsString:@"Normal"] || [dict[@"temp_str"] containsString:@"NoData"]) {
                        weakSelf.statusDataSource.sensors[1] = @[@"Temperature",dict[@"temp"],@"n"];
                    } else if ([dict[@"temp_str"] containsString:@"Very"] || [dict[@"temp_str"] containsString:@"Freezing"]) {
                        weakSelf.statusDataSource.sensors[1] = @[@"Temperature",dict[@"temp"],@"d"];
                    } else if ([dict[@"temp_str"] containsString:@"High"] || [dict[@"temp_str"] containsString:@"Low"]) {
                        weakSelf.statusDataSource.sensors[1] = @[@"Temperature",dict[@"temp"],@"w"];
                    }
                    
                    [weakSelf.tableView reloadData];
                    //cll
                    //weakSelf.
                });
                
            }
            
            weakSelf.loading = NO;
        }];
        [task resume];
    }
}
@end
