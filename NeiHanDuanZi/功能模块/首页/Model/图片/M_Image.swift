//
//  M_Image.swift
//  NeiHanDuanZi
//
//  Created by 陈东芝 on 16/11/22.
//  Copyright © 2016年 陈东芝. All rights reserved.
//

import UIKit
import SwiftyJSON
class M_Image: NSObject {

    ///是否更新
    var has_more:Bool!;
    var tip:String!;
    var name:String = "";
    ///头像地址
    var avatar_url:String!;
    var dislike_reason:[String:AnyObject]!;
    
   
    var content:String!;
    ///图片分类
    var category_name:String!;
    ///图片地址
    var url:String!;
    var r_height:CGFont!;
    var r_width:CGFont!;
    ///支持数
    var digg_count:NSInteger!;
    var repin_count:NSInteger!;
    //贬数量
    var bury_count:NSInteger!;
    ///分享数
    var share_count:NSInteger!;
    var favorite_count:NSInteger!;
    var share_url:String!;
    ///评论数
    var comment_count:NSInteger!;
    
    init(dict:[String:AnyObject]) {
        
        super.init();
        
        
        let json = JSON.init(dict);
        
        let group:JSON = json["group"];
        
        let user:JSON = json["group"]["user"];
        self.name = user["name"].stringValue;
        self.avatar_url = user["avatar_url"].stringValue;
        
      
        self.url = group["large_image"]["url_list"][0]["url"].string;
        self.content = group["content"].stringValue;
        self.share_url = group["share_url"].stringValue;
        self.category_name = group["category_name"].stringValue;
        self.share_count = group["share_count"].intValue;
        self.repin_count = group["repin_count"].intValue;
        self.digg_count = group["digg_count"].intValue;
        self.comment_count = group["comment_count"].intValue;
        self.bury_count = group["bury_count"].intValue
    }
}
