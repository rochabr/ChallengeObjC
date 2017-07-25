//
//  Challenge.h
//  Challenge
//
//  Created by Fernando Rocha Silva on 7/25/17.
//  Copyright © 2017 ropetech. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"
#import "ChallengeCheck.h"

@interface Challenge : NSObject

@property(nonatomic) NSString *uid;
@property(nonatomic) NSString* title;
@property(nonatomic) NSString* details;
@property(nonatomic) User* author;
@property(nonatomic) NSArray* assignedTo;
@property(nonatomic) NSArray* reward;
@property(nonatomic) NSString* rewardPictureURL;
@property(nonatomic, getter=isCompleted) BOOL completed;
@property(nonatomic) ChallengeCheck* challengeCheck;

@end
