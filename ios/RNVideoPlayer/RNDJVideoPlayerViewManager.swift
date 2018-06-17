//
//  RNDJVideoPlayerViewManager.swift
//  RNVideoPlayer
//
//  Created by Jiang,Zhenhua on 2018/6/17.
//  Copyright © 2018年 Jiang,Zhenhua. All rights reserved.
//

import UIKit

@objc(RNDJVideoPlayerViewManager)
class RNDJVideoPlayerViewManager: RCTViewManager {
    
    @objc
    public enum PlayerVideoGravity: Int {
        case aspectFit = 0, aspectFill
    }
    
    @objc
    public enum PlayerViewState: Int {
        case none = 0, failed, buffering, pause, playing, stopped
    }
}
