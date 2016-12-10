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
   // TB_ImageList.register(UINib.init(nibName: "CellNeiHanImage", bundle: nil), forCellReuseIdentifier: cellImageID)
    
    TB_ImageList.register(UINib.init(nibName: "CellVideo", bundle: nil), forCellReuseIdentifier: "cell")
    self .addSubview(TB_ImageList);
    
    
    
    self.requestVideoData();
    
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.arrayImageData.count;
        
    }
    
    func requestVideoData(){
        
        Alamofire.request(API_Video).responseJSON { (response) in
            
            let json = JSON(response.result.value);
            
            let data = json["data"]["data"].arrayValue;
            
            for dictData:JSON in data {
                
                let imageModel:M_Video = M_Video();
                imageModel.initWithDict(dictJson: dictData);
                
                self.arrayImageData .add(imageModel);
                
            }
            
            self.TB_ImageList .reloadData();
            
        };
        
        
    }

    
    func requestImageData(){
    
        Alamofire.request(API_Image).responseJSON { (response) in
            
            let json = JSON(response.result.value);
            
            let data = json["data"]["data"].arrayValue;
            
            for dictData:JSON in data {
                
                let imageModel:M_Image = M_Image.init(dict: dictData.dictionaryObject as! [String : AnyObject]);
                self.arrayImageData .add(imageModel);
                
            }
            
            self.TB_ImageList .reloadData();
            
        };

    
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        
        let cell:CellVideo = tableView.dequeueReusableCell(withIdentifier: "cell") as! CellVideo
        let videoInfo:M_Video = self.arrayImageData[indexPath.row] as! M_Video
        
        cell.setVideoInfo(videoInfo: videoInfo)
        return cell;
        
        /*
        let cell:CellNeiHanImage = tableView.dequeueReusableCell(withIdentifier: cellImageID) as! CellNeiHanImage;
        
        let imageModel:M_Image = self.arrayImageData[indexPath.row] as! M_Image;
        if (imageModel.url != nil) {
        
         cell.setCellNeiHanImageData(imageData: imageModel);
            
        }else{
        
            print(indexPath.row);
            
        }
       
        return cell;
        */
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
//        let imageModel:M_Image = self.arrayImageData[indexPath.row] as! M_Image;
//        let cellHeight = imageModel.calculateCellHeight();
        
        return 300;
        
    }

}
