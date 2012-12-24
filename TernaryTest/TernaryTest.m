//
//  TernaryTest.m
//  TernaryTest
//
//  Created by Gaku Ueda on 12/23/12.
//
//

#import "TernaryTest.h"
#import "GKTernarySearchTree.h"

@implementation StringItem
- (StringItem*)initWithString:(NSString*)str
{
    self = [super init];
    if (self) {
        self.str = str;
    }
    return self;
}

- (NSString*)stringValue
{
    return self.str;
}

- (NSString*)description
{
    return self.str;
}
@end

@implementation TernaryTest

- (void)setUp
{
    [super setUp];

    // Set-up code here.
}

- (void)tearDown
{
    // Tear-down code here.
    
    [super tearDown];
}

- (void)testInsert
{
    GKTernarySearchTree* tree = [[GKTernarySearchTree alloc] init];
    [tree insert:[[StringItem alloc] initWithString:@"hello"]];
    
    STAssertEquals(YES, [tree search:@"hello"], @"an inserted item should be found");
    STAssertEquals(YES, [tree search:@"hell"], @"substrings should be found");
    STAssertEquals(NO, [tree search:@"helo"], @"this doesn't exist in the tree");
}

- (void)testInsertTwo
{
    GKTernarySearchTree* tree = [[GKTernarySearchTree alloc] init];

    [tree insert:[[StringItem alloc] initWithString:@"ab"]];
    [tree insert:[[StringItem alloc] initWithString:@"aa"]];
    [tree insert:[[StringItem alloc] initWithString:@"ac"]];

    STAssertEquals(YES, [tree search:@"aa"], @"aa should be found");
    STAssertEquals(YES, [tree search:@"ab"], @"ab should be found");
    STAssertEquals(YES, [tree search:@"ac"], @"ac should be found");
}

- (void)testUTF8
{
    GKTernarySearchTree* tree = [[GKTernarySearchTree alloc] init];

    [tree insert:[[StringItem alloc] initWithString:@"あか"]];
    [tree insert:[[StringItem alloc] initWithString:@"あお"]];
    
    STAssertEquals(YES, [tree search:@"あか"], @"あか should be found");
    STAssertEquals(YES, [tree search:@"あお"], @"あお should be found");
    STAssertEquals(NO, [tree search:@"あき"], @"あき should not be found");
}

- (void)testRetrieval
{
    GKTernarySearchTree* tree = [[GKTernarySearchTree alloc] init];
    
    StringItem* i111 = [[StringItem alloc] initWithString:@"111"];
    StringItem* i123 = [[StringItem alloc] initWithString:@"123"];
    StringItem* i124 = [[StringItem alloc] initWithString:@"124"];
    StringItem* i130_1 = [[StringItem alloc] initWithString:@"130"];
    StringItem* i130_2 = [[StringItem alloc] initWithString:@"130"];  // Same string representation but different object

    [tree insert:i124];
    [tree insert:i111];
    [tree insert:i123];
    [tree insert:i130_1];
    [tree insert:i130_2];
    
    NSArray* output = [tree retrieve:@"123"];
    NSLog(@"length:%d, %@", [output count], output);
    STAssertEquals(1, (int)[output count], @"expects ['123']");
    STAssertEquals(YES, [output containsObject:i123], @"123");
    
    output = [tree retrieve:@"12"];
    NSLog(@"length:%d, %@", [output count], output);
    STAssertEquals(2, (int)[output count], @"expects ['123', '124']");
    STAssertEquals(YES, [output containsObject:i123], @"123");
    STAssertEquals(YES, [output containsObject:i124], @"124");

    output = [tree retrieve:@"11"];
    NSLog(@"length:%d, %@", [output count], output);
    STAssertEquals(1, (int)[output count], @"expects ['111']");
    STAssertEquals(YES, [output containsObject:i111], @"111");

    output = [tree retrieve:@"130"];
    NSLog(@"length:%d, %@", [output count], output);
    STAssertEquals(2, (int)[output count], @"expects ['130','130']");
    STAssertEquals(YES, [output containsObject:i130_1], @"130_1");
    STAssertEquals(YES, [output containsObject:i130_2], @"130_2");
}
@end
