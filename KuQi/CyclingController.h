//
//  CyclingController.h
//  KuQi
//
//  Created by ZhouM on 15/2/22.
//  Copyright (c) 2015年 ZhouM. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface CyclingController : UIViewController<CLLocationManagerDelegate> {
    CLLocationManager *locationManager;
}
@property (weak, nonatomic) IBOutlet UILabel *currentSpeedLabel;

@end
