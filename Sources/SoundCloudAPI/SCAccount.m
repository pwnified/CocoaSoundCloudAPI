/*
 * Copyright 2010, 2011 nxtbgthng for SoundCloud Ltd.
 * 
 * Licensed under the Apache License, Version 2.0 (the "License"); you may not
 * use this file except in compliance with the License. You may obtain a copy of
 * the License at
 * 
 * http://www.apache.org/licenses/LICENSE-2.0
 * 
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
 * WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the
 * License for the specific language governing permissions and limitations under
 * the License.
 *
 * For more information and documentation refer to
 * http://soundcloud.com/api
 * 
 */

#import "NXOAuth2.h"
#import "SCAccount.h"

#pragma mark Notifications

NSString * const SCAccountDidFailToGetAccessToken = @"SCAccountDidFailToGetAccessToken";

@implementation SCAccount

- (id)initWithOAuthAccount:(NXOAuth2Account *)anAccount {
    self = [super init];
    if (self) {
        _oauthAccount = anAccount;
    }
    return self;
}

- (NSString *)identifier {
    return _oauthAccount.identifier;
}

- (NSDictionary *)userInfo {
    return (NSDictionary *)_oauthAccount.userData;
}

- (void)setUserInfo:(NSDictionary *)userInfo {
    _oauthAccount.userData = userInfo;
}

@end
