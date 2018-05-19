//
//  NJTrendsLiveShowViewController.swift
//  NJDouYu
//
//  Created by HuXuPeng on 2018/5/19.
//  Copyright © 2018年 njhu. All rights reserved.
//

import UIKit

class NJTrendsLiveShowViewController: NJRefreshCollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let margin: CGFloat = 5.0
        let layoutWidth = (UIScreen.main.bounds.size.width - margin * 3) * 0.5
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = margin
        layout.minimumInteritemSpacing = margin - 1
        layout.itemSize = CGSize(width: layoutWidth, height: layoutWidth * 9.0 / 16.0 + 22.0)
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 0, left: margin, bottom: 0, right: margin)
        collectionView.collectionViewLayout = layout
        
        collectionView.register(UINib(nibName: "NJLiveShowCell", bundle: Bundle.main), forCellWithReuseIdentifier: "NJLiveShowCell")
    }
    override func loadData(isMore: Bool) {
        endHeaderFooterRefreshing()
    }
}

extension NJTrendsLiveShowViewController {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let liveShowCell = collectionView.dequeueReusableCell(withReuseIdentifier: "NJLiveShowCell", for: indexPath)
        return liveShowCell
    }
}


