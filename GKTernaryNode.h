//
//  GKTernaryNode.h
//  GKTernarySearchTree
//
//  Created by Gaku Ueda on 12/23/12.
//
// Based on C-version implementation at
// http://www.drdobbs.com/database/ternary-search-trees/184410528

#import <Foundation/Foundation.h>

@interface GKTernaryNode : NSObject
{
    GKTernaryNode* lokid;
    GKTernaryNode* eqkid;
    GKTernaryNode* hikid;
    unichar splitchar;
}
- (void) insert:(NSString*)str;
- (BOOL) search:(NSString*)str;

@end
