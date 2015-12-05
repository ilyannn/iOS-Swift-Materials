import Foundation

public class X: NSObject {
    
    public func method() -> Int {
        return 10
    }
    
    private(set) public var property: Int = 10
    
    public func attemptSetProperty(x: Int) {
        property = x - 1
    }
    
    private(set) public var observablePlus1: Int
    
    public init(initial: Int) {
//        observable = initial
        observablePlus1 = initial + 1
    }
    
//    public var observable: Int { willSet {
//        
//    } didSet {
//        observablePlus1 = observable + 1
//    }}
    
    public var observable: Int { get {
        return observablePlus1 - 1
    } set {
        observablePlus1 = newValue + 1
    }}
    
}