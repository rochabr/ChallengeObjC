//
//  User.h
//  Challenge
//
//  Created by Fernando Rocha Silva on 7/25/17.
//  Copyright © 2017 ropetech. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject

@property(nonatomic) NSString *email;
@property(nonatomic) NSString *name;
@property(nonatomic) NSString *uid;
@property(nonatomic) NSString *pictureURL;
@property(nonatomic) NSString *lastLoginTimestamp;

@end
