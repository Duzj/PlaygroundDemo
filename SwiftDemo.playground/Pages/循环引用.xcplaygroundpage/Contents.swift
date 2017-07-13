//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//在2个类中的循环引用使用weak 或者unowned 来避免循环引用
//无主引用通常都被期望拥有值。不过 ARC 无法在实例被销毁后将无主引用设为nil，因为非可选类型的变量不允许被赋值为nil
//weak 引用在实例被销毁后悔被置为nil


//闭包中的循环引用,使用定义捕获列表 来避免 闭包中的循环引用

class HTMLElement{
    let name :String;
    let text :String?;
    
    lazy var asHTML: (Void) -> String = {
//        [unowned self] in
        if let text = self.text {
            return "<\(self.name)>\(text)</\(self.name)>"
        } else {
            return "<\(self.name) />"
        }
    }
    
//    lazy var asHTML: ((Void) -> String) = {
////        [unowned self] in
//        if let text = self.text {
//            return "<\(self.name)>\(text)</\(self.name)>"
//        } else {
//            return "<\(self.name) />"
//        }
//    }()
    
    init(name : String , text : String? = nil) {
        self.name = name;
        self.text = text;
    }
    
    deinit {
        print("销毁对象");
    }
}
var paragraph: HTMLElement? = HTMLElement(name: "p", text: "hello, world")
print(paragraph!.asHTML())
print(paragraph!.asHTML)

paragraph = nil
