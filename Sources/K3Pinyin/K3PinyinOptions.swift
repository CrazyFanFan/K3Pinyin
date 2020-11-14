//
//  K3PinyinOptions.swift
//  K3Pinyin
//
//  Created by Crazy凡 on 2019/11/23.
//  Copyright © 2019 Crazy凡. All rights reserved.
//

import Foundation

public typealias K3PinyinOptions = [K3PinyinOption]

public enum K3PinyinOption: Equatable {
    case stripCombiningMarks
    case separator(String)
    case onlyFirstCharacter
    case allFirstLetter
    case onlyFirstLetter
    case capitalized
}

public extension Collection where Iterator.Element == K3PinyinOption {
    @inlinable
    var stripCombiningMarks: Bool { contains(.stripCombiningMarks) }

    var separator: String? {
        for option in reversed() {
            switch option {
            case .separator(let separator):
                return separator
            default: break
            }
        }
        return nil
    }

    @inlinable
    var onlyFirstCharacter: Bool { contains(.onlyFirstCharacter) }

    @inlinable
    var allFirstLetter: Bool { contains(.allFirstLetter) }

    @inlinable
    var onlyFirstLetter: Bool { contains(.onlyFirstLetter) }

    @inlinable
    var capitalized: Bool { contains(.capitalized) }
}
