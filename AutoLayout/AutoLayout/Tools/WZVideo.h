//
//  WZVideo.h
//  MyProject
//
//  Created by neoby on 2018/1/22.
//  Copyright © 2018年 arther. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WZVideo : UIView

- (instancetype)initWithFrame:(CGRect)frame andURL:(NSString *)url;
- (void)stopVideo;

@end
