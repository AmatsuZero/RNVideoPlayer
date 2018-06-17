//
//  RNDJCacheManager.swift
//  RNVideoPlayer
//
//  Created by Jiang,Zhenhua on 2018/6/17.
//  Copyright © 2018年 Jiang,Zhenhua. All rights reserved.
//

import Foundation

private let CacheDays = 2
private let AVPlayerCacheFolderName = "AVPlayerCache"

class RNDJAVPlayerCacheManager {
    static let shared = RNDJAVPlayerCacheManager()
    private let diskMaxCacheSize = 100 * 1000 * 1000
    private var cachePath = ""
    private var folderSize = 0
    private let ioQueue = DispatchQueue(label: "com.daubert.AVPlayerCache-IO")
    
    init() {
        if let url = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).last {
            cachePath = url.appendingFormat("/%@", AVPlayerCacheFolderName)
            ioQueue.async {
                if !FileManager.default.fileExists(atPath: self.cachePath) {
                    try? FileManager.default.createDirectory(atPath: self.cachePath,
                                                        withIntermediateDirectories: false,
                                                        attributes: nil)
                }
            }
        }
    }
    
    var cacheDirectoryPath: String {
        return ""
    }
    
    var cacheFolderSize: Int {
        return 0
    }
    
    func appendFileSize(_ : Int) {
        
    }
    
    func clearCacheFile(url: URL, completion: () -> Void) {
        
    }
    
    func clearOverdueFiles() {
        let date = Date()
        let fileMgr = FileManager.default
        let pathes = fileMgr.subpaths(atPath: cachePath)
        pathes?.forEach { fileName in
            let path = fileName.appendingFormat("/%@", AVPlayerCacheFolderName)
            if let firstFileInfo = try? fileMgr.attributesOfItem(atPath: path) {
                let modificationDate = firstFileInfo[FileAttributeKey.modificationDate] as! Date
                let calendar = Calendar.current
                let unit = Calendar.Component.day
                let dateComponents = calendar.dateComponents([unit], from: modificationDate, to: date)
                if dateComponents.day! >= CacheDays {
                    try? fileMgr.removeItem(atPath: path)
                } else {
                    folderSize += firstFileInfo[FileAttributeKey.size] as! Int
                }
            }
        }
    }
}

extension String {
    var md5: String {
        let context = UnsafeMutablePointer<CC_MD5_CTX>.allocate(capacity: 1)
        var digest = Array<UInt8>(repeating:0, count:Int(CC_MD5_DIGEST_LENGTH))
        CC_MD5_Init(context)
        CC_MD5_Update(context, self, CC_LONG(self.lengthOfBytes(using: String.Encoding.utf8)))
        CC_MD5_Final(&digest, context)
        context.deallocate()
        var hexString = ""
        for byte in digest {
            hexString += String(format:"%02x", byte)
        }
        return hexString
    }
}

extension URL {
    var cacheToken: String {
        return self.path.md5
    }
}
