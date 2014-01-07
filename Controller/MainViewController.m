#import "MainViewController.h"

@implementation MainViewController

- (id)init {
	self = [super initWithStyle:UITableViewStylePlain];

	if (self) {
		self.users = [[NSMutableArray alloc] init];

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
			User *user = [[User alloc] init:[users objectAtIndex:i]];

			[self.users addObject:user];
		}
	}

	return self;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	return 1;
}

- (NSInteger)tableView:(UITableView *)tableView
 		numberOfRowsInSection:(NSInteger)section {

	return [self.users count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView
		cellForRowAtIndexPath:(NSIndexPath *)indexPath {

	static NSString *identifier = @"Cell";

	UITableViewCell *cell =
		[tableView dequeueReusableCellWithIdentifier:identifier];

	if (cell == nil) {
		cell = [[UITableViewCell alloc]
			initWithStyle:UITableViewCellStyleDefault
			reuseIdentifier:identifier];
    }

	User *user = [self.users objectAtIndex:indexPath.row];

	[cell.textLabel setText:user.name];

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