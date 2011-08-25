#import "AppDelegate.h"
#import "SMXMLDocument.h"

@implementation AppDelegate

- (void) applicationDidFinishLaunching:(UIApplication *)application {
	
	// find "sample.xml" in our bundle resources
	NSString *sampleXML = [[NSBundle mainBundle] pathForResource:@"sample" ofType:@"xml"];
	NSData *data = [NSData dataWithContentsOfFile:sampleXML];
	
	// unarchive SMXMLDocument or create a new SMXMLDocument with the contents of sample.xml
	NSString *archivePath = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0] stringByAppendingPathComponent:@"archive.plist"];
	SMXMLDocument *document = [NSKeyedUnarchiver unarchiveObjectWithFile:archivePath];
	if (!document)
		document = [SMXMLDocument documentWithData:data error:NULL];
	
	[NSKeyedArchiver archiveRootObject:document toFile:archivePath];
	
	// demonstrate -description of document/element classes
	NSLog(@"Document:\n %@", document);
	
	// Pull out the <books> node
	SMXMLElement *books = [document.root childNamed:@"books"];
	
	// Look through <books> children of type <book>
	for (SMXMLElement *book in [books childrenNamed:@"book"]) {
		
		// demonstrate common cases of extracting XML data
		NSString *isbn = [book attributeNamed:@"isbn"]; // XML attribute
		NSString *title = [book valueWithPath:@"title"]; // child node value
		float price = [[book valueWithPath:@"price"] floatValue]; // child node value (converted)
		
		// show off some KVC magic
		NSArray *authors = [[book childNamed:@"authors"].children valueForKey:@"value"];
		
		NSLog(@"Found a book!\n ISBN: %@ \n Title: %@ \n Price: %f \n Authors: %@", isbn, title, price, authors);
	}
}

@end
