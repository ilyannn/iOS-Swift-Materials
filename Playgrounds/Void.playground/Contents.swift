//: Playground - noun: a place where people can play

import UIKit

struct Key {
    init(forRSA:Void) { /* */ }
    init(forCurve25519:Void) { /* */ }
    init(forAES:Void) { /* */ }
}

let a = Key(forRSA: ())

let b = Key(forCurve25519: ())

let empty: Void = ()
let c = Key(forAES: empty)
