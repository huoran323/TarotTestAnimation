//
//  PockerView.h
//  TarotTest
//
//  Created by kpb on 2021/6/4.
//  Copyright © 2021 motic. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface PockerView : UIView

@property (nonatomic, assign) BOOL isOpen;
@property (nonatomic, strong) UIImageView *imgView1;
@property (nonatomic, strong) UIImageView *imgView2;

-(instancetype)initWithFrame:(CGRect)frame imageName:(NSString *)imageName;

@end

NS_ASSUME_NONNULL_END
