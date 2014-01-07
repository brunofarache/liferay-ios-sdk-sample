#import "AppDelegate.h"
#import "MainViewController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application
		didFinishLaunchingWithOptions:(NSDictionary *)options {

	CGRect frame = [[UIScreen mainScreen] bounds];

	self.window = [[UIWindow alloc] initWithFrame:frame];

	MainViewController *mainController = [[MainViewController alloc] init];

	UINavigationController *navigationController =
		[[UINavigationController alloc]
			initWithRootViewController:mainController];

	[self.window setRootViewController:navigationController];
	[self.window setBackgroundColor:[UIColor whiteColor]];
	[self.window makeKeyAndVisible];

	return YES;
}

@end