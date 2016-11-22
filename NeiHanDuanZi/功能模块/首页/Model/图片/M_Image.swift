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
    var favorite_count:NSInteger!;
    var share_url:String!;
    var comment_count:NSInteger!;
    
    init(dict:[String:AnyObject]) {
        
        super.init();
        
        let group:[String:AnyObject] = dict["group"] as! [String : AnyObject];
        
        let user:[String:AnyObject] = group["user"] as! [String : AnyObject];
        self.name = user["name"] as! String!;
        self.avatar_url = user["avatar_url"] as! String;
        
        self.content = group["content"] as! String;
        self.share_url = group["share_url"] as! String;
        self.comment_count = group["comment_count"] as! NSInteger;
        self.category_name = group["category_name"] as! String;
        self.repin_count = group["repin_count"] as! NSInteger;
        self.digg_count = group["digg_count"] as! NSInteger;
        
    }
}
