#import "ContactCallback.h"

@implementation ContactCallback

- (id)init:(User *)user
		navigationController:(UINavigationController *)navigationController {

	self = [super init];

	if (self) {
		self.user = user;
		self.navigationController = navigationController;
	}

	return self;
}

- (void)onFailure:(NSError *)error {
	NSLog(@"Error: %@", error);
}

- (void)onSuccess:(id)result {
	NSArray *jsonArray = (NSArray *)result;

	Contact *contact = [[Contact alloc] init:jsonArray];

	[self.user setContact:contact];

	DetailsViewController *detailsController = [[DetailsViewController alloc]
		init:self.user];

	[self.navigationController pushViewController:detailsController
		animated:YES];
}

@end