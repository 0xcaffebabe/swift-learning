//
//  error-handles.swift
//  swift-learning
//
//  Created by mymac on 2022/4/24.
//

import Foundation

enum RuntimeError: Error{
    case NetWorkError(String)
    case ReadTimeOutError
}

func main(a: Int) throws -> Void {
    // 函数执行结束后才会执行
    defer {
        print("finally2 execute")
    }
    defer {
        print("finally1 execute")
    }
    if a == 1 {
        throw RuntimeError.NetWorkError("unknow host")
    }
}
// 强制忽略异常 发生异常程序就会崩
try! main(a:2)
// 忽略异常 发生异常不会蹦
try? main(a: 1)

do {
    try main(a: 1)
}catch RuntimeError.NetWorkError(let e) {
    print("error", e)
}catch let e as RuntimeError {
    print(e)
}catch {
    print("unknow error")
}

// 使用Nerver代表异常情况
func errorHandle() -> Never {
    print("!!!")
    fatalError()
}
var aaa = 1
guard aaa != 1 else {
    errorHandle()
}
