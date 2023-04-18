//
//  MBProgressHUD+LGPCategory.m
//  HudDemo
//
//  Created by 廖国朋 on 2023/4/18.
//  Copyright © 2023 Matej Bukovinski. All rights reserved.
//

#import "MBProgressHUD+LGPCategory.h"

@implementation MBProgressHUD (LGPCategory)

+ (UIWindow *)frontWindow{
    UIWindow *window = nil;
    if (window == nil){
        if (@available(iOS 13.0, *)) {
            for (UIScene *scene in UIApplication.sharedApplication.connectedScenes) {
                if ([scene isKindOfClass:[UIWindowScene class]]){
                    if (@available(iOS 15.0, *)) {
                        window = [(UIWindowScene *)scene keyWindow];
                    } else {
                        window = [(UIWindowScene *)scene windows].firstObject;
                    }
                    break;
                }
            }
        }else{
            window = UIApplication.sharedApplication.keyWindow;
        }
    }
    return window;
}

+ (NSBundle *)imageBundle{
    NSBundle *bundle = [NSBundle bundleForClass:self];
    NSURL *url = [bundle URLForResource:@"MBProgressHUD" withExtension:@"bundle"];
    NSBundle *imageBundle = [NSBundle bundleWithURL:url];
    return imageBundle;
}

+ (void)show{
    [self showWithStatus:nil];
}

+ (void)showWithStatus:(NSString *)status{
    [self showWithStatus:status userEnabled:NO];
}

+ (void)showWithStatus:(nullable NSString *)status userEnabled:(BOOL)userInteractionEnabled{
    [self dismiss];
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.frontWindow animated:YES];
    hud.userInteractionEnabled = userInteractionEnabled;
    if (status != nil) hud.label.text = status;
}

+ (void)dismiss{
    [MBProgressHUD hideHUDForView:self.frontWindow animated:YES];
}

+ (void)showSuccessWithStatus:(NSString *)status {
    UIImage *successImage = [UIImage imageWithContentsOfFile:[self.imageBundle pathForResource:@"success" ofType:@"png"]];
    [self showImage:successImage status:status];
}

+ (void)showErrorWithStatus:(nullable NSString *)status{
    UIImage *errorImage = [UIImage imageWithContentsOfFile:[self.imageBundle pathForResource:@"error" ofType:@"png"]];
    [self showImage:errorImage status:status];
}

+ (void)showImage:(UIImage *)image status:(nullable NSString *)status{
    [self dismiss];
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.frontWindow animated:YES];
    hud.mode = MBProgressHUDModeCustomView;
    hud.customView = [[UIImageView alloc] initWithImage:image];
    hud.square = YES;
    if (status != nil) hud.label.text = status;
    [hud hideAnimated:YES afterDelay:1.5];
}


@end
