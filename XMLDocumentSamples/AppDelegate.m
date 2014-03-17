#import "AppDelegate.h"
#import "SMXMLDocument.h"

@implementation AppDelegate

- (void) applicationDidFinishLaunching:(UIApplication *)application {
	
	// find "sample.xml" in our bundle resources
	NSString *sampleXML = [[NSBundle mainBundle] pathForResource:@"sample" ofType:@"xml"];
	NSData *data = [NSData dataWithContentsOfFile:sampleXML];
	
	// create a new SMXMLDocument with the contents of sample.xml
    NSError *error;
	SMXMLDocument *document = [SMXMLDocument documentWithData:data error:&error];
    
    // check for errors
    if (error) {
        NSLog(@"Error while parsing the document: %@", error);
        return;
    }
    
	// demonstrate -description of document/element classes
	NSLog(@"Document:\n %@", document);
	
	// Pull out the <books> node
	SMXMLElement *books = [document childNamed:@"books"];
	
	// Look through <books> children of type <book>
	for (SMXMLElement *book in [books childrenNamed:@"book"]) {
		
		// demonstrate common cases of extracting XML data
		NSString *isbn = [book attributeNamed:@"isbn"]; // XML attribute
		NSString *title = [book valueWithPath:@"title"]; // child node value
		float price = [book valueWithPath:@"price.usd"].floatValue; // child node value (two levels deep)
		
		// show off some KVC magic
		NSArray *authors = [[book childNamed:@"authors"].children valueForKey:@"value"];
		
		NSLog(@"Found a book!\n ISBN: %@ \n Title: %@ \n Price: %f \n Authors: %@", isbn, title, price, authors);
	}
}

@end
