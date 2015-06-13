import Foundation
import CoreGraphics
import UIKit

public func VectorViewQuickLook(dx dx: Double, dy: Double) -> PlaygroundQuickLook {
    return PlaygroundQuickLook(reflecting: VectorView(dx: dx, dy: dy))
}

private let maßstab:   CGFloat = 20
private let lineWidth: CGFloat = 4
private let endSize:   CGFloat = 10
private let extraSize: CGFloat = 1.5
private let minSize:   CGFloat = 50
private let hintSize:  CGFloat = 5

private extension UIBezierPath {
    func addHint(x x:CGFloat, y:CGFloat, vertical: Bool) {
        let dx = vertical ? 0 : hintSize
        let dy = vertical ? hintSize : 0
        moveToPoint(CGPoint(x: x - dx, y: y - dy))
        addLineToPoint(CGPoint(x: x + dx, y: y + dy))
    }
}

public class VectorView: UIView {
    init(dx: Double, dy: Double) {
        
        let fx = CGFloat(dx) * maßstab
        let fy = CGFloat(-dy) * maßstab
        
        let size = extraSize * ([fx, fy, -fx, -fy, minSize].maxElement() ?? 0)
        let frame = CGRectMake(0, 0, 2 * size, 2 * size)
        super.init(frame: frame)
        
        layer.addSublayer({
            let path = UIBezierPath()
            
            path.moveToPoint(CGPoint(x:size, y:0))
            path.addLineToPoint(CGPoint(x: size, y: 2 * size))
            
            path.moveToPoint(CGPoint(x:0, y:size))
            path.addLineToPoint(CGPoint(x: 2 * size, y: size))
            
            var hint = maßstab
            while (hint < size) {
                path.addHint(x: size, y: size + hint, vertical: false)
                path.addHint(x: size, y: size - hint, vertical: false)
                path.addHint(x: size - hint, y: size, vertical: true)
                path.addHint(x: size + hint, y: size, vertical: true)
                hint += maßstab
            }
            
            $0.path = path.CGPath
            
            $0.fillColor = nil
            $0.opacity = 1
            $0.strokeColor = UIColor.redColor().CGColor
            
            $0.bounds = bounds
            $0.anchorPoint = CGPointZero
            
            return $0
            }(CAShapeLayer()))
        
        layer.addSublayer({            
            let path = UIBezierPath()
            let endpoint = CGPoint(x: fx, y: fy)
            path.moveToPoint(endpoint)
            path.addLineToPoint(CGPointZero)
            
            let lengthsq = fx * fx + fy * fy 
            
            if lengthsq > endSize * endSize {
                let nx = fx / sqrt(lengthsq) * endSize
                let ny = fy / sqrt(lengthsq) * endSize
                
                let end = CGPoint(x: nx, y: ny)
                
                let angle = 0.4
                
                let transl = CGAffineTransformMakeRotation(CGFloat(M_PI - angle))
                
                let transr = CGAffineTransformMakeRotation(CGFloat(M_PI + angle))
                
                let deltar = CGPointApplyAffineTransform(end, transr)
                let deltal = CGPointApplyAffineTransform(end, transl)
                let endl = CGPointApplyAffineTransform(endpoint, CGAffineTransformMakeTranslation(deltal.x, deltal.y))
                
                let endr = CGPointApplyAffineTransform(endpoint, CGAffineTransformMakeTranslation(deltar.x, deltar.y))
                
                path.moveToPoint(endpoint)
                path.addLineToPoint(endr)
                
                path.moveToPoint(endpoint)
                path.addLineToPoint(endl)
            }
            
            $0.path = path.CGPath
            $0.lineCap = "round"        
            
            $0.fillColor = nil
            $0.opacity = 1
            $0.strokeColor = UIColor.blueColor().CGColor
            $0.lineWidth = lineWidth
            
            $0.bounds = bounds
            $0.position = CGPointMake(size, size)        
            $0.anchorPoint = CGPointZero
            
            return $0
            }(CAShapeLayer()))
        
    }
    
    required public init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

