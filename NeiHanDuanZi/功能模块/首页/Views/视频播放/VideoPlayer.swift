//
//  VideoPlayer.swift
//  VideoPlayer
//
//  Created by 陈东芝 on 16/12/3.
//  Copyright © 2016年 陈东芝. All rights reserved.
//

import UIKit
import AVFoundation


enum PlayerStates{

case PlayerStatesUnknown,
     PlayerStatesReadyToPlay,
     PlayerStatesFailed
    
}


@IBDesignable
class VideoPlayer: UIView {

    var player : AVPlayer!;
    var playerItem : AVPlayerItem!;
    var playerLayer : AVPlayerLayer!;
    var PlayerStates : PlayerStates!;
    
    
    @IBOutlet weak var BTN_PlayOrStop: UIButton!
    @IBOutlet weak var IV_Cover: UIImageView!
    @IBOutlet weak var LB_AllTime: UILabel!
    @IBOutlet weak var S_Progress: UISlider!
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var LB_PlayTime: UILabel!
    
    
    @IBAction func BTN_FullOrMin(_ sender: Any) {
    }
    
    
    @IBAction func BTN_PlayOrStop(_ sender: Any) {
        
           palyer();
        
    }
    
    
    override init(frame:CGRect){
    
        super.init(frame: frame);
        
        initialFromXib()
        
       
    }
    
    required init?(coder aDecoder: NSCoder) {
        //fatalError("init(coder:) has not been implemented")
        
        super.init(coder: aDecoder)

          initialFromXib()
        
        
    }
    
    func setPlayerState(state:PlayerStates){
    
        switch state {
            
        case .PlayerStatesReadyToPlay:
            
            self.BTN_PlayOrStop.isSelected = true;
            self .setVideoInfo();
            
            break
        case .PlayerStatesUnknown:
            
            
            break
        case .PlayerStatesFailed:
            
            
            break
            
        }
        
        self.PlayerStates = state;
        
    }
    
    
    //MARK: - TEST -
    
    func palyer() {
        
        playerItem = AVPlayerItem.init(url: URL.init(string: "http://ic.snssdk.com/neihan/video/playback/?video_id=34f1f4fd37c04e14a1d4eb5cfbcb9ff5&quality=360p&line=0&is_gif=0")!)
        player = AVPlayer.init(playerItem: playerItem)
        playerLayer = AVPlayerLayer.init(player: player);
        playerLayer.videoGravity = AVLayerVideoGravityResizeAspect;
        playerLayer.frame = self.bounds;
        self.contentView.layer .insertSublayer(playerLayer, at: 0);
        
          addPlayerKVC();
        
        player.play();
        
       
        
    }

    
    //MARK: -initXIB -
    
    func initialFromXib() {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: "VideoPlayer", bundle: bundle)
        contentView = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        contentView.frame = bounds
    
        addSubview(contentView)
        
        
        self.S_Progress.setThumbImage(UIImage.init(named: "redpoint.png"), for: .normal);
        self.S_Progress.setThumbImage(UIImage.init(named: "redpoint.png"), for: .highlighted);
    
        
    }
    
    
    //MARK: -PlayerKVC-
    func addPlayerKVC(){
    
         playerItem .addObserver(self, forKeyPath: "status", options: .new, context: nil);
         playerItem .addObserver(self, forKeyPath: "loadedTimeRanges", options: .new, context: nil);
         playerItem .addObserver(self, forKeyPath: "playbackBufferEmpty", options: .new, context: nil);
        
    }
    
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
    
        if(keyPath == "status"){
        
            let status:AVPlayerItemStatus = playerItem.status;
            print(playerItem.duration);
            
            switch status {
                
                
            case .unknown :
                
                self.setPlayerState(state: .PlayerStatesUnknown)
                
                break
            case .readyToPlay :
                
                  self.setPlayerState(state: .PlayerStatesReadyToPlay)
                  
                break
            case .failed :
                
                  self.setPlayerState(state: .PlayerStatesFailed)
                  
                break
                
            
            }
            
        }else if(keyPath == "loadedTimeRanges"){
        
            self.test();
            
        
        }else if(keyPath == "playbackBufferEmpty"){
        
        
        }
    }
    
    func setVideoInfo(){
    
        let time:CMTime = playerItem.duration;
        
        let totalSecond = time.value/Int64(time.timescale);
        
        self.LB_AllTime.text = self.convertIime(totalSecond: NSInteger(totalSecond));
        
    }
    
    
    func test(){
    
        let ranges:[NSValue] = (player .currentItem?.loadedTimeRanges)!
        
        let timeRange:CMTimeRange = ranges[0].timeRangeValue;
        
        print(timeRange.start,timeRange.duration);
        
    }
    
    
    //秒 -> 分时转换
    func convertIime(totalSecond:NSInteger) -> String{
    
        let date:NSDate = NSDate.init(timeIntervalSince1970: TimeInterval(totalSecond));
        
        let dateFormatter:DateFormatter = DateFormatter.init();
        
        if(totalSecond/3600 >= 1){
        
            dateFormatter .dateFormat = "HH:mm:ss";
            
        }else{
        
            dateFormatter.dateFormat = "mm:ss";
            
        }
        
        let time = dateFormatter .string(from: date as Date);
        
        return time;
        
    }
    
    
}
