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
    
    func eat(){
        print("person eat")
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

// 继承
class Student: Person {
    var grade = 12
    // 重载构造器
    // 使用required关键字来强制子类必须重写该构造函数
    required init(grade: Int) {
        // 在super.init之前 不能做self初始化之外的操作
        // self.eat()
        super.init(name: "cxk", age: 17)
        self.grade = grade
    }
    // 便利构造函数 通过一定逻辑调用其他构造函数初始化
    // 便利构造器无法调用super.init
    // 如果子类实现了父类所有的指定构造函数，则自动继承父类的所有便利构造函数
    convenience init(){
        self.init(name: "jntm", age: 22)
    }
    // 重写构造器
    override init(name: String, age: Int) {
        super.init(name: name, age: age)
        self.name = name
        self.age = age
    }
    // 重写属性
    override var bithYear: Int {
        return 2023 - self.age
    }
    // 重写方法
    override func eat() {
        print("student eat")
    }
}
// 禁止再继承
final class SuperPerson: Person{}
let student = Student(grade: 12)
print(student.nameAndAge)

// 多态
let persons: [Person] = [SuperPerson(nameAndAge: "s1,14")!, Student(grade: 18), Person(nameAndAge: "s1,32")!]
