//
//  WZVideoCell.swift
//  AutoLayout
//
//  Created by neoby on 2018/5/21.
//  Copyright © 2018 arther. All rights reserved.
//

import UIKit

class WZVideoCell: UICollectionViewCell {
    
    open var videoView: WZVideo?
    open var videoUrl: String! {
        didSet {
            videoView = WZVideo(frame: CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: SCREEN_HEIGHT - NAVIGATION_HEIGHT), andURL: videoUrl)
            self.contentView.addSubview(videoView!)
            
            let view = UIView(frame: CGRect(x: 100, y: 100, width: 100, height: 100))
            view.backgroundColor = UIColor.red
            self.contentView.addSubview(view)
        }
    }
    
}
