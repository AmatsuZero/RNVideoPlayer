//
//  RNDJAVPlayerView.swift
//  RNVideoPlayer
//
//  Created by Jiang,Zhenhua on 2018/6/17.
//  Copyright © 2018年 Jiang,Zhenhua. All rights reserved.
//

import UIKit
import AVFoundation

class RNDJAVPlayerView: UIView, PlayerViewProtocol {
    weak var delegate: PlayerViewDelegate?
    
    var url: URL!
    
    var seekTime: TimeInterval = 0
    
    var player: PlayerProtocol = CustomPlayer()
    
    var placeholderImageView: UIImageView?
    
    var state: RNDJVideoPlayerViewManager.PlayerViewState = .none
    
    var playerProgress: CGFloat = 0
    
    var bufferProgress: CGFloat = 0
    
    var currentTime: CGFloat = 0
    
    var totalTime: TimeInterval = 0
    
    var error: NSError?
    
    var videoGravity: RNDJVideoPlayerViewManager.PlayerVideoGravity = .aspectFit
    
    var isPlaythroughOK: Bool = false
    
    func setURL(url: NSURL, isPlayerPlaceholderImage: Bool) {
        
    }
    
    func setURL(url: NSURL, isPlayerPlaceholderImage: Bool, playbackTime: TimeInterval, isPlay: Bool) {
        
    }
    
    func setSeekTime(time: TimeInterval, completionHandler: (Bool) -> Void) {
        
    }
    
    class CustomPlayer: AVPlayer, PlayerProtocol {
        
    }

}
