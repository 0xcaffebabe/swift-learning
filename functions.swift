//
//  functions.swift
//  swift-learning
//
//  Created by mymac on 2022/4/11.
//

import Foundation

// 有参数有返回值
func say(name: String, age: Int) -> String {
    return "jntm \(name) - \(age)"
}
// 无参数无返回值
func say() {
    print( "ctrl")
}
// 返回多个值
func request() -> (message: String, code: Int) {
    return ("not found", 404)
}
// 调用时 多个参数必须使用 形参: 实参 的形式
print(say(name: "cxk", age: 18))

// 外部与内部参数名
func request(url getUrl: String) {
    print(getUrl)
}
request(url: "http://baidu.com")

// 忽略外部参数名
func request(_ url: String, _ method: String) {}
request("baidu.com", "get")

// 默认参数值和可变参数
// 可变参数不像其他语言 可以不放在最后 可变参数本质上也是一个数组
func request(url: String, method: String = "get", params: String ...){}
request(url: "baidu.com", params: "sds", "dfsds")

// 形参默认都是不可变的
// 使用 inout 关键字 相当于一个指针
func request(url: inout String){
    url = "google.com"
}
var u = "dsds"
request(url: &u)
print(u)

// 函数类型
func submit(runnable: () -> ()) {
    runnable()
}
func print(){
    print("running")
}
// 第一种调用
submit(runnable: print)
// 第二种调用
submit {
    print("hhh")
}
// 传递一个参数
func submit(consumer: (String) -> ()){
    consumer("ikun")
}
submit { params in
    print(params)
}
// 函数式编程三大操作
print([1,2,3].map{ v in v + 1})
print([1,2,3].filter{ v in v % 2 == 0})
print([1,2,3].reduce(10, {x, y in x + y}))

// 返回函数类型
func getFuture() -> () -> () {
    return {
        print("this is future")
    }
}
getFuture()()
// 函数嵌套
func execute(){
    func innerFunc(){
        print("hello world")
    }
    innerFunc()
}
execute()
