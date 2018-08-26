//
//  XLBaseLayoutAttributeConfigurer.h
//  XMLLayout
//
//  Created by 王俊仁 on 2018/8/26.
//

#import <Foundation/Foundation.h>
#import "XLBaseLayoutMaker.h"

@interface XLBaseLayoutAttributeConfigurer : NSObject <XLLayoutAttributeConfigurer>
@end

@interface XLIdentifierLayoutAttributeConfigurer : NSObject <XLLayoutAttributeConfigurer>
@end

@interface XLTextLayoutAttributeConfigurer : NSObject <XLLayoutAttributeConfigurer>
@end

@interface XLSelectedLayoutAttributeConfigurer : NSObject <XLLayoutAttributeConfigurer>
@end

