//
//  XLLayoutLoader.m
//  XMLLayout
//
//  Created by 王俊仁 on 2018/8/26.
//

#import "XLLayoutLoader.h"
#import "XLMyLayoutMaker.h"

@interface XLLayoutLoader ()

@end

@implementation XLLayoutLoader

static XLLayoutLoader *__defaultXLLayoutLoader;
+ (XLLayoutLoader *)defaultLoader {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        __defaultXLLayoutLoader = [XLLayoutLoader new];
    });
    return __defaultXLLayoutLoader;
}

- (XLLayoutContext *)loadXMLFile:(NSString *)filePath fileHolder:(id)fileHolder {
    // TODO: add cache
    XLXMLParser *parser = [[XLXMLParser alloc] initWithFile:filePath];
    XLNode *node = [parser parse];
    return [[XLMyLayoutMaker new] viewWithNode:node fileHolder:fileHolder];
}

@end
