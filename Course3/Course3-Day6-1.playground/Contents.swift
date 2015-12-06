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
today > past

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

let string = "skdjf"
string[string.startIndex.successor()]


extension Queue: CollectionType {
    
    var startIndex: Int { return -l.count}
    var endIndex: Int { return r.count}
    
    subscript(index: Int) -> Element {
        return index >= 0 ? r[index] : l[-1 - index]
    }
}

func >> <Element>(inout queue:Queue<Element>, inout element: Element?) {
    
    if queue.isEmpty {
        element = nil
        return
    }
    
    if queue.l.isEmpty {
        (queue.l, queue.r) = (queue.r.reverse(), [])
    }
    
    element = queue.l.removeLast()
}

//queue[queue.startIndex] = последний элемент в l = l[l.count - 1]
//queue[-1] = l[0]

qq[2]
qq[qq.endIndex.predecessor()]
qq
qq.count

qq.last
qq.first

var e: Int?

qq >> e
qq
e

qq >> e
qq
e

qq >> e
qq
e

qq[qq.startIndex]
qq.maxElement()


// enqueue - O(1)
// dequeue - среднее O(1)


