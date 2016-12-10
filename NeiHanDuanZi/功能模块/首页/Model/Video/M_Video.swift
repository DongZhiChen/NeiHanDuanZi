//
//  M_Video.swift
//  NeiHanDuanZi
//
//  Created by 陈东芝 on 16/12/10.
//  Copyright © 2016年 陈东芝. All rights reserved.
//

import UIKit
import SwiftyJSON

class M_Video: NSObject {

    var video_width:NSInteger = 0;
    var video_height:NSInteger = 0;
    var mp4_url:String = "";
    var videoURL360:String = "";
    var videoURL720:String = "";
    var videoURL480:String = "";
    var id:String = "";
    var favorite_count:NSInteger = 0;
    var go_detail_count:NSInteger = 0;
    var share_type:String = "";
    var is_can_share:String = "";
    var share_url:String = "";
    var content:String = "";
    var comment_count:NSInteger = 0;
    var dislike_reason:[String]?;
    var status_desc:String = "";
    var user:M_User = M_User();
    var digg_count:NSInteger = 0;
    var duration:NSInteger = 0;
    var play_count:NSInteger = 0;
    var category_name:String = "";
    var medium_cover:String = "";
    
    func initWithDict(dictJson:JSON){
    
        let group = dictJson["group"];
        
        video_width = group["video_width"].intValue;
        video_height = group["video_height"].intValue;
    
        mp4_url = group["mp4_url"].stringValue;
        content = group["content"].stringValue;
        digg_count = group["digg_count"].intValue;
        duration = group["duration"].intValue;
        favorite_count = group["favorite_count"].intValue;
        go_detail_count = group["go_detail_count"].intValue;
        share_url = group["share_url"].stringValue;
        play_count = group["play_count"].intValue;
        category_name = group["category_name"].stringValue;
        
        videoURL360 = group["360p_video"]["url_list"][0]["url"].stringValue;
        videoURL480 = group["480p_video"]["url_list"][0]["url"].stringValue;
        videoURL720 = group["720p_video"]["url_list"][0]["url"].stringValue;
        
        medium_cover = group["medium_cover"]["url_list"][0]["url"].stringValue;
        
        user.initWithDict(dictJSON: group["user"]);
        
        
    }
}
