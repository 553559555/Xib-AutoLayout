//
//  WZPlaySingleVideo.swift
//  AutoLayout
//
//  Created by neoby on 2018/5/23.
//  Copyright © 2018 arther. All rights reserved.
//

import UIKit
import AVFoundation

class WZPlaySingleVideo: UIView {

    private var player: AVPlayer!
    private var playerItem: AVPlayerItem!
    open var url: String! {
        didSet {
//            playerItem.removeObserver(self, forKeyPath: "status")
//            playerItem.removeObserver(self, forKeyPath: "loadedTimeRanges")
            playerItem = AVPlayerItem(url: URL(string: url)!)
//            playerItem.removeObserver(self, forKeyPath: "status")
//            playerItem.removeObserver(self, forKeyPath: "loadedTimeRanges")
            player.replaceCurrentItem(with: playerItem)
            player.play()
        }
    }
    
    init(frame: CGRect, url: String) {
        super.init(frame: frame)
        let urlPath: URL
        if url.contains("http") {
            urlPath = URL(string: url)!
        } else {
            urlPath = URL(fileURLWithPath: url)
        }
        playerItem = AVPlayerItem(url: urlPath)
        player = AVPlayer(playerItem: playerItem)
//        playerItem.addObserver(self, forKeyPath: "loadedTimeRanges", options: .new, context: nil)
//        playerItem.addObserver(self, forKeyPath: "status", options: .new, context: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(playbackFinished), name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: nil)
        let playerLayer = AVPlayerLayer(player: player)
        playerLayer.videoGravity = .resizeAspect
        playerLayer.contentsScale = UIScreen.main.scale
        playerLayer.frame = frame
        self.layer.addSublayer(playerLayer)
        
    }
    
    @objc func playbackFinished(notification: NSNotification) {
        player.seek(to: CMTime(value: 0, timescale: 1))
        player.play()
    }
    
//    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
//        let playerItem = object as? AVPlayerItem
//        if keyPath == "status" {
//            if playerItem?.status == AVPlayerItemStatus.readyToPlay {
//                self.player.play()
//            } else if playerItem?.status == AVPlayerItemStatus.failed {
//                print("加载失败")
//            }
//        }
//    }
    
    deinit {
//        playerItem.removeObserver(self, forKeyPath: "status")
//        playerItem.removeObserver(self, forKeyPath: "loadedTimeRanges")
        NotificationCenter.default.removeObserver(self)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
