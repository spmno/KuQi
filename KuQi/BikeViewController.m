//
//  BikeViewController.m
//  KuQi
//
//  Created by ZhouM on 15/2/25.
//  Copyright (c) 2015年 ZhouM. All rights reserved.
//

#import "BikeViewController.h"

@interface BikeViewController ()

@end

@implementation BikeViewController

- (void)getBikeData {
    NSString *brandUrlString = @"http://115.28.1.131/brands/";
    NSString *wholeUrlString = [[brandUrlString stringByAppendingString:self.brandId] stringByAppendingString:@"/bikes.json"];
    NSURL *url = [NSURL URLWithString:wholeUrlString];
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url];
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    [NSURLConnection sendAsynchronousRequest:urlRequest queue:queue completionHandler:
     ^(NSURLResponse *response, NSData *data, NSError *error) {
         if (([data length] > 0) && (error == nil)) {
             NSString *html = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
             NSLog(@"html = %@", html);
             NSError *error;
             self.bikeJsonArray = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
             for (NSDictionary *item in self.bikeJsonArray) {
                 //NSString *photoUrl = [ipUrlString stringByAppendingString:(NSString*)[item objectForKey:@"photo"]];
                 //[brandIdArray addObject:[item objectForKey:@"id"]];
             }
             dispatch_async(dispatch_get_main_queue(), ^{
                 [self.tableView reloadData];
             });
             
         }
     }];

}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self getBikeData];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (self.bikeJsonArray != nil) {
        NSLog(@"table count %lu", (unsigned long)self.bikeJsonArray.count);
        return self.bikeJsonArray.count;
    }
    return 0;}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"bike";
    static NSString *ipUrlString = @"http://115.28.1.131";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell==nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    // Configure the cell...
    NSDictionary *brandItem = [self.bikeJsonArray objectAtIndex:indexPath.row];
    cell.textLabel.text = [brandItem objectForKey:@"name"];
    //NSString *photoUrlString =[ipUrlString stringByAppendingString:[brandItem objectForKey:@"photo"]];
    //NSURL *imageUrl = [NSURL URLWithString:photoUrlString];
    //cell.imageView.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:imageUrl]];
    return cell;

}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
