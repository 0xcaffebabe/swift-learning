//
//  extensions.swift
//  swift-learning
//
//  Created by mymac on 2022/4/19.
//

import Foundation

extension String {
    // 如果扩展类的构造方法 则构造方法必须是便利构造方法
    init(by: String) {
        self.init(by.uppercased())
    }
    
    // 扩展的属性只能是计算型属性
    var length: Int {
        self.count
    }
    
    func firstChar() -> Character {
        return self[self.startIndex]
    }
    
    // 嵌套类型
    struct Range {}
}

let range : String.Range? = nil
