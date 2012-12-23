//
//  TernaryTest.m
//  TernaryTest
//
//  Created by Gaku Ueda on 12/23/12.
//
//

#import "TernaryTest.h"
#import "GKTernaryNode.h"

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
    GKTernaryNode* node = [[GKTernaryNode alloc] init];
    [node insert:@"hello"];
    
    STAssertEquals(YES, [node search:@"hello"], @"an inserted item should be found");
    STAssertEquals(YES, [node search:@"hell"], @"substrings should be found");
    STAssertEquals(NO, [node search:@"helo"], @"this doesn't exist in the tree");
}

- (void)testInsertTwo
{
    GKTernaryNode* node = [[GKTernaryNode alloc] init];
    [node insert:@"ab"];
    [node insert:@"aa"];
    [node insert:@"ac"];

    STAssertEquals(YES, [node search:@"aa"], @"aa should be found");
    STAssertEquals(YES, [node search:@"ab"], @"ab should be found");
    STAssertEquals(YES, [node search:@"ac"], @"ac should be found");
}

- (void)testUTF8
{
    GKTernaryNode* node = [[GKTernaryNode alloc] init];
    [node insert:@"あか"];
    [node insert:@"あお"];
    
    STAssertEquals(YES, [node search:@"あか"], @"あか should be found");
    STAssertEquals(YES, [node search:@"あお"], @"あお should be found");
    STAssertEquals(NO, [node search:@"あき"], @"あき should not be found");
}
@end
