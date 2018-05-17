//
//  WZListViewController.swift
//  AutoLayout
//
//  Created by neoby on 2018/5/11.
//  Copyright © 2018年 arther. All rights reserved.
//

import UIKit

class WZListViewController: UIViewController {
    
    private var listArray: [String] = ["图片自己适应大小","微博","模仿抖音播放","拉拉拉"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

}

extension WZListViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListCell")
        if let labelText = cell?.viewWithTag(200) as? UILabel {
            labelText.text = listArray[indexPath.row]
        }
        return cell!
    }
    
}

extension WZListViewController:UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.hidesBottomBarWhenPushed = true;
        switch indexPath.row {
        case 0:
            let autoImageSizeVC = UIStoryboard(name: "AutoImageSize", bundle: nil).instantiateInitialViewController()
            self.navigationController?.pushViewController(autoImageSizeVC!, animated: true)
            self.hidesBottomBarWhenPushed = false;
        case 1:
            let sinaVC = UIStoryboard(name: "Sina", bundle: nil).instantiateInitialViewController()
            self.navigationController?.pushViewController(sinaVC!, animated: true)
            self.hidesBottomBarWhenPushed = false;
        case 2:
            let videoVC = UIStoryboard(name: "Video", bundle: nil).instantiateInitialViewController()
            self.navigationController?.pushViewController(videoVC!, animated: true)
            self.hidesBottomBarWhenPushed = false
        default:
            print("No VC found to jump")
        }
        
    }
    
}
