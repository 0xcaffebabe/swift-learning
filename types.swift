//
//  types.swift
//  swift-learning
//
//  Created by mymac on 2022/4/26.
//

import Foundation

class Animal{}
class Duck: Animal{}
class Dog: Animal{}

let dog: Animal = Dog()
// 类型检查
print(dog is Dog)
// 尝试强制转型 失败返回nil
print((dog as? Dog)!)
