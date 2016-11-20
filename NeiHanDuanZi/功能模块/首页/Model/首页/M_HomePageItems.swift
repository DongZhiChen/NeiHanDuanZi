//
//  M_HomePageItems.swift
//  NeiHanDuanZi
//
//  Created by 陈东芝 on 16/11/20.
//  Copyright © 2016年 陈东芝. All rights reserved.
//

import UIKit

class M_HomePageItems: NSObject {

    var name:String!;
    var url:String!;
    var list_id:NSInteger!;
    var refresh_interval:NSInteger!;
    
     init(dict:[String:AnyObject]){
    
        super.init();
    
        name = dict["name"] as! String!;
        url = dict["url"] as! String!;
        list_id = dict["list_id"] as! NSInteger!;
        refresh_interval = dict["refresh_interval"] as! NSInteger!;
    }
}
