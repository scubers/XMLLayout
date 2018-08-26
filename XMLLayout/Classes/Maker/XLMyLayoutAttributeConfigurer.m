//
//  XLMyLayoutAttributeConfigurer.m
//  XMLLayout
//
//  Created by 王俊仁 on 2018/8/26.
//

#import "XLMyLayoutAttributeConfigurer.h"
#import <MyLayout/MyLayout.h>

@implementation XLMyLayoutAttributeConfigurer

- (void)xl_configView:(UIView *)view attribute:(NSString *)attribute value:(id)value context:(XLLayoutContext *)context {
    if ([attribute isEqualToString:@"weight"]) {
        view.weight = [value floatValue];
    }
    else if ([attribute isEqualToString:@"myHorzMarin"]) {
        view.myLeft = view.myRight = [value floatValue];
    }
    else if ([attribute isEqualToString:@"myVertMarin"]) {
        view.myTop = view.myBottom = [value floatValue];
    }
    else if ([attribute isEqualToString:@"myLeft"]) {
        view.myLeft = [value floatValue];
    }
    else if ([attribute isEqualToString:@"myRight"]) {
        view.myRight = [value floatValue];
    }
    else if ([attribute isEqualToString:@"myTop"]) {
        view.myTop = [value floatValue];
    }
    else if ([attribute isEqualToString:@"myBottom"]) {
        view.myBottom = [value floatValue];
    }
    else if ([attribute isEqualToString:@"myWidth"]) {
        view.myWidth = [value floatValue];
    }
    else if ([attribute isEqualToString:@"myHeight"]) {
        view.myHeight = [value floatValue];
    }
    else if ([attribute isEqualToString:@"myCenterX"]) {
        view.myCenterX = [value floatValue];
    }
    else if ([attribute isEqualToString:@"myCenterY"]) {
        view.myCenterY = [value floatValue];
    }
    else if ([attribute isEqualToString:@"useFrame"]) {
        view.useFrame = [value boolValue];
    }
    else if ([attribute isEqualToString:@"noLayout"]) {
        view.noLayout = [value boolValue];
    }
    else if ([attribute isEqualToString:@"wrapContentSize"]) {
        view.wrapContentSize = [value boolValue];
    }
    else if ([attribute isEqualToString:@"wrapContentWidth"]) {
        view.wrapContentWidth = [value boolValue];
    }
    else if ([attribute isEqualToString:@"wrapContentHeight"]) {
        view.wrapContentHeight = [value boolValue];
    }
    else if ([attribute isEqualToString:@"reverseFloat"]) {
        view.reverseFloat = [value boolValue];
    }
    else if ([attribute isEqualToString:@"myVisibility"]) {
        if ([value isEqualToString:@"Visiable"]) {
            view.myVisibility = MyVisibility_Visible;
        }
        else if ([value isEqualToString:@"Invisiable"]) {
            view.myVisibility = MyVisibility_Invisible;
        }
        else if ([value isEqualToString:@"Gone"]) {
            view.myVisibility = MyVisibility_Gone;
        }
    }
    else if ([attribute isEqualToString:@"horzGravity"]) {
        //                                view.myVisibility = [obj unsignedCharValue];
        if ([view isKindOfClass:[MyBaseLayout class]]) {
            MyBaseLayout *layout = (MyBaseLayout *)view;
            MyGravity gravity = MyGravity_None;
            if ([value isEqualToString:@"Left"]) {
                gravity = MyGravity_Horz_Left;
            }
            else if ([value isEqualToString:@"Right"]) {
                gravity = MyGravity_Horz_Right;
            }
            else if ([value isEqualToString:@"Fill"]) {
                gravity = MyGravity_Horz_Fill;
            }
            else if ([value isEqualToString:@"Center"]) {
                gravity = MyGravity_Horz_Center;
            }
            else if ([value isEqualToString:@"Between"]) {
                gravity = MyGravity_Horz_Between;
            }
            layout.gravity = layout.gravity | gravity;
        }
    }
    else if ([attribute isEqualToString:@"vertGravity"]) {
        //                                view.myVisibility = [obj unsignedCharValue];
        if ([view isKindOfClass:[MyBaseLayout class]]) {
            MyBaseLayout *layout = (MyBaseLayout *)view;
            MyGravity gravity = MyGravity_None;
            if ([value isEqualToString:@"Top"]) {
                gravity = MyGravity_Vert_Top;
            }
            else if ([value isEqualToString:@"Bottom"]) {
                gravity = MyGravity_Vert_Bottom;
            }
            else if ([value isEqualToString:@"Fill"]) {
                gravity = MyGravity_Vert_Fill;
            }
            else if ([value isEqualToString:@"Center"]) {
                gravity = MyGravity_Vert_Center;
            }
            else if ([value isEqualToString:@"Between"]) {
                gravity = MyGravity_Vert_Between;
            }
            layout.gravity = layout.gravity | gravity;
        }
    }
    else if ([attribute isEqualToString:@"padding"]) {
        if ([view isKindOfClass:[MyBaseLayout class]]) {
            MyBaseLayout *layout = (MyBaseLayout *)view;
            CGFloat f = [value floatValue];
            layout.padding = UIEdgeInsetsMake(f, f, f, f);
        }
    }
    else if ([attribute isEqualToString:@"topPadding"]) {
        if ([view isKindOfClass:[MyBaseLayout class]]) {
            MyBaseLayout *layout = (MyBaseLayout *)view;
            layout.topPadding = [value floatValue];
        }
    }
    else if ([attribute isEqualToString:@"bottomPadding"]) {
        if ([view isKindOfClass:[MyBaseLayout class]]) {
            MyBaseLayout *layout = (MyBaseLayout *)view;
            layout.bottomPadding = [value floatValue];
        }
    }
    else if ([attribute isEqualToString:@"leftPadding"]) {
        if ([view isKindOfClass:[MyBaseLayout class]]) {
            MyBaseLayout *layout = (MyBaseLayout *)view;
            layout.leftPadding = [value floatValue];
        }
    }
    else if ([attribute isEqualToString:@"rightPadding"]) {
        if ([view isKindOfClass:[MyBaseLayout class]]) {
            MyBaseLayout *layout = (MyBaseLayout *)view;
            layout.rightPadding = [value floatValue];
        }
    }
    else if ([attribute isEqualToString:@"subviewSpace"]) {
        if ([view isKindOfClass:[MyBaseLayout class]]) {
            MyBaseLayout *layout = (MyBaseLayout *)view;
            layout.subviewSpace = [value floatValue];
        }
    }
    else if ([attribute isEqualToString:@"subviewHSpace"]) {
        if ([view isKindOfClass:[MyBaseLayout class]]) {
            MyBaseLayout *layout = (MyBaseLayout *)view;
            layout.subviewHSpace = [value floatValue];
        }
    }
    else if ([attribute isEqualToString:@"subviewVSpace"]) {
        if ([view isKindOfClass:[MyBaseLayout class]]) {
            MyBaseLayout *layout = (MyBaseLayout *)view;
            layout.subviewVSpace = [value floatValue];
        }
    }
    else if ([attribute isEqualToString:@"orientation"]) {
        if ([view isKindOfClass:[MyBaseLayout class]]) {
            MyLinearLayout *layout = (MyLinearLayout *)view;
            if ([value isEqualToString:@"Horizontal"]) {
                layout.orientation = MyOrientation_Horz;
            } else {
                layout.orientation = MyOrientation_Vert;
            }
        }
    }
    else if ([attribute isEqualToString:@"arrangedCount"]) {
        if ([view isKindOfClass:[MyFlowLayout class]]) {
            MyFlowLayout *layout = (MyFlowLayout *)view;
            layout.arrangedCount = [value integerValue];
        }
    }
    else if ([attribute isEqualToString:@"pagedCount"]) {
        if ([view isKindOfClass:[MyFlowLayout class]]) {
            MyFlowLayout *layout = (MyFlowLayout *)view;
            layout.pagedCount = [value integerValue];
        }
    }
    else if ([attribute isEqualToString:@"autoArrange"]) {
        if ([view isKindOfClass:[MyFlowLayout class]]) {
            MyFlowLayout *layout = (MyFlowLayout *)view;
            layout.autoArrange = [value boolValue];
        }
    }
    else if ([attribute isEqualToString:@"adjustScrollViewContentSizeMode"]) {
        if ([view isKindOfClass:[MyBaseLayout class]]) {
            MyBaseLayout *layout = (MyBaseLayout *)view;
            if ([value isEqualToString:@"Auto"]) {
                layout.adjustScrollViewContentSizeMode = MyAdjustScrollViewContentSizeModeAuto;
            }
            else if ([value isEqualToString:@"Yes"]) {
                layout.adjustScrollViewContentSizeMode = MyAdjustScrollViewContentSizeModeYes;
            }
            else if ([value isEqualToString:@"No"]) {
                layout.adjustScrollViewContentSizeMode = MyAdjustScrollViewContentSizeModeNo;
            }
        }
    }
}

@end
