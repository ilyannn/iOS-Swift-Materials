//: ## Arrays


let numbers = [5, 6, 9, 10] + [45]

let strings = ["Илья", "Ваня"]

strings + ["xxx"]


var numbers_copy1 = numbers
var numbers_copy2:Array<Int> = numbers

numbers_copy1.append(100)
numbers_copy2.append(200)


numbers_copy1
numbers_copy2

numbers_copy1[2] = 10


numbers[2]


func computeAtPoint(x: Double,
    a:Double = 1,
    b:Double = 0,
    c:Double)
    
    -> Double
{
        
        let term1 = a * x * x
        let второй_член = b * x
        let result = [term1, второй_член, c]
            .reduce(0, combine:+)
    
        return result
}

import Foundation

let a = NSURL(string: "http://google.com/xxx")!
let b = NSURLComponents(URL: a, resolvingAgainstBaseURL: false)!

var c = NSURL(string: "http://google.com/xxx")!
var d = NSURLComponents(URL: c, resolvingAgainstBaseURL: false)!

a.path
b.path = "/yyy"
c.path
d.path = "/yyy"

b.path
d.path

c = a
d = b

//: Мнение Ильи по поводу var
//: - локальный - плохо
//: - глобальный - уничтожать
//: - в объектах - логично, жизнь изменяется

// Синхронный
class MyOperation: NSOperation {
    var result: Int = 0
    
    override func main() {
        super.main()
        result = 42
    }
}

// ^^ можно в background
MyOperation().start()
NSOperationQueue().addOperation(MyOperation())

class AsyncOperation: NSOperation {
    override var concurrent: Bool { return true }
    
    var result: Int = 0

    override func start() {
//        executing = true
        dispatch_async(dispatch_get_main_queue(), main)
    }
    
    var ourFinished = false
    override var finished: Bool { return ourFinished }
    
    override func main() {
        super.main()
        result = 42

        willChangeValueForKey("finished")
        ourFinished = true
        didChangeValueForKey("finished")
    }
    
}

AsyncOperation().start()


