//
//  k3Pinyin.swift
//  k3Pinyin
//
//  Created by Crazy凡 on 2018/2/24.
//  Copyright © 2018年 Crazy凡. All rights reserved.
//

import Foundation

//public struct StringProxy {
//    fileprivate let base: String
//    init(proxy: String) {
//        base = proxy
//    }
//}
//
//extension String: KingfisherCompatible {
//    public typealias CompatibleType = StringProxy
//    public var kf: CompatibleType {
//        return StringProxy(proxy: self)
//    }
//}
//
//extension StringProxy {
//    var md5: String {

private var K3PinyinOptionsKey: Void?

public struct K3Pinyin {
    fileprivate let base: String
    var options : K3PinyinOptions?
    init(_ base: String) {
        self.base = base
    }
}

public protocol k3PinyinCompatible {
    associatedtype CompatibleType
    var k3: CompatibleType { get }
}


public extension k3PinyinCompatible {
    public var k3: K3Pinyin {
        get { return K3Pinyin(self as! String) }
    }
}

extension String : k3PinyinCompatible {
}

extension K3Pinyin {
    var pinyin: String {
        let cfString = CFStringCreateMutableCopy(nil, 0, base as CFString)
        CFStringTransform(cfString, nil, kCFStringTransformToLatin, false) // 有音标
        CFStringTransform(cfString, nil, kCFStringTransformStripCombiningMarks, false) //无音标
        return cfString! as String
    }
}

public typealias K3PinyinOptions = [K3PinyinOption]

public enum K3PinyinOption {
    case none
    case stripCombiningMarks
    case stripWhitespace
    case onlyFirstCharactor
    case allFirstCharactor
    case capitalized
}

public extension Collection where Iterator.Element == K3PinyinOption {
    var stripCombiningMarks: Bool {
        return contains{$0 == .stripCombiningMarks}
    }
    
    var stripWhitespace: Bool {
        return contains{$0 == .stripWhitespace}
    }
    
    var onlyFirstCharactor: Bool {
        return contains{$0 == .onlyFirstCharactor}
    }
    
    var allFirstCharactor: Bool {
        return contains{$0 == .allFirstCharactor}
    }
    
    var capitalized : Bool {
        return contains{$0 == .capitalized}
    }
}
