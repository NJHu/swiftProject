//
//  NJCollectionViewController.swift
//  NJSwiftTodayNews
//
//  Created by HuXuPeng on 2018/5/15.
//  Copyright © 2018年 njhu. All rights reserved.
//

import UIKit

class NJCollectionViewController: NJViewController {

    @IBOutlet var collectionView: UICollectionView!
    
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
        if (parent != nil) && parent!.isKind(of: NJNavBarViewController.classForCoder()) {
            var contentInset = collectionView!.contentInset
            contentInset.top += nj_navigationBar.frame.size.height
            collectionView?.contentInset = contentInset
        }
        
        collectionView?.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionView?.backgroundColor = self.view.backgroundColor;
        collectionView?.dataSource = self;
        collectionView?.delegate = self;
    }
    private func addCollectionView () {
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: UICollectionViewFlowLayout())
        view.addSubview(collectionView!)
    }
}

extension NJCollectionViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        scrollView.scrollIndicatorInsets = scrollView.contentInset
        view.endEditing(true)
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
         return 0
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return UICollectionViewCell()
    }
}
