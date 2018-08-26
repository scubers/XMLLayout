//
//  XLXMLParser.m
//  XMLLayout
//
//  Created by 王俊仁 on 2018/8/26.
//

#import "XLXMLParser.h"

@interface XLXMLParser () <NSXMLParserDelegate>

@property (nonatomic, strong) XLNode *root;
@property (nonatomic, strong) XLNode *current;

@property (nonatomic, copy) NSString *filePath;
@property (nonatomic, copy) NSString *xmlContent;

@end

@implementation XLXMLParser

- (XLXMLParser *)initWithFile:(NSString *)filePath {
    if (self = [super init]) {
        _filePath = filePath;
    }
    return self;
}

- (XLXMLParser *)initWithXMLContent:(NSString *)xmlContent {
    if (self = [super init]) {
        _xmlContent = xmlContent;
    }
    return self;
}

- (XLNode *)parse {
    NSXMLParser *parser = nil;
    if (_filePath.length) {
        parser = [[NSXMLParser alloc] initWithContentsOfURL:[NSURL fileURLWithPath:_filePath]];
    } else if (_xmlContent.length) {
        parser = [[NSXMLParser alloc] initWithData:[_xmlContent dataUsingEncoding:NSUTF8StringEncoding]];
    }
    parser.delegate = self;
    if (![parser parse]) {
        NSAssert(NO, @"%@, xml file parse error!!!");
    }
    return _root;
}

#pragma mark - NSXMLParserDelegate

- (void)parserDidStartDocument:(NSXMLParser *)parser {

}

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary<NSString *,NSString *> *)attributeDict {
    if (!_root) {
        _root = [XLNode nodeWithElementName:elementName attributes:attributeDict];
        _current = _root;
    } else {
        XLNode *node = [XLNode nodeWithElementName:elementName attributes:attributeDict];
        // 配置父子关系
        [_current.children addObject:node];
        node.parent = _current;

        _current = node;
    }
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {
    NSString *new = [string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    if (new.length) {
        XLNode *node = [XLNode stringNodeWithString:new];
        [_current.children addObject:node];
        node.parent = _current;
    }
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName {
    _current = _current.parent;
}

@end


#pragma mark - XLNode

@implementation XLNode

- (NSMutableArray<XLNode *> *)children {
    if (!_children) {
        _children = [NSMutableArray array];
    }
    return _children;
}

- (NSMutableDictionary<NSString *,NSString *> *)attributes {
    if (!_attributes) {
        _attributes = [[NSMutableDictionary<NSString *,NSString *> alloc] init];
    }
    return _attributes;
}

+ (XLNode *)nodeWithElementName:(NSString *)elementName attributes:(NSDictionary *)attributes type:(XLNodeType)type {
    XLNode *node = [XLNode new];
    node.type = type;
    node.elementName = elementName;
    node.attributes = attributes.mutableCopy;
    return node;
}
+ (XLNode *)nodeWithElementName:(NSString *)elementName attributes:(NSDictionary *)attributes {
    return [self nodeWithElementName:elementName attributes:attributes type:XLNodeTypeElement];
}

+ (XLNode *)stringNodeWithString:(NSString *)string {
    return [self nodeWithElementName:string attributes:nil type:XLNodeTypeString];
}

@end
