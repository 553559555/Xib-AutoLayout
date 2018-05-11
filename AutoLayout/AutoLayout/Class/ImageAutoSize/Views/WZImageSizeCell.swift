//
//  WZImageSizeCell.swift
//  AutoLayout
//
//  Created by neoby on 2018/5/11.
//  Copyright © 2018年 arther. All rights reserved.
//

import UIKit
import Kingfisher

class WZImageSizeCell: UITableViewCell {

    typealias reloadCellClosure = (_ index: NSInteger) -> ()
    @IBOutlet weak var cellImage: UIImageView!
    @IBOutlet weak var cellText: UILabel!
    private var reloadCell: reloadCellClosure?
    public var currentIndex: NSInteger!
    public var dict: [String:String]? {
        didSet {
            cellText.text = dict!["title"]
            cellImage.kf.setImage(with: URL(string: dict!["pic"]!), placeholder: nil, options: nil, progressBlock: nil) { (image, error, type, imageURL) in
                print("iamge = \(String(describing: image)) error = \(String(describing: error)) type = \(type) imageURL = \(String(describing: imageURL))")
                if self.reloadCell != nil {
                    self.reloadCell!(self.currentIndex)
                }
            }
        }
    }
    
    func initWithClosure(closure: reloadCellClosure?) {
        reloadCell = closure
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
}
