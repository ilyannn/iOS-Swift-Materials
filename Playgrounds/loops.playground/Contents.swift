//: Playground - noun: a place where people can play

func sum_c() -> Int {
    var sum = 0
    for var i = 10 /* expr1 */; i > 0 /* expr2 */; i -= 1 /* expr3 */ {
        if i % 2 == 0 { continue } // statement
        sum += 1                   // statement
    }
    return sum
}

func sum_functional() -> Int {
    return (1...10).reverse().filter{ $0 % 2 != 0 }.count
}

struct IndexGenerator: SequenceType {

    let predicate:() -> Bool
    let loop: () -> ()

    func generate() -> AnyGenerator<Int> {
        var index = 0

        return anyGenerator {
            if index > 0 {
              self.loop()
            }
            if self.predicate() {
                index++
                return index
            }
            return nil
        }
    }
}

func +(predicate:() -> Bool, loop: () -> ()) -> IndexGenerator {
    return IndexGenerator(predicate: predicate, loop: loop)
}

func sum_protocol() -> Int {

    var sum = 0
    
    var i = 10

    for _ in ({i>0} + {i-=1}) {
        
        if i % 2 == 0 { continue } // statement
        sum += 1                   // statement
    }
    
    return sum
}


sum_c()
sum_functional()
sum_protocol()




