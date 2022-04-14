//
//  classs.swift
//  swift-learning
//
//  Created by mymac on 2022/4/14.
//

import Foundation

class Person {
    static var popilation: Int = 700_0000_0000
    var name: String
    var age: Int {
        // 属性观察器 需要注意的是不会在init阶段被调用
        // 将要赋值
        willSet {
            if newValue > 200 {
                print("太太老")
            }
        }
        // 已经赋值了
        didSet {
            if age == 18 {
                print("貌美如花")
            }
            if age > 100 {
                print("太老了")
                age = oldValue
            }
        }
    }
    // 计算属性
    var nameAndAge: String {
        get{
            return name + "," + String(age)
        }
        set(nameAndAge) {
            self.name = nameAndAge.components(separatedBy: ",")[0]
            self.age = Int(nameAndAge.components(separatedBy: ",")[1])!
        }
    }
    var bithYear: Int {
        return 2022 - self.age
    }
    
    // 延迟属性 首次访问时会被计算后缓存下来
    lazy var firstDate: Date = {
        return Date()
    }()
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
    init?(nameAndAge: String) {
        if !nameAndAge.contains(",") {
            return nil
        }
        self.name = nameAndAge.components(separatedBy: ",")[0]
        self.age = Int(nameAndAge.components(separatedBy: ",")[1])!
    }
    
    
    // 类型方法
    static func populationBalanced() -> Bool {
        return popilation <= 7000_0000_0000
    }
}

// 类创建的对象是引用类型
let cxk = Person(name: "cxk", age: 18)
print(cxk.age)
print(Person(nameAndAge: "cxk,18")!.age)

// cxk本身如果是常量 但里面的成员是变量 则可以修改 不像结构体
cxk.age = 22
print(cxk.nameAndAge)
cxk.nameAndAge = "jntm,88"
print(cxk.age)
print(cxk.bithYear)
print(Person.popilation)
print(Person.populationBalanced())
cxk.age = 18
cxk.age = 101
print(cxk.age)
print(cxk.firstDate)
print(cxk.firstDate)
