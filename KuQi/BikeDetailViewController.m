//
//  BikeDetailViewController.m
//  KuQi
//
//  Created by ZhouM on 15/2/28.
//  Copyright (c) 2015年 ZhouM. All rights reserved.
//

#import "BikeDetailViewController.h"

@interface BikeDetailViewController ()

@end

@implementation BikeDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.delegate = self;
    self.dataSource = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - ViewPagerDataSource
- (NSInteger)numberOfTabsForViewPager:(ViewPagerController *)viewPager {
    return 3;
}

- (UIView *)viewPager:(ViewPagerController *)viewPager viewForTabAtIndex:(NSUInteger)index {
    UILabel *label = [UILabel new];
    label.text = [NSString stringWithFormat:@"Tab%i", index];
    [label sizeToFit];
    return label;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
