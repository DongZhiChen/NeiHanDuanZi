//
//  CellNeiHanImage.swift
//  NeiHanDuanZi
//
//  Created by 陈东芝 on 16/11/20.
//  Copyright © 2016年 陈东芝. All rights reserved.
//

import UIKit

let cellImageID:String = "cellImageID"

class CellNeiHanImage: UITableViewCell {

  
    @IBOutlet weak var BTN_Share: UIButton!
    @IBOutlet weak var BTN_Comment: UIButton!
    @IBOutlet weak var BTN_Bury: UIButton!
    @IBOutlet weak var BTN_Digg: UIButton!
    @IBOutlet weak var IV_Content: UIImageView!
    @IBOutlet weak var IV_UserHead: UIImageView!
    @IBOutlet weak var LB_Content: UILabel!
    @IBOutlet weak var LB_UserName: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func setCellNeiHanImageData(imageData:M_Image){
    
        self.IV_UserHead.sd_setImage(with:URL.init(string: imageData.avatar_url));
        self.LB_UserName.text = imageData.name;
        self.LB_Content.text = imageData.content;
        self.IV_Content.sd_setImage(with: URL.init(string: imageData.url));
        self.BTN_Bury.setTitle(String(imageData.bury_count), for: .normal);
        self.BTN_Digg.setTitle(String(imageData.digg_count), for: .normal);
        self.BTN_Comment.setTitle(String(imageData.comment_count), for: .normal);
        self.BTN_Share.setTitle(String(imageData.share_count), for: .normal);
    
    }
    
    // MARK: - UIButtonEventClick -
    
    @IBAction func BTN_Digg(_ sender: AnyObject) {
    }
    @IBAction func BTN_Bury(_ sender: AnyObject) {
    }
    @IBAction func BTN_Comment(_ sender: AnyObject) {
    }
    @IBAction func BTN_Share(_ sender: AnyObject) {
    }
    
    
}
