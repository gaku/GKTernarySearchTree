//
//  TernaryTest.h
//  TernaryTest
//
//  Created by Gaku Ueda on 12/23/12.
//
//

#import <SenTestingKit/SenTestingKit.h>
#import "GKTernaryNode.h"
@interface StringItem : NSObject<GKTernaryTreeItem>
@property(retain) NSString* str;
@end

@interface TernaryTest : SenTestCase

@end
