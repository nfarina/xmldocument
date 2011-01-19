
// Thanks Apple, for not just exposing NSXMLDocument!

#ifdef __IPHONE_4_0
@interface SMXMLElement : NSObject<NSXMLParserDelegate> {
#else
@interface SMXMLElement : NSObject {
#endif

@private
	SMXMLElement *parent; // nonretained
	NSString *name;
	NSMutableString *value;
	NSMutableArray *children;
	NSDictionary *attributes;
}

@property (nonatomic, assign) SMXMLElement *parent;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, retain) NSString *value;
@property (nonatomic, retain) NSArray *children;
@property (nonatomic, readonly) SMXMLElement *firstChild, *lastChild;
@property (nonatomic, retain) NSDictionary *attributes;

- (SMXMLElement *)childNamed:(NSString *)name;
- (NSArray *)childrenNamed:(NSString *)name;
- (SMXMLElement *)childWithAttribute:(NSString *)attributeName value:(NSString *)attributeValue;
- (NSString *)attributeNamed:(NSString *)name;
- (SMXMLElement *)descendantWithPath:(NSString *)path;
- (NSString *)valueWithPath:(NSString *)path;

@end

#ifdef __IPHONE_4_0
@interface SMXMLDocument : NSObject<NSXMLParserDelegate> {
#else
@interface SMXMLDocument : NSObject {
#endif
	
@private
	SMXMLElement *root;
}

@property (nonatomic, retain) SMXMLElement *root;

- (id)initWithData:(NSData *)data;

+ (SMXMLDocument *)documentWithData:(NSData *)data;

@end
