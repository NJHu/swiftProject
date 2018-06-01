//
//  NJTrendsLiveShowViewController.swift
//  NJDouYu
//
//  Created by HuXuPeng on 2018/5/19.
//  Copyright © 2018年 njhu. All rights reserved.
//

import UIKit
import NJKit
import MJRefresh

class NJTrendsLiveShowViewController: NJRefreshCollectionViewController {
    private lazy var liveShowListViewModel = NJLiveShowListViewModel()
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
        liveShowListViewModel.getLiveShowsData(isMore: isMore) {[weak self] (error, isSucceed, isHasMore) in
            self?.endHeaderFooterRefreshing()
            self?.collectionView.reloadData()
            self?.collectionView.mj_footer.state = MJRefreshState.noMoreData
        }
    }
}

extension NJTrendsLiveShowViewController {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.liveShowListViewModel.liveShowViewModels.count
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let liveShowCell = collectionView.dequeueReusableCell(withReuseIdentifier: "NJLiveShowCell", for: indexPath) as! NJLiveShowCell
        liveShowCell.liveShowViewModel = self.liveShowListViewModel.liveShowViewModels[indexPath.row]
        
        return liveShowCell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        let webVc = NJWebViewController()
        webVc.gotoUrl = self.liveShowListViewModel.liveShowViewModels[indexPath.row].liveShow.url
        navigationController?.pushViewController(webVc, animated: true)
    }
}


