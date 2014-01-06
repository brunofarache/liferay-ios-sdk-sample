#import "MainViewController.h"

@implementation MainViewController

- (id)init {
	self = [super init];

	if (self) {
		LRSession *session = [SettingsUtil getSession];
		LRUserService_v62 *service = [[LRUserService_v62 alloc] init:session];
		NSError *error;

		int groupId = [self _getGuestGroupId:session];

		NSArray *users = [service getGroupUsersWithGroupId:groupId
			error:&error];

		if (error) {
			NSLog(@"Error: %@", error);
		}

		for (int i = 0; i < [users count]; i++) {
			NSLog(@"User: %@", [users objectAtIndex:i]);
		}
	}

	return self;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	return 0;
}

- (NSInteger)tableView:(UITableView *)tableView
 		numberOfRowsInSection:(NSInteger)section {

	return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
		cellForRowAtIndexPath:(NSIndexPath *)indexPath {

	static NSString *identifier = @"Cell";

	UITableViewCell *cell = [tableView
		dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];

    return cell;
}

- (int)_getGuestGroupId:(LRSession *)session {
	NSNumber *groupId = [NSNumber numberWithInt:-1];
	LRGroupService_v62 *service = [[LRGroupService_v62 alloc] init:session];
	NSError *error;

	NSArray *groups = [service getUserSites:&error];

	if (error) {
		NSLog(@"Error: %@", error);

		return [groupId intValue];
	}

	for (int i = 0; i < [groups count]; i++) {
		NSDictionary *group = [groups objectAtIndex:i];

		NSString *name = [group objectForKey:@"name"];

		if (![name isEqualToString:@"Guest"]) {
			continue;
		}

		groupId = [group objectForKey:@"groupId"];
	}

	if ([groupId intValue] == -1) {
		NSLog(@"Couldn't find Guest group.");
	}

	return [groupId intValue];
}

@end