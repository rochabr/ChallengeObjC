//
//  FDatabase.m
//  Challenge
//
//  Created by Fernando Rocha Silva on 7/25/17.
//  Copyright © 2017 ropetech. All rights reserved.
//

#import "FDatabase.h"

@implementation FDatabase

+ (id)instance {
    static FDatabase *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
    });
    return instance;
}

- (id)init {
    if (self = [super init]) {
        self.reference = [[FIRDatabase database] reference];
    }
    return self;
}

- (bool)addOrUpdateUser:(User*)user{
    user.uid = [[FIRAuth auth] currentUser].uid;
    
    [[[self.reference child:@"user"] child:user.uid] setValue:@{@"name": user.name, @"email": user.email, @"pictureURL": user.pictureURL, @"lastLoginTimestamp": [[NSDate date] description]}];
    
    return true;
}

//- (bool)updateUserLastLocationWithLatitude:(NSNumber*)latitude AndLongitude:(NSNumber*)longitude{
//    NSString* userUID = [[FIRAuth auth] currentUser].uid;
//    [[[[self.reference child:@"user"] child:userUID] child:@"latitude"] setValue:latitude];
//    [[[[self.reference child:@"user"] child:userUID] child:@"longitude"] setValue:longitude];
//
//    return true;
//}

//- (bool)postMemory{
//    Memory *memory = [[MemoryManager instance] currentMemory];
//
//    NSString* key = [[self.reference child:@"memories"] childByAutoId].key;
//    [[[self.reference child:@"memories"] child:key] setValue:@{@"latitude": memory.latitude, @"longitude": memory.longitude, @"message": memory.message, @"scope":[NSNumber numberWithInteger:memory.scope]} withCompletionBlock:^(NSError * _Nullable error, FIRDatabaseReference * _Nonnull ref) {
//        if (!error){
//            NSDictionary* userInfo = @{@"result":@"YES"};
//
//            NSNotificationCenter* nc = [NSNotificationCenter defaultCenter];
//            [nc postNotificationName:@"MemoryPosted" object:self userInfo:userInfo];
//        }else{
//            NSDictionary* userInfo = @{@"result":@"NO"};
//
//            NSNotificationCenter* nc = [NSNotificationCenter defaultCenter];
//            [nc postNotificationName:@"MemoryPosted" object:self userInfo:userInfo];
//        }
//    }];
//
//    return true;
//}

@end

