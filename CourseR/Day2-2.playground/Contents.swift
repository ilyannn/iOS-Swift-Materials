//: Playground - noun: a place where people can play

import Foundation

//[T] = Array<T>
//T? = Optional<T>

let optional: Optional<NSURL> = NSURL(string: "http://google.coлфывралодывраорфыm")

func f() -> String {
    switch optional {
    case .None: return "no URL"
    case .Some(let url): return url.query ?? "no query"
        // null coalescing a ?: b in Obj-C
    }
}

func g(string: String) -> String?? {

    if let url = NSURL(string: string) {
        return url.query // если url != nil а query nil
        // то .Some(.None)
    }
    
    return nil // если url nil то .None
}

// String? url?.query

let nil1 = g("фывафыва")
let nil2 = g("http://gggg")
let nonnil = g("http://goog.?q")



(nil1 ?? "nil1") ?? "nil2"
(nil2 ?? "nil1") ?? "nil2"

enum Query: String {
    case BadURL = "xxx"
    case NoQuery = "yyy"
    case HasQuery = "zzz"
}

enum QueryF {
    case BadURL
    case NoQuery
    case HasQuery
}

QueryF.BadURL
QueryF.HasQuery
QueryF.NoQuery

//let string = nonnil!!

//if let stringq:String = string {
//    stringq.characters
//}

//nonnil?!.characters

import UIKit


