//
//  RNVideoPlayer.swift
//  RNVideoPlayer
//
//  Created by Jiang,Zhenhua on 2018/6/17.
//  Copyright © 2018年 Jiang,Zhenhua. All rights reserved.
//
import AVFoundation

@objc(RNDJVideoPlayer)
class RNDJVideoPlayerView: UIView, PlayerViewDelegate {
    var videoGravity = RNDJVideoPlayerViewManager.PlayerVideoGravity.aspectFit
    private var _placeholderImageView: UIImageView?
    var placeHolder: String? {
        didSet {
            guard let value = placeHolder else { return }
            _placeholderImageView?.image = value.toImage()
        }
    }
    var isFirstFramePlayed = false
    var model: PlayerModelProtocol?
    var currentCacheModel: RNDJPlayerClarityModel?
    
    @objc(play)
    func play() {
        
    }
    
    @objc(pause)
    func pause() {
        
    }
    
    @objc(stop)
    func stop() {
        
    }
    
    @objc(playWithDictionary:isPlay:)
    func play(dict: NSDictionary, isPlay: Bool) {
        
    }
    
    @objc(replayWithDictionary:)
    func replay(dict: NSDictionary) {
        
    }
}
