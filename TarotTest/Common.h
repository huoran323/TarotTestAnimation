//
//  Common.h
//  TarotTest
//
//  Created by kpb on 2021/6/4.
//  Copyright © 2021 motic. All rights reserved.
//

#ifndef Common_h
#define Common_h

#define UIColorFromHexString(string) [MyObject colorWithHexString:string]

/*常用颜色*/
#define MainColor UIColorFromHexString(@"#3391e7")
#define KLineColor1 UIColorFromHexString(@"#ffcc51")
#define KLineColor2 UIColorFromHexString(@"#3492e9")
#define ThemeColor UIColorFromHexString(@"#3492e9")
#define BarTitleColor UIColorFromHexString(@"#ffffff")
#define DarkTitleColor UIColorFromHexString(@"#333333")
#define LightTitleColor UIColorFromHexString(@"#999999")
#define LightViewColor UIColorFromHexString(@"#f8f8f8")

#import "MyObject.h"
#import <pop/POP.h>
#import <Masonry.h>

#endif /* Common_h */
