#import "SMXMLDocumentResponseSerializer.h"

@implementation SMXMLDocumentResponseSerializer

+ (instancetype)serializer {
    return [self new];
}

- (instancetype)init {
    if (self = [super init]) {
        self.acceptableContentTypes = [NSSet setWithObjects:@"application/xml", @"text/xml", nil];
    }
    return self;
}

#pragma mark - AFURLResponseSerialization

- (id)responseObjectForResponse:(NSURLResponse *)response
                           data:(NSData *)data
                          error:(NSError *__autoreleasing *)error {

    return [SMXMLDocument documentWithData:data error:error];
}

@end
