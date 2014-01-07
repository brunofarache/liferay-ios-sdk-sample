#import "AppDelegate.h"

int main(int argc, char *argv[]) {

	@autoreleasepool {
		NSString *clazz = NSStringFromClass([AppDelegate class]);

		return UIApplicationMain(argc, argv, nil, clazz);
	}

}