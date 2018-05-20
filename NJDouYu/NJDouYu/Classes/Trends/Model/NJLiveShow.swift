//
//  NJLiveShow.swift
//  NJDouYu
//
//  Created by HuXuPeng on 2018/5/19.
//  Copyright © 2018年 njhu. All rights reserved.
//

import UIKit

class NJLiveShow: NSObject {
   @objc var hn: Int = 0
   @objc var nickname: String = ""
   @objc var online: Int = 0
   @objc var owner_uid: Int = 0
   @objc var room_id: Int = 0
   @objc var room_name: String = ""
   @objc var room_src: String = ""
   @objc var url: String = ""
    
    public init(_ dict: [String: AnyObject]) {
        super.init()
//        self.setValuesForKeys(dict)
        setValuesForKeys(dict)
    }
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
    }
}
