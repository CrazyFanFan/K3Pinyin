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
        func getFirstLetter(_ source: String) -> String {
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
            source = getFirstLetter(source)
        }
        
        let cfString = CFStringCreateMutableCopy(nil, 0, source as CFString)
        CFStringTransform(cfString, nil, kCFStringTransformToLatin, false) // 有音标
        
        let cases = options ?? []
        
        if cases.stripCombiningMarks {
            CFStringTransform(cfString, nil, kCFStringTransformStripCombiningMarks, false) //无音标
        }
        
        var result: String = cfString! as String
        
        if cases.onlyFirstLetter {
            result = getFirstLetter(result)
        }
        
        if cases.capitalized {
            result = result.capitalized
        }
        
        result = result.split(separator: " ").map {
            return cases.allFirstLetter ? getFirstLetter(String($0)) : String($0)
            }
            .joined(separator: cases.separator ?? "")
        
        return result
    }
    
    func pinyin(_ options: K3PinyinOptions?, completion: @escaping (_ pinyin: String) -> ()) {
        completion(pinyin(options))
    }
}


// MARK: K3PinyinCompatible

public protocol K3PinyinCompatible {
    associatedtype CompatibleType
    var k3: CompatibleType { get }
}


public extension K3PinyinCompatible {
    public var k3: K3Pinyin {
        get { return K3Pinyin(self as! String) }
    }
}

extension String : K3PinyinCompatible {}

extension NSString : K3PinyinCompatible {}

// MARK: K3PinyinOptions

public typealias K3PinyinOptions = [K3PinyinOption]

public enum K3PinyinOption {
    case stripCombiningMarks
    case separator(String)
    case onlyFirstCharactor
    case allFirstLetter
    case onlyFirstLetter
    case capitalized
}

precedencegroup OptionComparisonPrecedence {
    associativity: none
    higherThan: LogicalConjunctionPrecedence
}

infix operator <==> : OptionComparisonPrecedence

// This operator returns true if two `K3PinyinOption` enum is the same, without considering the associated values.
func <==> (lhs: K3PinyinOption, rhs: K3PinyinOption) -> Bool {
    switch (lhs, rhs) {
    case (.stripCombiningMarks, .stripCombiningMarks):  return true
    case (.separator(_),        .separator(_)):         return true
    case (.onlyFirstCharactor,  .onlyFirstCharactor):   return true
    case (.allFirstLetter,      .allFirstLetter):       return true
    case (.onlyFirstLetter,     .onlyFirstLetter):      return true
    case (.capitalized,         .capitalized):          return true
    default:return false
    }
}

public extension Collection where Iterator.Element == K3PinyinOption {
    var stripCombiningMarks: Bool {
        return contains{$0 <==> .stripCombiningMarks}
    }
    
    var separator: String? {
        if let item = reversed().first(where: { $0 <==> .separator("")}),
            case .separator(let separator) = item
        {
            return separator
        }
        return nil
    }
    
    var onlyFirstCharactor: Bool {
        return contains{$0 <==> .onlyFirstCharactor}
    }
    
    var allFirstLetter: Bool {
        return contains{$0 <==> .allFirstLetter}
    }
    
    var onlyFirstLetter: Bool {
        return contains{$0 <==> .onlyFirstLetter}
    }
    
    var capitalized : Bool {
        return contains{$0 <==> .capitalized}
    }
}
