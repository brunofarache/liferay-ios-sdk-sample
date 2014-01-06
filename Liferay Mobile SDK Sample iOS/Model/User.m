#import "User.h"

@implementation User

- (id)init:(NSDictionary *)jsonObj {
	self = [super init];

	if (self) {
		NSNumber *userId = [jsonObj objectForKey:@"userId"];
		self.userId = [userId longValue];

		NSNumber *contactId = [jsonObj objectForKey:@"contactId"];
		self.contactId = [contactId longValue];

		self.name = [jsonObj objectForKey:@"firstName"];
		self.lastName = [jsonObj objectForKey:@"lastName"];
	}

	return self;
}

@end