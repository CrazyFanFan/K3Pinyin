//
//  k3Pinyin.swift
//  k3Pinyin
//
//  Created by Crazy凡 on 2018/2/24.
//  Copyright © 2018年 Crazy凡. All rights reserved.
//

import Foundation

public extension K3Base where BaseType == String {
    var pinyin: String {
        return pinyin(nil)
    }
    
    func pinyin(_ options: K3PinyinOptions?) -> String {
        
        guard base.count > 0 else {
            return ""
        }
        
        let DEFAULT_SEPARATOR = ""
        
        let cases = options ?? []
        let source = (cases.onlyFirstCharacter || cases.onlyFirstLetter ? "\(base.first!)" : base)
        
        let cfString = CFStringCreateMutableCopy(nil, 0, source as CFString)
        CFStringTransform(cfString, nil, kCFStringTransformToLatin, false)
        
        if cases.stripCombiningMarks {
            CFStringTransform(cfString, nil, kCFStringTransformStripCombiningMarks, false)
        }
        
        var result: String = cfString! as String
        
        guard options != nil else {
            return result.replacingOccurrences(of: " ", with: DEFAULT_SEPARATOR)
        }
        
        if cases.onlyFirstLetter {
            result = "\(result.first!)"
        }
        
        if cases.capitalized {
            result = result.capitalized
        }
        
        let separator = cases.separator ?? DEFAULT_SEPARATOR
        
        if cases.allFirstLetter {
            result = result.split(separator: " ")
                .map { "\($0.first!)" }
                .joined(separator: separator)
        } else {
            result = result.replacingOccurrences(of: " ", with:separator)
        }
        
        return result
    }
    
    func pinyin(_ options: K3PinyinOptions?, completion: @escaping (_ pinyin: String) -> ()) {
        completion(pinyin(options))
    }
}

public extension K3Base where BaseType == NSString {
    var pinyin: String {
        return pinyin(nil)
    }

    func pinyin(_ options: K3PinyinOptions?) -> String {
        return (base as String).k3.pinyin(options)
    }

    func pinyin(_ options: K3PinyinOptions?, completion: @escaping (_ pinyin: String) -> ()) {
        completion(pinyin(options))
    }
}

extension String :K3BaseCompatible {}
extension NSString :K3BaseCompatible {}
// MARK: K3PinyinOptions

public typealias K3PinyinOptions = [K3PinyinOption]

public enum K3PinyinOption {
    case stripCombiningMarks
    case separator(String)
    case onlyFirstCharacter
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
    case (.onlyFirstCharacter,  .onlyFirstCharacter):   return true
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
    
    var onlyFirstCharacter: Bool {
        return contains{$0 <==> .onlyFirstCharacter}
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
