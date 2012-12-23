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

- (void) insert:(NSString*)str
{
    unichar c = [str characterAtIndex:0];
    if (0 == self->splitchar) {
        self->splitchar = c;
    }
    if (c < self->splitchar) {
        if (!self->lokid) {
            self->lokid = [[GKTernaryNode alloc] init];
        }
        [self->lokid insert:str];
    } else if (c == self->splitchar) {
        if ([str length] > 1) {
            if (!self->eqkid) {
                self->eqkid = [[GKTernaryNode alloc] init];
            }
            [self->eqkid insert:[str substringFromIndex:1]];
        }
    } else {
        if (!self->hikid) {
            self->hikid = [[GKTernaryNode alloc] init];
        }
        [self->hikid insert:str];
    }
}

- (BOOL) search:(NSString*)str
{
    unichar c = [str characterAtIndex:0];
    if (c < self->splitchar) {
        if (!self->lokid) {
            return NO;
        }
        return [self->lokid search:str];
    } else if (c == self->splitchar) {
        if (1 == [str length]) {
            return YES;
        }
        return [self->eqkid search:[str substringFromIndex:1]];
    } else {
        if (!self->hikid) {
            return NO;
        }
        return [self->hikid search:str];
    }
}

@end
