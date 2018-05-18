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
    public var dict: [String: String]! {
        didSet {
            backgroundImage.kf.setImage(with: URL(string: dict["thumbnail_pic"]!), placeholder: nil, options: nil, progressBlock: nil) { (image, error, type, url) in
            }
        }
    }
    
    func initWithClosure(closure: reloadCellClosure?) {
        reloadCell = closure
    }
    
}

/*
 
 2018-05-18 10:57:36.656092+0800 AutoLayout[3991:86005] [LayoutConstraints] Unable to simultaneously satisfy constraints.
 Probably at least one of the constraints in the following list is one you don't want.
 Try this:
 (1) look at each constraint and try to figure out which you don't expect;
 (2) find the code that added the unwanted constraint or constraints and fix it.
 (
 "<NSLayoutConstraint:0x600000090d60 UIImageView:0x7f82eed069f0.height == 50   (active)>",
 "<NSLayoutConstraint:0x600000281810 UILabel:0x7f82eec3d060.height == 1   (active)>",
 "<NSLayoutConstraint:0x600000281900 UIView:0x7f82eec3d540.height == 10   (active)>",
 "<NSLayoutConstraint:0x60000009e000 UICollectionView:0x7f82ef0af200.height == 136.333   (active)>",
 "<NSLayoutConstraint:0x600000280190 V:|-(10)-[UIImageView:0x7f82eed069f0]   (active, names: '|':UITableViewCellContentView:0x7f82eed105e0 )>",
 "<NSLayoutConstraint:0x600000281950 V:[UIImageView:0x7f82eed069f0]-(10)-[UILabel:0x7f82eec3bc50'\U5403\U80d6\U4e86\U7684\U9e45\Uff0c\U4eff\U4f5b\U5bf9\U751f\U6d3b\U5931\U53bb\U4e86\U5c0f\U76ee\U6807\Uff0c\U5e94\U8be5\U662f\U6211\U672c\U4eba\U4e86...']   (active)>",
 "<NSLayoutConstraint:0x600000281a90 V:[UILabel:0x7f82eec3bc50'\U5403\U80d6\U4e86\U7684\U9e45\Uff0c\U4eff\U4f5b\U5bf9\U751f\U6d3b\U5931\U53bb\U4e86\U5c0f\U76ee\U6807\Uff0c\U5e94\U8be5\U662f\U6211\U672c\U4eba\U4e86...']-(10)-[UICollectionView:0x7f82ef0af200]   (active)>",
 "<NSLayoutConstraint:0x600000281b80 V:[UILabel:0x7f82eec3d060]-(0)-[UIStackView:0x7f82eec3bf30]   (active)>",
 "<NSLayoutConstraint:0x600000281c20 V:[UICollectionView:0x7f82ef0af200]-(0)-[UILabel:0x7f82eec3d060]   (active)>",
 "<NSLayoutConstraint:0x600000281e00 V:[UIView:0x7f82eec3d540]-(0)-|   (active, names: '|':UITableViewCellContentView:0x7f82eed105e0 )>",
 "<NSLayoutConstraint:0x600000281e50 V:[UIStackView:0x7f82eec3bf30]-(0)-[UIView:0x7f82eec3d540]   (active)>",
 "<NSLayoutConstraint:0x604000095220 'UISV-canvas-connection' UIStackView:0x7f82eec3bf30.top == UIButton:0x7f82eec3c140'\U5206\U4eab'.top   (active)>",
 "<NSLayoutConstraint:0x604000283a20 'UISV-canvas-connection' V:[UIButton:0x7f82eec3c140'\U5206\U4eab']-(0)-|   (active, names: '|':UIStackView:0x7f82eec3bf30 )>",
 "<NSLayoutConstraint:0x6040002845b0 'UIView-Encapsulated-Layout-Height' UITableViewCellContentView:0x7f82eed105e0.height == 44   (active)>"
 )
 
 Will attempt to recover by breaking constraint
 <NSLayoutConstraint:0x604000095220 'UISV-canvas-connection' UIStackView:0x7f82eec3bf30.top == UIButton:0x7f82eec3c140'分享'.top   (active)>

 
 */
