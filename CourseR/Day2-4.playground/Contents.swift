//: Playground - noun: a place where people can play

func f() -> Bool {
    return true
}

func g() -> Bool {
    fatalError()
}

f() || g()
// f() && g()

func compute1(a:Bool,  _ b: Bool) -> Bool {
    return a
}

func compute(a:Bool, @autoclosure _ b: () -> Bool) -> Bool {
    return a
}

compute(f(), g() && g())
//compute1(f(), g() && g())

