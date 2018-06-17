//
//  PlayerViewProtocol.swift
//  RNVideoPlayer
//
//  Created by Jiang,Zhenhua on 2018/6/17.
//  Copyright © 2018年 Jiang,Zhenhua. All rights reserved.
//

import UIKit

@objc(RNDJPlayerViewDelegate)
protocol PlayerViewDelegate: class, NSObjectProtocol {
    @objc optional var onBufferProgressChanged: RCTBubblingEventBlock? { get set }
    @objc optional var onProgressChanged: RCTBubblingEventBlock? { get set }
    @objc optional var onStateChanged: RCTBubblingEventBlock? { get set }
}

@objc(RNDJPlayerViewProtocol)
protocol PlayerViewProtocol: class, NSObjectProtocol {
    weak var delegate: PlayerViewDelegate? { get set }
    var url: URL! { get set }
    var seekTime: TimeInterval { get set }
    var player: PlayerProtocol { get }
    var placeholderImageView: UIImageView? { get }
    var state: RNDJVideoPlayerViewManager.PlayerViewState { get }
    var playerProgress: CGFloat { get }
    var bufferProgress: CGFloat { get }
    var currentTime: CGFloat { get }
    var totalTime: TimeInterval { get }
    var error: NSError? { get }
    var videoGravity: RNDJVideoPlayerViewManager.PlayerVideoGravity { get }
    var isPlaythroughOK: Bool { get }
    
    @objc(setURL:isPlayerPlaceholderImage:)
    func setURL(url: NSURL, isPlayerPlaceholderImage: Bool)
    
    @objc(setURL:isPlayerPlaceholderImage:playbackTime:isPlay:)
    func setURL(url: NSURL, isPlayerPlaceholderImage: Bool, playbackTime: TimeInterval, isPlay: Bool)
    
    @objc(setSeekTime:completionHandler:)
    func setSeekTime(time: TimeInterval, completionHandler: (Bool) -> Void)
}

@objc(RNDJPlayerProtocol)
protocol PlayerProtocol: class, NSObjectProtocol {
    @objc optional func prepareToPlay()
    @objc optional func play()
    @objc optional func pause()
    @objc optional func stop()
    @objc optional func reset()
}
