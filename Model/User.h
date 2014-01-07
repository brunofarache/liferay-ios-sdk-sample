#import "Contact.h"

@interface User : NSObject

@property (nonatomic, retain) Contact *contact;
@property (nonatomic) long contactId;
@property (nonatomic, retain) NSString *lastName;
@property (nonatomic, retain) NSString *name;
@property (nonatomic) long userId;

- (id)init:(NSDictionary *)jsonObj;

@end