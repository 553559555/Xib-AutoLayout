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
    @IBOutlet weak var descLabel: UILabel!
    private var reloadCell: reloadCellClosure?
    public var currentIndex: NSInteger!
    @IBOutlet weak var collectionView: UICollectionView!
    public var dict: [String:String]? {
        didSet {
            descLabel.text = dict!["title"]
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
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "imageCollectionCell", for: indexPath) as! WZImageCollectionViewCell
        cell.imageStr = dict!["pic"]
        cell.currentIndex = indexPath.row
        cell.initWithClosure { (index) in
            collectionView.reloadItems(at: [IndexPath(row: index, section: 0)])
            if self.reloadCell != nil {
                self.reloadCell!(self.currentIndex)
            }
        }
        return cell
    }
    
    
}

extension WZSniaCell: UICollectionViewDelegate {
    
}
