
### Overview

SMXMLDocument is a very handy lightweight XML parser for iOS.

More info in the blog post:
http://nfarina.com/post/2843708636/a-lightweight-xml-parser-for-ios

### ARC Support

If you are including SMXMLDocument in a project that has [Automatic Reference Counting (ARC)](http://clang.llvm.org/docs/AutomaticReferenceCounting.html) enabled, you will need to set the `-fno-objc-arc` compiler flag for our source. To do this in Xcode, go to your active target and select the "Build Phases" tab. In the "Compiler Flags" column, set `-fno-objc-arc` for `SMXMLDocument.m`.
