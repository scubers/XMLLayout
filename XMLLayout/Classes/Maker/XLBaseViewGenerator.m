//
//  XLBaseViewGenerator.m
//  XMLLayout
//
//  Created by 王俊仁 on 2018/8/26.
//

#import "XLBaseViewGenerator.h"

@implementation XLUIViewGenerator
- (UIView *)xl_generateViewWithElement:(NSString *)element context:(XLLayoutContext *)context {
    Class viewClass = NSClassFromString(element);
    if (viewClass) {
        return [[viewClass alloc] initWithFrame:CGRectZero];
    }
    return nil;
}
@end

@implementation XLUIButtonGenerator
- (UIView *)xl_generateViewWithElement:(NSString *)element context:(XLLayoutContext *)context {
    return [UIButton buttonWithType:UIButtonTypeCustom];
}
@end


