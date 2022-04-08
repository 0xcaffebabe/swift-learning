//
//  strings.swift
//  swift-learning
//
//  Created by mymac on 2022/4/8.
//

import Foundation

var str = "cxk"

// 判断是否是空字符串
print(str.isEmpty)
// 插值表达式
print("name: \(str)")

// 字符串拼接 转义字符等同类C语言


// 显式声明单个字符（底层采用unicode存储）
let single: Character = "中"
let single1: Character = "🐶"
// 遍历字符
for c in "中文大萨达🇨🇳" {
    print(c)
}
// 字符串是可变的
str.append("jntm")
print(str)

// 字符串长度
print(str.count)


// 字符串索引
// [startIndex, endIndedx)
var s = "我如果付费"
// 需要根据startIndex 或者endIndex 计算
print(s[s.index(s.startIndex, offsetBy: 2)]) // 果 在第一个索引往后的2个
print(s[s.index(before: s.endIndex)]) // 费 在最后一个索引之前的一个


// 方法
print(s.uppercased())
print(s.lowercased())
print(s.capitalized) // 将每个单词转为首字母大写
print(s.contains("如果"))
print(s.hasPrefix("我 "))
print(s.hasSuffix("费"))

// NSString
print(NSString(format: "%.2f", 1.0 / 3.0) as String)
// 截取
print(NSString("微分去问问").substring(with: NSMakeRange(1, 3)))
// 替换两边的字符
print(NSString("-a-").trimmingCharacters(in: CharacterSet(charactersIn: "-")))
