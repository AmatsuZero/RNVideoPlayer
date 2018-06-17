//
//  RNDJAVPlayerResourceLoader.swift
//  RNVideoPlayer
//
//  Created by Jiang,Zhenhua on 2018/6/17.
//  Copyright © 2018年 Jiang,Zhenhua. All rights reserved.
//

import AVFoundation

class RNDJAVPlayerResourceLoader: NSObject, AVAssetResourceLoaderDelegate {
    let url: URL
    var scheme: String!
    init(url: URL) {
        self.url = url
    }
}
