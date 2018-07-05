//
//  DetailsViewController.m
//  twitter
//
//  Created by Emily Schussheim on 7/5/18.
//  Copyright © 2018 Emerson Malca. All rights reserved.
//

#import "DetailsViewController.h"
#import "UIImageView+AFNetworking.h"
#import "APIManager.h"

@interface DetailsViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *propicImage;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *usernameLabel;
@property (weak, nonatomic) IBOutlet UILabel *tweetText;
@property (weak, nonatomic) IBOutlet UIButton *favoriteButtonProperty;
@property (weak, nonatomic) IBOutlet UILabel *retweetLabel;
- (IBAction)retweetTapped:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *retweetButtonProperty;
@property (weak, nonatomic) IBOutlet UILabel *faveLabel;

- (IBAction)faveTapped:(id)sender;

@end

@implementation DetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUI];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setUI {
    self.tweetText.text = self.tweet.text;
    [self.propicImage setImageWithURL:self.tweet.user.propicURL];
    self.nameLabel.text = self.tweet.user.name;
    self.usernameLabel.text = self.tweet.user.screenName;
    self.retweetLabel.text = [NSString stringWithFormat:@"%i", self.tweet.retweetCount];
    self.faveLabel.text = [NSString stringWithFormat:@"%i", self.tweet.favoriteCount];
    if (self.tweet.retweeted) {
        [self.retweetButtonProperty setImage:[UIImage imageNamed:@"retweet-icon-green"] forState:UIControlStateNormal];
    }
    if (self.tweet.favorited) {
        [self.favoriteButtonProperty setImage:[UIImage imageNamed:@"favor-icon-red"] forState:UIControlStateNormal];
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)retweetTapped:(id)sender {
    if ([[self.retweetButtonProperty imageForState:UIControlStateNormal] isEqual: [UIImage imageNamed:@"retweet-icon-green"]]) {
        [self.retweetButtonProperty setImage:[UIImage imageNamed:@"retweet-icon"] forState:UIControlStateNormal];
        self.tweet.retweeted = NO;
        self.tweet.retweetCount -= 1;
        [self setUI];
        
        //make the post request
        [[APIManager shared] unretweet:self.tweet completion:^(Tweet *tweet, NSError *error) {
            if(error){
                NSLog(@"Error unretweeting tweet: %@", error.localizedDescription);
            }
            else{
                NSLog(@"Successfully unretweeted the following Tweet: %@", tweet.text);
            }
        }];
        
    } else {
        [self.retweetButtonProperty setImage:[UIImage imageNamed:@"retweet-icon-green"] forState:UIControlStateNormal];
        self.tweet.retweeted = YES;
        self.tweet.retweetCount += 1;
        [self setUI];
        
        //make the post request
        [[APIManager shared] retweet:self.tweet completion:^(Tweet *tweet, NSError *error) {
            if(error){
                NSLog(@"Error retweeting tweet: %@", error.localizedDescription);
            }
            else{
                NSLog(@"Successfully retweeted the following Tweet: %@", tweet.text);
            }
        }];
        
    }
    
}


- (IBAction)faveTapped:(id)sender {
    if ([[self.favoriteButtonProperty imageForState:UIControlStateNormal] isEqual: [UIImage imageNamed:@"favor-icon-red"]]) {
        [self.favoriteButtonProperty setImage:[UIImage imageNamed:@"favor-icon"] forState:UIControlStateNormal];
        self.tweet.favorited = NO;
        self.tweet.favoriteCount -= 1;
        [self setUI];
        
        //make the post request
        [[APIManager shared] unfavorite:self.tweet completion:^(Tweet *tweet, NSError *error) {
            if(error){ NSLog(@"Error unfavoriting tweet: %@", error.localizedDescription);
            }
            else{ NSLog(@"Successfully unfavorited the following Tweet: %@", tweet.text);
            }
        }];
        
    } else {
        
        [self.favoriteButtonProperty setImage:[UIImage imageNamed:@"favor-icon-red"] forState:UIControlStateNormal];
        self.tweet.favorited = YES;
        self.tweet.favoriteCount += 1;
        [self setUI];
        
        //make the post request
        [[APIManager shared] favorite:self.tweet completion:^(Tweet *tweet, NSError *error) {
            if(error){ NSLog(@"Error favoriting tweet: %@", error.localizedDescription);
            }
            else{ NSLog(@"Successfully favorited the following Tweet: %@", tweet.text);
            }
        }];
    }
    
}
@end
