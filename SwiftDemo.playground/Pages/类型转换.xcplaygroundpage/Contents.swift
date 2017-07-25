//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)


///类型转换在 Swift 中使用 is 和 as 操作符实现。这两个操作符提供了一种简单达意的方式去检查值的类型或者转换它的类型。

class MediaItem{
    var name : String
    
    init(name : String) {
        self.name = name;
    }
}

class Movie : MediaItem{
    var director: String;
    
    init(name :String , director : String) {
        self.director = director;
        super.init(name: name)
    }
}

class Song : MediaItem{
    var artist : String;
    
    init(name : String , artist : String) {
        self.artist = artist;
        super.init(name: name)
    }
}

let library = [
    Movie(name: "qqqq", director: "QQQQ"),
    Song(name: "wwww", artist: "WWWW"),
    Song(name: "rrrrr", artist: "RRRRR"),
    Movie(name: "tttt", director: "TTTTT"),
    Song(name: "lllll", artist: "LLLLL")
]

print(library)
//用类型检查操作符（is）来检查一个实例是否属于特定子类型。若实例属于那个子类型，类型检查操作符返回 true，否则返回 false

var moveCount = 0
var songCount = 0
for item in library{
    if item is Movie {
        moveCount += 1
    }
    if item is Song {
        songCount += 1;
    }
}


//向下转型
//某类型的一个常量或变量可能在幕后实际上属于一个子类。当确定是这种情况时，你可以尝试向下转到它的子类型，用类型转换操作符（as? 或 as!）




