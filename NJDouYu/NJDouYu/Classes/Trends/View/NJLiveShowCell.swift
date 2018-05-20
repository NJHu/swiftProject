//
//  NJLiveShowCell.swift
//  NJDouYu
//
//  Created by HuXuPeng on 2018/5/19.
//  Copyright © 2018年 njhu. All rights reserved.
//

import UIKit
import SDWebImage

class NJLiveShowCell: UICollectionViewCell {
    
    
    @IBOutlet weak var srcImageView: UIImageView!
    
    @IBOutlet weak var roomNameLabel: UILabel!
    
    
    var liveShowViewModel: NJLiveShowViewModel? {
        didSet {
            self.roomNameLabel.text = liveShowViewModel?.liveShow.room_name
            self.srcImageView.sd_setImage(with: URL(string: (liveShowViewModel?.liveShow.room_src)!), completed: nil)
        }
    }
}
