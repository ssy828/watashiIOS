//: A UIKit based Playground for presenting user interface
  
import UIKit


class CircleView: UIView
{
    override func draw(_ rect: CGRect) {
       
        let path = UIBezierPath()
//        path.move(to: .zero)
        
        let radius: Double = Double(rect.width) / 2 - 20
        let center = CGPoint(x: rect.width / 2, y: rect.height / 2)
        
        path.move(to: CGPoint(x: center.x + CGFloat(radius), y: center.y))
        
        for i in stride(from: 0, to: 361.0, by: 1) // by: 40으로 할경우 육각형?
        {
            // radians = degrees * PI / 100
             let radians = i * Double.pi / 180
//            let x = radius * cos(i)
//            let y = radius * sin(i)
            let x = Double(center.x) + radius * cos(radians)
            let y = Double(center.y) + radius * sin(radians)
            
            //            print(i)
            path.addLine(to: CGPoint(x: x, y: y))
//            print(x,y)
        }
//        path.addLine(to: CGPoint(x: 100, y: 100))
        UIColor.red.setStroke()
        path.lineWidth = 5
        path.stroke()
    }
}


let view = CircleView(frame: CGRect(x: 0, y: 0, width: 300, height: 300))
view.backgroundColor = #colorLiteral(red: 1, green: 0.9967653155, blue: 0.9591305852, alpha: 1)




