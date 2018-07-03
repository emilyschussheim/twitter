//
//  User.m
//  twitter
//
//  Created by Emily Schussheim on 7/2/18.
//  Copyright © 2018 Emerson Malca. All rights reserved.
//

#import "User.h"

@implementation User

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (self) {
        self.name = dictionary[@"name"];
        self.screenName = dictionary[@"screen_name"];
        
        NSString *URL = dictionary[@"profile_image_url"];
        self.propicURL = [NSURL URLWithString:URL];

    }
    return self;
}

@end
