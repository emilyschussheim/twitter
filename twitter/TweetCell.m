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
    self.dateLabel.text = self.tweet.createdAtString;
    [self.propicImage setImageWithURL:self.tweet.user.propicURL];
    self.nameLabel.text = self.tweet.user.name;
    self.usernameLabel.text = self.tweet.user.screenName;
    self.retweetLabel.text = [NSString stringWithFormat:@"%i", self.tweet.retweetCount];
    self.favoriteLabel.text = [NSString stringWithFormat:@"%i", self.tweet.favoriteCount];
    
}

- (IBAction)retweetButton:(id)sender {
    if ([[self.retweenButtonProperty imageForState:UIControlStateNormal] isEqual: [UIImage imageNamed:@"retweet-icon-green"]]) {
        [self.retweenButtonProperty setImage:[UIImage imageNamed:@"retweet-icon"] forState:UIControlStateNormal];
    } else {
    [self.retweenButtonProperty setImage:[UIImage imageNamed:@"retweet-icon-green"] forState:UIControlStateNormal];
    }
}

- (IBAction)favoriteButton:(id)sender {
    if ([[self.favoriteButtonProperty imageForState:UIControlStateNormal] isEqual: [UIImage imageNamed:@"favor-icon-red"]]) {
        [self.favoriteButtonProperty setImage:[UIImage imageNamed:@"favor-icon"] forState:UIControlStateNormal];
    } else {
    [self.favoriteButtonProperty setImage:[UIImage imageNamed:@"favor-icon-red"] forState:UIControlStateNormal];}
}
@end
