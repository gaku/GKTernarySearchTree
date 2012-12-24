//
//  GKTernaryNode.m
//  GKTernarySearchTree
//
//  Created by Gaku Ueda on 12/23/12.
//
//

#import "GKTernaryNode.h"

@implementation GKTernaryNode

- (GKTernaryNode*) init
{
    self = [super init];
    return self;
}
@end

@implementation GKTernarySearchTree
- (GKTernarySearchTree*) init
{
    self = [super init];
    if (self) {
        self->root = nil;
    }
    return self;
}

- (void) insert:(id<GKTernaryTreeItem>)item
{
    NSString* str = [item stringValue];
    GKTernaryNode* __strong * prev = &(self->root);
    GKTernaryNode* node = self->root;
    GKTernaryNode* parent = nil;
    int idx = 0;
    
    while (idx < [str length]) {
        unichar c = [str characterAtIndex:idx];
        if (!node) {
            *prev = [[GKTernaryNode alloc] init];
            node = *prev;
            node->splitchar = c;
            // NSLog(@"created node:%@ for %C", node, c);
        }
        if (c < node->splitchar) {
            prev = &(node->lo);
            node = node->lo;
        } else if (c == node->splitchar) {
            parent = node;
            prev = &(node->eq);
            node = node->eq;
            idx++;
        } else {
            prev = &(node->hi);
            node = node->hi;
        }
    }
    // NSLog(@"register item to %@ for %C", parent, parent->splitchar);
    if (parent.item == nil) {
        // single item
        parent.item = item;
    } else {
        if ([parent.item isKindOfClass:[NSMutableArray class]]) {
            // 2+ items
            NSMutableArray* list = (NSMutableArray*)parent.item;
            [list addObject:item];
        } else {
            // 1 -> 2 items: replace it with a mutable array
            NSMutableArray* list = [[NSMutableArray alloc] init];
            [list addObject:parent.item];;
            [list addObject:item];
            parent.item = list;
        }
    }
}

-(GKTernaryNode*) searchNode:(NSString*)prefix
{
    int idx = 0;
    GKTernaryNode* node = self->root;
    GKTernaryNode* prev;
    
    while (idx < [prefix length]) {
        unichar c = [prefix characterAtIndex:idx];
        if (c < node->splitchar) {
            if (!node->lo) {
                return nil;
            }
            node = node->lo;
            continue;
        } else if (c == node->splitchar) {
            prev = node;
            node = node->eq;
            idx++;
            continue;
        } else {
            if (!node->hi) {
                return nil;
            }
            node = node->hi;
            continue;
        }
    }
    return prev;
}

- (BOOL) search:(NSString*)prefix
{
    if ([self searchNode:prefix]) {
        return YES;
    };
    return NO;
}

+ (void)addItems:(GKTernaryNode*)node toArray:(NSMutableArray*)output
{
    if (!node.item) {
        return;
    }
    if ([node.item isKindOfClass:[NSArray class]]) {
        [output addObjectsFromArray:node.item];
    } else {
        [output addObject:node.item];
    }
}

- (void) retrieveNodeFrom:(GKTernaryNode*)prefixedRoot toArray:(NSMutableArray*)output
{
    if (prefixedRoot == nil) {
        return;
    }
    [self retrieveNodeFrom:prefixedRoot->lo toArray:output];
    [GKTernarySearchTree addItems:prefixedRoot toArray:output];
    [self retrieveNodeFrom:prefixedRoot->eq toArray:output];
    [self retrieveNodeFrom:prefixedRoot->hi toArray:output];
}
     
- (NSArray*) retrieve:(NSString*)prefix
{
    GKTernaryNode* prefixedRoot = [self searchNode:prefix];
    NSMutableArray* output = [[NSMutableArray alloc] init];
    [GKTernarySearchTree addItems:prefixedRoot toArray:output];
    [self retrieveNodeFrom:prefixedRoot->eq toArray:output];
    return [[NSArray alloc] initWithArray:output];
}
@end
