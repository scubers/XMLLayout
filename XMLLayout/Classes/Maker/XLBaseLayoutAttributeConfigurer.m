//
//  XLBaseLayoutAttributeConfigurer.m
//  XMLLayout
//
//  Created by 王俊仁 on 2018/8/26.
//

#import "XLBaseLayoutAttributeConfigurer.h"

@implementation XLBaseLayoutAttributeConfigurer

- (void)xl_configView:(UIView *)view attribute:(NSString *)attribute value:(id)value context:(XLLayoutContext *)context {
    if ([attribute isEqualToString:@"hidden"]) {
        view.hidden = [value boolValue];
    }
    else if ([attribute isEqualToString:@"alpha"]) {
        view.alpha = [value floatValue];
    }
    else if ([attribute isEqualToString:@"tag"]) {
        view.tag = [value integerValue];
    }
//    @"selected" : ^void(UIView *view, id obj) {
//        [((UIButton *)view) setSelected:[obj boolValue]];
//    },
}

@end


@implementation XLIdentifierLayoutAttributeConfigurer
- (void)xl_configView:(UIView *)view attribute:(NSString *)attribute value:(id)value context:(XLLayoutContext *)context {
    if (![attribute isEqualToString:@"id"]) {
        return;
    }
    @try {
        [context.fileHolder setValue:view forKey:value];
    } @catch (NSException *exception) {
        NSLog(@"%@", exception);
    } @finally {

    }
}
@end


@implementation XLTextLayoutAttributeConfigurer
- (void)xl_configView:(UIView *)view attribute:(NSString *)attribute value:(id)value context:(XLLayoutContext *)context {
    if ([attribute isEqualToString:@"text"]) {
        if ([((id)view) respondsToSelector:@selector(setText:)]) {
            [((id)view) setText:value];
        }
    }
    else if ([attribute isEqualToString:@"placeholder"]) {
        if ([((id)view) respondsToSelector:@selector(setPlaceholder:)]) {
            [((id)view) setPlaceholder:value];
        }
    }
}
@end

@implementation XLSelectedLayoutAttributeConfigurer
- (void)xl_configView:(UIView *)view attribute:(NSString *)attribute value:(id)value context:(XLLayoutContext *)context {
    if ([attribute isEqualToString:@"selected"]) {
        if ([((id)view) respondsToSelector:@selector(setSelected:)]) {
            [((id)view) setSelected:[value boolValue]];
        }
    }

}
@end
