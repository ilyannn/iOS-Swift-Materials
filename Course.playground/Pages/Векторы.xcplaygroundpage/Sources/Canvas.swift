import Foundation
import CoreGraphics
import UIKit

// MARK: Layout constants
private let maßstab:   CGFloat = 30
private let lineWidth: CGFloat = 4
private let canvasSize:CGFloat = 300
private let hintSize:  CGFloat = 3

private let endSize:   Double  = 0.3

// MARK: Drawing protocol

public protocol Drawable {
    func drawLine(toX toX: Double, toY: Double, fromX: Double, fromY: Double, asVector: Bool)
    func drawArc(radius radius: Double, centerX: Double, centerY: Double, startAngle: Double, endAngle: Double)
}

public extension Drawable {
    func drawVector(dx dx: Double, dy:Double) {
        drawLine(toX: dx, toY: dy, fromX: 0, fromY: 0, asVector: true)
    }
}

// MARK: Canvas
private extension UIBezierPath {
    func addHint(x x:CGFloat, y:CGFloat, vertical: Bool) {
        let dx = vertical ? 0 : hintSize
        let dy = vertical ? hintSize : 0
        moveToPoint(CGPoint(x: x - dx, y: y - dy))
        addLineToPoint(CGPoint(x: x + dx, y: y + dy))
    }
}

public class Canvas: UIView, Drawable {
    
    private var halfSize: CGFloat 
    private var originPoint: CGPoint 
    
    private func addLayer(color color:UIColor, lineWidth width:CGFloat = 1.0, @noescape configuration: UIBezierPath -> Void) {

        layer.addSublayer({
            let path = UIBezierPath()
            configuration(path)
            $0.path = path.CGPath
            
            $0.fillColor = nil
            $0.opacity = 1
            $0.strokeColor = color.CGColor

            $0.lineWidth = width
            $0.lineCap = "round"        
            
            $0.bounds = bounds
            $0.anchorPoint = CGPointZero
            $0.position = originPoint
            
            return $0
        }(CAShapeLayer()))
    }
    
    public init() {
        halfSize = canvasSize / 2
        originPoint = CGPoint(x: canvasSize / 2, y: canvasSize / 2)
        let frame = CGRectMake(0, 0, canvasSize, canvasSize)
        super.init(frame: frame)

        self.backgroundColor = UIColor.whiteColor()
        self.layer.borderColor = UIColor.darkGrayColor().CGColor
        self.layer.borderWidth = CGFloat(2.0)
        self.layer.cornerRadius = CGFloat(5.0)

        addLayer(color: UIColor.redColor()) { path in
            // X and Y axis
            path.moveToPoint(CGPoint(x: 0, y: -halfSize))
            path.addLineToPoint(CGPoint(x: 0, y: halfSize))
            
            path.moveToPoint(CGPoint(x:-halfSize, y:0))
            path.addLineToPoint(CGPoint(x: halfSize, y: 0))
        }
        
        addLayer(color: UIColor.redColor()) { path in    
            // Hints
            var hint = maßstab
            while (hint < halfSize) {
                path.addHint(x: 0, y: 0 + hint, vertical: false)
                path.addHint(x: 0, y: 0 - hint, vertical: false)
                path.addHint(x: 0 - hint, y: 0, vertical: true)
                path.addHint(x: 0 + hint, y: 0, vertical: true)
                hint += maßstab
            }
        }

    }
    
    private func translate(x x:Double, y:Double) -> CGPoint {
        return CGPoint(x: CGFloat(x) * maßstab, y: CGFloat(y) * (-maßstab))
    }
    
    public func drawArc(radius radius: Double, centerX: Double, centerY: Double, startAngle: Double, endAngle: Double) {
        
        addLayer(color: UIColor.brownColor(), lineWidth: lineWidth/2) { path in
            let centerT = translate(x: centerX, y: centerY)
            let radiusT = translate(x: radius, y: 0)
            
            path.addArcWithCenter(centerT, 
                radius: radiusT.x, 
                startAngle: CGFloat(startAngle), 
                endAngle: CGFloat(endAngle), 
                clockwise: true)
        }
    }
    
    public func drawLine(toX toX: Double, toY: Double, fromX: Double, fromY: Double, asVector: Bool) {
        
        let dx = toX - fromX
        let dy = toY - fromY
        
        addLayer(color: UIColor.blueColor(), lineWidth: lineWidth) { path in
            let startT = translate(x: fromX, y: fromY)
            let endT = translate(x: toX, y: toY)
            path.moveToPoint(endT)
            path.addLineToPoint(startT)
            
            let lengthsq = dx * dx + dy * dy 
            
            if asVector && (lengthsq  > endSize * endSize) {
                let nx = dx / sqrt(lengthsq) * endSize
                let ny = dy / sqrt(lengthsq) * endSize
                
                let normT = translate(x: nx, y: ny)
                
                let angle = 0.4
                
                let transl = CGAffineTransformMakeRotation(CGFloat(M_PI - angle))
                
                let transr = CGAffineTransformMakeRotation(CGFloat(M_PI + angle))
                
                let deltar = CGPointApplyAffineTransform(normT, transr)
                let deltal = CGPointApplyAffineTransform(normT, transl)
                let endlT = CGPointApplyAffineTransform(endT, CGAffineTransformMakeTranslation(deltal.x, deltal.y))
                
                let endrT = CGPointApplyAffineTransform(endT, CGAffineTransformMakeTranslation(deltar.x, deltar.y))
                
                path.moveToPoint(endT)
                path.addLineToPoint(endrT)
                
                path.moveToPoint(endT)
                path.addLineToPoint(endlT)
            }
        }
    }
    
    required public init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override public var description: String {
        return "Рисунок"
    }
}

public func CanvasQuickLook(@noescape drawing: Drawable -> Void) -> PlaygroundQuickLook {
    let canvas = Canvas()
    drawing(canvas)
    return PlaygroundQuickLook(reflecting: canvas)
}
