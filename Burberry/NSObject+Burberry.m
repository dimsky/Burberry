//
//  NSObject+Burberry.m
//  Burberry
//
//  Created by dimsky on 16/1/21.
//  Copyright © 2016年 dimsky. All rights reserved.
//

#import "NSObject+Burberry.h"
#import <AppKit/AppKit.h>
#import "Burberry-Swift.h"

@implementation NSObject (Burberry)

- (id)bur_initWithIcon:(id)icon
                message:(NSString *)message
           parentWindow:(id)parentWindow
               duration:(double)duration {
     NSBundle *bundle = [NSBundle bundleWithIdentifier:@"com.dimsky.Burberry"];
    if (icon && [Burberry isEnable] && [message containsString:@"Succeeded"]) {


        BurberryImage *burberryImage = [ImageStore makeImage];

        NSImage *image = [bundle imageForResource:burberryImage.imageName];

        [self bur_initWithIcon:image message:burberryImage.message parentWindow:parentWindow duration:duration];

        if ([self isKindOfClass:[NSPanel class]]) {
            NSPanel *panel = (id)self;

            if ([panel.contentView isKindOfClass:[NSVisualEffectView class]]) {
                NSVisualEffectView *e = (id)panel.contentView;

                e.material = NSVisualEffectMaterialTitlebar;

                image.template = NO;
            }
        }

        return self;
    } else if (icon && [Burberry isEnable] && [message containsString:@"Failed"]) {
        NSImage *image = [bundle imageForResource:@"failed.pdf"];

        [self bur_initWithIcon:image message:@"Son of bitch" parentWindow:parentWindow duration:duration];

        if ([self isKindOfClass:[NSPanel class]]) {
            NSPanel *panel = (id)self;

            if ([panel.contentView isKindOfClass:[NSVisualEffectView class]]) {
                NSVisualEffectView *e = (id)panel.contentView;

                e.material = NSVisualEffectMaterialTitlebar;

                image.template = NO;
            }
        }
        
        return self;
    }

    return [self bur_initWithIcon:icon message:message parentWindow:parentWindow duration:duration];
}


@end
