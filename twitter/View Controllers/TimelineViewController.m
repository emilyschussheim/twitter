//
//  TimelineViewController.m
//  twitter
//
//  Created by emersonmalca on 5/28/18.
//  Copyright © 2018 Emerson Malca. All rights reserved.
//

#import "TimelineViewController.h"
#import "APIManager.h"
#import "Tweet.h"
#import "TweetCell.h"
#import "AppDelegate.h"
#import "LoginViewController.h"

@interface TimelineViewController () <UITableViewDataSource, UITableViewDelegate>
@property (strong, nonatomic) IBOutlet UITableView *timelineTableView;
@property NSArray *tweetArray;
@property (nonatomic, strong) UIRefreshControl *refreshControl;
- (IBAction)logoutTapped:(id)sender;

@end

@implementation TimelineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.timelineTableView.dataSource = self;
    self.timelineTableView.delegate = self;
    
    [self getTweets];
    
    self.refreshControl = [[UIRefreshControl alloc] init];
    [self.refreshControl addTarget:self action:@selector(getTweets) forControlEvents:UIControlEventValueChanged];
    [self.timelineTableView insertSubview:self.refreshControl atIndex:0];
    
}

- (void)getTweets {
     [[APIManager shared] getHomeTimelineWithCompletion:^(NSArray *tweets, NSError *error) {
         if (tweets) {
            self.tweetArray = tweets;
             [self.timelineTableView reloadData];
             } else {
            NSLog(@"Error getting home timeline: %@", error.localizedDescription);
             }
         [self.refreshControl endRefreshing];
         }];
     
     //[task resume];
 }


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    
    TweetCell *tweetCell = [tableView dequeueReusableCellWithIdentifier:@"TweetCell"];
    
    tweetCell.tweet = self.tweetArray[indexPath.row];
    
    return tweetCell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.tweetArray.count;
}




/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


- (IBAction)logoutTapped:(id)sender {
    AppDelegate *appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    LoginViewController *loginViewController = [storyboard instantiateViewControllerWithIdentifier:@"LoginViewController"];
    appDelegate.window.rootViewController = loginViewController;
    
    [[APIManager shared] logout];
}
@end
