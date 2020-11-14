//
//  k3Pinyin.swift
//  k3Pinyin
//
//  Created by Crazy凡 on 2018/2/24.
//  Copyright © 2018年 Crazy凡. All rights reserved.
//

import Foundation

public let defaultSeparator = ""
private let systemDefaultSeparator = " "

public extension K3Pinyin where BaseType == String {
    var pinyin: String {
        return pinyin(nil)
    }

    func pinyin(_ options: K3PinyinOptions?) -> String {
        // skip empty string
        guard !base.isEmpty else { return "" }

        let cases = options ?? []

        // get only first char when case onlyFirst...
        var source = base
        if cases.onlyFirstCharacter || cases.onlyFirstLetter {
            source = String(base.prefix(1))
        }

        // get pinyin
        let cfString = CFStringCreateMutableCopy(nil, 0, source as CFString)
        CFStringTransform(cfString, nil, kCFStringTransformToLatin, false)

        // just replace `Separator` if options is nil
        guard options != nil else {
            return (cfString! as String).replacingOccurrences(of: systemDefaultSeparator, with: defaultSeparator)
        }

        // string combining marks
        if cases.stripCombiningMarks {
            CFStringTransform(cfString, nil, kCFStringTransformStripCombiningMarks, false)
        }

        var result: String = cfString! as String

        if cases.onlyFirstLetter {
            if let char = result.first {
                result = String(char)
            } else {
                result = ""
            }
        }

        if cases.capitalized {
            result = result.capitalized
        }

        let separator = cases.separator ?? defaultSeparator

        if cases.allFirstLetter {
            result = result.split(separator: Character(systemDefaultSeparator))
                .compactMap { $0.prefix(1) }
                .joined(separator: separator)
        } else {
            result = result.replacingOccurrences(of: systemDefaultSeparator, with: separator)
        }

        return result
    }

    func pinyin(_ options: K3PinyinOptions?, completion: @escaping (_ pinyin: String) -> Void) {
        completion(pinyin(options))
    }
}

public extension K3Pinyin where BaseType == NSString {
    var pinyin: String {
        return pinyin(nil)
    }

    func pinyin(_ options: K3PinyinOptions?) -> String {
        return (base as String).k3.pinyin(options)
    }

    func pinyin(_ options: K3PinyinOptions?, completion: @escaping (_ pinyin: String) -> Void) {
        completion(pinyin(options))
    }
}

extension String: K3PinyinCompatible {}
extension NSString: K3PinyinCompatible {}
