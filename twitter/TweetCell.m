//
//  TweetCell.m
//  twitter
//
//  Created by Emily Schussheim on 7/2/18.
//  Copyright © 2018 Emerson Malca. All rights reserved.
//

#import "TweetCell.h"
#import "Tweet.h"
#import "User.h"
#import "UIImageView+AFNetworking.h"
#import "APIManager.h"
#import "NSDate+TimeAgo.h"
#import "DateTools.h"

@implementation TweetCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setTweet:(Tweet *)tweet {
    _tweet = tweet;
    self.tweetText.text = self.tweet.text;
    [self.propicImage setImageWithURL:self.tweet.user.propicURL];
    self.nameLabel.text = self.tweet.user.name;
    self.usernameLabel.text = self.tweet.user.screenName;
    self.retweetLabel.text = [NSString stringWithFormat:@"%i", self.tweet.retweetCount];
    self.favoriteLabel.text = [NSString stringWithFormat:@"%i", self.tweet.favoriteCount];
    

    NSDate *tweetDate = self.tweet.date;
    NSString *date = [tweetDate timeAgo];
    self.dateLabel.text = date;
    
}

- (IBAction)retweetButton:(id)sender {
    
    if ([[self.retweenButtonProperty imageForState:UIControlStateNormal] isEqual: [UIImage imageNamed:@"retweet-icon-green"]]) {
        [self.retweenButtonProperty setImage:[UIImage imageNamed:@"retweet-icon"] forState:UIControlStateNormal];
        self.tweet.retweeted = NO;
        self.tweet.retweetCount -= 1;
        [self refreshData:self];
        
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
    [self.retweenButtonProperty setImage:[UIImage imageNamed:@"retweet-icon-green"] forState:UIControlStateNormal];
        self.tweet.retweeted = YES;
        self.tweet.retweetCount += 1;
        [self refreshData:self];
        
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

- (IBAction)favoriteButton:(id)sender {
    
    if ([[self.favoriteButtonProperty imageForState:UIControlStateNormal] isEqual: [UIImage imageNamed:@"favor-icon-red"]]) {
        [self.favoriteButtonProperty setImage:[UIImage imageNamed:@"favor-icon"] forState:UIControlStateNormal];
        self.tweet.favorited = NO;
        self.tweet.favoriteCount -= 1;
        [self refreshData:self];
        
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
        [self refreshData:self];
        
        //make the post request
        [[APIManager shared] favorite:self.tweet completion:^(Tweet *tweet, NSError *error) {
            if(error){ NSLog(@"Error favoriting tweet: %@", error.localizedDescription);
            }
            else{ NSLog(@"Successfully favorited the following Tweet: %@", tweet.text);
            }
        }];
    }
    
    
    // TODO: Update the local tweet model
    // TODO: Update cell UI
    // TODO: Send a POST request to the POST favorites/create endpoint
}

- (void)refreshData:(TweetCell *)tweetCell {
    [self setTweet:tweetCell.tweet];
}
@end
