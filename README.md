GKTernarySearchTree
===================

An implementation of Ternary Search Tree.  I am going to use it in iOS.

- It should work with UTF-8 strings.
- It can store multiple instances with a same string representation.

You can store any objects as long as it conforms with GKTernaryTreeItem protocol.  It just requires to have stringValue method.

# insert

~~~
GKTernarySearchTree* tree = [[GKTernarySearchTree alloc] init];
[tree insert:yourItem];
~~~

# retrieval

~~~
NSArray* items = [tree retrieve:@"prefix string"];
~~~
