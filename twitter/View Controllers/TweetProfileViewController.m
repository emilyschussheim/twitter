//
//  TweetProfileViewController.m
//  twitter
//
//  Created by Emily Schussheim on 7/6/18.
//  Copyright © 2018 Emerson Malca. All rights reserved.
//

#import "TweetProfileViewController.h"
#import "UIImageView+AFNetworking.h"

@interface TweetProfileViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *propicImage;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *usernameLabel;
@property (weak, nonatomic) IBOutlet UILabel *tweetCount;
@property (weak, nonatomic) IBOutlet UILabel *followersCount;
@property (weak, nonatomic) IBOutlet UILabel *followingCount;

@end

@implementation TweetProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setProfileUI];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void) setProfileUI {
    
    self.nameLabel.text = self.user.name;
    self.usernameLabel.text = self.user.screenName;
    self.tweetCount.text = self.user.tweetCount;
    self.followersCount.text = self.user.followersCount;
    self.followingCount.text = self.user.followingCount;
    [self.propicImage setImageWithURL:self.user.propicURL];
    
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
