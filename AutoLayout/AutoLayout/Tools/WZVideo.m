//
//  WZVideo.m
//  MyProject
//
//  Created by neoby on 2018/1/22.
//  Copyright © 2018年 arther. All rights reserved.
//

#import "WZVideo.h"
#import <AVFoundation/AVFoundation.h>


@interface WZVideo()

@property (nonatomic, strong) AVPlayer *player;
@property (nonatomic, strong) AVPlayerItem *playerItem;

@end

@implementation WZVideo

- (instancetype)initWithFrame:(CGRect)frame andURL:(NSString *)url {
    if (self = [super initWithFrame:frame]) {
        NSURL *urlPath = nil;
        if ([url rangeOfString:@"http"].location != NSNotFound) {
            urlPath = [NSURL URLWithString:url];
        } else {
            urlPath = [NSURL fileURLWithPath:url];
        }
        //创建AVPlayerItem
        _playerItem = [AVPlayerItem playerItemWithURL:urlPath];
        //添加给AVPlayer
        self.player = [AVPlayer playerWithPlayerItem:_playerItem];
        //设置视频声音
//        self.player.volume = 0;
        //添加监听
        [_playerItem addObserver:self forKeyPath:@"loadedTimeRanges" options:NSKeyValueObservingOptionNew context:nil];
        [_playerItem addObserver:self forKeyPath:@"status" options:NSKeyValueObservingOptionNew context:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(playbackFinished:) name:AVPlayerItemDidPlayToEndTimeNotification object:self.player.currentItem];
        // 创建AVPlayerlayer
        AVPlayerLayer *playerLayer = [AVPlayerLayer playerLayerWithPlayer:self.player];
        //设置模式
        playerLayer.videoGravity = AVLayerVideoGravityResizeAspectFill;
        playerLayer.contentsScale = [UIScreen mainScreen].scale;
        playerLayer.frame = frame;
        [self.layer addSublayer:playerLayer];
    }
    return self;
}

// 监听视频播放完成继续播放
-(void)playbackFinished:(NSNotification *)notification{
    NSLog(@"视频播放完成.");
    // 播放完成后重复播放
    // 跳到最新的时间点开始播放
    [_player seekToTime:CMTimeMake(0, 1)];
    [_player play];
}

//监听视频加载完成开始播放
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context
{
    AVPlayerItem *playerItem = (AVPlayerItem *)object;
    //当前缓冲进度
    if ([keyPath isEqualToString:@"loadedTimeRanges"]){
        
    //视频加载进度
    }else if ([keyPath isEqualToString:@"status"]){
        //视频加载完成
        if (playerItem.status == AVPlayerItemStatusReadyToPlay) {
            [self.player play];
        //视频加载失败
        } else if (playerItem.status == AVPlayerItemStatusFailed) {
            NSLog(@"load break");
        //未知
        } else {
            NSLog(@"加载未知");
        }
    }
}

- (void)stopVideo {
    [_player pause];
}

- (void)dealloc {
    NSLog(@"video界面被释放了");
    //释放KVO、通知
    [_playerItem removeObserver:self forKeyPath:@"loadedTimeRanges"];
    [_playerItem removeObserver:self forKeyPath:@"status"];
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
