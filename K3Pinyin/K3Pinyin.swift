//
//  k3Pinyin.swift
//  k3Pinyin
//
//  Created by Crazy凡 on 2018/2/24.
//  Copyright © 2018年 Crazy凡. All rights reserved.
//

import Foundation

public struct K3Pinyin {
    fileprivate let base: String
    init(_ base: String) {
        self.base = base
    }
}

public extension K3Pinyin {
    var pinyin: String {
        return pinyin(nil)
    }
    
    func pinyin(_ options: K3PinyinOptions?) -> String {
        func getFirstCharactor(_ source: String) -> String {
            guard base.count > 0 else {
                return ""
            }
            let start = source.startIndex
            let end = source.index(start, offsetBy: 1)
            return String(source[start..<end])
        }
        
        guard base.count > 0 else {
            return ""
        }
        
        var source = base
        if options != nil && (options!.onlyFirstCharactor || options!.onlyFirstLetter) {
            source = getFirstCharactor(source)
        }
        
        let cfString = CFStringCreateMutableCopy(nil, 0, source as CFString)
        CFStringTransform(cfString, nil, kCFStringTransformToLatin, false) // 有音标
        
        guard options != nil else {
            return cfString! as String
        }
        
        let cases = options!
        
        if cases.stripCombiningMarks {
            CFStringTransform(cfString, nil, kCFStringTransformStripCombiningMarks, false) //无音标
        }
        
        var result: String = cfString! as String
        
        if cases.onlyFirstLetter {
            result = getFirstCharactor(result)
        }
        
        if cases.capitalized {
            result = result.capitalized
        }
        
        if cases.allFirstCharactor || cases.stripWhitespace {
            result = result.split(separator: " ").map{
                return cases.allFirstCharactor ? getFirstCharactor(String($0)) : String($0)
                }
                .joined(separator: cases.stripWhitespace ? "" : " ")
        }
        
        return result
    }
}


// MARK: k3PinyinCompatible

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

// MARK: K3PinyinOptions

public typealias K3PinyinOptions = [K3PinyinOption]

public enum K3PinyinOption {
    case none
    case stripCombiningMarks
    case stripWhitespace
    case onlyFirstCharactor
    case onlyFirstLetter
    case allFirstLetter
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
    
    var onlyFirstLetter: Bool {
        return contains{$0 == .onlyFirstLetter}
    }
    
    var allFirstCharactor: Bool {
        return contains{$0 == .allFirstLetter}
    }
    
    var capitalized : Bool {
        return contains{$0 == .capitalized}
    }
}
