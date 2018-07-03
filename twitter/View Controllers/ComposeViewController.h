//
//  ComposeViewController.h
//  twitter
//
//  Created by Emily Schussheim on 7/3/18.
//  Copyright © 2018 Emerson Malca. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ComposeViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextView *composeTextView;
- (IBAction)tweetButton:(id)sender;
- (IBAction)closeButton:(id)sender;


@end
