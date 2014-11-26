#import "SettingsUtil.h"

@implementation SettingsUtil

static NSUserDefaults *_preferences;

+ (void)initialize {
	if (!_preferences) {
		_preferences = [NSUserDefaults standardUserDefaults];
	}
}

+ (NSString *)getLogin {
	NSString *value = [_preferences stringForKey:@"login"];

	if (!value) {
		value = @"test@liferay.com";
	}

	return value;
}

+ (NSString *)getPassword {
	NSString *value = [_preferences stringForKey:@"password"];

	if (!value) {
		value = @"test";
	}

	return value;
}

+ (NSString *)getServer {
	NSString *value = [_preferences stringForKey:@"server"];

	if (!value) {
		value = @"http://localhost:8080";
	}

	return value;
}

+ (LRSession *)getSession {
	return [[LRSession alloc] initWithServer:[self getServer]
		username:[self getLogin] password:[self getPassword]];
}

@end