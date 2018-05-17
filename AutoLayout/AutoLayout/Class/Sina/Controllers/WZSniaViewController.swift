//
//  WZSniaViewController.swift
//  AutoLayout
//
//  Created by neoby on 2018/5/14.
//  Copyright © 2018年 arther. All rights reserved.
//

import UIKit
import Alamofire

class WZSniaViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    private var sourceDataArray: [[String:Any]]?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        BYNetRequest.shared.loadSinaListData(url: "https://api.weibo.com/2/statuses/home_timeline.json?access_token=2.00Eom_JGOoOLfD0e6f0eb7dbrGYIpD&count=10&page=1", successBlock: { (dict) in
            if let dataArray = dict["statuses"] {
                self.sourceDataArray = (dataArray as! [[String: Any]])
                self.tableView.reloadData()
            } else {
                print("获取数据失败")
            }
        }) { (error) in
            print(error)
        }
    
    }

}


extension WZSniaViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sourceDataArray?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "sinacell") as? WZSniaCell
        cell?.dict = sourceDataArray?[indexPath.row]
        cell?.currentIndex = indexPath.row
//        cell?.initWithClosure { (index) in
//            tableView.reloadRows(at: [IndexPath(row: index, section: 0)], with: .none)
//        }
        return cell!
    }
}

extension WZSniaViewController: UITableViewDelegate {
    
    
}
