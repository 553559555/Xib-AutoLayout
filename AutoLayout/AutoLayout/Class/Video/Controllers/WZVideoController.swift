//
//  WZVideoController.swift
//  AutoLayout
//
//  Created by neoby on 2018/5/21.
//  Copyright © 2018 arther. All rights reserved.
//

import UIKit

class WZVideoController: UIViewController,UIScrollViewDelegate,JPVideoPlayerDelegate {
    
    private let videoArray: [String] = [
        "http://p11s9kqxf.bkt.clouddn.com/coder.mp4",
        "http://p11s9kqxf.bkt.clouddn.com/buff.mp4",
        "http://p11s9kqxf.bkt.clouddn.com/cat.mp4",
        "http://p11s9kqxf.bkt.clouddn.com/child.mp4",
        "http://p11s9kqxf.bkt.clouddn.com/english.mp4",
        "http://p11s9kqxf.bkt.clouddn.com/erha.mp4",
        "http://p11s9kqxf.bkt.clouddn.com/face.mp4",
        "http://p11s9kqxf.bkt.clouddn.com/fanglian.mp4",
        "http://p11s9kqxf.bkt.clouddn.com/gao.mp4",
        "http://p11s9kqxf.bkt.clouddn.com/girlfriend.mp4",
        "http://p11s9kqxf.bkt.clouddn.com/haha.mp4",
        "http://p11s9kqxf.bkt.clouddn.com/hide.mp4",
        "http://p11s9kqxf.bkt.clouddn.com/juzi.mp4",
        "http://p11s9kqxf.bkt.clouddn.com/keai.mp4",
        "http://p11s9kqxf.bkt.clouddn.com/nvpengy.mp4",
        "http://p11s9kqxf.bkt.clouddn.com/samo.mp4",
        "http://p11s9kqxf.bkt.clouddn.com/shagou.mp4",
        "http://p11s9kqxf.bkt.clouddn.com/shagougou.mp4",
        "http://p11s9kqxf.bkt.clouddn.com/shamiao.mp4",
        "http://p11s9kqxf.bkt.clouddn.com/sichuan.mp4",
        "http://p11s9kqxf.bkt.clouddn.com/tuolaiji.mp4",
        "http://p11s9kqxf.bkt.clouddn.com/xiaobiaozi.mp4"
    ]
    private var scrollView: UIScrollView!
    private var topImageView: UIImageView!
    private var middleImageView: UIImageView!
    private var bottomImageView: UIImageView!
    private var currentVideoIndex: NSInteger!
    private var scrollViewOffserYOnStartDrag: CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setup()
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.scrollView.contentInset = UIEdgeInsets.zero
        if #available(iOS 11.0, *) {
            self.scrollView.contentInsetAdjustmentBehavior = .never
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.scrollViewOffserYOnStartDrag = -100;
        self.scrollViewDidEndScrolling()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        self.middleImageView.jp_stopPlay()
    }
    
    /*
     * UIScrollViewDelegate
     */
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        if decelerate == false {
            self.scrollViewDidEndScrolling()
        }
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        self.scrollViewDidEndScrolling()
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        scrollViewOffserYOnStartDrag = scrollView.contentOffset.y
    }
    
    func shouldShowBlackBackgroundBeforePlaybackStart() -> Bool {
        return true
    }
    
    
    
    private func scrollViewDidEndScrolling() {
        
        if scrollViewOffserYOnStartDrag == scrollView.contentOffset.y {
            return
        }
        
        scrollView.setContentOffset(CGPoint(x: 0, y: SCREEN_HEIGHT), animated: false)
        middleImageView.jp_stopPlay()
        middleImageView.jp_playVideo(with: self.fetchURL(), bufferingIndicator: nil, controlView: nil, progressView: JPDouyuProgressView()) { (view, model) in
            view.jp_muted = false
        }
        
    }
    
    private func fetchURL() -> URL {
        if currentVideoIndex == videoArray.count - 1 {
            self.currentVideoIndex = 0
        }
        let url = URL(string: videoArray[currentVideoIndex])
        currentVideoIndex = currentVideoIndex + 1
        return url!
    }

    private func setup() {
        view.backgroundColor = UIColor.white
        self.currentVideoIndex = 0
        
        scrollView = UIScrollView(frame: view.bounds)
        scrollView.backgroundColor = UIColor.black
        scrollView.contentSize = CGSize(width: SCREEN_WIDTH, height: SCREEN_HEIGHT * 3)
        scrollView.isPagingEnabled = true
        scrollView.delegate = self
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        view.addSubview(scrollView)
        
        topImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: SCREEN_HEIGHT))
        topImageView.backgroundColor = UIColor.black
        topImageView.isUserInteractionEnabled = true
        scrollView.addSubview(topImageView)
        
        middleImageView = UIImageView(frame: CGRect(x: 0, y: SCREEN_HEIGHT, width: SCREEN_WIDTH, height: SCREEN_HEIGHT))
        middleImageView.backgroundColor = UIColor.black
        middleImageView.isUserInteractionEnabled = true
        middleImageView.jp_videoPlayerDelegate = self
        scrollView.addSubview(middleImageView)
        
        bottomImageView = UIImageView(frame: CGRect(x: 0, y: SCREEN_HEIGHT * 2, width: SCREEN_WIDTH, height: SCREEN_HEIGHT))
        bottomImageView.backgroundColor = UIColor.black
        bottomImageView.isUserInteractionEnabled = true
        scrollView.addSubview(bottomImageView)
        
        
    }

}

class JPDouyuProgressView: JPVideoPlayerProgressView {
    
    override func layoutThatFits(_ constrainedRect: CGRect, nearestViewControllerInViewTree nearestViewController: UIViewController?, interfaceOrientation: JPVideoPlayViewInterfaceOrientation) {
        super.layoutThatFits(constrainedRect, nearestViewControllerInViewTree: nearestViewController, interfaceOrientation: interfaceOrientation)
        
        self.trackProgressView.frame = CGRect(x: 0, y: constrainedRect.size.height - JPVideoPlayerProgressViewElementHeight - (nearestViewController?.tabBarController?.tabBar.bounds.size.height)!, width: constrainedRect.size.width, height: JPVideoPlayerProgressViewElementHeight)
        
        self.cachedProgressView.frame = self.trackProgressView.bounds
        self.elapsedProgressView.frame = self.trackProgressView.frame
        
    }
    
}
