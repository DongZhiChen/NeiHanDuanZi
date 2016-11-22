//
//  V_ImageList.swift
//  NeiHanDuanZi
//
//  Created by 陈东芝 on 16/11/22.
//  Copyright © 2016年 陈东芝. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class V_ImageList: UIView ,UITableViewDelegate,UITableViewDataSource{

    var TB_ImageList:UITableView!;
    var arrayImageData:NSMutableArray = [];
    
   override init(frame: CGRect) {
        
        super.init(frame: frame);
        
    TB_ImageList = UITableView.init(frame: self.bounds, style: .plain);
    TB_ImageList.delegate = self;
    TB_ImageList.dataSource = self;
    TB_ImageList.register(CellNieHanImage.self, forCellReuseIdentifier: cellImageID);
    self .addSubview(TB_ImageList);
    
    
    
    self.requestImageData();
    
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 10;
        
    }
    
    
    
    func requestImageData(){
    
        Alamofire.request(API_Image).responseJSON { (response) in
            
            let json = JSON.init(response.result.value);
            let data = json["data"]["data"];
            
            for (_,dictData):(String,JSON) in data {
                
                let imageModel:M_Image = M_Image.init(dict: dictData.dictionaryObject as! [String : AnyObject]);
                self.arrayImageData .add(imageModel);
                
            }
            
           
            
        };

    
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell:CellNieHanImage = tableView.dequeueReusableCell(withIdentifier: cellImageID) as! CellNieHanImage;
        
        return cell;
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 10.0;
    }

}
