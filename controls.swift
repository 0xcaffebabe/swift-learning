//
//  controls.swift
//  swift-learning
//
//  Created by mymac on 2022/4/7.
//

import Foundation

// for 循环

// 忽略下标
for _ in 1...10 {
    print("gogogo")
}

// while循环
var i = 1
while i <= 10 {
    print(i)
    i += 2
}

// do-while循环

var j = 1
repeat {
    print(j)
    j += 2
}while(j <= 10)

// switch 选择
// 每条case之间不用加break
var rank = "a"
switch rank {
// 同时case多个条件
case "a", "A":
    print("jn")
case "b":
    print("d")
default:
    print("defa")
// 空语句
//default:break
//default:()
}

// switch与范围
switch 5 {
case 1...5:
    print("1-5")
case 6...10:
    print("6-10")
default:()
}
// switch与元组
let response = (200, "OK")
switch response {
case(200, "OK"):
    print("done")
case(200, "GOON"):
    print("continue")
default:()
}
// 在case中解构变量
switch (0,0) {
case(let x, 0):
    print("x is \(x)")
case (0, let y):
    print("y is \(y)")
default:()
}
// 继续往下执行
switch 5 {
case 5:
    print("5")
    // 不会判断下面的case是否满足条件 无脑执行
    fallthrough
case 6:
    print("6")
default:()
}


// 跳出多重循环
outter:
for index in 1...10{
    for index1 in 1...10 {
        if (index == 3 && index1 == 3) {
                print("i got go")
                break outter
        }
    }
}
            
// where类似于SQL 是一种条件限定
switch (3,3){
case let(x,y) where x == y:
    print("x == y")
default:
    ()
}

for case let index in 1...10 where index % 3 == 0 {
    print(index)
}

var num = 0

// 防御式编程的语义化
guard num >= 1 else {
    print("stop")
    exit(0)
}
