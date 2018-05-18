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
        
        itemWidth = (SCREEN_WIDTH - 50) / 3
        collectionViewFlowLayout.sectionInset = .zero
        collectionViewFlowLayout.scrollDirection = .vertical
        collectionViewFlowLayout.minimumInteritemSpacing = 5
        collectionViewFlowLayout.minimumLineSpacing = 5
        collectionViewFlowLayout.itemSize = CGSize(width: itemWidth, height: itemWidth)
        collectionView.bounces = false
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }

}

extension WZSniaCell: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return (imagesArray?.count)!
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "imageCollectionCell", for: indexPath) as! WZImageCollectionViewCell
//        cell.dict = imagesArray![indexPath.row]
        cell.currentIndex = indexPath.row
        cell.backgroundColor = UIColor.red
        return cell
    }
    
    
}

extension WZSniaCell: UICollectionViewDelegate {
    
}
