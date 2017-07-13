//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//

struct people{
    var name = "json"
    init(name:String) {
        self.name = name;
    }
}

var peop =  people(name: "kkk")
print(peop.name)


//结构体的属性可以不赋值进行初始化;但是类中的所有存储属性必须进行初始化
//构造器代理;构造器可以通过调用其它构造器来完成实例的部分构造过程。这一过程称为构造器代理，它能减少多个构造器间的代码重复。
//Swift 为类类型提供了两种构造器来确保实例中所有存储型属性都能获得初始值，它们分别是指定构造器和便利构造器。
//指定构造器是类中最主要的构造器。一个指定构造器将初始化类中提供的所有属性，并根据父类链往上调用父类的构造器来实现父类的初始化。每一个类都必须拥有至少一个指定构造器


//指定构造器的语法

/*
 init(parameters) {
 statements
 }
 */

//便利构造器的语法
//你应当只在必要的时候为类提供便利构造器，比方说某种情况下通过使用便利构造器来快捷调用某个指定构造器，能够节省更多开发时间并让类的构造过程更清晰明了
/*
convenience init(parameters) {
 statements
 }
 */

/*
 指定构造器必须总是向上代理
 便利构造器必须总是横向代理
 */

//枚举类型的可失败构造器

enum TemperatureUnit{
    case Kelvin,Celsius,Fahrenheit;
    
    init?(sysbol: Character){
        switch sysbol {
        case "K":
            self =  .Kelvin;
        case "C":
            self = .Celsius
        case "F":
            self = .Fahrenheit
        default:
            return nil
        }
    }
}

//let dddss = TemperatureUnit(raw)
if let ddd = TemperatureUnit(sysbol: "p"){
    print(ddd)
}
//构造器的继承和重写
//跟 Objective-C 中的子类不同，Swift 中的子类默认情况下不会继承父类的构造器。Swift 的这种机制可以防止一个父类的简单构造器被一个更精细的子类继承，并被错误地用来创建子类的实例
//重写父类的指定构造器 需要override 标识





