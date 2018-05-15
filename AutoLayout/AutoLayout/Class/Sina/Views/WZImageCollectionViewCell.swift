//
//  WZImageCollectionViewCell.swift
//  AutoLayout
//
//  Created by arther on 2018/5/15.
//  Copyright © 2018年 arther. All rights reserved.
//

import UIKit
import Kingfisher

typealias reloadCellClosure = (_ index: NSInteger) -> ()

class WZImageCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var backgroundImage: UIImageView!
    private var reloadCell: reloadCellClosure?
    public var currentIndex: NSInteger!
    public var imageStr: String! {
        didSet {
            backgroundImage.kf.setImage(with: URL(string: imageStr), placeholder: nil, options: nil, progressBlock: nil) { (image, error, type, url) in
                if self.reloadCell != nil {
                    self.reloadCell!(self.currentIndex)
                }
            }
        }
    }
    
    func initWithClosure(closure: reloadCellClosure?) {
        reloadCell = closure
    }
    
}
