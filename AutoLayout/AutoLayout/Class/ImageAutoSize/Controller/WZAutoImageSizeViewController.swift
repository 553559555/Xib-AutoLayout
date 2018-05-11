//
//  WZAutoImageSizeViewController.swift
//  AutoLayout
//
//  Created by neoby on 2018/5/11.
//  Copyright © 2018年 arther. All rights reserved.
//

import UIKit

class WZAutoImageSizeViewController: UIViewController {
    
    let sourceArray: [[String:String]] = [
        ["title":"谁跑得最快谁跑得最快谁跑得最快谁跑得最快谁跑得最快","pic":"http://timage.wurener.com/uploads/official/image/pic/1/7bf90e2b19c8195032e270de3ec999fbd240dc4b"],
    ["title":"1212112121121211212112121121211212112121121211212112121","pic":"http://timage.wurener.com/uploads/official/image/pic/1/7bf90e2b19c8195032e270de3ec999fbd240dc4b"],
        ["title":"谁跑得最快谁跑得最快谁跑得最快谁跑得最快谁跑得最快谁跑得最快谁跑得最快谁跑得最快谁跑得最快谁跑得最快谁跑得最快谁跑得最快谁跑得最快谁跑得最快谁跑得最快","pic":"http://timage.wurener.com/uploads/official/article/pic/6/b17950acdf6d1094f846e4789c25c395015a7597"],
        ["title":"wfw测试点赞1","pic":"http://timage.wurener.com/uploads/official/vote/pic/12/bb6212cd8322c7f10ba92b10f4f53f473467d864"],
        ["title":"吴凤威测试多选投票11吴凤威测试多选投票11吴凤威测试多选投票11","pic":"http://timage.wurener.com/uploads/official/vote/pic/11/21249884801458a20613cf54703d84c965f81989"],
        ["title":"吴凤威测试多选投票1吴凤威测试多选投票1吴凤威测试多选投票1吴凤威测试多选投票1","pic":"http://timage.wurener.com/uploads/official/vote/pic/10/657efaa403620ad9d2a927693b7a79961b8857dd"],
        ["title":"吴凤威测试单选投票1111吴凤威测试单选投票1111吴凤威测试单选投票1111","pic":"http://timage.wurener.com/uploads/official/vote/pic/9/fc3c6c45f32c4064ca19b4ab2e44f5932d5816df"],
        ["title":"吴凤威测试单选投票111","pic":"http://timage.wurener.com/uploads/official/vote/pic/8/7bf90e2b19c8195032e270de3ec999fbd240dc4b"],
        ["title":"吴凤威测试单选投票11","pic":"http://timage.wurener.com/uploads/official/vote/pic/7/21249884801458a20613cf54703d84c965f81989"],
        ["title":"吴凤威测试单选投票1吴凤威测试单选投票1","pic":"http://timage.wurener.com/uploads/official/vote/pic/6/e1c246f8f5bb35c13d568c64447cf05d47a19f4c"]
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}

extension WZAutoImageSizeViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sourceArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ImageCell") as! WZImageSizeCell
        cell.dict = sourceArray[indexPath.row]
        cell.currentIndex = indexPath.row
        cell.initWithClosure { (index) in
            tableView.reloadRows(at: [IndexPath(row: index, section: 0)], with: .none)
        }
        return cell
    }
}
