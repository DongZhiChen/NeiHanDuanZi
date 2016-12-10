//
//  CellVideo.swift
//  NeiHanDuanZi
//
//  Created by 陈东芝 on 16/12/10.
//  Copyright © 2016年 陈东芝. All rights reserved.
//

import UIKit

class CellVideo: UITableViewCell {

    @IBOutlet weak var IV_UserHead: UIImageView!
    
    @IBOutlet weak var LB_UserName: UILabel!
    @IBOutlet weak var LB_Content: UILabel!
    
    @IBOutlet weak var Player: VideoPlayer!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func setVideoInfo(videoInfo:M_Video){
    
        self.IV_UserHead .sd_setImage(with: URL.init(string: videoInfo.medium_cover))
        self.Player.IV_Cover.sd_setImage(with: URL.init(string: videoInfo.user.avatar_url))
        self.LB_UserName.text = videoInfo.user.name
        self.LB_Content.text = videoInfo.content
        
    }
}
