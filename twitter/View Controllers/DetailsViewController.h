//
//  DetailsViewController.h
//  twitter
//
//  Created by Emily Schussheim on 7/5/18.
//  Copyright © 2018 Emerson Malca. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Tweet.h"

@interface DetailsViewController : UIViewController
@property (strong, nonatomic) Tweet *tweet;
@property (weak, nonatomic) IBOutlet UITextView *textView;

@end
