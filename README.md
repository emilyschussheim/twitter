# Project 4 - Twitter Client

Twitter Client is a basic twitter app to read and compose tweets the [Twitter API](https://apps.twitter.com/).

Time spent: 25 hours spent in total

## User Stories

The following **required** functionality is completed:

- [X] User sees app icon in home screen and styled launch screen
- [X] User can sign in using OAuth login flow
- [X] User can Logout
- [X] User can view last 20 tweets from their home timeline
- [X] In the home timeline, user can view tweet with the user profile picture, username, tweet text, and timestamp.
- [X] User can pull to refresh.
- [X] User can tap the retweet and favorite buttons in a tweet cell to retweet and/or favorite a tweet.
- [X] User can compose a new tweet by tapping on a compose button.
- [X] Using AutoLayout, the Tweet cell should adjust it's layout for iPhone 7, Plus and SE device sizes as well as accommodate device rotation.
- [X] The current signed in user will be persisted across restarts

The following **optional** features are implemented:

- [X] Tweet Details Page: User can tap on a tweet to view it, with controls to retweet, favorite, and reply.
- [X] User can view their profile in a *profile tab*
<<<<<<< HEAD
- Contains the user header view: picture and tagline
- Contains a section with the users basic stats: # tweets, # following, # followers
- [ ] Profile view should include that user's timeline
=======
   - Contains the user header view: picture and tagline
   - Contains a section with the users basic stats: # tweets, # following, # followers
   - [ ] Profile view should include that user's timeline
- [X] User should display the relative timestamp for each tweet "8m", "7h"
- [X] User should be able to unretweet and unfavorite and should decrement the retweet and favorite count. Refer to [[this guide|unretweeting]] for help on implementing unretweeting.
- [X] Links in tweets are clickable.
- [X] User can tap the profile image in any tweet to see another user's profile
<<<<<<< HEAD
- Contains the user header view: picture and tagline
- Contains a section with the users basic stats: # tweets, # following, # followers
=======
   - Contains the user header view: picture and tagline
   - Contains a section with the users basic stats: # tweets, # following, # followers
- [X] User can load more tweets once they reach the bottom of the feed using infinite loading similar to the actual Twitter client.
- [X] When composing, you should have a countdown for the number of characters remaining for the tweet (out of 140) (**1 point**)
- [X] After creating a new tweet, a user should be able to view it in the timeline immediately without refetching the timeline from the network.
- [X] User can reply to any tweet, and replies should be prefixed with the username and the reply_id should be set when posting the tweet (**2 points**)
- [ ] User sees embedded images in tweet if available 
- [X] User can switch between timeline, mentions, or profile view through a tab bar (**3 points**)

<<<<<<< HEAD
- NOTE: tab bar switches between timeline view and profile view

=======
        - NOTE: tab bar switches between timeline view and profile view
- [ ] Profile Page: pulling down the profile page should blur and resize the header image. (**4 points**)


The following **additional** features are implemented:

- [X] List anything else that you can get done to improve the app functionality!

<<<<<<< HEAD
- Retweet and Favorite status of retweet/favorite buttons transfers between view controllers!
=======
       - Retweet and Favorite status of retweet/favorite buttons transfers between view controllers!

Please list two areas of the assignment you'd like to **discuss further with your peers** during the next class (examples include better ways to implement something, how to extend your app in certain ways, etc):

1.  Comparison / Analysis of delegation/protocol and blocks and how they're useful for different situations
2.  Strategies for sharing objects between view controllers  

## Video Walkthrough

Here's a walkthrough of implemented user stories:

<img src='http://i.imgur.com/33fEjUN.gif' title='Video Walkthrough' width='' alt='Video Walkthrough' />

[img]https://i.imgur.com/33fEjUN.gif[/img]

GIF created with [LiceCap](http://www.cockos.com/licecap/).

## Notes

Describe any challenges encountered while building the app.

I was confused by the ways different view controllers could pass objects or connect earlier in the week, but I'm more comfortable with that now.  

## Credits

List an 3rd party libraries, icons, graphics, or other assets you used in your app.

- [AFNetworking](https://github.com/AFNetworking/AFNetworking) - networking task library

-DateTools Pod for the time stamps

## License

<<<<<<< HEAD
Copyright [2018] [Emily Schussheim]

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
=======
    Copyright [yyyy] [name of copyright owner]

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
>>>>>>> 3be936ff4a48b1aee7c0e920c2de5c13082be5b4
