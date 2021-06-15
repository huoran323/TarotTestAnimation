//
//  MyObject.h
//  TarotTest
//
//  Created by kpb on 2021/6/4.
//  Copyright © 2021 motic. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

NS_ASSUME_NONNULL_BEGIN

@interface MyObject : NSObject



+ (UIColor *)colorWithHexString:(NSString *)stringToConvert;
+(NSString *)toString:(id)data;

/**
 获取当前控制器

 @return kongzhiqi
 */
+ (UIViewController*)currentViewController;

+ (UINavigationController *)currentNavigationController;


@end

NS_ASSUME_NONNULL_END
