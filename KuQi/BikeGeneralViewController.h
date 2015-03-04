//
//  BikeGeneralViewController.h
//  KuQi
//
//  Created by ZhouM on 15/3/4.
//  Copyright (c) 2015年 ZhouM. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BikeGeneralViewController : UIViewController
{
    NSDictionary *jsonMap;
}

@property (weak, nonatomic) IBOutlet UILabel *bikeTitleLabel;
@property (weak, nonatomic) IBOutlet UIImageView *bikeShowImageView;
@end
