//
//  BikeGeneralViewController.m
//  KuQi
//
//  Created by ZhouM on 15/3/4.
//  Copyright (c) 2015年 ZhouM. All rights reserved.
//

#import "BikeGeneralViewController.h"

@interface BikeGeneralViewController ()

@end

@implementation BikeGeneralViewController

- (void)downloadBikeImage {
    NSString *rootUrl = @"http://115.28.1.131";
    NSArray *photos = [jsonMap objectForKey:@"photos"];
    NSDictionary *photoMap = [photos firstObject];
    NSString *imageRelativeUrlStr = [[photoMap objectForKey:@"photo"] objectForKey:@"url"];
    NSString *imageUrlStr = [rootUrl stringByAppendingString:imageRelativeUrlStr];
    NSURL *imageUrl = [NSURL URLWithString:imageUrlStr];
    UIImage *bikeImage = [UIImage imageWithData:[NSData dataWithContentsOfURL:imageUrl]];
    self.bikeShowImageView.image = bikeImage;
}

- (void)getBikeData {
    
    NSString *bikeUrlString = @"http://115.28.1.131/bikes/";
    NSString *wholeUrlString = [[bikeUrlString stringByAppendingString:@"7"] stringByAppendingString:@".json"];
    NSURL *url = [NSURL URLWithString:wholeUrlString];
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url];
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    [NSURLConnection sendAsynchronousRequest:urlRequest queue:queue completionHandler:
     ^(NSURLResponse *response, NSData *data, NSError *error) {
         if (([data length] > 0) && (error == nil)) {
             NSString *html = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
             NSLog(@"html = %@", html);
             NSError *error;
             jsonMap = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
             NSString *bikeName = [jsonMap objectForKey:@"name"];
             self.bikeTitleLabel.text = bikeName;
             [self downloadBikeImage];
         }
     }];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self getBikeData];
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

@end
