//
//  M_Image.swift
//  NeiHanDuanZi
//
//  Created by 陈东芝 on 16/11/22.
//  Copyright © 2016年 陈东芝. All rights reserved.
//

import UIKit

class M_Image: NSObject {

    var name:String!;
    var avatar_url:String!;
    var content:String!;
    var category_name:String!;
    var url:String!;
    var r_height:CGFont!;
    var r_width:CGFont!;
    var digg_count:NSInteger!;
    var repin_count:NSInteger!;
    var bury_count:NSInteger!;
    var share_count:NSInteger!;
    
    init(dict:[String:AnyObject]) {
        
        super.init();
        
        let dictGroup:[String:AnyObject] = dict["group"] as! [String : AnyObject];
        let dictUser:[String:AnyObject] = dictGroup["user"] as! [String : AnyObject];
        
        self.name = dictUser["name"] as! String!;
        
    }
}
