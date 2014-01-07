#import "DetailsViewController.h"
#import "LRCallback.h"

@interface ContactCallback : NSObject <LRCallback>

@property (nonatomic, retain) UINavigationController *navigationController;
@property (nonatomic, retain) User *user;

- (id)init:(User *)user
	navigationController:(UINavigationController *)navigationController;

@end