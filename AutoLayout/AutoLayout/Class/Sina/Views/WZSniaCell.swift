//
//  WZSniaCell.swift
//  AutoLayout
//
//  Created by neoby on 2018/5/14.
//  Copyright © 2018年 arther. All rights reserved.
//

import UIKit
import Kingfisher

class WZSniaCell: UITableViewCell,UICollectionViewDelegateFlowLayout {

    private var itemWidth: CGFloat!
    typealias reloadCellClosure = (_ index: NSInteger) -> ()
    @IBOutlet weak var iconImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var collectionViewHeight: NSLayoutConstraint!
    @IBOutlet weak var collectionViewFlowLayout: UICollectionViewFlowLayout!
    @IBOutlet weak var transmitDescLabel: UILabel!
    private var imagesArray: [[String : String]]!
    private var reloadCell: reloadCellClosure?
    public var currentIndex: NSInteger!
    private var flowLayout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
    public var dict: [String:Any]! {
        didSet {
            descLabel.text = dict!["text"] as? String
            if let icon = dict!["user"] as? [String:Any] {
                iconImage.kf.setImage(with: URL(string: icon["avatar_large"]! as! String))
            }
            if let name = dict!["user"] as? [String:Any] {
                nameLabel.text = name["name"] as? String
            }
            timeLabel.text = (dict["created_at"] as! String)
            if let isTransmit = dict!["retweeted_status"] as? [String:Any] {
                transmitDescLabel.text = isTransmit["text"] as? String
                setImages(imageArray: isTransmit["pic_urls"] as! [[String : String]])
            } else {
                setImages(imageArray: dict!["pic_urls"] as! [[String : String]])
            }
            self.collectionView.reloadData()
        }
    }
    
    private func setImages(imageArray: [[String : String]]) {
        imagesArray = imageArray
        switch imageArray.count {
        case 0:
            collectionViewHeight.constant = 0
        case 1:
            collectionViewHeight.constant = itemWidth + 15
        case 2:
            collectionViewHeight.constant = itemWidth + 15
        default:
            let count = ceilf(Float(Float(imageArray.count) / 3.0))
            collectionViewHeight.constant = CGFloat(count) * itemWidth + (CGFloat(count) + 1) * 7
        }
        self.collectionView.layoutIfNeeded()
    }
    
    
    func initWithClosure(closure: reloadCellClosure?) {
        reloadCell = closure
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        itemWidth = (SCREEN_WIDTH - 35) / 3
        collectionViewFlowLayout.sectionInset = .zero
        collectionViewFlowLayout.scrollDirection = .vertical
        collectionViewFlowLayout.minimumInteritemSpacing = 5
        collectionViewFlowLayout.minimumLineSpacing = 5
        collectionView.bounces = false
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: itemWidth, height: itemWidth)
    }

}

extension WZSniaCell: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (imagesArray?.count)!
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "imageCollectionCell", for: indexPath) as! WZImageCollectionViewCell
        cell.dict = imagesArray![indexPath.row]
        cell.currentIndex = indexPath.row
        cell.backgroundColor = UIColor.red
        return cell
    }
    
    
}

extension WZSniaCell: UICollectionViewDelegate {
    
}
