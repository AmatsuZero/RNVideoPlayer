//
//  String+Extensions.swift
//  RNVideoPlayer
//
//  Created by Jiang,Zhenhua on 2018/6/17.
//  Copyright © 2018年 Jiang,Zhenhua. All rights reserved.
//

import UIKit

extension String {
    func toImage() -> UIImage? {
        if let img = UIImage(named: self) {
            return img
        } else {
            return UIImage(contentsOfFile: self)
        }
    }
}
