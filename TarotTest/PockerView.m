//
//  PockerView.m
//  TarotTest
//
//  Created by kpb on 2021/6/4.
//  Copyright © 2021 motic. All rights reserved.
//

#import "PockerView.h"

@implementation PockerView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(instancetype)initWithFrame:(CGRect)frame imageName:(NSString *)imageName {
    
    self = [super initWithFrame:frame];
    self.isOpen = false;
    if (self) {
        //设置阴影
        self.layer.shadowColor = [UIColor blackColor].CGColor;
        self.layer.shadowOffset = CGSizeMake(-10, 0);
        self.layer.shadowOpacity = 0.3;
        
        //牌的背面
        self.imgView1 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        self.imgView1.backgroundColor = [UIColor redColor];
        self.imgView1.image = [UIImage imageNamed:@"1.jpeg"];
        [self addSubview:self.imgView1];
        self.imgView1.layer.cornerRadius = 10;
        self.imgView1.clipsToBounds = YES;
        self.imgView1.layer.borderWidth = 5;
        self.imgView1.layer.borderColor = [UIColor whiteColor].CGColor;
        
        //牌的正面
        self.imgView2 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        self.imgView2.backgroundColor = [UIColor redColor];
        self.imgView2.image = [UIImage imageNamed:imageName];
        self.imgView2.layer.cornerRadius = 10;
        self.imgView2.clipsToBounds = YES;
        self.imgView2.layer.borderWidth = 5;
        self.imgView2.layer.borderColor = [[UIColor whiteColor] CGColor];
    }
    return self;
}
@end
