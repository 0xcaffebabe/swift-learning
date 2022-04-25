//
//  mermoery-manage.swift
//  swift-learning
//
//  Created by mymac on 2022/4/24.
//

import Foundation

class Pet {
    var owner: Person?
    init(owner: Person) {
        self.owner = owner
    }
    deinit{
        print("pet clean")
    }
}

class Person {
    // 没有加weak时会出现相互引用导致内存泄漏 加了weak后不会增加pet的引用数
    // weak要求类型是可选型并且是var的 如果不满足这个条件 需要使用unowned
    // 但unowned有一定的风险 如果一个unowned被回收后被使用 则会发生致命错误
    weak var pet: Pet?
    init() {
        pet = Pet(owner: self)
    }
    deinit {
        print("person clean")
    }
}

// swift 使用引用计数
var p: Person? = Person()
p = nil
print("111")
