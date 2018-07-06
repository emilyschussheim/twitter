//
//  User.h
//  twitter
//
//  Created by Emily Schussheim on 7/2/18.
//  Copyright © 2018 Emerson Malca. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject

@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *screenName;
@property (strong, nonatomic) NSURL *propicURL;
@property (strong, nonatomic) NSString *followersCount;
@property (strong, nonatomic) NSString *followingCount;
@property (strong, nonatomic) NSString *tweetCount;


- (instancetype)initWithDictionary:(NSDictionary *)dictionary;


@end
