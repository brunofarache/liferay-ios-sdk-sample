#import "DetailsViewController.h"

@implementation DetailsViewController

- (id)init:(User *)user {
	self = [super initWithStyle:UITableViewStyleGrouped];

	if (self) {
		self.user = user;
	}

	return self;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	return 4;
}

- (NSInteger)tableView:(UITableView *)tableView
 		numberOfRowsInSection:(NSInteger)section {

	if (section == 3) {
		NSArray *phones = self.user.contact.phones;

		if ([phones count] == 0) {
			return 1;
		}

		return [phones count];
	}

	return 1;
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

	NSString *text = @"";

	if (indexPath.section == 0) {
		text = [NSString stringWithFormat:@"%@ %@", self.user.name,
			self.user.lastName];
	}
	else if (indexPath.section == 1) {
		text = self.user.contact.emailAddress;
	}
	else if (indexPath.section == 2) {
		text = self.user.contact.birthday;
	}
	else {
		NSArray *phones = self.user.contact.phones;

		if ([phones count] > 0) {
			text = [phones objectAtIndex:indexPath.row];
		}
	}

	[cell.textLabel setText:text];

	return cell;
}

- (NSString *)tableView:(UITableView *)tableView
		titleForHeaderInSection:(NSInteger)section {

	if (section == 0) {
		return @"Name";
	}
	else if (section == 1) {
		return @"Email";
	}
	else if (section == 2) {
		return @"Birthday";
	}
	else {
		return @"Phones";
	}
}

@end