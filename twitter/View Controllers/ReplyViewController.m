//
//  ReplyViewController.m
//  twitter
//
//  Created by Emily Schussheim on 7/5/18.
//  Copyright © 2018 Emerson Malca. All rights reserved.
//

#import "ReplyViewController.h"
#import "APIManager.h"

@interface ReplyViewController ()

@end

@implementation ReplyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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

- (IBAction)replyTapped:(id)sender {
    
    NSString *tweetString = self.textView.text;
    [[APIManager shared] postStatusWithText:tweetString completion:^(Tweet *tweet, NSError *error) {
        if (tweet) {
            NSLog(@"tweet exists??");
            [self dismissViewControllerAnimated:true completion:nil];
        } else {
            NSLog(@"the tweet didnt get made");
            NSLog(@"THIS IS THE ERROR: %@", error);
        }
    }];
}
- (IBAction)closeButton:(id)sender {
    [self dismissViewControllerAnimated:true completion:nil];
}
@end
