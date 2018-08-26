//
//  XLBaseLayoutMaker.m
//  XMLLayout
//
//  Created by 王俊仁 on 2018/8/26.
//

#import "XLBaseLayoutMaker.h"
#import "XLBaseLayoutAttributeConfigurer.h"
#import "XLBaseViewGenerator.h"

#pragma mark - XLBaseLayoutMaker

@interface XLBaseLayoutMaker ()

@property (nonatomic, strong) NSMutableDictionary<NSString *, id<XLLayoutAttributeConfigurer>> *baseLayoutBlocks;

@property (nonatomic, strong) NSDictionary<NSString *, id<XLLayoutViewGenerator>> *baseViewGenerators;

@end

@implementation XLBaseLayoutMaker


- (XLLayoutContext *)viewWithNode:(XLNode *)node fileHolder:(id)fileHolder {

    XLLayoutContext *context = [XLLayoutContext contextWithFileHolder:fileHolder];
    
    [node.children enumerateObjectsUsingBlock:^(XLNode * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([obj.elementName isEqualToString:@"String"]) {
            // store a string value
            context.globalAttributes[obj.attributes[@"name"]] = obj.attributes[@"value"];
        }
        else if ([obj.elementName isEqualToString:@"Int"]) {
            // store a Int value
            context.globalAttributes[obj.attributes[@"name"]] =
            [NSNumber numberWithInt:obj.attributes[@"value"].intValue];
        }
        else if ([obj.elementName isEqualToString:@"Double"]) {
            // store a Int value
            context.globalAttributes[obj.attributes[@"name"]] =
            [NSNumber numberWithInt:obj.attributes[@"value"].doubleValue];
        }
        else if ([obj.elementName isEqualToString:@"Bool"]) {
            // store a Int value
            context.globalAttributes[obj.attributes[@"name"]] =
            [NSNumber numberWithInt:[obj.attributes[@"value"] isEqualToString:@"true"]];
        }
        else {
            // Root
            context.finalView = [self generateViewWithNode:obj context:context];
            *stop = YES;
        }
    }];

    return context;
}


- (UIView *)generateViewWithNode:(XLNode *)node context:(XLLayoutContext *)context {
    if (node.type == XLNodeTypeString) {
        return nil;
    }

    id<XLLayoutViewGenerator> generator = [self generatorWithElement:node.elementName];
    if (!generator) {
        generator = [XLUIViewGenerator new];
    }
    UIView *view = [generator xl_generateViewWithElement:node.elementName context:context];
    if (!view) {
        NSLog(@"[warning]--Cannot handle element %@;", node.elementName);
        return nil;
    }

    [node.attributes enumerateKeysAndObjectsUsingBlock:^(NSString * _Nonnull key, NSString * _Nonnull obj, BOOL * _Nonnull stop) {
        [[self configurerWithAttribute:key] xl_configView:view attribute:key value:obj context:context];
    }];

    [node.children enumerateObjectsUsingBlock:^(XLNode * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        UIView *subview = [self generateViewWithNode:obj context:context];
        [view addSubview:subview];
    }];

    return view;
}

#pragma mark - public method


- (id<XLLayoutAttributeConfigurer>)configurerWithAttribute:(NSString *)attribute {
    return self.baseLayoutBlocks[attribute];
}

- (id<XLLayoutViewGenerator>)generatorWithElement:(NSString *)element {
    return self.baseViewGenerators[element];
}

#pragma mark - getter setter

- (NSMutableDictionary *)baseLayoutBlocks {
    if (!_baseLayoutBlocks) {
        XLBaseLayoutAttributeConfigurer *baseConfig = [XLBaseLayoutAttributeConfigurer new];
        XLTextLayoutAttributeConfigurer *textConfig = [XLTextLayoutAttributeConfigurer new];
        _baseLayoutBlocks = @{
                              @"hidden" : baseConfig,
                              @"alpha" : baseConfig,
                              @"tag" : baseConfig,
                              @"text" : textConfig,
                              @"placeholder" : textConfig,
                              @"id" : [XLIdentifierLayoutAttributeConfigurer new],
                              @"selected" : [XLSelectedLayoutAttributeConfigurer new],
                              }.mutableCopy;
    }
    return _baseLayoutBlocks;
}

- (NSDictionary<NSString *,id<XLLayoutViewGenerator>> *)baseViewGenerators {
    if (!_baseViewGenerators) {
        _baseViewGenerators = @{
                                @"UIButton" : [XLUIButtonGenerator new],
                                };
    }
    return _baseViewGenerators;
}
@end


#pragma mark - XLLayoutContext

@interface XLLayoutContext ()

@end

@implementation XLLayoutContext
- (NSMutableDictionary<NSString *,id> *)globalAttributes {
    if (!_globalAttributes) {
        _globalAttributes = [[NSMutableDictionary<NSString *,id> alloc] init];
    }
    return _globalAttributes;
}

- (NSMutableDictionary<NSString *,UIView *> *)identifyViews {
    if (!_identifyViews) {
        _identifyViews = [[NSMutableDictionary<NSString *,UIView *> alloc] init];
    }
    return _identifyViews;
}

+ (instancetype)contextWithFileHolder:(id)fileHolder {
    XLLayoutContext *context = [XLLayoutContext new];
    context.fileHolder = fileHolder;
    return context;
}

@end





