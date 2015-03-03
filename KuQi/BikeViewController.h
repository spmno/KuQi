//
//  BikeViewController.h
//  KuQi
//
//  Created by ZhouM on 15/2/25.
//  Copyright (c) 2015年 ZhouM. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BikeViewController : UITableViewController
{
    NSMutableArray *bikeIdArray;
}

@property (nonatomic, strong) NSString* brandId;
@property (strong, nonatomic) NSArray *bikeJsonArray;

@end
