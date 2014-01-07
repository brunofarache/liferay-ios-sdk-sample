#import "Contact.h"

@implementation Contact

- (id)init:(NSArray *)jsonArray {
	self = [super init];

	if (self) {
		NSDictionary *contact = [jsonArray objectAtIndex:0];
		self.emailAddress = [contact objectForKey:@"emailAddress"];

		self.phones = [[NSMutableArray alloc] init];
		NSArray *phones = [jsonArray objectAtIndex:1];

		for (NSDictionary *phone in phones) {
			[self.phones addObject:[phone objectForKey:@"number"]];
		}

		NSNumber *timeInterval = [contact objectForKey:@"birthday"];

		if ([timeInterval longValue] > 0) {
			NSDate *birthday = [self _convertNumberToDate:timeInterval];

			NSDateFormatter *formatter = [[NSDateFormatter alloc] init];

			[formatter setDateStyle:NSDateFormatterShortStyle];
			[formatter setTimeStyle:NSDateFormatterShortStyle];

			self.birthday = [formatter stringFromDate:birthday];
		}
	}

	return self;
}

- (NSDate *)_convertNumberToDate:(NSNumber *)timeInterval {
	NSString *value = [timeInterval stringValue];

	value = [value substringToIndex:(value.length - 3)];

	return [NSDate dateWithTimeIntervalSince1970:[value longLongValue]];
}

@end