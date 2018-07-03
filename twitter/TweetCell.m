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
    // Initialization code
    self.tweetText.text = self.tweet.text;
    self.dateLabel.text = self.tweet.createdAtString;
    self.propicImage.image = nil;
    if (self.tweet.user.propicURL != nil) {
        [self.propicImage setImageWithURL:self.tweet.user.propicURL];
    }
    self.nameLabel.text = self.tweet.user.name;
    self.usernameLabel.text = self.tweet.user.screenName;
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setTweet:(Tweet *)tweet {
    _tweet = tweet;
    self.tweetText.text = self.tweet.text;
    self.dateLabel.text = self.tweet.createdAtString;
    //self.propicImage.image = nil;
    //if (self.tweet.user.propicURL != nil) {
        [self.propicImage setImageWithURL:self.tweet.user.propicURL];
    NSLog(@"The ProPic URL: %@ THATS THE END", self.tweet.user.propicURL);
    //}
    self.nameLabel.text = self.tweet.user.name;
    self.usernameLabel.text = self.tweet.user.screenName;
    
}

@end
