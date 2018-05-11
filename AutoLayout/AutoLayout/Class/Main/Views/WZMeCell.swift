//
//  WZMeCell.swift
//  AutoLayout
//
//  Created by neoby on 2018/5/11.
//  Copyright © 2018年 arther. All rights reserved.
//

import UIKit

class WZMeCell: UITableViewCell {
    
    
    @IBOutlet weak var iconImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    public var dict: [String:String]? {
        didSet {
            iconImage.image = UIImage(named: dict!["icon"]!)
            titleLabel.text = dict?["title"]
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
}
