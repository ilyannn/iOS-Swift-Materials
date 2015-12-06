//: Playground - noun: a place where people can play

import Foundation

let today = NSDate()
let past = NSDate(timeIntervalSinceNow: -600)

let result = today.compare(past)
result.rawValue

public func <(lhs: NSDate, rhs: NSDate) -> Bool {
    return lhs.compare(rhs) == .OrderedAscending
}

extension NSDate: Comparable {}

today < past
today >= past

let array: Array<Int>
array = [5, 6, 7, 1]

array.sort()
array.count


struct Queue<Element>: CustomStringConvertible {
    var l: [Element] = []
    var r: [Element] = []
    
    var description: String {
        return "Queue(\(l.reverse() + r ))"
    }
    
    init(elements: [Element]) {
        r = elements
    }
    
}

func << <Element>(inout queue: Queue<Element>, element: Element) {
    queue.r += [element]
}

func << <Element>(inout queue: Queue<Element>, elements: Array<Element>) {
    queue.r += elements
}

var qq = Queue(elements: [6, 7, 9])
qq << 56
qq << [100, 101, 102]

qq

extension Queue: CollectionType {
    
    var startIndex: Int { return -l.count}
    var endInput: Int { return r.count}
    
}


