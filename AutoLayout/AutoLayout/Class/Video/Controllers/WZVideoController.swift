//
//  WZVideoController.swift
//  AutoLayout
//
//  Created by neoby on 2018/5/21.
//  Copyright © 2018 arther. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class WZVideoController: UICollectionViewController {
    
    private let videoArray: [String] = [
        "http://p11s9kqxf.bkt.clouddn.com/coder.mp4",
        "http://p11s9kqxf.bkt.clouddn.com/buff.mp4",
        "http://p11s9kqxf.bkt.clouddn.com/cat.mp4",
        "http://p11s9kqxf.bkt.clouddn.com/child.mp4",
        "http://p11s9kqxf.bkt.clouddn.com/english.mp4",
        "http://p11s9kqxf.bkt.clouddn.com/erha.mp4",
        "http://p11s9kqxf.bkt.clouddn.com/face.mp4",
        "http://p11s9kqxf.bkt.clouddn.com/fanglian.mp4",
        "http://p11s9kqxf.bkt.clouddn.com/gao.mp4",
        "http://p11s9kqxf.bkt.clouddn.com/girlfriend.mp4",
        "http://p11s9kqxf.bkt.clouddn.com/haha.mp4",
        "http://p11s9kqxf.bkt.clouddn.com/hide.mp4",
        "http://p11s9kqxf.bkt.clouddn.com/juzi.mp4",
        "http://p11s9kqxf.bkt.clouddn.com/keai.mp4",
        "http://p11s9kqxf.bkt.clouddn.com/nvpengy.mp4",
        "http://p11s9kqxf.bkt.clouddn.com/samo.mp4",
        "http://p11s9kqxf.bkt.clouddn.com/shagou.mp4",
        "http://p11s9kqxf.bkt.clouddn.com/shagougou.mp4",
        "http://p11s9kqxf.bkt.clouddn.com/shamiao.mp4",
        "http://p11s9kqxf.bkt.clouddn.com/sichuan.mp4",
        "http://p11s9kqxf.bkt.clouddn.com/tuolaiji.mp4",
        "http://p11s9kqxf.bkt.clouddn.com/xiaobiaozi.mp4"
    ]
    @IBOutlet weak var collectionViewFlowLayout: UICollectionViewFlowLayout!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView?.isPagingEnabled = true
        collectionViewFlowLayout.itemSize = CGSize(width: SCREEN_WIDTH, height: SCREEN_HEIGHT - NAVIGATION_HEIGHT)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return videoArray.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "videoCell", for: indexPath) as? WZVideoCell
        cell?.videoUrl = videoArray[indexPath.row]
        return cell!
    }
    
    override func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let index = scrollView.contentOffset.y / scrollView.bounds.size.height
        let itemArray = collectionView?.indexPathsForVisibleItems
        for indexPath in itemArray! {
            let cell = collectionView?.cellForItem(at: indexPath) as? WZVideoCell
            if indexPath.row != Int(index) {
                cell?.videoView?.stop()
            }
        }
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
