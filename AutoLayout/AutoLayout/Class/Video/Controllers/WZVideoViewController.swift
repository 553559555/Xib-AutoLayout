//
//  WZVideoViewController.swift
//  AutoLayout
//
//  Created by neoby on 2018/5/16.
//  Copyright © 2018年 arther. All rights reserved.
//

import UIKit

class WZVideoViewController: UIViewController {

    var videoView: WZVideoView!
    private var playerImageView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        playerImageView = UIView(frame: CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: CGFloat(SCREEN_HEIGHT - NAVIGATION_HEIGHT)))
        playerImageView.backgroundColor = UIColor.white
        self.view.addSubview(playerImageView)
        videoView = WZVideoView()
        let url = URL(string: "http://p11s9kqxf.bkt.clouddn.com/xiaobiaozi.mp4")
        playerImageView.jp_playVideoMute(with: url!, bufferingIndicator: nil, progressView: videoView) { (view, model) in
            view.jp_muted = false
        }
    }
    
    deinit {
        print("WZVideoViewController deinit")
    }

}
