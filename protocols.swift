//
//  protocols.swift
//  swift-learning
//
//  Created by mymac on 2022/4/21.
//

import Foundation

protocol Runnable {
    
    // 协议的属性
    var threadName: String {get set}
    
    // 协议的方法
    func run()
}
struct Task: Runnable {
    var threadName = "test"
    func run() {
        print("running")
    }
    
}

// 只有类才能实现该协议
protocol Future: AnyObject {}
class MyFuture: Future{}

// 如果既需要继承有需要协议 则继承类要放在协议的前面
//class Callable: NSObject, Future {}

// 类型别名
typealias Length = Int
let length: Length = 123

// 类型参数化
protocol WeightCalacuable {
    associatedtype WightType
    var weight: WightType {get}
}

class Phone: WeightCalacuable {
    typealias WightType = Double
    var weight = 0.114
}
class Boat: WeightCalacuable {
    typealias WightType = Int
    var weight = 100_0000
}

// 扩展协议
protocol Callable: Runnable{
    func call() -> Int
    
}
// 协议的默认实现
extension Callable {
    func run() {
        let _ = self.call()
    }
}
// 限定扩展：只有同时实现Callable和WeightCalacuable才应用
extension Callable where Self: WeightCalacuable {
    func run() {
        print("calc run")
    }
}
struct Computer: Callable, WeightCalacuable {
    var weight: Int
    func call() -> Int {
        return 0
    }
    
    typealias WightType = Int
    var threadName: String
    
}
Computer(weight: 1, threadName: "test").run()
// 协议聚合：同时实现两种协议的参数才被接受
func run(computeable: Callable & CustomStringConvertible){}
// 泛型约束
func topOne<T: Comparable & CustomStringConvertible>(seq: [T]) -> T {
    let ans = seq.sorted()[0]
    print(ans.description)
    return ans
}
print(topOne(seq: [67,6,4,23,45,2,1]))

// 协议的可选方法
@objc protocol Service {
    @objc optional func start()
}
class UserService: Service{}
let service: Service = UserService()
if let start = service.start {
    start()
}
