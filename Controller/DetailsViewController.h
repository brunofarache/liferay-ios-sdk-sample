#import "User.h"

@interface DetailsViewController : UITableViewController

@property (nonatomic, retain) User *user;

- (id)init:(User *)user;

@end