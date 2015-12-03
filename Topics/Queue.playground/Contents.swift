//: ## Queues 
//: Motivated by Advanced Swift, https://github.com/objcio/advanced-swift/blob/master/

//: We define a generic queue. It will be convenient to leave dequeue definition for later.

struct Queue<Element>: ArrayLiteralConvertible {
    
    private var l: [Element] = []
    private var r: [Element] = []
    
    private init(l: [Element], r: [Element]) {
        self.r = r
        self.l = l
    }
    
    // Crashes if ArrayLiteralConvertible conformance is declared in an extension
    init(arrayLiteral elements: Element...) {
        r = elements
    }
    
    init(_ elements: [Element]) {
        r = elements
    }
    
    mutating func enqueue(elements: Element...) {
        r += elements
    }
}

//: Let's make it printable.

extension Queue: CustomStringConvertible, CustomDebugStringConvertible {
    
    var description: String {
        return "Queue(\( Array(self) ))"
    }
    
    var debugDescription: String {
        return "Queue(l: \(l.debugDescription), r:\(r.debugDescription))"
    }
    
}

//: Now to implement dequeue

extension Queue: CollectionType {
    
    var startIndex: Int { return -l.count }
    var endIndex:   Int { return r.count }
    
    subscript(i: Int) -> Element {
        return i < 0 ? l[ -i - 1] : r[i]
    }
    
    mutating func dequeue() -> Element? {
        
        if isEmpty {
            return nil
        }
        
        if l.isEmpty {
            (l, r) = (r.reverse(), [])
        }
        
        return l.removeLast()
    }
}

//: And functional stuff

extension Queue {
    
    func map<T>(@noescape transform: (Element) throws -> T) rethrows -> Queue<T> {
        return Queue<T>(l: try l.map(transform),
            r: try r.map(transform)
        )
    }
    
    func filter(@noescape includeElement: (Element) throws -> Bool) rethrows -> Queue {
        return Queue(l: try l.filter(includeElement),
            r: try r.filter(includeElement)
        )
    }
}

func ==<T:Equatable>(lhs:Queue<T>, rhs:Queue<T>) -> Bool {
    return lhs.elementsEqual(rhs) // Array(lhs) == Array(rhs)
}

extension Queue {
    func reverse() -> Queue {
        return Queue(l: r.reverse(), r: l.reverse())
    }
}

//extension Queue: Equatable where Element:Equatable {
//
//}

var qq = Queue<String>()
qq.enqueue("xx", "")
qq.dequeue()
Array(qq)

var q: Queue = [1, 2, 3]
q.enqueue(4)
q.dequeue()
q.count
q[q.startIndex]
q[q.endIndex - 1]
q.indices
q.first
Array(q)
q

let mapped = q.map {
    i in i.description
}

mapped.reduce("", combine: +)
mapped.debugDescription
Queue(l: ["4", "3", "2"], r:[])
Queue([5, 6])

let number_array = [45, 67].map { $0 * $0 }
let number_queue = Queue([45, 67]).map { $0 * $0 }

number_array
number_queue


func takes_queue<T>(original: Queue<T>) -> Queue<T> {
    var q = original
    
    if let last = q.dequeue() {
        q.enqueue(last)
        q.enqueue(last)
    }
    
    return q
}

takes_queue([1, 2, 3, 4, 5]) == [2, 3, 4, 5, 1, 1]

var mutable:Queue = ["x", "y", "z"]
Array(mutable[mutable.startIndex...mutable.startIndex.successor()])
mutable.debugDescription
mutable.reverse().debugDescription
mutable.reverse() as Array


/* extension Queue: RangeReplaceableCollectionType {
    
    mutating func reserveCapacity(n: Int) {
        r.reserveCapacity(n)
    }
    
    mutating func replaceRange<C : CollectionType where C.Generator.Element == Generator.Element>(subRange: Range<Int>, with newElements: C) {

        if subRange.startIndex >= 0 {
            r.replaceRange(subRange, with: newElements)
        } else {
            let shifted = Range(start: r.count - subRange.endIndex,
                                  end: r.count - subRange.startIndex)
            
            l = r.reverse() + l
            r = []
            
            l.replaceRange(shifted, with: newElements.reverse())
        }
    }
}*/

mutable
let range = Range(start: mutable.endIndex.predecessor(), end: mutable.endIndex)
mutable.endIndex
mutable

