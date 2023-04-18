//
//  MBProgressHUD+LGPCategory.h
//  HudDemo
//
//  Created by 廖国朋 on 2023/4/18.
//  Copyright © 2023 Matej Bukovinski. All rights reserved.
//

#import "MBProgressHUD.h"

NS_ASSUME_NONNULL_BEGIN

@interface MBProgressHUD (LGPCategory)

+ (void)show;

+ (void)showWithStatus:(nullable NSString *)status;

+ (void)showWithStatus:(nullable NSString *)status userEnabled:(BOOL)userInteractionEnabled;

+ (void)dismiss;

+ (void)showSuccessWithStatus:(nullable NSString *)status;

+ (void)showErrorWithStatus:(nullable NSString *)status;

+ (void)showImage:(UIImage *)image status:(nullable NSString *)status;

@end

NS_ASSUME_NONNULL_END
