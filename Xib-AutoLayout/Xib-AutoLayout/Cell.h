//
//  Cell.h
//  Xib-AutoLayout
//
//  Created by 王壮 on 2017/2/28.
//  Copyright © 2017年 Arther. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Cell : UITableViewCell

@property (nonatomic,strong) NSDictionary *dict;

@property (nonatomic,copy) void (^finfish)();

@end
