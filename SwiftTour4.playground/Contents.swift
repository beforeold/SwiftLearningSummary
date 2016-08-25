//: Playground - noun: a place where people can play

import Cocoa

var str = "Hello, playground"

// 类的属性的声明和常量变量一样唯一的区别就是它们的上下文不同
// 方法的声明和函数一样

class Shape {
    var numberOfSlides = 0
    let someConst = 8
    
    func simpleDescription() -> String {
        return "A shape with \(numberOfSlides) slides."
    }
    
    func passParam(param: Int) -> Int {
        return 2*param
    }
}

var shape = Shape()
shape.numberOfSlides = 4
shape.simpleDescription()
shape.passParam(33)

class NamedShape {
    var numberOfSlides = 0
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    func simpleDescription() -> String {
        return "A shape with \(numberOfSlides) slides. name-> \(name)"
    }
}

var nameShape = NamedShape(name: "Good");
nameShape.simpleDescription()

class Square : NamedShape {
    var sideLength: Double
    init(sideLength: Double, name: String) {
        self.sideLength = sideLength;
        super.init(name: name)
        numberOfSlides = 4;
    }
    
    func area() -> Double {
        return sideLength * sideLength
    }
    
    override func simpleDescription() -> String {
        return "A square with sides of length \(sideLength)"
    }
}

let test = Square(sideLength: 5.2, name: "MyTestSqaure")
test.area()
test.simpleDescription()

class Circle : NamedShape {
    var radius: Double = 0.0
    
    init(radius: Double, name: String) {
        self.radius = radius
        super.init(name: name)
    }
    
    func area() -> Double {
        return M_PI * radius * radius
    }
    
    override func simpleDescription() -> String {
        return "Cicle with name \(name) raidus \(radius)"
    }
    
}

let circle = Circle(radius: 3.2, name: "MyCircle")
circle.area()
circle.simpleDescription()


class EquilateralTriangle : NamedShape {
    var sideLength: Double = 0.0
    
    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSlides = 3
    }
    
    var perimeter: Double {
        get {
            return 3.0*sideLength
        }set {
            sideLength = newValue / 3.0
        }
    }
    
    override func simpleDescription() -> String {
        return "An equilateralTriangle with sides of length \(sideLength)"
    }
    
}

var triangle = EquilateralTriangle(sideLength: 3, name: "Tri")
triangle.perimeter
triangle.perimeter = 9.9
triangle.sideLength


class TriangleAndSquare {
    var triangle: EquilateralTriangle {
        willSet {
            square.sideLength = newValue.sideLength
        }
    }
    
    var square : Square {
        willSet {
            triangle.sideLength = newValue.sideLength
        }
    }
    
    init(size: Double, name: String) {
        square = Square(sideLength: size, name: name);
        triangle = EquilateralTriangle(sideLength: size, name: name)
    }
}

var triangleAndSquare = TriangleAndSquare(size: 36, name: "TS")
triangleAndSquare.square.sideLength
triangleAndSquare.triangle.sideLength
triangleAndSquare.square = Square(sideLength: 24, name: "SS")
triangleAndSquare.triangle.sideLength


// optional
let optionalSquare: Square? = nil //Square(sideLength: 33, name: "opSq")
let sideLength = optionalSquare?.sideLength



class __ {
    var __: Int = 0;
}

extension Int {
    var __: Int {
        return self
    }
}

let ___ = 3

var i = __().__.__
print(i)


