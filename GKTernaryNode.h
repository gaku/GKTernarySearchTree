//
//  GKTernaryNode.h
//  GKTernarySearchTree
//
//  Created by Gaku Ueda on 12/23/12.
//
// Orignally referred the C implementation at
// http://www.drdobbs.com/database/ternary-search-trees/184410528

#import <Foundation/Foundation.h>

@protocol GKTernaryTreeItem <NSObject>
- (NSString*)stringValue;
@end


@interface GKTernaryNode : NSObject
{
@public
    GKTernaryNode* lo;
    GKTernaryNode* eq;
    GKTernaryNode* hi;
    unichar splitchar;
}
@property (retain) id item;

@end

@interface GKTernarySearchTree : NSObject
{
    GKTernaryNode* root;
}
- (void) insert:(id<GKTernaryTreeItem>)item;
- (BOOL) search:(NSString*)str;
- (NSArray*) retrieve:(NSString*)prefix;
@end
