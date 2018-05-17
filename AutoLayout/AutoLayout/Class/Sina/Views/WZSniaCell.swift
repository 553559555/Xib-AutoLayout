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

    private let itemWidth = (SCREEN_WIDTH - 60) / 3 - 20;
    typealias reloadCellClosure = (_ index: NSInteger) -> ()
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var collectionViewHeight: NSLayoutConstraint!
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
                    collectionViewHeight.constant = itemWidth
                case 2:
                    collectionViewHeight.constant = itemWidth
                default:
                    let count = ceilf(Float(Float(images.count) / 3.0))
                    collectionViewHeight.constant = 400
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
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
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

extension WZMeCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemWidth = (SCREEN_WIDTH - 60) / 3 - 20;
        return CGSize(width: itemWidth, height: itemWidth)
    }
}

extension WZSniaCell: UICollectionViewDelegate {
    
}
