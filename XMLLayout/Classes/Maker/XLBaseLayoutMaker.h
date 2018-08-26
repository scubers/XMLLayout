//
//  XLBaseLayoutMaker.h
//  XMLLayout
//
//  Created by 王俊仁 on 2018/8/26.
//

#import <Foundation/Foundation.h>
#import "XLXMLParser.h"

#pragma mark - XLLayoutContext

@interface XLLayoutContext<T> : NSObject

@property (nonatomic, strong) T fileHolder;

@property (nonatomic, strong) UIView *finalView;

@property (nonatomic, strong) NSMutableDictionary<NSString *, UIView *> *identifyViews;
@property (nonatomic, strong) NSMutableDictionary<NSString *, id> *globalAttributes;

+ (instancetype)contextWithFileHolder:(T)fileHolder;

@end

#pragma mark - XLBaseLayoutMaker

@protocol XLLayoutViewGenerator <NSObject>
- (UIView *)xl_generateViewWithElement:(NSString *)element
                               context:(XLLayoutContext *)context;
@end

@protocol XLLayoutAttributeConfigurer <NSObject>

- (void)xl_configView:(UIView *)view
            attribute:(NSString *)attribute
                value:(id)value
              context:(XLLayoutContext *)context;

@end


@interface XLBaseLayoutMaker : NSObject

- (id<XLLayoutAttributeConfigurer>)configurerWithAttribute:(NSString *)attribute;

- (id<XLLayoutViewGenerator>)generatorWithElement:(NSString *)element;

- (XLLayoutContext *)viewWithNode:(XLNode *)node fileHolder:(id)fileHolder;

@end


