//
//  NJTableViewController.swift
//  NJSwiftTodayNews
//
//  Created by HuXuPeng on 2018/5/15.
//  Copyright © 2018年 njhu. All rights reserved.
//

import UIKit

class NJTableViewController: NJViewController {
    
    @IBOutlet var tableView: UITableView?
    private var style: UITableViewStyle = .plain
    
    init(tableViewStyle: UITableViewStyle) {
        super.init(nibName: nil, bundle: nil)
        style = tableViewStyle;
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if tableView == nil {
            addTableView()
        }
        setupTableView()
    }
}


extension NJTableViewController {
    
    private func setupTableView () {
        if #available(iOS 11, *) {
            tableView?.contentInsetAdjustmentBehavior = .never
        }
    }
    
    private func addTableView () {
        tableView = UITableView(frame: view.bounds, style: style)
        view.addSubview(tableView!)
    }
}
