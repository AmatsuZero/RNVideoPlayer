//
//  RNDJAVPlayerResponseModel.swift
//  RNVideoPlayer
//
//  Created by Jiang,Zhenhua on 2018/6/17.
//  Copyright © 2018年 Jiang,Zhenhua. All rights reserved.
//

import UIKit
import MobileCoreServices

private let kContentLengthKey = "kContentLengthKey"
private let kContentTypeKey = "kContentTypeKey"
private let kByteRangeAccessSupported = "kByteRangeAccessSupported"
private let kContentOffsetKey = "kContentOffsetKey"
private let kContentETageKey = "kContentETageKey"

class RNDJAVPlayerResponseModel: NSObject, NSCoding {

    private(set) var contentType: String?
    private(set) var contentLength: Int = 0
    private(set) var requestOffset: Int = 0
    private(set) var Etag = ""
    private(set) var isByteRangeAccessSupported:Bool = false
    
    init(responseHeader: NSDictionary) {
        if let contentRange = responseHeader["content-range"] as? String,
        let range = contentRange.decodeLengthFromContentRange(), let length = Int(range) {
            contentLength = length
        } else if let range = responseHeader["Content-Length"] as? String, let length = Int(range) {
            contentLength = length
        }
        if let value = responseHeader["Content-Type"] as? String,
            let type = UTTypeCreatePreferredIdentifierForTag(kUTTagClassMIMEType, value as CFString, nil)?.takeUnretainedValue() as String? {
            contentType = type
        }
        if let acceptRange = responseHeader["Accept-Ranges"] as? String {
            isByteRangeAccessSupported = acceptRange == "bytes"
        }
        if let tag = responseHeader["Etag"] as? String {
            Etag = tag
        }
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init()
        contentLength = aDecoder.decodeInteger(forKey: kContentLengthKey)
        contentType = aDecoder.decodeObject(forKey: kContentTypeKey) as? String
        isByteRangeAccessSupported = aDecoder.decodeBool(forKey: kByteRangeAccessSupported)
        Etag = aDecoder.decodeObject(forKey: kContentETageKey) as? String ?? ""
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(contentLength, forKey: kContentLengthKey)
        aCoder.encode(contentType, forKey: kContentTypeKey)
        aCoder.encode(isByteRangeAccessSupported, forKey: kByteRangeAccessSupported)
        aCoder.encode(Etag, forKey: kContentETageKey)
    }
    
    override var debugDescription: String {
        return """
        \(NSStringFromClass(RNDJAVPlayerResourceLoader.self))
        Content Length: \(contentLength)
        Content Type: \(contentType ?? "Unknown")
        ByteRange Access Supported: \(isByteRangeAccessSupported)
        """
    }
}

extension String {
    func decodeLengthFromContentRange() -> String? {
        let ranges = components(separatedBy: "/")
        guard !ranges.isEmpty else {
            return nil
        }
        guard let result = ranges.last?.trimmingCharacters(in: .whitespaces),
            result.count > 0 else {
            return nil
        }
        return result
    }
}
