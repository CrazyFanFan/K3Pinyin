//
//  K3PinyinOptions.swift
//  K3Pinyin
//
//  Created by Crazy凡 on 2019/11/23.
//  Copyright © 2019 Crazy凡. All rights reserved.
//

import Foundation

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

infix operator <==>: OptionComparisonPrecedence

/// This operator returns true if two `K3PinyinOption` enum is the same,
/// without considering the associated values.
func <==> (lhs: K3PinyinOption, rhs: K3PinyinOption) -> Bool {
    switch (lhs, rhs) {
    case (.stripCombiningMarks, .stripCombiningMarks): return true
    case (.separator, .separator): return true
    case (.onlyFirstCharacter, .onlyFirstCharacter): return true
    case (.allFirstLetter, .allFirstLetter): return true
    case (.onlyFirstLetter, .onlyFirstLetter): return true
    case (.capitalized, .capitalized): return true
    default: return false
    }
}

public extension Collection where Iterator.Element == K3PinyinOption {
    var stripCombiningMarks: Bool {
        return contains { $0 <==> .stripCombiningMarks }
    }

    var separator: String? {
        if let item = reversed().first(where: { $0 <==> .separator("") }),
            case .separator(let separator) = item {
            return separator
        }
        return nil
    }

    var onlyFirstCharacter: Bool {
        return contains { $0 <==> .onlyFirstCharacter }
    }

    var allFirstLetter: Bool {
        return contains { $0 <==> .allFirstLetter }
    }

    var onlyFirstLetter: Bool {
        return contains { $0 <==> .onlyFirstLetter }
    }

    var capitalized: Bool {
        return contains { $0 <==> .capitalized }
    }
}
