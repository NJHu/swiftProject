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
}
