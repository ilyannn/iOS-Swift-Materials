//: Playground - noun: a place where people can play

import Swift

let str = "Hello, 😎"

str.characters.count

func f(s: String) -> Int {
    return s.characters.count
}

func main() {
    // event-driven
//    NSRunLoop().run()
}


let result = ["kjasdhf", "kasjdhfa", "ajsdhfajksdf"]
    .map(f)
    .reduce(1, combine: *)

let numbers = [3, 23, 500, 6872364812, 5, 777, 4444, 222]

func square(x: Int) -> Int {
    return x * x
}

numbers
    .lazy
    .map(square)
    .first


for num in numbers {
//     let num = numbers[index]
    num
}

// CollectionType


let seq = zip(numbers, str.characters)

internal class _TakeUntilSequence<Base : GeneratorType> : SequenceType, GeneratorType {
    
    typealias Element = Base.Element
    
    internal var generator: Base
    internal let predicate: Base.Element -> Bool
    
    internal init(_ generator: Base, predicate:(Base.Element) -> Bool) {
        self.generator = generator
        self.predicate = predicate
    }
    
    internal func generate() -> _TakeUntilSequence<Base> {
        return self
    }
    
    internal func next() -> Base.Element? {
        
        return generator
            .next()
            .flatMap { predicate($0) ? nil : $0 }
    }
}

extension SequenceType {
    func takeUntil(predicate:(Generator.Element) -> Bool) ->  AnySequence<Generator.Element>
    {
        return AnySequence(_TakeUntilSequence(generate(), predicate: predicate))
    }
}


let s = numbers.sort().lazy.map(square).takeUntil { $0 > 1000 }
Array(s)

for (num, ch) in seq.takeUntil({$1 == " "  }) {
    num
    ch
}

var gen = numbers.generate()
while let num = gen.next() {
    num
}


for (index, ch) in str.characters.enumerate().dropFirst(3).dropLast() {
    index
}



