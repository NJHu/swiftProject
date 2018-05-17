//
//  NJCollectionViewController.swift
//  NJSwiftTodayNews
//
//  Created by HuXuPeng on 2018/5/15.
//  Copyright © 2018年 njhu. All rights reserved.
//

import UIKit

class NJCollectionViewController: NJViewController {

    @IBOutlet var collectionView: UICollectionView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if collectionView == nil {
            addCollectionView()
        }
        setupCollectionView()
    }
}

extension NJCollectionViewController {
    private func setupCollectionView () {
        if #available(iOS 11, *) {
            collectionView?.contentInsetAdjustmentBehavior = .never
        }
    }
    private func addCollectionView () {
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: UICollectionViewFlowLayout())
        view.addSubview(collectionView!)
    }
}
