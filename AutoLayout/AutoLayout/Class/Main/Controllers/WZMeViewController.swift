//
//  WZMeViewController.swift
//  AutoLayout
//
//  Created by neoby on 2018/5/11.
//  Copyright © 2018年 arther. All rights reserved.
//

import UIKit

class WZMeViewController: UIViewController {

    @IBOutlet weak var iconImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        iconImageView.layer.cornerRadius = 50
        iconImageView.layer.masksToBounds = true
        
    }

}

extension WZMeViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MeCell") as? WZMeCell
        cell?.dict = ["icon": "icon","title":"Arther"]
        return cell!
    }
    
}
