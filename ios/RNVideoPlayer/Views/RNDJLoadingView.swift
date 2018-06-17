//
//  RNDJLoadingView.swift
//  RNVideoPlayer
//
//  Created by Jiang,Zhenhua on 2018/6/17.
//  Copyright © 2018年 Jiang,Zhenhua. All rights reserved.
//

import UIKit

class RNDJLoadingView: UIView {

    @objc
    enum AnimationType: Int {
        case white = 0, black
    }

    var isAnimating: Bool = false
    private let _imageOuterView = UIImageView()
    var imageOuter: String! {
        didSet {
            _imageOuterView.image = imageOuter.toImage()
        }
    }
    private let _imageInnerView = UIImageView()
    var imageInner: String! {
        didSet {
            _imageInnerView.image = imageInner.toImage()
        }
    }
    var isHalf = false
    
    func start() {
        
    }
    
    func stop() {
        
    }
}
