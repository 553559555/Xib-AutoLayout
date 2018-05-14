//
//  WZSniaCell.swift
//  AutoLayout
//
//  Created by neoby on 2018/5/14.
//  Copyright © 2018年 arther. All rights reserved.
//

import UIKit
import Kingfisher

class WZSniaCell: UITableViewCell {

    typealias reloadCellClosure = (_ index: NSInteger) -> ()
    @IBOutlet weak var picImageView: UIImageView!
    @IBOutlet weak var descLabel: UILabel!
    private var reloadCell: reloadCellClosure?
    public var currentIndex: NSInteger!
    
    public var dict: [String:String]? {
        didSet {
            descLabel.text = dict!["title"]
            picImageView.kf.setImage(with: URL(string: dict!["pic"]!), placeholder: nil, options: nil, progressBlock: nil) { (image, error, type, imageURL) in
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

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
