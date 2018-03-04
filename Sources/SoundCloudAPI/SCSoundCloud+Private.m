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

#if TARGET_OS_IPHONE
#import "NXOAuth2.h"
#else
#import "NXOAuth2.h"
#import <Cocoa/Cocoa.h>
#endif

#import "SCConstants.h"

#import "SCSoundCloud+Private.h"


@implementation SCSoundCloud (Private)

+ (id)shared;
{
    static SCSoundCloud *shared;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shared = [SCSoundCloud new];
    });
    return shared;
}

#pragma mark Configuration


+ (NSDictionary *)configuration;
{
    NSDictionary *configuration = [[NXOAuth2AccountStore sharedStore] configurationForAccountType:kSCAccountType];
    
    NSMutableDictionary *config = [NSMutableDictionary dictionary];
	
	config[kSCConfigurationClientID] = configuration[kNXOAuth2AccountStoreConfigurationClientID];
	config[kSCConfigurationSecret] = configuration[kNXOAuth2AccountStoreConfigurationSecret];
	config[kSCConfigurationRedirectURL] = configuration[kNXOAuth2AccountStoreConfigurationRedirectURL];
	config[kSCConfigurationAuthorizeURL] = configuration[kNXOAuth2AccountStoreConfigurationAuthorizeURL];
	config[kSCConfigurationCustomHeaders] = configuration[kNXOAuth2AccountStoreConfigurationCustomHeaderFields];
	
    if ([configuration[kNXOAuth2AccountStoreConfigurationTokenURL] isEqual:[NSURL URLWithString:kSCSoundCloudSandboxAccessTokenURL]]) {
		config[kSCConfigurationSandbox] = @YES;
    } else {
		config[kSCConfigurationSandbox] = @NO;
    }
    
	config[kSCConfigurationAPIURL] = configuration[kSCConfigurationAPIURL];
    
    return config;
}

#pragma mark Manage Accounts


- (void)requestAccessWithUsername:(NSString *)username password:(NSString *)password;
{
    [[NXOAuth2AccountStore sharedStore] requestAccessToAccountWithType:kSCAccountType username:username password:password];
}

@end
