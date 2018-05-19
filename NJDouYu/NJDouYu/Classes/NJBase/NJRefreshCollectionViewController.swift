//
//  NJRefreshCollectionViewController.swift
//  NJSwiftTodayNews
//
//  Created by HuXuPeng on 2018/5/15.
//  Copyright © 2018年 njhu. All rights reserved.
//

import UIKit

class NJRefreshCollectionViewController: NJCollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.mj_header = NJRefreshNormalHeader(refreshingBlock: {[weak self] () -> Void in
            if let strongSelf = self {
                strongSelf.refreshing(isMore: false)
            }
        })
        collectionView.mj_footer = NJRefreshAutoNormalFooter(refreshingBlock: {[weak self] () -> Void in
            if let strongSelf = self {
                strongSelf.refreshing(isMore: true)
            }
        })
        collectionView.mj_header.beginRefreshing()
    }
}

extension NJRefreshCollectionViewController {
    private func refreshing(isMore: Bool) {
        if isMore {
            if collectionView.mj_header.isRefreshing {
                collectionView.mj_footer.endRefreshing()
                return
            }
            collectionView.mj_header.isHidden = true
            collectionView.mj_footer.isHidden = false
        } else {
            if collectionView.mj_footer.isRefreshing {
                collectionView.mj_header.endRefreshing()
                return
            }
            collectionView.mj_header.isHidden = false
            collectionView.mj_footer.isHidden = true
        }
        self.loadData(isMore: isMore)
    }
}



extension NJRefreshCollectionViewController {
    public func loadData(isMore: Bool) {
        
    }
}

extension NJRefreshCollectionViewController {
    // 子类需要调用调用
    public func endHeaderFooterRefreshing() {
        if collectionView.mj_header.isRefreshing {
            collectionView.mj_header.endRefreshing()
        }
        if collectionView.mj_footer.isRefreshing {
            collectionView.mj_footer.endRefreshing()
        }
        collectionView.mj_footer.isHidden = false
        collectionView.mj_header.isHidden = false
    }
}

extension NJRefreshCollectionViewController {
    override func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        var contentInset = scrollView.contentInset
        contentInset.bottom -= scrollView.mj_footer.frame.size.height
        scrollView.scrollIndicatorInsets = contentInset
        view.endEditing(true)
    }
}
