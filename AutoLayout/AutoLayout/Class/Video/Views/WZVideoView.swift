//
//  WZVideoView.swift
//  AutoLayout
//
//  Created by neoby on 2018/5/16.
//  Copyright © 2018年 arther. All rights reserved.
//

import UIKit

class WZVideoView: JPVideoPlayerProgressView {

    override func layoutThatFits(_ constrainedRect: CGRect, nearestViewControllerInViewTree nearestViewController: UIViewController?, interfaceOrientation: JPVideoPlayViewInterfaceOrientation) {
        super.layoutThatFits(constrainedRect, nearestViewControllerInViewTree: nearestViewController, interfaceOrientation: interfaceOrientation)
        self.trackProgressView.frame = CGRect(x: 0, y: constrainedRect.size.height - JPVideoPlayerProgressViewElementHeight - 10, width: constrainedRect.size.width, height: JPVideoPlayerProgressViewElementHeight)
        self.cachedProgressView.frame = self.trackProgressView.bounds
        self.elapsedProgressView.frame = self.trackProgressView.frame
        self.jp_videoPlayerView?.isUserInteractionEnabled = true
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    
}
