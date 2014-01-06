#import "LRSession.h"

@interface SettingsUtil : NSObject

+ (NSString *)getLogin;
+ (NSString *)getPassword;
+ (NSString *)getServer;
+ (LRSession *)getSession;

@end