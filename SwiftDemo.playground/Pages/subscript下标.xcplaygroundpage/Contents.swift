//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)


//下标允许你通过在实例名称后面的方括号中传入一个或者多个索引值来对实例进行存取。语法类似于实例方法语法和计算型属性语法的混合。与定义实例方法类似，定义下标使用subscript关键字，指定一个或多个输入参数和返回类型；与实例方法不同的是，下标可以设定为读写或只读。这种行为由 getter 和 setter 实现，有点类似计算型属性

//只读下标
struct TimesTable{
    var multipiler : Int;
    subscript (index : Int) -> Int{
        return multipiler * index
    }
}

var threeTimesTable = TimesTable(multipiler: 4)
print(threeTimesTable[7])


//下标可以接受任意数量的入参，并且这些入参可以是任意类型。下标的返回值也可以是任意类型。下标可以使用变量参数和可变参数，但不能使用输入输出参数，也不能给参数设置默认值


struct Matrix{
    let rows,columns:Int;
    var grid : [Double];
    init(rows:Int , columns :Int) {
        self.rows = rows;
        self.columns = columns;
        self.grid = Array(repeating: 0.0, count: rows*columns)
    }
    
    func indexIsValidForRow(row:Int , column : Int) -> Bool {
        return row>=0 && row<rows && column>=0 && column<columns;
    }
    
    subscript(row:Int ,column : Int) -> Double{
        get{
            assert(indexIsValidForRow(row: row, column: column),"index out of range")
            return grid[(row * column) + column];
        }
        set{
            assert(indexIsValidForRow(row: row, column: column),"index out of range")
            grid[(row*column) + column] = newValue;
        }
    }
}

var matrix = Matrix(rows: 4, columns: 4)

matrix[0,3] = 20;

print(matrix)
