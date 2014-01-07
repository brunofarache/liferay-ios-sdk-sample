#import "ContactCallback.h"

@implementation ContactCallback

- (void)onFailure:(NSError *)error {
	NSLog(@"Error: %@", error);
}

- (void)onSuccess:(id)result {
	NSArray *jsonArray = (NSArray *)result;

	Contact *contact = [[Contact alloc] init:jsonArray];

	NSLog(@"Contact: %@", contact);
}

@end