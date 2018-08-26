//
//  XLXMLParser.h
//  XMLLayout
//
//  Created by 王俊仁 on 2018/8/26.
//

#import <Foundation/Foundation.h>

@class XLNode;

@interface XLXMLParser : NSObject

- (XLXMLParser *)initWithFile:(NSString *)filePath;
- (XLXMLParser *)initWithXMLContent:(NSString *)xmlContent;

- (XLNode *)parse;

@end


#pragma mark - XLNode

typedef NS_ENUM(NSInteger, XLNodeType) {
    XLNodeTypeElement,
    XLNodeTypeString,
};

@interface XLNode : NSObject

@property (nonatomic, assign) XLNodeType type;

@property (nonatomic, copy) NSString *elementName;

@property (nonatomic, strong) NSMutableDictionary<NSString *, NSString *> *attributes;

@property (nonatomic, strong) NSMutableArray<XLNode *> *children;

@property (nonatomic, weak) XLNode *parent;


/**
 返回一个元素模型
 */
+ (XLNode *)nodeWithElementName:(NSString *)elementName attributes:(NSDictionary *)attributes;


/**
 返回一个字符串模型
 */
+ (XLNode *)stringNodeWithString:(NSString *)string;

@end




