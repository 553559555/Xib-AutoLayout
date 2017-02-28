//
//  Cell.m
//  Xib-AutoLayout
//
//  Created by 王壮 on 2017/2/28.
//  Copyright © 2017年 Arther. All rights reserved.
//

#import "Cell.h"
#import <UIImageView+WebCache.h>

@interface Cell()

@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UIImageView *pic;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *cellHeight;

@end

@implementation Cell


- (void)setDict:(NSDictionary *)dict {
    _dict = dict;
    
    _title.text = dict[@"title"];
    [_pic sd_setImageWithURL:[NSURL URLWithString:dict[@"pic"]] placeholderImage:[UIImage imageNamed:@"123"] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        CGFloat height = [UIScreen mainScreen].bounds.size.width / image.size.width  * image.size.height;
        self.cellHeight.constant = height;
        if (self.finfish) {
            self.finfish();
        }
    }];
    
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
