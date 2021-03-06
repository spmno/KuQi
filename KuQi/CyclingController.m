//
//  CyclingController.m
//  KuQi
//
//  Created by ZhouM on 15/2/22.
//  Copyright (c) 2015年 ZhouM. All rights reserved.
//

#import "CyclingController.h"

@interface CyclingController ()

@end

@implementation CyclingController

- (void)viewDidLoad {
    [super viewDidLoad];
    if (![CLLocationManager locationServicesEnabled]) {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"turn on gps" message:@"turn on gps" delegate:nil cancelButtonTitle:@"Cancel" otherButtonTitles:@"Yes", nil];
        [alert show];
        return;
    }
    locationManager = [[CLLocationManager alloc]init];
    locationManager.delegate = self;
    locationManager.desiredAccuracy=kCLLocationAccuracyBest;
    [locationManager startUpdatingLocation];
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0) {
        [locationManager requestWhenInUseAuthorization];
    }
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations {
    CLLocation *lastLocation = [locations lastObject];
    NSString *currentSpeed = [NSString stringWithFormat:@"%f", [lastLocation speed]];
}

@end
