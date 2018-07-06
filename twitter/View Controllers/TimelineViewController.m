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
#import "DetailsViewController.h"
#import "ComposeViewController.h"
#import "TweetProfileViewController.h"
#import "InfiniteScrollActivityView.h"


@interface TimelineViewController () <UIScrollViewDelegate, TweetCellDelegate, ComposeViewControllerDelegate, UITableViewDataSource, UITableViewDelegate>
@property (strong, nonatomic) IBOutlet UITableView *timelineTableView;
@property (strong, nonatomic) NSArray *tweetArray;
@property (nonatomic, strong) UIRefreshControl *refreshControl;
@property (assign, nonatomic) BOOL isMoreDataLoading;
- (IBAction)logoutTapped:(id)sender;

@end

@implementation TimelineViewController

bool isMoreDataLoading = false;
InfiniteScrollActivityView* loadingMoreView;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.timelineTableView.dataSource = self;
    self.timelineTableView.delegate = self;
    
    [self getTweets];
    
    self.refreshControl = [[UIRefreshControl alloc] init];
    [self.refreshControl addTarget:self action:@selector(getTweets) forControlEvents:UIControlEventValueChanged];
    [self.timelineTableView insertSubview:self.refreshControl atIndex:0];
    
    [self addInfiniteScrollActivityIndicator];
    
    
}
- (void) addInfiniteScrollActivityIndicator {
    CGRect frame = CGRectMake(0, self.timelineTableView.contentSize.height, self.timelineTableView.bounds.size.width, InfiniteScrollActivityView.defaultHeight);
    loadingMoreView = [[InfiniteScrollActivityView alloc] initWithFrame:frame];
    loadingMoreView.hidden = true;
    [self.timelineTableView addSubview:loadingMoreView];
    
    UIEdgeInsets insets = self.timelineTableView.contentInset;
    insets.bottom += InfiniteScrollActivityView.defaultHeight;
    self.timelineTableView.contentInset = insets;
    
}

- (void)tweetCell:(TweetCell *)tweetCell didTap:(User *)user{
    
    [self performSegueWithIdentifier:@"UsersProfileSegue" sender:user];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if(self.isMoreDataLoading == FALSE){
     
        int scrollViewContentHeight = self.timelineTableView.contentSize.height;
        int scrollOffsetThreshold = scrollViewContentHeight - self.timelineTableView.bounds.size.height;
        
        //start requesting
        if(scrollView.contentOffset.y > scrollOffsetThreshold && self.timelineTableView.isDragging) {
                self.isMoreDataLoading = true;
            
                // Update position of loadingMoreView, and start loading indicator
                CGRect frame = CGRectMake(0, self.timelineTableView.contentSize.height, self.timelineTableView.bounds.size.width, InfiniteScrollActivityView.defaultHeight);
            loadingMoreView.frame = frame;
            [loadingMoreView startAnimating];
            
            [self loadMoreData];
        }
    }
}

-(void)loadMoreData{
    
    // ... Create the NSURLRequest (myRequest) ...
    
    // Configure session so that completion handler is executed on main UI thread
//    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
//
//    NSURLSession *session  = [NSURLSession sessionWithConfiguration:configuration delegate:nil delegateQueue:[NSOperationQueue mainQueue]];
//
//    NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *requestError) {
//        if (requestError != nil) {
//
//        }
//        else

    [self getTweets];
    
    self.isMoreDataLoading = false;
    [loadingMoreView stopAnimating];
            
    [self.timelineTableView reloadData];

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
 }


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    
    TweetCell *tweetCell = [tableView dequeueReusableCellWithIdentifier:@"TweetCell"];
    tweetCell.tweet = self.tweetArray[indexPath.row];
    tweetCell.delegate = self;
    return tweetCell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.tweetArray.count;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"detailsSegue"]) {
        TweetCell *tappedTweet = sender;
        DetailsViewController *detailsViewController = [segue destinationViewController];
        detailsViewController.tweet = tappedTweet.tweet;
    }
    
    if ([segue.identifier isEqualToString:@"composeSegue"]) {
        UINavigationController *navigationController = [segue destinationViewController];
        ComposeViewController *composeController = (ComposeViewController*)navigationController.topViewController;
        composeController.delegate = self;
    }
    
    if ([segue.identifier isEqualToString:@"UsersProfileSegue"]) {

        TweetProfileViewController *viewController = [segue destinationViewController];
        User *user = sender;
        viewController.user = user;

    }
}



- (IBAction)logoutTapped:(id)sender {
    AppDelegate *appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    LoginViewController *loginViewController = [storyboard instantiateViewControllerWithIdentifier:@"LoginViewController"];
    appDelegate.window.rootViewController = loginViewController;
    
    [[APIManager shared] logout];
}


- (void)didTweet:(Tweet *)tweet {
    self.tweetArray = [self.tweetArray arrayByAddingObject:tweet];
    [self.timelineTableView reloadData];
    [self getTweets];
}


@end
