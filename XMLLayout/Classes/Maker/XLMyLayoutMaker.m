//
//  XLMyLayoutMaker.m
//  XMLLayout
//
//  Created by 王俊仁 on 2018/8/26.
//

#import "XLMyLayoutMaker.h"
#import "XLXMLParser.h"
#import "XLMyLayoutAttributeConfigurer.h"

@interface XLMyLayoutMaker ()

@property (nonatomic, strong) XLMyLayoutAttributeConfigurer *configurer;

@end

@implementation XLMyLayoutMaker


- (id<XLLayoutAttributeConfigurer>)configurerWithAttribute:(NSString *)attribute {
    id<XLLayoutAttributeConfigurer> obj = [super configurerWithAttribute:attribute];
    if (!obj) {
        obj = self.configurer;
    }
    return obj;
}

- (XLMyLayoutAttributeConfigurer *)configurer {
    if (!_configurer) {
        _configurer = [[XLMyLayoutAttributeConfigurer alloc] init];
    }
    return _configurer;
}
@end
