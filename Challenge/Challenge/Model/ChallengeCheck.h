//
//  ChallengeCheck.h
//  Challenge
//
//  Created by Fernando Rocha Silva on 7/25/17.
//  Copyright © 2017 ropetech. All rights reserved.
//

#import <Foundation/Foundation.h>
@class User;
@class Challenge;

@interface ChallengeCheck : NSObject

@property(nonatomic) NSString *uid;
@property(nonatomic) NSString* details;
@property(nonatomic) User* completedBy;
@property(nonatomic, weak) Challenge* challenge;
@property(nonatomic) NSString* rewardPictureURL;

@end
