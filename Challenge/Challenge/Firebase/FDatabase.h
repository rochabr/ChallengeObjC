//
//  FDatabase.h
//  Challenge
//
//  Created by Fernando Rocha Silva on 7/25/17.
//  Copyright © 2017 ropetech. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"
@import Firebase;

@interface FDatabase : NSObject

@property (strong, nonatomic) FIRDatabaseReference *reference;

+ (id) instance;
- (bool) addOrUpdateUser:(User*)user;
//- (bool) updateUserLastLocationWithLatitude:(NSNumber*)latitude AndLongitude:(NSNumber*)longitude;

//- (bool)postMemory;

@end
