//
//  K3Compatible.swift
//  KKUIDevice-swift
//
//  Created by K3 on 2018/5/21.
//  Copyright © 2018年 K3. All rights reserved.
//

import Foundation

public class K3Base<BaseType> {
    var base: BaseType
    init(_ base: BaseType) {
        self.base = base
    }
}

public protocol K3BaseCompatible {
    associatedtype K3BaseCompatibleType
    var k3: K3BaseCompatibleType { get }
    static var k3: K3BaseCompatibleType.Type { get }
}

public extension K3BaseCompatible {
    public var k3: K3Base<Self> {
        return K3Base(self)
    }

    public static var k3: K3Base<Self>.Type {
        return K3Base.self
    }
}
