//: Playground - noun: a place where people can play

//import UIKit

let PI: Double = 3.14

func msg() -> Int
{
    print("type이 틀렸습니다")
    return -1
}

func square( type: String, width: Int ) -> Int
{
    
    var returnValue: Int = 0
    if type ==  "A" {
        returnValue = width * width
    }else if type == "p"
    {
        returnValue = width * 4
    } else
    {
//        print("type이 틀렸습니다.")
//        return 0 // 에러처리할 경우: -1도 가능 뭐든지 return을 해야함
        msg()
    }
    return returnValue
}

var areaSquare: Int = square(type:"A", width: 28)
print(areaSquare)

// Rectangle
func rectangle( type: String, length: Int, width: Int) -> Int
{
    var rectangleValue: Int = 0
    if type == "A"{
        rectangleValue = length * width
    } else if type == "P" {
        rectangleValue = (2*length) + (2*width)
    } else
    {
       msg()
    }
    return rectangleValue
}

// circle
func circle(type: String, radius: Double) -> Double
{
    var circleValue: Double = 0
    if type == "A" {
        circleValue = radius * radius
    } else if type == "C" {
        circleValue = 2*PI*radius
    }
    else
    {
        msg()
    }
    return circleValue
}

// triangle
func halfHeight (h: Int) -> Int
{
    var halfH = h/2 //(1/2)*h -> 1/2: 나머지가 0이고  이것부터 계산해서
    // Int 정수형만 나오므로 0으로 나옴
    return halfH

}
func trigangle(type: String, base: Int, height: Int ) -> Int
{
    var triangleValue: Int = 0
    if type == "A"{
        triangleValue = halfHeight(h: height)*base
    } else {
        msg()
    }
    return triangleValue
}

print(trigangle(type: "A", base: 4, height: 8))

// trapezoid
func trapezoid(type: String, height: Int, base: Int, alpha: Int) -> Int
{
    var trapezoidValue: Int = 0
    if type == "A"{
        trapezoidValue = halfHeight(h: height)*(base+alpha)
    } else
    {
      msg()
    }
    return trapezoidValue
    
}
print(trapezoid(type: "A", height: 14, base: 6, alpha: 6))

// cube
func cube(type: String, width: Int) -> Int
{
    var cubeValue: Int = 0
    if type == "V"
    {
        cubeValue = width*width*width
    }else
    {
        msg()
    }
    return cubeValue
}

// rectangular solid
func rectangularS(type: String,width: Int, height: Int, length: Int) -> Int
{
    var rectangularSolidValue: Int = 0
    if type == "V" {
        rectangularSolidValue = length*width*height
    } else {
        msg()
    }
    return rectangularSolidValue
}

// circular cylinder
func circularCylinder(type: String, radius: Double, height: Double) -> Double
{
    var circularCValue: Double = 0
    if type == "V"
    {
        circularCValue = PI*radius*radius*height
    }
    else
    {
        msg()
    }
    return circularCValue
}
// sphere
func sphre(type: String, radius: Double) -> Double
{
    var sphreValue: Double = 0
    if type == "V"
    {
        sphreValue = PI*radius*radius*radius*4/3
    }
    else
    {
        msg()
    }
    return sphreValue
}

// cone
func cone(type: String, radius: Double, height: Double) -> Double
{
    var coneValue: Double = 0
    if type == "V"
    {
        coneValue = PI*radius*radius*height/3
    }
    else
    {
        msg()
    }
    return coneValue
}
print(cone(type: "V", radius: 2, height: 5))
