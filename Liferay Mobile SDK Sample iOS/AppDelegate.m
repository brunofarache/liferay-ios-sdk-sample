#import "AppDelegate.h"
#import "MainViewController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application
		didFinishLaunchingWithOptions:(NSDictionary *)options {

	CGRect frame = [[UIScreen mainScreen] bounds];

	MainViewController *controller = [[MainViewController alloc] init];
	
	self.window = [[UIWindow alloc] initWithFrame:frame];

	[self.window setBackgroundColor:[UIColor whiteColor]];
	[self.window makeKeyAndVisible];

	return YES;
}

@end