//
//  VC_HomePage.swift
//  NeiHanDuanZi
//
//  Created by 陈东芝 on 16/11/20.
//  Copyright © 2016年 陈东芝. All rights reserved.
//

import UIKit

import Alamofire
import SwiftyJSON

class VC_HomePage: UIViewController,V_RollingTabDelegate {

    var tabsData:NSMutableArray!;
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.view .addSubview(self.rollingTab());
        self.tabsData = NSMutableArray.init();
        
        Alamofire.request(API_tabs).responseJSON { (response) in
            
            let json = JSON.init(response.result.value);
            let data = json["data"];

            for(_,subJson):(String, JSON) in data{
            
                let tabItem:M_HomePageItems = M_HomePageItems.init(dict: subJson.dictionaryObject as! [String:AnyObject]);
                self.tabsData .add(tabItem);
                
            }
            
        };
        
        
        let imageList:V_ImageList = V_ImageList.init(frame: CGRect.init(x: 0, y: 40, width: mainSize.width, height: mainSize.height-40));
        self.view.addSubview(imageList);
        
    }

    
    func rollingTab() -> V_RollingTab{
  
        let rollingTab:V_RollingTab = V_RollingTab.init(frame: CGRect.init(x: 0, y: 0, width: mainSize.width , height: 45.0));
        rollingTab.arrayTitles = ["推荐","视频","图片","段子","精华","同城","游戏"];
        rollingTab.selectedColor = UIColor.red;
        rollingTab.normalColor = UIColor.black;
        rollingTab.delegate = self;
        return rollingTab;
    }
    
    
    //MARK: - V_RollingTabDelegate -
    
    func v_RollingTabSelectedIndx(_ index: Int) {
        
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
