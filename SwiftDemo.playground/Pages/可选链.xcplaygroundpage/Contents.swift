//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)

//可选链式调用是一种可以在当前值可能为nil的可选值上请求和调用属性、方法及下标的方法。如果可选值有值，那么调用就会成功；如果可选值是nil，那么调用将返回nil。多个调用可以连接在一起形成一个调用链，如果其中任何一个节点为nil，整个调用链都会失败，即返回nil

class Person {
    var residence : Residence?
    
}

open class Room{
    let name :String
    init(name : String) {
        self.name = name;
    }
}

class Residence{
    var rooms : [Room] = [Room]()
    
    var numberRooms : Int {
       return  rooms.count;
    }
    
    subscript(i : Int) -> Room{
        get {
            return rooms[i]
        }
        set{
            rooms[i] = newValue
        }
    }
    
    func numbersOfRooms() {
        print("the nuber of rooms in residence is \(self.numberRooms)")
    }
    
    var address : Address?
}



//let  郭建坡 = Person();
//郭建坡.residence = Residence();
//if let roomCount = 郭建坡.residence?.numberRooms {
//    print("John's residence has \(roomCount) room(s).")
//} else {
//    print("Unable to retrieve the number of rooms.")
//}



class Address{
    var buildingName : String?
    var buildingNum :String?
    var street : String?
    func buildingIdentifier() -> String? {
        if buildingName != nil {
            return buildingName;
        }else if ((buildingNum != nil) &&
            (street != nil)){
//            return "\(String(describing: street)) \(String(describing: buildingNum))"
            return String(format: "%@ %@", self.buildingNum! , self.street!);
        }else{
            return nil;
        }
    }
    
}


let john = Person();

if let roomcount = john.residence?.numberRooms{
    print(roomcount);
}else{
    print("meiy ")
}

//可选链 失败(nil) 时 等号 右边的不会被执行
let someAddress = Address()
someAddress.street = "长安街"
someAddress.buildingNum = "23号"
john.residence?.address = someAddress;

if let firstRoomName = john.residence?[0].name{
    print(firstRoomName);
}else{
    print("no room")
}

//这次赋值同样会失败，因为residence目前是nil
john.residence?[0] = Room(name: "白宫")

let johnHouse = Residence();
johnHouse.rooms.append(Room(name: "gugong"))
johnHouse.rooms.append(Room(name: "heigong"))

john.residence = johnHouse;

if let firstRoomName = john.residence?[0].name {
    print("The first room name is \(firstRoomName).")
} else {
    print("Unable to retrieve the first room name.")
}


//访问可选类型的下标
//如果下标返回可选类型值，比如 Swift 中Dictionary类型的键的下标，可以在下标的结尾括号后面放一个问号来在其可选返回值上进行可选链式调用
var testscores = ["devie":[33,44,55] , "jonh" : [99,08,44]]
testscores["devie"]?[0] = 88;

// ?? 操作符 标识 前面的值不为空 就返回前面的值,如果前面的值为nil 就返回后面的值
var level : Int? = 0;
var startLevel = 1;
let le = level ?? startLevel


let name = ["王小二","张三","李四","王二小"]

name.forEach {
    switch $0{
    case let x where x .hasPrefix("王"):
        print("\(x)是个程序员")
    default:
        print("你好, \($0)")
    }
}




