//
//  RNDJPlayerModel.swift
//  RNVideoPlayer
//
//  Created by Jiang,Zhenhua on 2018/6/17.
//  Copyright © 2018年 Jiang,Zhenhua. All rights reserved.
//

import UIKit

@objc(RNDJPlayerModelProtocol)
protocol PlayerModelProtocol: class, NSObjectProtocol {
    @objc var cover: String? { get set }
    @objc var videoPlayUrl: String? { get set }
    @objc var videoTotalTime: TimeInterval { get set }
    @objc var vid: String? { get set }
    @objc var clarity: String? { get set }
}

class RNDJPlayerModel: NSObject, PlayerModelProtocol {
    var cover: String?
    var videoTotalTime: TimeInterval = 0
    var vid: String?
    lazy var clarity: String? = {
        guard !multiClarity.isEmpty else { return nil }
        _currentClarity = multiClarity.first
        return _currentClarity!.clarity
    }()
    var videoRatio: Float = 0
    var multiClarity = [RNDJPlayerClarityModel]()
    private var _currentClarity: RNDJPlayerClarityModel?
    lazy var videoPlayUrl: String? = {
        guard !multiClarity.isEmpty else { return nil }
        _currentClarity = multiClarity.first
        return _currentClarity!.videoPlayUrl
    }()
}

class RNDJPlayerClarityModel: NSObject, PlayerModelProtocol {
    var cover: String?
    var videoTotalTime: TimeInterval = 0
    var vid: String?
    var clarity: String?
    var title = ""
    var videoSize: Int64 = 0
    var videoPlayUrl: String?
}
