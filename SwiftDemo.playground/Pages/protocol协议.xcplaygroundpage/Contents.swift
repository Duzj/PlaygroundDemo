//: [Previous](@previous)

import Foundation

var str = "Hello, playground"
//协议用var 关键字声明变量属性 , 在声明的属性后面加上 {set  get}来表明属性是可读可写的 ,可读则只用{get}表示
protocol someProtocal{
    var test : Int {get set }
    var test1 :Int {get }
}

//在协议中定义类型属性时，总是使用 static 关键字作为前缀。当类类型遵循协议时，除了 static 关键字，还可以使用 class 关键字来声明类型属性
protocol antherProtocal{
    static var test :Int{get set}
    
}


//协议合成
//有时候需要同时遵循多个协议，你可以将多个协议采用 SomeProtocol & AnotherProtocol 这样的格式进行组合，称为 协议合成（protocol composition）。你可以罗列任意多个你想要遵循的协议，以与符号(&)分隔
protocol aged {
    var age : Int {get}
}

protocol named{
    var name : String {get}
}

struct preson:aged,named{
    var name: String
    var age: Int
}

//someone 遵循 aged 协议和named协议, 只要同事符合这俩个协议,不管什么类型都可以作为参数
func sayHelloTo(someOne : aged&named) -> Void{
    print("hello \(someOne.name) and age is \(someOne.age)")
}

var jhon = preson(name: "json", age: 20)

sayHelloTo(someOne: jhon)


//检查协议一致性


