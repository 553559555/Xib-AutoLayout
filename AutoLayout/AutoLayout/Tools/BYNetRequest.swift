//
//  BYNetRequest.swift
//  iOS_Swift_iPay
//
//  Created by 王壮 on 2017/5/12.
//  Copyright © 2017年 Arther. All rights reserved.
//

import UIKit
import Alamofire
import MBProgressHUD


class BYNetRequest: NSObject {
    
    static let shared = BYNetRequest()
    
    //获取微博首页临时数据
    public func loadSinaListData(url urlString: String, successBlock:@escaping ((_ success: [String : Any]) -> Void), failBlock:@escaping ((_ fail: HTTPURLResponse) -> Void)) {
        
        Alamofire.request(urlString).responseJSON { (response) in
            if let jsonData = response.result.value {
                let a = jsonData as! [String : Any]
                successBlock(a)
            } else {
                if let error = response.response {
                    failBlock(error)
                }
            }
        }
        
    }
    
    public func getLoginWithToken(client_id: String, redirect_uri: String ,SuccessBlock:@escaping ((_ success :[String: Any])->Void),ErrorBlock:@escaping ((_ error: HTTPURLResponse)->Void)) {
        
        let parameter = ["client_id": client_id, "redirect_uri": redirect_uri]
        
        Alamofire.request("\(GET_USER_TOKEN)", method: .get, parameters: parameter).responseJSON { response in
            if let JSON = response.result.value {
                let a = JSON as? [String: Any]
                SuccessBlock(a!)
            } else {
                BYLoadingTool.shared.showText(str: "网络请求超时", currentView: ((UIApplication.shared.delegate?.window)!)!)
                if let error = response.response {
                    ErrorBlock(error)
                }
                
            }
        }
    }
    
}
