//
//  ReplyViewController.h
//  twitter
//
//  Created by Emily Schussheim on 7/5/18.
//  Copyright © 2018 Emerson Malca. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ReplyViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextView *textView;
- (IBAction)replyTapped:(id)sender;
- (IBAction)closeButton:(id)sender;

@end
