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
    private var reloadCell: reloadCellClosure?
    public var currentIndex: NSInteger!
    private var flowLayout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
    
    public var dict: [String:Any]! {
        didSet {
            descLabel.text = dict!["text"] as? String
            if let images = dict!["pic_urls"] as? [[String: String]] {
                switch images.count {
                case 0:
                    collectionViewHeight.constant = 0
                case 1:
                    collectionViewHeight.constant = itemWidth + 15
                case 2:
                    collectionViewHeight.constant = itemWidth + 15
                default:
                    let count = ceilf(Float(Float(images.count) / 3.0))
                    collectionViewHeight.constant = CGFloat(count) * itemWidth + (CGFloat(count) + 1) * 10
                }
                self.collectionView.layoutIfNeeded()
            }
            self.collectionView.reloadData()
        }
    }
    
    func initWithClosure(closure: reloadCellClosure?) {
        reloadCell = closure
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        itemWidth = (collectionView.bounds.size.width - 30) / 3
        collectionViewFlowLayout.sectionInset = .zero
        collectionViewFlowLayout.scrollDirection = .horizontal
        collectionViewFlowLayout.minimumInteritemSpacing = 5
        collectionViewFlowLayout.minimumLineSpacing = 5
        collectionViewFlowLayout.itemSize = CGSize(width: itemWidth, height: itemWidth)
        collectionView.bounces = false
        
    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        return 5
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
//        return 5
//    }

}

extension WZSniaCell: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let array = dict!["pic_urls"] as? [[String: String]] {
            return array.count
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "imageCollectionCell", for: indexPath) as! WZImageCollectionViewCell
        if let imageArray = dict!["pic_urls"] as? [[String : String]] {
            cell.dict = imageArray[indexPath.row]
        }
        cell.currentIndex = indexPath.row
        cell.backgroundColor = UIColor.red
        return cell
    }
    
    
}

extension WZSniaCell: UICollectionViewDelegate {
    
}
