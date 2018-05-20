//
//  NJLiveShowListViewModel.swift
//  NJDouYu
//
//  Created by HuXuPeng on 2018/5/19.
//  Copyright © 2018年 njhu. All rights reserved.
//

import UIKit
import Alamofire

class NJLiveShowListViewModel {

    public lazy var liveShowViewModels: [NJLiveShowViewModel] = [NJLiveShowViewModel]()
    private var currentPage = 0
    private var totalPage = 0
    
    func getLiveShowsData(isMore: Bool, completion: @escaping (_ error: Error?, _ isSucceed: Bool, _ isHasMore: Bool) -> ()) -> Void {
        // 1. GET请求
        let urlStr = "http://open.douyucdn.cn/api/RoomApi/live/1"
        let page = isMore ? currentPage + 1 : 0
        let parameters = ["offset": page, "limit": 30]
        Alamofire.request(urlStr, method: .get, parameters: parameters).responseJSON { (returnResult) in
            print("secondMethod --> GET 请求 --> returnResult = \(returnResult)")
            if let statusCode = returnResult.response?.statusCode {
                if statusCode != 200 {
                    completion(returnResult.error, false, true)
                    return
                }
            }
            
            guard let dicts = returnResult.result.value as? Dictionary<String, AnyObject> else {
                completion(returnResult.error, false, true)
                return
            }
            guard let dictArray = dicts["data"] as? [Dictionary<String, AnyObject>] else {
                completion(dicts["error"] as? Error, false, true)
                return
            }
            
            if !isMore {
                self.liveShowViewModels.removeAll()
            }
            
            for dict in dictArray {
                let liveShow = NJLiveShow(dict)
                let liveShowViewModel = NJLiveShowViewModel(liveShow)
                self.liveShowViewModels.append(liveShowViewModel)
            }
            
            self.currentPage = page
            completion(nil, true, true)

        }
    }
}
