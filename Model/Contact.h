@interface Contact : NSObject

@property (nonatomic, retain) NSString *birthday;
@property (nonatomic, retain) NSString *emailAddress;
@property (nonatomic, retain) NSMutableArray *phones;

- (id)init:(NSArray *)jsonArray;

@end