//
//  XLLayoutLoader.h
//  XMLLayout
//
//  Created by 王俊仁 on 2018/8/26.
//

#import <Foundation/Foundation.h>
#import "XLBaseLayoutMaker.h"

@interface XLLayoutLoader : NSObject

+ (XLLayoutLoader *)defaultLoader;

- (XLLayoutContext *)loadXMLFile:(NSString *)filePath fileHolder:(id)fileHolder;

@end
