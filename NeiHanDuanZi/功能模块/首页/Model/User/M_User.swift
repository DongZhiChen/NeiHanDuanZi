//
//  M_User.swift
//  NeiHanDuanZi
//
//  Created by 陈东芝 on 16/12/10.
//  Copyright © 2016年 陈东芝. All rights reserved.
//

import UIKit
import SwiftyJSON
class M_User: NSObject {

    var user_id = "";
    var name = "";
    var followings = 0;
    var ugc_count = 0;
    var user_varified = false;
    var avatar_url = "";
    var followers = 0;
    var is_following = false;
    var is_pro_user = false;
    
    func initWithDict(dictJSON:JSON){
    
        user_id = dictJSON["user_id"].stringValue;
        name = dictJSON["name"].stringValue;
        followings = dictJSON["followings"].intValue;
        user_varified = dictJSON["user_varified"].boolValue
        avatar_url = dictJSON["avatar_url"].stringValue;
        is_following = dictJSON["is_following"].boolValue;
        is_pro_user = dictJSON["is_pro_user"].boolValue;
        ugc_count = dictJSON["ugc_count"].intValue;
        followers = dictJSON["followers"].intValue;
        
    }
    
}
