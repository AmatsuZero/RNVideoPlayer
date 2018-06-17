//
//  RNDJCacheModel.swift
//  RNVideoPlayer
//
//  Created by Jiang,Zhenhua on 2018/6/17.
//  Copyright © 2018年 Jiang,Zhenhua. All rights reserved.
//

import UIKit

class RNDJCacheModel: NSObject {
    enum CacheState: Int {
        case none, finish, prefetch
    }
    var state: CacheState
    var cachePath: String?
    init(state: CacheState) {
        self.state = state
    }
}
