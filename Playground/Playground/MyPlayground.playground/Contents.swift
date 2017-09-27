//: Playground - noun: a place where people can play

import Cocoa

var str = "Hello, playground"

print(str)
print("Hello World")

let url = "www.51qiqiniu.com"
print("我的个人网站：\(url)")

if (url.isEmpty) {
    print("url为空")
} else {
    print("url不为空")
}

enum ClassEn: Int {
    case abc
    case ccc
    case ddd
}

print(ClassEn.ccc.rawValue)
