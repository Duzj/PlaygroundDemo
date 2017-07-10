//: Playground - noun: a place where people can play

import UIKit

print("出来")

//extension 可以为已有的类型扩展新的构造器,扩展能为类添加新的便利构造器，但是它们不能为类添加新的指定构造器或析构器。指定构造器和析构器必须总是由原始的类实现来提供。
struct Size{
    var width = 0.0;
    var height = 0.0;
}

struct Point{
    var centerX = 0.0;
    var centerY = 0.0;
}

struct Rect {
    var origin = Point();
    var size = Size();
}


let rect = Rect(origin: Point(centerX: 1.0, centerY: 1.0), size: Size(width: 30, height: 30))

extension Rect{
    init(center : Point , size : Size) {
        let originX = center.centerX - size.width/2;
        let originY = center.centerY - size.height/2;
        self.init(origin: Point(centerX: originX, centerY: originY), size: Size(width: size.width, height: size.height))
    }
}

print(Rect(center: Point(centerX: 40, centerY: 20), size: Size(width: 50, height: 50)))

//可以为已有的类添加新的实例方法和类型方法

extension Int {
    func repetitions(task : () -> Void) -> Void {
        for _ in 0...self{
            task();
        }
    }
}

3.repetitions {
    print("hahah")
}

//结构体和枚举类型中修改 self 或其属性的方法必须将该实例方法标注为 mutating，正如来自原始实现的可变方法一样
extension Int{
     mutating func square() -> Int {
        self = self * self
        return self;
    }
}

var someInt  = 3;

print(someInt.square())

//为已有类型添加新的下标

extension Int{
    subscript (digitIndex : Int ) -> Int{
        var temp = 1;
        for _ in 1 ..< digitIndex {
            temp *= 10;
        }
        return (self/temp) % 10;
    }
}

0123456789[11]




