//: Playground - noun: a place where people can play

// [забираем] A <- B (l.reverse())||(r) <- C [добавляем]

struct Queue<Element>: ArrayLiteralConvertible {
    
    private var l: [Element] = []
    private var r: [Element]
    
    init(elements: [Element]) { r = elements }
    
    init(arrayLiteral elements: Element...) {
        r = elements
    }

    mutating func enqueue(els: Element...) {
        r += els
    }
}

extension Queue: CustomStringConvertible {
    
    var description: String {
//        Array(self)
        return "Queue(\(l.reverse() + r))"
    }
}

extension Queue: CustomDebugStringConvertible {
    
    var debugDescription: String {
        //        Array(self)
        return "l:\(l.debugDescription), r:\(r.debugDescription)"
    }
}

extension Queue {
    
    mutating func dequeue() -> Element? {

        guard !isEmpty else {
            return nil
        }
        
        if l.isEmpty {
            (l, r) = (r.reverse(), [])
        }
        
        return l.removeLast()
    }
}

extension Queue: CollectionType {

    var startIndex:Int { return -l.endIndex }
    var endIndex:  Int { return r.endIndex }
    
    subscript(i: Int) -> Element {
        return i >= 0 ? r[i] : l[-i - 1]
    }
}

extension Queue {

    func reverse() -> Queue {
        return Queue(elements:Array(self).reverse())
    }

}

extension Queue {
    
    func map<T>(transform: (Element) throws -> T) rethrows -> Queue<T> {
        
        let els:Array<T> = try map(transform)
        return Queue<T>(elements: els)
    }
}


var qq: Queue<String> = []

var queue:Queue = [1, 2, 3]

queue.dequeue()
queue.debugDescription

queue.enqueue(4)
queue.enqueue(5)
queue.enqueue(6)
queue.enqueue(7, 8, 9)
queue.dequeue()

queue.debugDescription

Array(Set([1, 5, 2, 6, 7, 8]))

queue.count
queue.first
queue.last

Array(queue)
Set(queue)

queue[queue.startIndex.successor()]
queue[queue.endIndex.advancedBy(-1)]
let range = queue.startIndex.successor()...queue.endIndex.predecessor().predecessor()

queue[range]

func take_q<E>(queue:Queue<E>) -> Int {
    return queue.count
}

queue.reverse()

queue.reverse() as Queue // я написал
queue.reverse() as ReverseCollection // в implementation


take_q([5, 7, 1])

func f(x: Int) -> String {
    return "Число \(x)"
}

f(10)

let qqq:Queue<String> = ["q", "ffg"]

queue.map(f)

//extension Queue: Equatable where Element:Equatable {
//    
//}

func ==<T:Equatable>(lhs:Queue<T>, rhs:Queue<T>) -> Bool {
    return lhs.elementsEqual(rhs)
}

var qqqqq:Queue = [1, 2, 3]

qqqqq == Queue(elements: [1, 2, 3])
queue.debugDescription
queue == Queue(elements: [3, 4, 5, 6, 7, 8, 9])

