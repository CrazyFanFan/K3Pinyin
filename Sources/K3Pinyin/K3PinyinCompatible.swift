//
//  K3PingyinC.swift
//  K3Pinyin
//
//  Created by Crazy凡 on 2019/11/23.
//  Copyright © 2019 Crazy凡. All rights reserved.
//

import Foundation

public struct K3Pinyin<BaseType> {
    public var base: BaseType
    init(_ base: BaseType) {
        self.base = base
    }
}

public protocol K3PinyinCompatible {
    associatedtype K3PinyinCompatibleType
    var k3: K3PinyinCompatibleType { get }
    static var k3: K3PinyinCompatibleType.Type { get }
}

public extension K3PinyinCompatible {
    var k3: K3Pinyin<Self> {
        return K3Pinyin(self)
    }

    static var k3: K3Pinyin<Self>.Type {
        return K3Pinyin.self
    }
}
